#ifndef ONEG_GENERATE_MESH_C
#define ONEG_GENERATE_MESH_C

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include "read_array_common.c"

#define N0 100
#define EPS 0.01


void oneg_gridsize(double *boundary, double tol, int* n) {

  double len;
  double dx;
  double left=boundary[0];
  double right=boundary[1];
  int m;
  int N;

  len = right - left;
  dx = len;
  m =0;
      
  while( fabs(dx) > tol ) {
    dx = dx/2;
    m = m+1;
  }
       
  N = pow(2,m);
  *n = N + 1;
  return;
}




void oneg_gridgen(double *boundary, int *bc, double tol, int nsize, double* grid, int* newbc) {


  double len;
  double dx;
  double left=boundary[0];
  double right=boundary[1];
  int N;
  int i;
  
  len = right - left;
  dx = len;
      
  while( fabs(dx) > tol ) {
    dx = dx/2;
  }

  for (i=0; i<nsize; i++) {
    grid[i]=left+i*dx;
    newbc[i]=0;
  }
  newbc[0]=bc[0];
  newbc[nsize-1]=bc[1];

}

/*
void  oneg_generate_input(const char* meshinputfile, 
			  double *boundary, size_t bdim1, size_t bdim2, 
			  int *bc, size_t bcdim1,
			  double h) 
{

  FILE *out = fopen(meshinputfile, "w");
  int i,j;

  MY_ASSERT(bdim2 == 2, "Boundary points are not two-dimensional");
  MY_ASSERT(bdim1 == bcdim1, "Size of boundary conditions not same as boundary points");
  MY_ASSERT(out != NULL, "Failed to open meshfile for writing.");

  fprintf(out, "MeshVersionFormatted 0\n");

  //
  //if (angle >= 0) 
  //  out << "AngleOfCornerBound " << angle << endl;
  //

  fprintf(out,  "\nDimension 2\n");

  fprintf(out,  "\nVertices %d\n", bdim1);
  for (i=0; i<bdim1 ; i++)
    fprintf(out, "%f %f %d\n", boundary[bdim2*i], boundary[bdim2*i+1],
	    bc[i]);

  fprintf(out,  "\nEdges %d\n", bdim1 );

  for (i=1; i < bdim1; i++)
     fprintf(out, "%d %d %d\n", i, i+1, bc[i-1]);
  fprintf(out, "%d %d %d\n", i, 1, bc[i-1]);

  fprintf(out, "\nhVertices\n");
  j=0;
  for (i=0; i<bdim1; i++,j++) {
    fprintf(out, "%f ", h);
    if (j==20) {
      fprintf(out, "\n");
      j=0;
    }
  }
  fprintf(out, "\n");

  fclose(out);
}

*/
			 


void  oneg_generate_output(const char* outputfile, 
						  double *boundary, size_t bdim1, 
						  int *bc, size_t bcdim1,
						  double tol) 
{

  FILE *out = fopen(outputfile, "w");
  int i,j;
  int nv=0;
  double *vertices;
  int *newbc;

   MY_ASSERT(bdim1 == bcdim1, "Size of boundary conditions not same as boundary points");
  MY_ASSERT(out != NULL, "Failed to open meshfile for writing.");

  fprintf(out, "MeshVersionFormatted 0\n");

  /*
  if (angle >= 0) 
    out << "AngleOfCornerBound " << angle << endl;
  */

  fprintf(out,  "\nDimension 1\n");

  oneg_gridsize(boundary,tol,&nv);
  vertices=malloc(sizeof(double)*nv);
  newbc=malloc(sizeof(int)*nv);
  oneg_gridgen(boundary,bc,tol,nv,vertices,newbc);

  fprintf(out,  "\nVertices %d\n", nv);
  for (i=0; i<nv ; i++)
    fprintf(out, "%f %d\n", vertices[i], newbc[i]);
  fprintf(out,"\n");

  fprintf(out,  "\Bdpoints %d\n", bdim1);
  fprintf(out, "%d %d\n", 1, bc[0]);
  fprintf(out, "%d %d\n", nv, bc[1]);
  fprintf(out,"\n");

  fprintf(out,  "\nIntervals %d\n", nv-1 );

  for (i=1; i < nv; i++)
     fprintf(out, "%d %d %d\n", i, i+1, 1);
  
  fprintf(out,"End\n");

  fclose(out);
}


void oneg_generate_mesh(const char *exec, const char *outputfile, int *status,
			double *boundary, size_t bdim1,
			int *bc, size_t bcdim1, 
			double refine)
{
  int res;
  int i=0;
  double tol;
  char buf[1024]="";
  char meshinputfile[100]="meshgeninput.msh";

  MY_ASSERT(bdim1 == bcdim1, "Size of boundary conditions not same as boundary points");

  
  /* Useful for calling an external 1D mesh generator:

  oneg_generate_input(meshinputfile, boundary, bdim1, bdim2, bc, bcdim1, h);

  strcat(buf, exec);
  strcat(buf, " ");
  strcat(buf, meshinputfile);
  strcat(buf, " ");
  strcat(buf, outputfile);
  printf("Calling... %s\n",buf);
  res = system(buf);
  *status = res;
  printf("Result: %d\n",res);
  */

  tol = 1/((1 + N0*(1 - refine))*(1 - log(refine + EPS)));

  oneg_generate_output(outputfile, boundary, bdim1, bc, bcdim1, tol);
  return;
}

#undef N0
#undef EPS

#endif /* #define ONEG_GENERATE_MESH_C */
