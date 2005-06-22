#include "read_array_common.h"
#include "read_matrix.h"

void read_matrix_internal(FILE *f, int n1, int n2, double *m)
{
  int rows=0,cols=0;
  unsigned int i,j;
  INTERNALVARS;
  OPENCURLY(f);

  rows=READINT(f); READCOMMA(f);
  cols=READINT(f); READCOMMA(f);

  MY_ASSERT(rows == n1, "Matrix row size incorrect");
  MY_ASSERT(cols == n2, "Matrix column size incorrect");

  OPENCURLY(f);
  for(i=0; i<rows; i++) {
    OPENCURLY(f);
    for(j=0; j<cols; j++) {      
      m[i*cols+j] = READDOUBLE(f);
      if (j<cols-1)
	READCOMMA(f);
    }
    CLOSECURLY(f);
    if (i<rows-1)
      READCOMMA(f);
  }
  CLOSECURLY(f);
    
  CLOSECURLY(f);
}

void read_matrix(const char *filename, int n1, int n2, double *m)
{
  FILE *f;

  f = fopen(filename,"rb");

  MY_ASSERT(f != 0, "Couldn't open matrix input file");

  read_matrix_internal(f, n1, n2, m);

  fclose(f);
}

void read_matrix_size(const char *filename, int *n1, int *n2)
{
  FILE *f;
  INTERNALVARS;
  int rows=0,cols=0;

  f = fopen(filename,"rb");

  MY_ASSERT(f != 0, "Couldn't open matrix input file");

  OPENCURLY(f);

  rows=READINT(f); READCOMMA(f);
  cols=READINT(f); READCOMMA(f);

  *n1 = rows;
  *n2 = cols;

  fclose(f);
}


void read_matrix_row(const char *filename, int n1, int n2, double *m, int row_i)
{
  FILE *f;
  int rows=0,cols=0;
  unsigned int i,j;
  double foo;
  INTERNALVARS;

  f = fopen(filename,"rb");

  MY_ASSERT(f != 0, "Couldn't open matrix input file");

  OPENCURLY(f);

  rows=READINT(f); READCOMMA(f);
  cols=READINT(f); READCOMMA(f);

  MY_ASSERT(rows == n1, "Matrix row size incorrect");
  MY_ASSERT(cols == n2, "Matrix column size incorrect");
  MY_ASSERT(row_i < n1, "Row index out of bounds");

  OPENCURLY(f);
  for(i=0; i<row_i; i++) {
    OPENCURLY(f);
    for(j=0; j<cols; j++) {      
      foo=READDOUBLE(f);
      if (j<cols-1)
	READCOMMA(f);
    }
    CLOSECURLY(f);
    READCOMMA(f);
  }

  OPENCURLY(f);
  for(j=0; j<cols; j++) {      
    m[j]=READDOUBLE(f);
    if (j<cols-1)
      READCOMMA(f);
  }
  CLOSECURLY(f);

  fclose(f);
}

void read_square_matrix(const char *filename, int n, double *m)
{
  read_matrix(filename, n, n, m);
}

void read_square_matrix_row(const char *filename, int n, double *m, int i)
{
  read_matrix_row(filename, n, n, m, i);
}


void read_vector(const char *filename, int n, double *v)
{
  FILE *f;
  int rows=0;
  unsigned int i;
  INTERNALVARS;

  f = fopen(filename,"rb");

  MY_ASSERT(f != 0, "Couldn't open vector input file");

  OPENCURLY(f);

  rows=READINT(f); READCOMMA(f);

  MY_ASSERT_ARGS(rows == n, "Vector size incorrect %d != %d", rows, n);

  OPENCURLY(f);
  for(i=0; i<rows; i++) {
    v[i] = READDOUBLE(f);
    if (i<rows-1)
      READCOMMA(f);
  }
  CLOSECURLY(f);
    
  CLOSECURLY(f);
  fclose(f);
}

