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

#ifdef __cplusplus
}
#endif 
