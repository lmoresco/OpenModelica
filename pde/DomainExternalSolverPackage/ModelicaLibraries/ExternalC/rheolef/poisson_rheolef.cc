#include "rheolef.h"
#include "rheolef/tiny_matvec.h"
#include "rheolef_common.h"
#include "read_array_common.h"
#include "poisson_rheolef.h"
#include <iostream>
#include <fstream>
#include <sstream>

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
  form mleft;
  field uh;
  field fh;
  vec<Float> bu;
  problem(const char* meshfile, const char *eltype, size_type nv, 
	  size_type nbc, size_type bcdim, double *bc,
	  Float fhval = 5)
  {
    get_geo_bamg(meshfile, omega);
    Vh = space(omega,eltype);

    if (bcdim != 3) {
      cerr << "Boundary conditions have incorrect dimension, must be == 3 (type, value, index):" << endl;
      exit(3);
    }

    for (size_type i=0; i<nbc; i++) {
      if (bc[i*bcdim + 0] == 1) { // dirichlet 
	unsigned int domainnr = (unsigned int)bc[i*bcdim + 2] - 1;
	if (domainnr >= omega.n_domain()) {
	  cerr << "Domain index larger than number of subdomains, skipping block:" << endl;
	  cerr << domainnr << " >= " << omega.n_domain() << endl;
	} else {
	  const domain &dom = omega.get_domain(domainnr);
	  Vh.block(dom);
	}
      }
      // Handle neumann here? Shouldn't block for neumann
    }

    a = form(Vh, Vh, "grad_grad");
    m = form(Vh, Vh, "mass");
    mleft = form(Vh, Vh, "mass");
    fh = field(Vh, fhval);
    uh = field(Vh);

    for (size_type i=0; i<nbc; i++) {
      if (bc[i*bcdim + 0] == 1) { // dirichlet 
	unsigned int domainnr = (unsigned int)bc[i*bcdim + 2] - 1;
	if (domainnr >= omega.n_domain()) {
	  cerr << "Domain index larger than number of subdomains, skipping block:" << endl;
	  cerr << domainnr << " >= " << omega.n_domain() << endl;
	} else {
	  const domain & dom = omega.get_domain(domainnr);
	  uh[dom] = bc[i*bcdim + 1];
	}
      }
      // Handle neumann here? Shouldn't block for neumann
    }    
    bu = m.uu*fh.u + m.ub*fh.b - a.ub*uh.b; // unknown part of rhs
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

  get_full_matrix_mass(p.mleft, a_all);
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

void get_rheolef_form_grad_grad(const char *meshfile, unsigned int 
				nv, unsigned int nuin, unsigned int nbin, 
				unsigned int *fnu, unsigned int *fnb, 
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
			   unsigned int *fnu, unsigned int *fnb, 
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