void read_matrices(const char *filename, int m, int n1[], int n2[], doubleptr *matrices)
{
  FILE *f;
  int rows=0;
  unsigned int i;
  INTERNALVARS;

  f = fopen(filename,"rb");

  MY_ASSERT(f != 0, "Couldn't open matrices input file");

  OPENCURLY(f);

  rows=READINT(f); READCOMMA(f);

  MY_ASSERT(rows == m, "Number of matrices incorrect");

  OPENCURLY(f);
  for(i=0; i<rows; i++) {
    read_matrix_internal(f, n1[i], n2[i], matrices[i]);
    if (i<rows-1)
      READCOMMA(f);
  }
  CLOSECURLY(f);
    
  CLOSECURLY(f);
  fclose(f);
}

void read_vector_int(const char *filename, int n, MyInteger *v)
{
  FILE *f;
  int rows=0;
  unsigned int i;
  INTERNALVARS;

  f = fopen(filename,"rb");

  MY_ASSERT(f != 0, "Couldn't open vector input file");

  OPENCURLY(f);

  rows=READINT(f); READCOMMA(f);

  MY_ASSERT_ARGS(rows == n, "Vector size incorrect %d != %d", rows, n);

  OPENCURLY(f);
  for(i=0; i<rows; i++) {
    v[i] = READINT(f);
    if (i<rows-1)
      READCOMMA(f);
  }
  CLOSECURLY(f);
    
  CLOSECURLY(f);
  fclose(f);
}


void write_matrix(const char *filename, int n1, int n2, double *m)
{
  FILE *f;
  int rows=n1,cols=n2;
  unsigned int i,j;
  INTERNALVARS;

  f = fopen(filename,"wb");

  MY_ASSERT(f != 0, "Couldn't open matrix output file");

  WRITEOPENCURLY(f);

  WRITEINT(f,rows); WRITECOMMA(f);
  WRITEINT(f,cols); WRITECOMMA(f);

  WRITEOPENCURLY(f);
  for(i=0; i<rows; i++) {
    WRITEOPENCURLY(f);
    for(j=0; j<cols; j++) {      
      WRITEDOUBLE(f, m[i*cols+j]);
      if (j<cols-1)
	WRITECOMMA(f);
    }
    WRITECLOSECURLY(f);
    if (i<rows-1)
      WRITECOMMA(f);
  }
  WRITECLOSECURLY(f);
    
  WRITECLOSECURLY(f);
  fclose(f);
}

void write_square_matrix(const char *filename, int n, double *m)
{
  write_matrix(filename, n, n, m);
}

void write_vector(const char *filename, int n, double *v)
{
  FILE *f;
  int rows=n;
  unsigned int i;
  INTERNALVARS;

  f = fopen(filename,"wb");

  MY_ASSERT(f != 0, "Couldn't open vector output file");

  WRITEOPENCURLY(f);

  WRITEINT(f,rows); WRITECOMMA(f);

  WRITEOPENCURLY(f);
  for(i=0; i<rows; i++) {
    WRITEDOUBLE(f, v[i]);
    if (i<rows-1)
      WRITECOMMA(f);
  }
  WRITECLOSECURLY(f);
    
  WRITECLOSECURLY(f);
  fclose(f);
}

void add_matrix(int n1, int n2, double *a, double *b, double *m) {
  unsigned int i,j;
  for (i=0; i<n1; i++)
    for (j=0; j<n2; j++)
      m[i*n2+j]=a[i*n2+j]+b[i*n2+j];
}

void mult_scalar_matrix(int n1, int n2, double a, double *b, double *m) {
  unsigned int i,j;
  for (i=0; i<n1; i++)
    for (j=0; j<n2; j++)
      m[i*n2+j]=a*b[i*n2+j];
}

void set_scalar_matrix(int n1, int n2, double a, double *m) {
  unsigned int i,j;
  for (i=0; i<n1; i++)
    for (j=0; j<n2; j++)
      m[i*n2+j]=a;
}
