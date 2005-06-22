#ifndef READ_ARRAY_COMMON_H
#define READ_ARRAY_COMMON_H

#include <stdio.h>

typedef long MyInteger;
typedef MyInteger MySizeType;

#ifdef __cplusplus
extern "C" {
#endif 

#ifndef WITHOUT_DYMOLA
#include <ModelicaUtilities.h>
#endif

#ifdef WITHOUT_DYMOLA
#define ModelicaError(msg) { printf("ModelicaError (%s:%d): %s", __FILE__, __LINE__, msg); exit(3); }
#define ModelicaMessage(msg) { printf("ModelicaMessage  (%s:%d): %s", __FILE__, __LINE__, msg); }
#endif


#define INTERNALVARS  double internal_dbltemp; MyInteger internal_inttemp; int internal_foo
#define OPENCURLY(f) internal_foo=fscanf(f," {")
#define CLOSECURLY(f) internal_foo=fscanf(f," }")
#define READCOMMA(f) internal_foo=fscanf(f," ,")
#define READINT(f) (internal_foo=fscanf(f,"%ld",&internal_inttemp),internal_inttemp)
#define READDOUBLE(f) (internal_foo=fscanf(f,"%lf",&internal_dbltemp),internal_dbltemp)
#define MY_ASSERT(cond,msg) do { if(!(cond)) ModelicaError(msg); } while (0)
#define MY_ASSERT_ARGS(cond, str, args...) do { char buf[512]; sprintf(buf,str,args); if(!(cond)) ModelicaError(buf); } while (0)
#define MY_MESSAGE(msg) do { ModelicaMessage(msg); } while (0)


#define WRITEOPENCURLY(f) fprintf(f," {")
#define WRITECLOSECURLY(f) fprintf(f," }")
#define WRITECOMMA(f) fprintf(f," ,")
#define WRITEINT(f,val) fprintf(f,"%d",val)
#define WRITEDOUBLE(f,val) fprintf(f,"%lf",val)


int read_until_token(FILE *file, const char *token);

#ifdef __cplusplus
}
#endif 

#endif /* #define READ_ARRAY_COMMON_H */
