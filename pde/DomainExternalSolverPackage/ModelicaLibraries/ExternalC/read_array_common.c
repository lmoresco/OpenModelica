#include <stdio.h>
#include "read_array_common.h"

#ifdef __cplusplus
extern "C" {
#endif 

int read_until_token(FILE *file, const char *token) {
  char buf[1024]="";
  fscanf(file, "%s", buf);
  while (strncmp(buf, token,1024) != 0) {
    if (feof(file))
      return -1;
    fscanf(file, "%s", buf);
  }
  return 0;
}

#ifdef __cplusplus
}
#endif 
