#ifndef READ_ARRAY_C
#define READ_ARRAY_C

#include <stdio.h>

#define INTERNALVARS  double internal_dbltemp; int internal_inttemp; int internal_foo
#define OPENCURLY(f) internal_foo=fscanf(f," {")
#define CLOSECURLY(f) internal_foo=fscanf(f," }")
#define READCOMMA(f) internal_foo=fscanf(f," ,")
#define READINT(f) (internal_foo=fscanf(f,"%d",&internal_inttemp),internal_inttemp)
#define READDOUBLE(f) (internal_foo=fscanf(f,"%lf",&internal_dbltemp),internal_dbltemp)

#define W_OPENCURLY(f) internal_foo=fprintf(f,"{")
#define W_CLOSECURLY(f) internal_foo=fprintf(f,"}")
#define WRITECOMMA(f) internal_foo=fprintf(f,",")
#define WRITEINT(f,a) internal_foo=fprintf(f,"%d",a)
#define WRITEDOUBLE(f,a) internal_foo=fprintf(f,"%lf",a)


void read_double_array_1d(FILE *file, double *a, int n) {
  /* declare internal variables for macros */

  INTERNALVARS;
  
  int i;

  OPENCURLY(file);
  for (i=0; i<n; i++) {
    a[i] = READDOUBLE(file);
    if (i<n-1) {
      READCOMMA(file);
    }
  }
  CLOSECURLY(file);
}

void read_double_array_2d(FILE *file, double *a, int n, int m) {
  /* declare internal variables for macros */
  INTERNALVARS;
  
  int i;

  OPENCURLY(file);
  for (i=0; i<n; i++) {
    read_double_array_1d(file, &(a[i*m]), m);
    if (i<n-1) {
      READCOMMA(file);
    }
  }
  CLOSECURLY(file);
}

void write_double_array_1d(FILE *file, double *a, int n) {
  /* declare internal variables for macros */

  INTERNALVARS;
  
  int i;

  W_OPENCURLY(file);
  for (i=0; i<n; i++) {
    WRITEDOUBLE(file, a[i]);
    if (i<n-1) {
      WRITECOMMA(file);
    }
  }
  W_CLOSECURLY(file);
}

void write_double_array_2d(FILE *file, double *a, int n, int m) {
  /* declare internal variables for macros */
  INTERNALVARS;
  
  int i;

  W_OPENCURLY(file);
  for (i=0; i<n; i++) {
    write_double_array_1d(file, &(a[i*m]), m);
    if (i<n-1) {
      WRITECOMMA(file);
    }
  }
  W_CLOSECURLY(file);
}

void read_int_array_1d(FILE *file, int *a, int n) {
  /* declare internal variables for macros */
  INTERNALVARS;
  
  int i;

  OPENCURLY(file);
  for (i=0; i<n; i++) {
    a[i] = READINT(file);
    if (i<n-1) {
      READCOMMA(file);
    }
  }
  CLOSECURLY(file);
}

void read_int_array_2d(FILE *file, int *a, int n, int m) {
  /* declare internal variables for macros */
  INTERNALVARS;
 i;

  OPENCURLY(file);
  for (i=0; i<n; i++) {
    read_int_array_1d(file, &(a[i*m]), m);
    if (i<n-1) {
      READCOMMA(file);
    }
  }
  CLOSECURLY(file);
}


void read_array_test(const char *filename, double *A, size_t a1, size_t a2, double *B, size_t b1, size_t b2)
{
  /* declare internal variables for macros */
  INTERNALVARS;
  
  FILE *file;
  
/*
  A = (int*)malloc(sizeof(int)*m1size1*m1size2);
  B = (int*)malloc(sizeof(int)*m2size1*m2size2);
*/
  

  /* open file */
  file = fopen(filename,"rb");

  OPENCURLY(file);
  read_double_array_2d(file, A, a1, a2);
  read_double_array_2d(file, B, b1, b2);
  CLOSECURLY(file);

  fclose(file);

}

void write_array_test(const char *filename, double *A, size_t a1, size_t a2)
{
  /* declare internal variables for macros */
  INTERNALVARS;
  
  FILE *file;
  
/*
  A = (int*)malloc(sizeof(int)*m1size1*m1size2);
  B = (int*)malloc(sizeof(int)*m2size1*m2size2);
*/
  

  /* open file */
  file = fopen(filename,"wb");

  W_OPENCURLY(file);
  write_double_array_2d(file, A, a1, a2);
  W_CLOSECURLY(file);

  fclose(file);

}


#endif /* READ_ARRAY_C */
