#ifndef READ_ARRAY_COMMON_C
#define READ_ARRAY_COMMON_C

#include <stdio.h>
#include <ModelicaUtilities.h>


#define INTERNALVARS  double internal_dbltemp; int internal_inttemp; int internal_foo
#define OPENCURLY(f) internal_foo=fscanf(f," {")
#define CLOSECURLY(f) internal_foo=fscanf(f," }")
#define READCOMMA(f) internal_foo=fscanf(f," ,")
#define READINT(f) (internal_foo=fscanf(f,"%d",&internal_inttemp),internal_inttemp)
#define READDOUBLE(f) (internal_foo=fscanf(f,"%lf",&internal_dbltemp),internal_dbltemp)
#define MY_ASSERT(cond,msg) if(!cond) { ModelicaError(msg); }

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

#endif /* #define READ_ARRAY_COMMON_C */
