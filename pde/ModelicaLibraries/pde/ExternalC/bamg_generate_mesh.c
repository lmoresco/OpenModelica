#ifndef BAMG_GENERATE_MESH_C
#define BAMG_GENERATE_MESH_C

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "read_array_common.c"



void  bamg_generate_input(const char* meshinputfile, 
			  double *boundary, size_t bdim1, size_t bdim2, 
			  int *bc, size_t bcdim1,
			  double h) {

  FILE *out = fopen(meshinputfile, "w");
  int i,j;

  MY_ASSERT(bdim2 == 2, "Boundary points are not two-dimensional");
  MY_ASSERT(bdim1 == bcdim1, "Size of boundary conditions not same as boundary points");
  MY_ASSERT(out != NULL, "Failed to open meshfile for writing.");

  fprintf(out, "MeshVersionFormatted 0\n");

  /*
  if (angle >= 0) 
    out << "AngleOfCornerBound " << angle << endl;
  */

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



void bamg_generate_mesh(const char *exec, const char *outputfile, int *status,
			double *boundary, size_t bdim1, size_t bdim2,
			int *bc, size_t bcdim1, 
			double h)
{
  int res;
  size_t i=0,j=0;
  char buf[1024]="";
  char meshinputfile[100]="meshgeninput.msh";
  FILE *outappend;
  int edgedomains[bcdim1];
  int nbr_edgedomains=0;
  int found=0;

  MY_ASSERT(bdim2 == 2, "Boundary points are not two-dimensional");
  MY_ASSERT(bdim1 == bcdim1, "Size of boundary conditions not same as boundary points");

  
  bamg_generate_input(meshinputfile, boundary, bdim1, bdim2, bc, bcdim1, h);

  strcat(buf, exec);
  strcat(buf, " ");
  strcat(buf, meshinputfile);
  strcat(buf, " ");
  strcat(buf, outputfile);
  printf("Calling... %s\n",buf);
  res = system(buf);
  *status = res;
  printf("Result: %d\n",res);


  outappend = fopen(outputfile, "a");

  nbr_edgedomains=0;
  for(i=0; i<bcdim1; i++) {
    found=0;
    for (j=0; j<nbr_edgedomains; j++) {
      if (edgedomains[j] == bc[i]) {
	found=1;
	break;
      }
    }
    if (! found ) {
      edgedomains[nbr_edgedomains]=bc[i];
      nbr_edgedomains++;
    }
  }


  fprintf(outappend, "EdgeDomainNames\n%d\n",nbr_edgedomains);
  for(i=0; i<nbr_edgedomains; i++)
    fprintf(outappend, "bndpart%d\n", i+1);
  
  fclose(outappend);

  return;
}

#endif /* #define BAMG_GENERATE_MESH_C */
