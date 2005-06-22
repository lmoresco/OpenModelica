#include "read_array_common.h"
#include "poisson_rheolef.h"
#include "read_matrix.h"

const char bcfile[]="temp_bc.txt";

void write_bcfile(MyInteger nbc, MySizeType bcdim, double *bc) {
  write_matrix(bcfile,nbc,bcdim,bc);
}

void get_rheolef_poisson_laplace(const char *meshfile, MyInteger nv, double *laplace,
				 MyInteger nbc, MySizeType bcdim, double *bc)
{
  char buf[1024];
  char tempfilename[]="temp_a.txt";

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -a %s %d P1 %s > %s", meshfile, nv, bcfile, tempfilename);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_square_matrix(tempfilename, nv, laplace);
}

void get_rheolef_poisson_mass(const char *meshfile, MyInteger nv, double *laplace,
			      MyInteger nbc, MySizeType bcdim, double *bc)
{
  char buf[1024];
  char tempfilename[]="temp_m.txt";

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -m %s %d P1 %s > %s", meshfile, nv, bcfile, tempfilename);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_square_matrix(tempfilename, nv, laplace);
}

void get_rheolef_poisson_laplace_row(const char *meshfile, MyInteger nv, double *row, MyInteger i,
				     MyInteger nbc, MySizeType bcdim, double *bc)
{
  char buf[1024];
  char tempfilename[]="temp_a.txt";

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -a %s %d P1 %s > %s", meshfile, nv, bcfile, tempfilename);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_square_matrix_row(tempfilename, nv, row, i);
}

void get_rheolef_poisson_g(const char *meshfile, MyInteger nv, double *g,
			   MyInteger nbc, MySizeType bcdim, double *bc)
{
  char buf[1024];
  char tempfilename[]="temp_g.txt";

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -g %s %d P1 %s > %s", meshfile, nv, bcfile, tempfilename);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_vector(tempfilename, nv, g);
 
}

void get_rheolef_form_size(const char *meshfile, MyInteger nv, MyInteger *nu, MyInteger *nb,
			   MyInteger nbc, MySizeType bcdim, double *bc)
{
  char buf[1024];
  MyInteger sizes[2];
  char tempfilename[]="temp_form_size.txt";

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -fsize %s %d P1 %s > %s", meshfile, nv, bcfile, tempfilename);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_vector_int(tempfilename, 2, sizes);
  *nu = sizes[0];
  *nb = sizes[1];
}

void get_rheolef_form_size_bdr(const char *meshfile, MyInteger bndindex, 
			       MyInteger nv, MyInteger *nu, MyInteger *nb,
			       MyInteger nbc, MySizeType bcdim, double *bc)
{
  char buf[1024];
  MyInteger sizes[2];
  char tempfilename[]="temp_form_size_bdr.txt";

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -fsizebdr %d %s %d P1 %s > %s", bndindex, meshfile, nv, bcfile, tempfilename);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_vector_int(tempfilename, 2, sizes);
  *nu = sizes[0];
  *nb = sizes[1];
}

void get_rheolef_form_grad_grad(const char *meshfile, MyInteger nv, 
				MyInteger nuin, MyInteger nbin, 
				double *uu, double *ub, double *bu, double *bb,
				MyInteger nbc, MySizeType bcdim, double *bc) 
{
  char buf[1024];
  char tempfilename[]="temp_form_gradgrad.txt";

  doubleptr matrices[4] = { uu, ub, bu, bb};
  int n1[4] = {nuin, nuin, nbin, nbin};  // number of rows for each matrix
  int n2[4] = {nuin, nbin, nuin, nbin};  // number of columns for each matrix

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -fgg %s %d P1 %s > %s", meshfile, nv, bcfile, tempfilename);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_matrices(tempfilename, 4, n1, n2, matrices);
}



void get_rheolef_form_mass(const char *meshfile, MyInteger nv, 
			   MyInteger nuin, MyInteger nbin, 
			   double *uu, double *ub, double *bu, double *bb,
			   MyInteger nbc, MySizeType bcdim, double *bc) 
{
  char buf[1024];
  char tempfilename[]="temp_form_mass.txt";
  doubleptr matrices[4] = { uu, ub, bu, bb};
  int n1[4] = {nuin, nuin, nbin, nbin};  // number of rows for each matrix
  int n2[4] = {nuin, nbin, nuin, nbin};  // number of columns for each matrix

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -fmass %s %d P1 %s > %s", meshfile, nv, bcfile, tempfilename);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_matrices(tempfilename, 4, n1, n2, matrices);
}

void get_rheolef_massbdr_u(const char *meshfile, MyInteger nv, 
			   MyInteger nuin, MyInteger nbin, 
			   double *mbu, 
			   MyInteger nbc, MySizeType bcdim, double *bc) 
{
  char buf[1024];
  char tempfilename[]="temp_massbdr_u.txt";

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -massbdr_u %s %d P1 %s > %s", meshfile, nv, bcfile, tempfilename);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_vector(tempfilename, nuin, mbu);
}

