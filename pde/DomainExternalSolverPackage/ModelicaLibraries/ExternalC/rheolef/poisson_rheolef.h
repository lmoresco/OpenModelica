#ifndef _POISSON_RHEOLEF_H_
#define _POISSON_RHEOLEF_H_


#ifdef __cplusplus
extern "C" {
#endif 

  void get_rheolef_poisson_laplace(const char *meshfile, const char *eltype, unsigned int nv, double *laplace,
				   unsigned int nbc, unsigned int bcdim, double *bc);
  void get_rheolef_poisson_mass(const char *meshfile, const char *eltype, unsigned int nv, double *mass,
				unsigned int nbc, unsigned int bcdim, double *bc);
  void get_rheolef_poisson_g(const char *meshfile, const char *eltype, unsigned int nv, double *g,
			     unsigned int nbc, unsigned int bcdim, double *bc);
  void get_rheolef_poisson_fh(const char *meshfile, const char *eltype, unsigned int nv, double *g,
			      unsigned int nbc, unsigned int bcdim, double *bc);
  void get_rheolef_form_size(const char *meshfile, unsigned int nv, unsigned int *nu, unsigned int *nb,
			     unsigned int nbc, unsigned int bcdim, double *bc);
  void get_rheolef_form_size_bdr(const char *meshfile, unsigned int bndindex, 
				 unsigned int nv, unsigned int *nu, unsigned int *nb,
				 unsigned int nbc, unsigned int bcdim, double *bc);
  void get_rheolef_form_grad_grad(const char *meshfile, unsigned int nv, unsigned int nuin, unsigned int nbin, 
				  unsigned int *fnu, unsigned int *fnb, 
				  double *uu, double *ub, double *bu, double *bb, 
				  unsigned int nbc, unsigned int bcdim, double *bc);
  void get_rheolef_form_mass(const char *meshfile, unsigned int nv, unsigned int nuin, unsigned int nbin, 
				  unsigned int *fnu, unsigned int *fnb, 
				  double *uu, double *ub, double *bu, double *bb,
				 unsigned int nbc, unsigned int bcdim, double *bc);
  void get_rheolef_unknown_indices(const char *meshfile, const char *eltype, 
				   unsigned int nv, unsigned int nuin, int *indices, 
				  unsigned int nbc, unsigned int bcdim, double *bc);
  void get_rheolef_blocked_indices(const char *meshfile, const char *eltype, 
				   unsigned int nv, unsigned int nbin, int *indices, 
				  unsigned int nbc, unsigned int bcdim, double *bc);
  void get_rheolef_blocked_values(const char *meshfile, const char *eltype, 
				  unsigned int nv, unsigned int nbin, double *values, 
				  unsigned int nbc, unsigned int bcdim, double *bc);
  void get_rheolef_form(const char *formname, const char *meshfile, unsigned int nv, 
			unsigned int nuin, unsigned int nbin, 
			unsigned int *fnu, unsigned int *fnb, 
			double *uu, double *ub, double *bu, double *bb,
			unsigned int nbc, unsigned int bcdim, double *bc);

  void get_rheolef_form_mass_bdr(const char *meshfile, unsigned int bndindex,
				 unsigned int nv, 
				 unsigned int nuin, unsigned int nbin, 
				 unsigned int *fnu, unsigned int *fnb, 
				 double *uu, double *ub, double *bu, double *bb,
				 unsigned int nbc, unsigned int bcdim, double *bc);

  void get_rheolef_form_mass_bdr_on_bnd(const char *meshfile, unsigned int bndindex,
					unsigned int nv, 
					unsigned int nuin, unsigned int nbin, 
					unsigned int *fnu, unsigned int *fnb, 
					double *uu, double *ub, double *bu, double *bb,
					unsigned int nbc, unsigned int bcdim, double *bc);

void get_rheolef_interpolate_bdr_coords(const char *meshfile, unsigned int bndindex, unsigned int nv, 
					unsigned int nu, unsigned int nb,
					unsigned int pdim, 
					double *pu, double *pb,
					unsigned int nbc, unsigned int bcdim, double *bc);


#ifdef __cplusplus
}
#endif 


#endif /* _POISSON_RHEOLEF_H_ */
