#include "rheolef_common.h"
#include "rheolef.h"
#include <fstream>
#include <vector>
#include <assert.h>

using namespace std;

#ifdef __cplusplus
extern "C" {
#endif 


void get_geo_bamg(const char *meshfile, geo& omega) {
  ifstream in(meshfile);
  in >> setbasename(meshfile);
  in >> bamg;
  in >> omega;  
  omega.upgrade();
  in.close();
}

void get_unknown_indices(const field &uh, vector<int> &indices) {

  const space &X = uh.get_space();
  size_type ni = uh.size();
  indices.resize(X.n_unknown());

  for (size_type i=0; i<ni; i++) {
    if (! X.is_blocked(i)) {
      assert (X.index(i) < indices.size());
      indices[X.index(i)] = i + 1;
    }
  }
}


void get_blocked_indices(const field &uh, vector<int> &indices) {

  const space &X = uh.get_space();
  size_type ni = uh.size();
  indices.resize(X.n_blocked());

  for (size_type i=0; i<ni; i++) {
    if (X.is_blocked(i)) {
      assert (X.index(i) < indices.size());
      indices[X.index(i)] = i + 1;
    }
  }
}


void get_full_matrix_laplace(const form& a, dns<Float>& M)
{
  const space & X = a.get_first_space();
  const space & Y = a.get_second_space();
  size_type ni = a.nrow();
  size_type nj = a.ncol();
  M = dns<Float>(ni,nj);

  for(size_type i=0; i<ni; i++) {
    // rows. map backwards from second space in form.
    size_type xi = Y.index(i);
    bool ib = Y.is_blocked(i);
    for(size_type j=0; j<nj; j++) {
      // columns map backwards from first space in form. Here, it is Vh:
      size_type xj = X.index(j);
      bool jb = X.is_blocked(j);
      Float val=1000*xi+100000+xj;
      if (ib) {
	if (jb) { // a.bb(xi, xj); 
	  if (xi==xj)
	    val=1;  // for boundary conditions, - (-1*u) = bndval;
	  else
	    val=0;
	} else {
	  val=0; // a.bu(xi, xj); 
	}
      } else {
	if (jb) {
	  val=a.ub(xi, xj); 
	} else {
	  val=a.uu(xi, xj);
	}
      }
      M(i,j) = val;
    }
  }
}

void get_full_matrix_mass(const form& a, dns<Float>& M)
{
  const space & X = a.get_first_space();
  const space & Y = a.get_second_space();
  size_type ni = a.nrow();
  size_type nj = a.ncol();
  M = dns<Float>(ni,nj);

  for(size_type i=0; i<ni; i++) {
    // rows. map backwards from second space in form.
    size_type xi = Y.index(i);
    bool ib = Y.is_blocked(i);
    for(size_type j=0; j<nj; j++) {
      // columns map backwards from first space in form. Here, it is Vh:
      size_type xj = X.index(j);
      bool jb = X.is_blocked(j);
      Float val=1000*xi+100000+xj;
      if (ib) {
	if (jb) { // a.bb(xi, xj); 
	  val=a.bb(xi,xj);
	} else {
	  val=a.bu(xi, xj); 
	}
      } else {
	if (jb) {
	  val=a.ub(xi, xj); 
	} else {
	  val=a.uu(xi, xj);
	}
      }
      M(i,j) = val;
    }
  }
}


void get_full_rhs(const field & uh, const vec<Float>& bu, vec<Float>& rhs) {

  const space &X = uh.get_space();
  size_type ni = uh.size();
  rhs.resize(ni);
  for (size_type i=0; i<ni; i++) {
    size_type xi=X.index(i);
    if (X.is_blocked(i))
      rhs(i)= uh.b(xi);
    else
      rhs(i) = bu(xi);
  }
}

void get_space_node_coords(const space &V, vec<point>& pu, vec<point>& pb) {

  typedef field::size_type size_type;
  field u(V);
  pu.resize(u.n_unknown());
  pb.resize(u.n_blocked());
  const geo&  g = V.get_geo() ;  
  const base& b = V.get_base() ;  
  check_macro (V.n_component() == 1, "interpolate: expect scalar space, get "
	<< V.n_component() << "D vector-valued space.");
  size_type coord_dimension = V.get_global_geo().dimension();
  std::vector<bool> marked (V.size(), false);
  for (geo::const_iterator iter_K = g.begin(); iter_K != g.end(); iter_K++) {
      const geo_element& K = *iter_K;
      size_type nb_dof = b.size(K.type()) ;
      tiny_vector<space::size_type> dof(nb_dof);
      V.set_dof(K, dof, 0) ;
      base::argv Karg (g.begin_node(), K);
      for(size_type i = 0; i < nb_dof; i++) {
	  size_type i_dof = dof[i];
	  if (marked [i_dof]) continue; else marked [i_dof] = true;
	  point x = b.node (Karg, i, coord_dimension);
	  size_type idx = V.index(i_dof);
	  if (V.is_blocked(i_dof))
	    pb(idx) = x;
	  else
	    pu(idx) = x;
      }
  }
}

  std::ostream& operator << (std::ostream& os, vec<point>& pv) {
    //    copy(pv.begin(), pv.end(), ostream_iterator<point>(os, ", "));
    vec<point>::iterator i=pv.begin();
    for(; i!=pv.end(); ++i)
      os << *i << ", ";
    return os;
  }



#ifdef __cplusplus
}
#endif 