void get_rheolef_form_mass_bdr(const char *meshfile, MyInteger bndindex,
			       MyInteger nv, 
			       MyInteger nuin, MyInteger nbin, 
			       double *uu, double *ub, double *bu, double *bb,
			       MyInteger nbc, MySizeType bcdim, double *bc) 
{
  char buf[1024];
  char tempfilename[]="temp_form_massbdr.txt";
  doubleptr matrices[4] = { uu, ub, bu, bb};
  int n1[4] = {nuin, nuin, nbin, nbin};  // number of rows for each matrix
  int n2[4] = {nuin, nbin, nuin, nbin};  // number of columns for each matrix

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -fmassbdr %d %s %d P1 %s > %s", bndindex, meshfile, nv, bcfile, tempfilename);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_matrices(tempfilename, 4, n1, n2, matrices);
}

void get_rheolef_form_mass_bdr_on_bnd(const char *meshfile, MyInteger bndindex,
				      MyInteger nv, MyInteger nuin, MyInteger nbin, 
				      double *uu, double *ub, double *bu, double *bb,
				      MyInteger nbc, MySizeType bcdim, double *bc) 
{
  char buf[1024];
  char tempfilename[]="temp_form_massbdr_on_bnd.txt";
  doubleptr matrices[4] = { uu, ub, bu, bb};
  int n1[4] = {nuin, nuin, nbin, nbin};  // number of rows for each matrix
  int n2[4] = {nuin, nbin, nuin, nbin};  // number of columns for each matrix

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -fmassbdrbnd %d %s %d P1 %s > %s", bndindex, meshfile, nv, bcfile, tempfilename);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_matrices(tempfilename, 4, n1, n2, matrices);
}

void get_rheolef_unknown_indices(const char *meshfile, MyInteger nv, 
				 MyInteger nuin, 
				 MyInteger *indices,
				 MyInteger nbc, MySizeType bcdim, double *bc) 
{
  char buf[1024];
  char tempfilename[]="temp_u_indices.txt";

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -uind %d %s %d P1 %s > %s", nuin, meshfile, nv, bcfile, tempfilename);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_vector_int(tempfilename, nuin, indices);
}

void get_rheolef_blocked_indices(const char *meshfile, MyInteger nv, 
				 MyInteger nbin, 
				 MyInteger *indices,
				 MyInteger nbc, MySizeType bcdim, double *bc) 
{
  char buf[1024];
  char tempfilename[]="temp_b_indices.txt";

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -bind %d %s %d P1 %s > %s", nbin, meshfile, nv, bcfile, tempfilename);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_vector_int(tempfilename, nbin, indices);
}


void get_rheolef_blocked_values(const char *meshfile, MyInteger nv, 
				 MyInteger nbin, 
				 double *values,
				 MyInteger nbc, MySizeType bcdim, double *bc) 
{
  char buf[1024];
  char tempfilename[]="temp_b_values.txt";

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -bval %d %s %d P1 %s > %s", nbin, meshfile, nv, bcfile, tempfilename);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_vector(tempfilename, nbin, values);
}


void get_rheolef_form(const char *formname, 
		      const char *meshfile, MyInteger nv, 
		      MyInteger nuin, MyInteger nbin, 
		      double *uu, double *ub, double *bu, double *bb,
		      MyInteger nbc, MySizeType bcdim, double *bc) 
{
  char buf[1024];
  char tempfilename[256];
  doubleptr matrices[4] = { uu, ub, bu, bb};
  int n1[4] = {nuin, nuin, nbin, nbin};  // number of rows for each matrix
  int n2[4] = {nuin, nbin, nuin, nbin};  // number of columns for each matrix

  write_bcfile(nbc, bcdim, bc);

  sprintf(tempfilename, "temp_form_%s", formname);
  sprintf(buf, "extsolverrun.bat -form %s %s %d P1 %s > %s", formname, meshfile, nv, bcfile, tempfilename);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_matrices(tempfilename, 4, n1, n2, matrices);
}

void get_rheolef_interpolate_bdr_coords(const char *meshfile, MyInteger bndindex,
					MyInteger nv, 
					MyInteger nuin, MyInteger nbin, MySizeType pdim,
					double *pu, double *pb,
					MyInteger nbc, MySizeType bcdim, double *bc) 
{
  char buf[1024];
  char tempfilename[]="temp_form_bdr_coords.txt";
  doubleptr matrices[2] = { pu, pb };
  int n1[2] = {nuin, nbin};  // number of rows for each matrix
  int n2[2] = {pdim, pdim};  // number of columns for each matrix

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -interpolate %d %s %d P1 %s > %s", bndindex, meshfile, nv, bcfile, tempfilename);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_matrices(tempfilename, 2, n1, n2, matrices);
}


#ifdef __cplusplus
}
#endif 

