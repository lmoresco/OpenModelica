#ifndef BAMG_H
#define BAMG_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "read_array_common.h"

#ifdef __cplusplus
extern "C" {
#endif


void  bamg_generate_input(const char* meshinputfile, 
			  double *boundary, MySizeType bdim1, MySizeType bdim2, 
			  MyInteger *bc, MySizeType bcdim1,
			  double h);

void bamg_generate_mesh(const char *exec, const char *outputfile, MyInteger *status,
			double *boundary, MySizeType bdim1, MySizeType bdim2,
			MyInteger *bc, MySizeType bcdim1, 
			double h);

void bamg_read_edges(const char *meshfile, MyInteger *v, MySizeType dim1, MySizeType dim2);


void bamg_read_sizes(const char *outputfile, MyInteger *size, MySizeType dim);

void bamg_read_triangles(const char *meshfile, MyInteger *v, MySizeType dim1, MySizeType dim2);

void bamg_read_vertices(const char *meshfile, double *v, MySizeType dim1, MySizeType dim2);


#ifdef __cplusplus
}
#endif


#endif /* #define BAMG_H */
