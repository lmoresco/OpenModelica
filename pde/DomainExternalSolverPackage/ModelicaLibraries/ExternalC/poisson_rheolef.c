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

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -a %s %d P1 %s > temp_a.txt", meshfile, nv, bcfile);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_square_matrix("temp_a.txt", nv, laplace);
}

void get_rheolef_poisson_mass(const char *meshfile, MyInteger nv, double *laplace,
			      MyInteger nbc, MySizeType bcdim, double *bc)
{
  char buf[1024];

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -m %s %d P1 %s > temp_m.txt", meshfile, nv, bcfile);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_square_matrix("temp_m.txt", nv, laplace);
}

void get_rheolef_poisson_laplace_row(const char *meshfile, MyInteger nv, double *row, MyInteger i,
				     MyInteger nbc, MySizeType bcdim, double *bc)
{
  char buf[1024];

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -a %s %d P1 %s > temp_a.txt", meshfile, nv, bcfile);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_square_matrix_row("temp_a.txt", nv, row, i);
}

void get_rheolef_poisson_g(const char *meshfile, MyInteger nv, double *g,
			   MyInteger nbc, MySizeType bcdim, double *bc)
{
  char buf[1024];

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -g %s %d P1 %s > temp_g.txt", meshfile, nv, bcfile);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_vector("temp_g.txt", nv, g);
 
}

void get_rheolef_form_size(const char *meshfile, MyInteger nv, MyInteger *nu, MyInteger *nb,
			   MyInteger nbc, MySizeType bcdim, double *bc)
{
  char buf[1024];
  MyInteger sizes[2];

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -fsize %s %d P1 %s > temp_size.txt", meshfile, nv, bcfile);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_vector_int("temp_size.txt", 2, sizes);
  *nu = sizes[0];
  *nb = sizes[1];
}

void get_rheolef_form_grad_grad(const char *meshfile, MyInteger nv, 
				MyInteger nuin, MyInteger nbin, 
				double *uu, double *ub, double *bu, double *bb,
				MyInteger nbc, MySizeType bcdim, double *bc) 
{
  char buf[1024];
  doubleptr matrices[4] = { uu, ub, bu, bb};
  int n1[4] = {nuin, nuin, nbin, nbin};  // number of rows for each matrix
  int n2[4] = {nuin, nbin, nuin, nbin};  // number of columns for each matrix

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -fgg %s %d P1 %s > temp_form_grad_grad.txt", meshfile, nv, bcfile);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_matrices("temp_form_grad_grad.txt", 4, n1, n2, matrices);
}


void get_rheolef_form_mass(const char *meshfile, MyInteger nv, 
			   MyInteger nuin, MyInteger nbin, 
			   double *uu, double *ub, double *bu, double *bb,
			   MyInteger nbc, MySizeType bcdim, double *bc) 
{
  char buf[1024];
  doubleptr matrices[4] = { uu, ub, bu, bb};
  int n1[4] = {nuin, nuin, nbin, nbin};  // number of rows for each matrix
  int n2[4] = {nuin, nbin, nuin, nbin};  // number of columns for each matrix

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -fmass %s %d P1 %s > temp_form_mass.txt", meshfile, nv, bcfile);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_matrices("temp_form_mass.txt", 4, n1, n2, matrices);
}

void get_rheolef_unknown_indices(const char *meshfile, MyInteger nv, 
				 MyInteger nuin, 
				 MyInteger *indices,
				 MyInteger nbc, MySizeType bcdim, double *bc) 
{
  char buf[1024];

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -uind %d %s %d P1 %s > temp_u_indices.txt", nuin, meshfile, nv, bcfile);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_vector_int("temp_u_indices.txt", nuin, indices);
}

void get_rheolef_blocked_indices(const char *meshfile, MyInteger nv, 
				 MyInteger nbin, 
				 MyInteger *indices,
				 MyInteger nbc, MySizeType bcdim, double *bc) 
{
  char buf[1024];

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -bind %d %s %d P1 %s > temp_b_indices.txt", nbin, meshfile, nv, bcfile);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_vector_int("temp_b_indices.txt", nbin, indices);
}


void get_rheolef_blocked_values(const char *meshfile, MyInteger nv, 
				 MyInteger nbin, 
				 double *values,
				 MyInteger nbc, MySizeType bcdim, double *bc) 
{
  char buf[1024];

  write_bcfile(nbc, bcdim, bc);
  sprintf(buf, "extsolverrun.bat -bval %d %s %d P1 %s > temp_b_values.txt", nbin, meshfile, nv, bcfile);
  fprintf(stderr, "Running: %s\n", buf);
  system(buf);
  read_vector("temp_b_values.txt", nbin, values);
}



#ifdef __cplusplus
}
#endif 

