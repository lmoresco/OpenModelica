#ifndef READ_ARRAY_C
#define READ_ARRAY_C

#include <stdio.h>

#define INTERNALVARS  double internal_dbltemp; int internal_inttemp; int internal_foo
#define OPENCURLY(f) internal_foo=fscanf(f," {")
#define CLOSECURLY(f) internal_foo=fscanf(f," }")
#define READCOMMA(f) internal_foo=fscanf(f," ,")
#define READINT(f) (internal_foo=fscanf(f,"%d",&internal_inttemp),internal_inttemp)
#define READDOUBLE(f) (internal_foo=fscanf(f,"%lf",&internal_dbltemp),internal_dbltemp)


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
  
  int i;

  OPENCURLY(file);
  for (i=0; i<n; i++) {
    read_int_array_1d(file, &(a[i*m]), m);
    if (i<n-1) {
      READCOMMA(file);
    }
  }
  CLOSECURLY(file);
}


void read_array(const char *meshfile,  
		int *int1, int *int2, 
		int **i2m1, size_t m1size1, size_t m1size2, 
		int **i2m2, size_t m2size1, size_t m2size2,
		double **d2m3, size_t m3size1, size_t m3size2, 
		int **i1m4, size_t m4size1, 
		int **i2m5, size_t m5size1, size_t m5size2, 
		int **i1m6, size_t m6size1, 
		int **i2m7, size_t m7size1, size_t m7size2, 
		int **i1m8, size_t m8size1)
{
  /* declare internal variables for macros */
  INTERNALVARS;
  
  FILE *file;
  int i,j;
  double dblres;
/*  int int1, int2;
  int *i2m1, *i2m2;
  double *d2m3;
  int *i1m4;
  int *i2m5;
  int *i1m6;
  int *i2m7;
  int *i1m8;
  int m1size1=314, m1size2=8;
  int m2size1=562, m2size2=3;
  int m3size1=314, m3size2=2;
 m4size1=314;
  int m5size1=1, m5size2=64;
  int m6size1=1;
  int m7size1=1, m7size2=64;
  int m8size1=1;
*/

  *i2m1 = (int*)malloc(sizeof(int)*m1size1*m1size2);
  *i2m2 = (int*)malloc(sizeof(int)*m2size1*m2size2);
  *d2m3 = (double*)malloc(sizeof(double)*m3size1*m3size2);
  *i1m4 = (int*)malloc(sizeof(int)*m4size1);
  *i2m5 = (int*)malloc(sizeof(int)*m5size1*m5size2);
  *i1m6 = (int*)malloc(sizeof(int)*m6size1);
  *i2m7 = (int*)malloc(sizeof(int)*m7size1*m7size2);
  *i1m8 = (int*)malloc(sizeof(int)*m8size1);


  /* open file */
  file = fopen(meshfile,"rb");

  OPENCURLY(file);

  *int1 = READINT(file);
  READCOMMA(file);

  *int2 = READINT(file);
  READCOMMA(file);

  read_int_array_2d   (file, *i2m1, m1size1, m1size2);
  READCOMMA(file);

  read_int_array_2d   (file, *i2m2, m2size1, m2size2);
  READCOMMA(file);

  read_double_array_2d(file, *d2m3, m3size1, m3size2);
  READCOMMA(file);

  read_int_array_1d   (file, *i1m4, m4size1);
  READCOMMA(file);

  read_int_array_2d   (file, *i2m5, m5size1, m5size2);
  READCOMMA(file);

  read_int_array_1d   (file, *i1m6, m6size1);
  READCOMMA(file);

  read_int_array_2d   (file, *i2m7, m7size1, m7size2);
  READCOMMA(file);

  read_int_array_1d   (file, *i1m8, m8size1);
  CLOSECURLY(file);

  fclose(file);

}


#endif /* READ_ARRAY_C */
