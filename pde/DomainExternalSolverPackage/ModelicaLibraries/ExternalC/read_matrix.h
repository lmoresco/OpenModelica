#ifndef READ_MATRIX_H
#define READ_MATRIX_H

#include "read_array_common.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef double * doubleptr;


void read_square_matrix(const char *filename, int n, double *m);
void read_square_matrix_row(const char *filename, int n, double *m, int i);
void read_matrix(const char *filename, int n1, int n2, double *m);
void read_matrix_size(const char *filename, int *n1, int *n2);
void read_matrix_row(const char *filename, int n1, int n2, double *m, int row_i);
void read_matrices(const char *filename, int m, int n1[], int n2[], doubleptr *matrices);
void read_vector(const char *filename, int n, double *v);
void read_vector_int(const char *filename, int n, MyInteger *v);
void write_matrix(const char *filename, int n1, int n2, double *m);
void write_square_matrix(const char *filename, int n, double *m);
void write_vector(const char *filename, int n, double *v);

#ifdef __cplusplus
}
#endif

#endif /*  READ_MATRIX_H */

