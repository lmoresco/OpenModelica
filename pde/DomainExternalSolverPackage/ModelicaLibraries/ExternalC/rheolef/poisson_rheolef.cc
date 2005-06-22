#include "rheolef.h"
#include "rheolef/tiny_matvec.h"
#include "rheolef_common.h"
#include "read_array_common.h"
#include "poisson_rheolef.h"
#include <iostream>
#include <fstream>
#include <sstream>

#define BCTYPE 0
#define BCGVAL 1
#define BCQVAL 2
#define BCINDEX 3
#define BCDIM (BCINDEX+1)

using namespace std;

#ifdef __cplusplus
extern "C" {
#endif 

typedef unsigned int size_type;

struct problem {
  geo omega;
  space Vh;
  form a;
  form m;
  field uh;
  field fh;
  vec<Float> bu;
  vec<Float> solvec;
  problem(const char* meshfile, const char *eltype, size_type nv, 
	  size_type nbc, size_type bcdim, double *bc,
	  Float fhval = 5)
  {
    get_geo_bamg(meshfile, omega);
    Vh = space(omega,eltype);

    if (bcdim != BCDIM) {
      cerr << "Boundary conditions have incorrect dimension, must be == " << BCDIM << " (type, gvalue, qvalue, index):" << endl;
      exit(3);
    }

    for (size_type i=0; i<nbc; i++) {
      if (bc[i*bcdim + BCTYPE] == 1 || bc[i*bcdim + BCTYPE] == 4) { // dirichlet or timedepdirichlet
	unsigned int domainnr = (unsigned int)bc[i*bcdim + BCINDEX] - 1;
	if (domainnr >= omega.n_domain()) {
	  cerr << "Domain index larger than number of subdomains, skipping block:" << endl;
	  cerr << domainnr << " >= " << omega.n_domain() << endl;
	} else {
	  const domain &dom = omega.get_domain(domainnr);
	  Vh.block(dom);
	}
      }
      // Nothing to do for neumann or robin. no blocking.
    }

    a = form(Vh, Vh, "grad_grad");
    m = form(Vh, Vh, "mass");
    fh = field(Vh, fhval);
    uh = field(Vh);

    solvec = vec<Float>(a.uu.nrow(), 0);
    for (size_type i=0; i<nbc; i++) {
      unsigned int domainnr = (unsigned int)bc[i*bcdim + BCINDEX] - 1;
      if (domainnr >= omega.n_domain()) {
	cerr << "Domain index larger than number of subdomains, skipping block:" << endl;
	cerr << domainnr << " >= " << omega.n_domain() << endl;
      }
      const domain & dom = omega.get_domain(domainnr);
      if (bc[i*bcdim + BCTYPE] == 1 || bc[i*bcdim + BCTYPE] == 4) { // dirichlet or timedepdirichlet
	uh[dom] = bc[i*bcdim + BCGVAL];
      } 
      else {
	// Handle neumann and robin here.
	space Wh (omega, dom, eltype);
	field gh = field(Wh, bc[i*bcdim + BCGVAL]);
	form mb(Wh, Vh, "mass_bdr");
	solvec += mb.uu * gh.u + mb.ub * gh.b; // gh.b should be size zero but anyway
	if (bc[i*bcdim + BCTYPE] == 2) { // neumann
	  // nothing else for neumann
	}
	else if (bc[i*bcdim + BCTYPE] == 3) { // robin
	  double q = bc[i*bcdim + BCQVAL];
	  form ab(Vh, Vh, "mass_bdr", dom);
	  a = a + q*ab;
	}
	else {
	  cerr << "Boundary condition type unknown, must be 1-4 (dirichlet,neumann,robin,timedepdirichlet): " 
	       << bc[i*bcdim + BCTYPE] << " for boundary " << i << endl;
	  exit(3);
	}
      }
    }
    bu = solvec + m.uu*fh.u + m.ub*fh.b - a.ub*uh.b; // unknown part of rhs
  }
};

void get_rheolef_poisson_laplace(const char *meshfile, const char *eltype, size_type nv, double *laplace,
				 unsigned int nbc, size_type bcdim, double *bc)
{
  struct problem p(meshfile, eltype, nv, nbc, bcdim, bc);

  // a.uu is the unknown block part of the stiffness matrix
  // b is : vec<Float> b = m.uu*fh.u + m.ub*fh.b - a.ub*uh.b;

   // PRINT_CSR_INFO(a.uu);
   // PRINT_CSR_INFO(a.ub);
   // PRINT_CSR_INFO(a.bu);
   // PRINT_CSR_INFO(a.bb);

  //  PRINT_CSR_INFO(a_all);
  

  //  MY_ASSERT(a_all.nrow() == nv, "Matrix row size doesn't much number of vertices");
  //  MY_ASSERT(a_all.ncol() == nv, "Matrix column size doesn't much number of vertices");
  
  // MY_ASSERT(a.uu.nrow() == nv, "Matrix row size doesn't much number of vertices");	
  // MY_ASSERT(a.uu.ncol() == nv, "Matrix column size doesn't much number of vertices");

  //  ssk<Float> fact = ldlt(a.uu);
  // csr<Float> auufact(fact);
  

  dns<Float> a_all;

  // -a Because -Laplace*x in the Modelica model.
  get_full_matrix_laplace(-p.a, a_all);
  ostringstream msgstr1,msgstr2;
  msgstr1 << "Matrix row size doesn't much number of vertices: " << a_all.nrow() << " != " << nv << ends;
  msgstr2 << "Matrix column size doesn't much number of vertices: " << a_all.ncol() << " != " << nv << ends;
  MY_ASSERT(a_all.nrow() == nv, msgstr1.str().c_str() );	
  MY_ASSERT(a_all.ncol() == nv, msgstr2.str().c_str() );

  for(unsigned int i=0; i<a_all.nrow(); i++) {
    for(unsigned int j=0; j<a_all.ncol(); j++) {
      laplace[i*nv+j] = a_all(i,j);
    }
  }
}

void get_rheolef_poisson_mass(const char *meshfile, const char *eltype, size_type nv, double *mass,
				 unsigned int nbc, size_type bcdim, double *bc)
{
  struct problem p(meshfile, eltype, nv, nbc, bcdim, bc);

  dns<Float> a_all;
  form mleft(p.Vh, p.Vh, "mass");

  get_full_matrix_mass(mleft, a_all);
  ostringstream msgstr1,msgstr2;
  msgstr1 << "Matrix row size doesn't much number of vertices: " << a_all.nrow() << " != " << nv << ends;
  msgstr2 << "Matrix column size doesn't much number of vertices: " << a_all.ncol() << " != " << nv << ends;
  MY_ASSERT(a_all.nrow() == nv, msgstr1.str().c_str() );	
  MY_ASSERT(a_all.ncol() == nv, msgstr2.str().c_str() );

  for(unsigned int i=0; i<a_all.nrow(); i++) {
    for(unsigned int j=0; j<a_all.ncol(); j++) {
      mass[i*nv+j] = a_all(i,j);
    }
  }
}


void get_rheolef_poisson_g(const char *meshfile, const char *eltype, unsigned int nv, double *g,
				 unsigned int nbc, size_type bcdim, double *bc)
{

  struct problem p(meshfile, eltype, nv, nbc, bcdim, bc);

  // a.uu is the stiffness matrix
  // b is rhs


  vec<Float> rhs;

  get_full_rhs(p.uh, p.bu, rhs);

  ostringstream msgstr;
  msgstr << "Array size doesn't much number of vertices" << rhs.size() << " != " << nv << ends;
  MY_ASSERT(rhs.size() == nv, msgstr.str().c_str() );

  for (size_type i=0; i<nv; i++) {
    g[i] = rhs(i);
  }

  /*
  ssk<Float> fact=ldlt(a.uu);

  uh.u = fact.solve(b);

  cout << uh << endl;
  */


}

void get_rheolef_poisson_fh(const char *meshfile, const char *eltype, unsigned int nv, double *g,
				 unsigned int nbc, size_type bcdim, double *bc)
{

  struct problem p(meshfile, eltype, nv, nbc, bcdim, bc);

  // a.uu is the stiffness matrix
  // b is rhs


  for (size_type i=0; i<nv; i++) {
    g[i] = p.fh.at(i);
  }
}

void get_rheolef_form_size(const char *meshfile, unsigned int nv, unsigned int *nu, unsigned int *nb,
				 unsigned int nbc, size_type bcdim, double *bc) {

  struct problem p(meshfile, "P1", nv, nbc, bcdim, bc);

  *nu = p.uh.n_unknown();
  *nb = p.uh.n_blocked();
  
}


class const_function {
public:
  typedef Float result_type;
  result_type c;
  const_function(result_type val=0.0) : c(val) {}
  result_type operator () (const point &p) { return c; }
};

void get_rheolef_interpolate_bdr_coords(const char *meshfile, unsigned int bndindex, unsigned int nv, 
					unsigned int nu, unsigned int nb,
					size_type pdim, 
					double *pu, double *pb,
					unsigned int nbc, size_type bcdim, double *bc) {

  MY_ASSERT( bndindex > 0, "Illegal boundary index in get_rheolef_form_mass_bdr");
  MY_ASSERT( bndindex <= nbc, "Illegal boundary index in get_rheolef_form_mass_bdr");

  struct problem p(meshfile, "P2", nv, nbc, bcdim, bc);
  
  const domain& boundary = p.omega.get_domain(bndindex-1);

  space Wh(p.omega, boundary, "P1");
  // form mb(Wh, p.Vh, "mass_bdr");
  vec<point> vpu, vpb;
  get_space_node_coords(Wh, vpu, vpb);

  MY_ASSERT( vpu.size() == nu, "Unknown size is incorrect in get_rheolef_interpolate_bdr_coords");
  MY_ASSERT( vpb.size() == nb, "Blocked size is incorrect in get_rheolef_interpolate_bdr_coords");

  for (unsigned int i=0; i < nu; i++) {
    const point& p=vpu(i);
    pu[i*pdim+0] = p(0);
    pu[i*pdim+1] = p(1);    
  }

  for (unsigned int i=0; i < nb; i++) {
    const point& p=vpb(i);
    pb[i*pdim+0] = p(0);
    pb[i*pdim+1] = p(1);    
  }
    
}


void get_rheolef_form_size_bdr(const char *meshfile, unsigned int bndindex, 
			       unsigned int nv, unsigned int *nu, unsigned int *nb,
			       unsigned int nbc, size_type bcdim, double *bc) {

  MY_ASSERT( bndindex > 0, "Illegal boundary index in get_rheolef_form_mass_bdr");
  MY_ASSERT( bndindex <= nbc, "Illegal boundary index in get_rheolef_form_mass_bdr");

  struct problem p(meshfile, "P1", nv, nbc, bcdim, bc);

  const domain& boundary = p.omega.get_domain(bndindex-1);

  space Wh(p.omega, boundary, "P1");
  // form mb(Wh, p.Vh, "mass_bdr");
  field gh = interpolate(Wh, const_function());
  *nu = Wh.n_unknown();
  *nb = Wh.n_blocked();
  
}

void get_rheolef_form_grad_grad(const char *meshfile, unsigned int nv, 
				unsigned int nuin, unsigned int nbin, 
				double *uu, double *ub, double *bu, double *bb, 
				unsigned int nbc, unsigned int bcdim, double *bc) 
{

  struct problem p(meshfile, "P1", nv, nbc, bcdim, bc);

  unsigned int nu = p.a.uu.nrow();
  unsigned int nb = p.a.bu.nrow();

  MY_ASSERT( nu == nuin, "Number of unknowns mismatch in get_rheolef_form_grad_grad");
  MY_ASSERT( nb == nbin, "Number of blockeds mismatch in get_rheolef_form_grad_grad");
  
  for (unsigned int i=0; i < nu; i++) {
    for (unsigned int j=0; j< nu; j++) {
      uu[nu*i + j] = p.a.uu(i,j);
    }
    for (unsigned int j=0; j< nb; j++) {
      ub[nb*i + j] = p.a.ub(i,j);
    }
  }

  for (unsigned int i=0; i < nb; i++) {
    for (unsigned int j=0; j< nu; j++) {
      bu[nu*i + j] = p.a.bu(i,j);
    }
    for (unsigned int j=0; j< nb; j++) {
      bb[nb*i + j] = p.a.bb(i,j);
    }
  }
}


void get_rheolef_form_mass(const char *meshfile, unsigned int nv, unsigned int nuin, unsigned int nbin, 
			   double *uu, double *ub, double *bu, double *bb,
			   unsigned int nbc, size_type bcdim, double *bc) {

  struct problem p(meshfile, "P1", nv, nbc, bcdim, bc);

  unsigned int nu = p.m.uu.nrow();
  unsigned int nb = p.m.bu.nrow();

  MY_ASSERT( nu == nuin, "Number of unknowns mismatch in get_rheolef_form_mass");
  MY_ASSERT( nb == nbin, "Number of blockeds mismatch in get_rheolef_form_mass");
  
  for (unsigned int i=0; i < nu; i++) {
    for (unsigned int j=0; j< nu; j++) {
      uu[nu*i + j] = p.m.uu(i,j);
    }
    for (unsigned int j=0; j< nb; j++) {
      ub[nb*i + j] = p.m.ub(i,j);
    }
  }

  for (unsigned int i=0; i < nb; i++) {
    for (unsigned int j=0; j< nu; j++) {
      bu[nu*i + j] = p.m.bu(i,j);
    }
    for (unsigned int j=0; j< nb; j++) {
      bb[nb*i + j] = p.m.bb(i,j);
    }
  }
}


void get_rheolef_massbdr_u(const char *meshfile, unsigned int nv, unsigned int nuin, unsigned int nbin, 
			   double *mbu, unsigned int nbc, size_type bcdim, double *bc) {

  struct problem p(meshfile, "P1", nv, nbc, bcdim, bc);

  unsigned int nu = p.m.uu.nrow();
  unsigned int nb = p.m.bu.nrow();

  ostringstream msgstr1,msgstr2;
  msgstr1 << "Number of unknowns mismatch in get_rheolef_massbdr_u: " << nu << " != " << nuin << ends;
  MY_ASSERT( nu == nuin, msgstr1.str().c_str());

  msgstr2 << "MassBdr_u size mismatch in get_rheolef_massbdr_u: " << nu << " != " << p.solvec.size() << ends;
  MY_ASSERT( nu == p.solvec.size(), msgstr2.str().c_str());
  
  for (unsigned int i=0; i < nu; i++)
    mbu[i] = p.solvec.at(i);

}

void get_rheolef_form_mass_bdr_on_bnd(const char *meshfile, unsigned int bndindex,
				      unsigned int nv, 
				      unsigned int nuin, unsigned int nbin, 
				      double *uu, double *ub, double *bu, double *bb,
				      unsigned int nbc, size_type bcdim, double *bc) {

  MY_ASSERT( bndindex > 0, "Illegal boundary index in get_rheolef_form_mass_bdr_on_bnd");
  MY_ASSERT( bndindex <= nbc, "Illegal boundary index in get_rheolef_form_mass_bdr_on_bnd");
  
  struct problem p(meshfile, "P1", nv, nbc, bcdim, bc);

  const domain& boundary = p.omega.get_domain(bndindex-1);

  form ab(p.Vh, p.Vh, "mass_bdr", boundary);

  unsigned int nu = ab.uu.nrow();
  unsigned int nb = ab.bu.nrow();

  MY_ASSERT( nu == nuin, "Number of unknowns mismatch in get_rheolef_form_mass_bdr_on_bnd");
  MY_ASSERT( nb == nbin, "Number of blockeds mismatch in get_rheolef_form_mass_bdr_on_bnd");
  
  for (unsigned int i=0; i < nu; i++) {
    for (unsigned int j=0; j< nu; j++) {
      uu[nu*i + j] = ab.uu(i,j);
    }
    for (unsigned int j=0; j< nb; j++) {
      ub[nb*i + j] = ab.ub(i,j);
    }
  }

  for (unsigned int i=0; i < nb; i++) {
    for (unsigned int j=0; j< nu; j++) {
      bu[nu*i + j] = ab.bu(i,j);
    }
    for (unsigned int j=0; j< nb; j++) {
      bb[nb*i + j] = ab.bb(i,j);
    }
  }
}

void get_rheolef_form_mass_bdr(const char *meshfile, unsigned int bndindex,
			       unsigned int nv, 
			       unsigned int nuin, unsigned int nbin, 
			       double *uu, double *ub, double *bu, double *bb,
			       unsigned int nbc, size_type bcdim, double *bc) {

  MY_ASSERT( bndindex > 0, "Illegal boundary index in get_rheolef_form_mass_bdr");
  MY_ASSERT( bndindex <= nbc, "Illegal boundary index in get_rheolef_form_mass_bdr");

  struct problem p(meshfile, "P1", nv, nbc, bcdim, bc);

  const domain& boundary = p.omega.get_domain(bndindex-1);

  space Wh(p.omega, boundary, "P1");
  form mb(Wh, p.Vh, "mass_bdr");

  unsigned int nu = mb.uu.nrow();
  unsigned int nb = mb.bu.nrow();

  MY_ASSERT( nu == nuin, "Number of unknowns mismatch in get_rheolef_form_mass_bdr");
  MY_ASSERT( nb == nbin, "Number of blockeds mismatch in get_rheolef_form_mass_bdr");
  
  for (unsigned int i=0; i < nu; i++) {
    for (unsigned int j=0; j< nu; j++) {
      uu[nu*i + j] = mb.uu(i,j);
    }
    for (unsigned int j=0; j< nb; j++) {
      ub[nb*i + j] = mb.ub(i,j);
    }
  }

  for (unsigned int i=0; i < nb; i++) {
    for (unsigned int j=0; j< nu; j++) {
      bu[nu*i + j] = mb.bu(i,j);
    }
    for (unsigned int j=0; j< nb; j++) {
      bb[nb*i + j] = mb.bb(i,j);
    }
  }
}



void get_rheolef_form(const char *formname, const char *meshfile, unsigned int nv, 
		      unsigned int nuin, unsigned int nbin, 
		      double *uu, double *ub, double *bu, double *bb,
		      unsigned int nbc, size_type bcdim, double *bc) {

  struct problem p(meshfile, "P1", nv, nbc, bcdim, bc);

  unsigned int nu = p.m.uu.nrow();
  unsigned int nb = p.m.bu.nrow();

  MY_ASSERT( nu == nuin, "Number of unknowns mismatch in get_rheolef_form_mass");
  MY_ASSERT( nb == nbin, "Number of blockeds mismatch in get_rheolef_form_mass");
  
  for (unsigned int i=0; i < nu; i++) {
    for (unsigned int j=0; j< nu; j++) {
      uu[nu*i + j] = p.m.uu(i,j);
    }
    for (unsigned int j=0; j< nb; j++) {
      ub[nb*i + j] = p.m.ub(i,j);
    }
  }

  for (unsigned int i=0; i < nb; i++) {
    for (unsigned int j=0; j< nu; j++) {
      bu[nu*i + j] = p.m.bu(i,j);
    }
    for (unsigned int j=0; j< nb; j++) {
      bb[nb*i + j] = p.m.bb(i,j);
    }
  }
}

void get_rheolef_unknown_indices(const char *meshfile, const char *eltype, unsigned int nv, 
				 unsigned int nuin, int *indices, 
				 unsigned int nbc, unsigned int bcdim, double *bc)
{

  struct problem p(meshfile, eltype, nv, nbc, bcdim, bc);

  // a.uu is the stiffness matrix
  // b is rhs


  vector<int> ind;

  get_unknown_indices(p.uh, ind);

  ostringstream msgstr;
  msgstr << "Indices size doesn't much number of unknown vertices" << ind.size() << " != " << nuin << ends;
  MY_ASSERT(ind.size() == nuin, msgstr.str().c_str() );

  for (unsigned int i=0; i<nuin; i++) {
    indices[i] = ind[i];
    // cout << i << ": " << ind[i] << endl;
  }
}


void get_rheolef_blocked_indices(const char *meshfile, const char *eltype, unsigned int nv, 
				 unsigned int nbin, int *indices, 
				  unsigned int nbc, unsigned int bcdim, double *bc)
{

  struct problem p(meshfile, eltype, nv, nbc, bcdim, bc);

  // a.uu is the stiffness matrix
  // b is rhs


  vector<int> ind;

  get_blocked_indices(p.uh, ind);

  ostringstream msgstr;
  msgstr << "Indices size doesn't much number of blocked vertices" << ind.size() << " != " << nbin << ends;
  MY_ASSERT(ind.size() == nbin, msgstr.str().c_str() );

  for (unsigned int i=0; i<nbin; i++) {
    indices[i] = ind[i];
    // cout << i << ": " << ind[i] << endl;
  }
}


void get_rheolef_blocked_values(const char *meshfile, const char *eltype, unsigned int nv, 
				unsigned int nbin, double *values, 
				unsigned int nbc, unsigned int bcdim, double *bc)
{

  struct problem p(meshfile, eltype, nv, nbc, bcdim, bc);

  // a.uu is the stiffness matrix
  // b is rhs


  const vec<Float>& val = p.uh.b;

  ostringstream msgstr;
  msgstr << "Indices size doesn't much number of blocked vertices" << val.size() << " != " << nbin << ends;
  MY_ASSERT(val.size() == nbin, msgstr.str().c_str() );

  for (unsigned int i=0; i<nbin; i++) {
    values[i] = val(i);
    // cout << i << ": " << ind[i] << endl;
  }
}

#ifdef __cplusplus
}
#endif 

