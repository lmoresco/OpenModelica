#ifndef POISSON_RHEOLEF_H
#define POISSON_RHEOLEF_H

#include "read_array_common.h"

#ifdef __cplusplus
extern "C" {
#endif


  void get_rheolef_poisson_laplace(const char *meshfile, MyInteger nv, double *laplace,
				   MyInteger nbc, MySizeType bcdim, double *bc);
  void get_rheolef_poisson_mass(const char *meshfile, MyInteger nv, double *mass,
				MyInteger nbc, MySizeType bcdim, double *bc);
  void get_rheolef_poisson_laplace_row(const char *meshfile, MyInteger nv, double *row, MyInteger i,
				       MyInteger nbc, MySizeType bcdim, double *bc);
  void get_rheolef_poisson_g(const char *meshfile, MyInteger nv, double *g,
			     MyInteger nbc, MySizeType bcdim, double *bc);
  void get_rheolef_form_size(const char *meshfile, MyInteger nv, MyInteger *nu, MyInteger *nb,
			     MyInteger nbc, MySizeType bcdim, double *bc);
  void get_rheolef_form_size_bdr(const char *meshfile, MyInteger bndindex, 
				 MyInteger nv, MyInteger *nu, MyInteger *nb,
				 MyInteger nbc, MySizeType bcdim, double *bc);
  void get_rheolef_form_grad_grad(const char *meshfile, MyInteger nv, MyInteger nuin, MyInteger nbin, 
				  double *uu, double *ub, double *bu, double *bb,
				  MyInteger nbc, MySizeType bcdim, double *bc);
  void get_rheolef_form_mass(const char *meshfile, MyInteger nv, MyInteger nuin, MyInteger nbin, 
			     double *uu, double *ub, double *bu, double *bb,
			     MyInteger nbc, MySizeType bcdim, double *bc) ;

  void get_rheolef_form_mass_bdr(const char *meshfile, MyInteger bndindex,
				 MyInteger nv, 
				 MyInteger nuin, MyInteger nbin, 
				 double *uu, double *ub, double *bu, double *bb,
				 MyInteger nbc, MySizeType bcdim, double *bc);

void get_rheolef_form_mass_bdr_on_bnd(const char *meshfile, MyInteger bndindex,
				      MyInteger nv, MyInteger nuin, MyInteger nbin, 
				      double *uu, double *ub, double *bu, double *bb,
				      MyInteger nbc, MySizeType bcdim, double *bc);

  void get_rheolef_form(const char *formname, 
			const char *meshfile, MyInteger nv, MyInteger nuin, MyInteger nbin, 
			double *uu, double *ub, double *bu, double *bb,
			MyInteger nbc, MySizeType bcdim, double *bc) ;

  void get_rheolef_unknown_indices(const char *meshfile, MyInteger nv, MyInteger nuin, MyInteger *indices,
				   MyInteger nbc, MySizeType bcdim, double *bc);
  void get_rheolef_blocked_indices(const char *meshfile, MyInteger nv, MyInteger nbin, MyInteger *indices,
				   MyInteger nbc, MySizeType bcdim, double *bc);
  
  void get_rheolef_blocked_values(const char *meshfile, MyInteger nv, MyInteger nbin, double *values,
				  MyInteger nbc, MySizeType bcdim, double *bc);


  void get_rheolef_interpolate_bdr_coords(const char *meshfile, MyInteger bndindex,
					  MyInteger nv, 
					  MyInteger nuin, MyInteger nbin, MySizeType pdim,
					  double *pu, double *pb,
					  MyInteger nbc, MySizeType bcdim, double *bc);


#ifdef __cplusplus
}
#endif


#endif /* POISSON_RHEOLEF_H */

