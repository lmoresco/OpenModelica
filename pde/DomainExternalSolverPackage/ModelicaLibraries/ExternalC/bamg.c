#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "bamg.h"
#include "read_array_common.h"

#ifdef __cplusplus
extern "C" {
#endif


void  bamg_generate_input(const char* meshinputfile, 
			  double *boundary, MySizeType bdim1, MySizeType bdim2, 
			  MyInteger *bc, MySizeType bcdim1,
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



void bamg_generate_mesh(const char *exec, const char *outputfile, MyInteger *status,
			double *boundary, MySizeType bdim1, MySizeType bdim2,
			MyInteger *bc, MySizeType bcdim1, 
			double h)
{
  int res;
  int i=0;
  char buf[1024]="";
  char meshinputfile[100]="meshgeninput.msh";
  FILE *outappend;

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

  fprintf(outappend, "EdgeDomainNames\n1\nboundary\n");
  
  fclose(outappend);

  return;
}


void bamg_read_edges(const char *meshfile, MyInteger *v, MySizeType dim1, MySizeType dim2)
{
  
  FILE *file;
  int res;
  int i;
  INTERNALVARS;

  MY_ASSERT(dim2==3, "Second dimension must be 3");

  /* open file */
  file = fopen(meshfile,"rb");
  MY_ASSERT(file != NULL, "Error opening file");

  res=read_until_token(file, "Edges");
  MY_ASSERT(res==0, "Error looking for Edges section in file");

  res=READINT(file);
  MY_ASSERT(res==dim1, "Size in file doesn't match given size");

  for (i=0; i<dim1; i++) {
    MY_ASSERT(feof(file)==0, "File ended before reading finished.");
    v[dim2*i] = READINT(file);   /* first vertex index */
    v[dim2*i+1] = READINT(file); /* second vertex index */
    v[dim2*i+2] = READINT(file); /* bc index */
  }

}


void bamg_read_sizes(const char *meshfile, MyInteger *size, MySizeType dim)
{
  
  FILE *file;
  int res;
  INTERNALVARS;

  MY_ASSERT(dim == 3, "Second dimension must be 3");

  /* open file */
  file = fopen(meshfile,"rb");

  MY_ASSERT(file != NULL, "Error opening file");

  res=read_until_token(file, "Vertices");
  MY_ASSERT(res==0, "Error looking for Vertices section in file");
  size[0] = READINT(file);

  res=read_until_token(file, "Edges");
  MY_ASSERT(res==0, "Error looking for Edges section in file");
  size[1] = READINT(file);

  res=read_until_token(file, "Triangles");
  MY_ASSERT(res==0, "Error looking for Triangles section in file");
  size[2] = READINT(file);

  fclose(file);

}

void bamg_read_triangles(const char *meshfile, MyInteger *v, MySizeType dim1, MySizeType dim2)
{
  
  FILE *file;
  int res;
  int i;
  INTERNALVARS;

  MY_ASSERT(dim2 == 4, "Second dimension must be 4");

  /* open file */
  file = fopen(meshfile,"rb");
  MY_ASSERT(file != NULL, "Error opening file");

  res=read_until_token(file, "Triangles");
  MY_ASSERT(res==0, "Error looking for Triangles section in file");

  res=READINT(file);
  MY_ASSERT(res==dim1, "Size in file doesn't match given size");

  for (i=0; i<dim1; i++) {
    MY_ASSERT(feof(file)==0, "File ended before reading finished.");
    v[dim2*i] = READINT(file);	 /* vertex index 1 */
    v[dim2*i+1] = READINT(file); /* vertex index 2 */
    v[dim2*i+2] = READINT(file); /* vertex index 3 */
    v[dim2*i+3] = READINT(file); /* vertex index 4 */
    //READINT(file); /* throw away, subdomain info? */
  }

}

void bamg_read_vertices(const char *meshfile, double *v, MySizeType dim1, MySizeType dim2)
{
  
  FILE *file;
  int res;
  int i;
  INTERNALVARS;

  MY_ASSERT(dim2 == 3, "Second dimension must be 3");

  /* open file */
  file = fopen(meshfile,"rb");
  MY_ASSERT(file != NULL, "Error opening file");

  res=read_until_token(file, "Vertices");
  MY_ASSERT(res==0, "Error looking for Vertices section in file");

  res=READINT(file);
  MY_ASSERT(res==dim1, "Size in file doesn't match given size");

  for (i=0; i<dim1; i++) {
    MY_ASSERT(feof(file)==0, "File ended before reading finished.");
    v[dim2*i] = READDOUBLE(file);   /* x */
    v[dim2*i+1] = READDOUBLE(file); /* y */
    v[dim2*i+2] = (double) READINT(file); /* y */
    //READINT(file); /* throw away, subdomain info? */
  }

}


#ifdef __cplusplus
}
#endif
