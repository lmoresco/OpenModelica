#ifndef ONEG_READ_SIZES_C
#define ONEG_READ_SIZES_C

#include <stdio.h>
#include "read_array_common.c"

void oneg_read_sizes(const char *meshfile, int *size, size_t dim)
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

  res=read_until_token(file, "Bdpoints");
  MY_ASSERT(res==0, "Error looking for Edges section in file");
  size[1] = READINT(file);

  res=read_until_token(file, "Intervals");
  MY_ASSERT(res==0, "Error looking for Triangles section in file");
  size[2] = READINT(file);

  fclose(file);

}

#endif /* #define ONEG_READ_SIZES_C */
