#ifndef ONED_READ_INTERVALS_C
#define ONED_READ_INTERVALS_C

#include <stdio.h>
#include "read_array_common.c"

void oneD_read_intervals(const char *meshfile, int *v, size_t dim1, size_t dim2)
{
  
  FILE *file;
  int res;
  int i;
  INTERNALVARS;

  MY_ASSERT(dim2 == 3, "Second dimension must be 3");

  /* open file */
  file = fopen(meshfile,"rb");
  MY_ASSERT(file != NULL, "Error opening file");

  res=read_until_token(file, "Intervals");
  MY_ASSERT(res==0, "Error looking for Intervals section in file");

  res=READINT(file);
  MY_ASSERT(res==dim1, "Size in file doesn't match given size");

  for (i=0; i<dim1; i++) {
    MY_ASSERT(feof(file)==0, "File ended before reading finished.");
    v[dim2*i] = READINT(file);	 /* vertex index 1 */
    v[dim2*i+1] = READINT(file); /* vertex index 2 */
    v[dim2*i+2] = READINT(file); /* vertex index 3 */
    //READINT(file); /* throw away, subdomain info? */
  }

}

#endif /* #define ONED_READ_INTERVALS_C */
