#ifndef BAMG_READ_EDGES_C
#define BAMG_READ_EDGES_C

#include <stdio.h>
#include "read_array_common.c"

void bamg_read_edges(const char *meshfile, int *v, size_t dim1, size_t dim2)
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

#endif /* #define BAMG_READ_EDGES_C */
