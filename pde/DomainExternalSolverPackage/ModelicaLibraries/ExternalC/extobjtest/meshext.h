#ifndef MESHEXT_H
#define MESHEXT_H

#ifdef __cplusplus
extern "C" {
#endif 

typedef long MyInteger;
typedef MyInteger MySizeType;

#include <stdio.h>

#include <ModelicaUtilities.h>
#define MY_ASSERT(cond,msg) do { if(!(cond)) ModelicaError(msg); } while (0)


#define XDIM2 3
#define EDGEDIM2 3
#define TRIDIM2 4

#ifdef __cplusplus
extern "C" {
#endif


typedef struct {
  MyInteger nv;
  MyInteger ne;
  MyInteger nt;
  double *x;        /* [nv, XDIM2] */
  MyInteger *edge;     /* [ne, EDGEDIM2] */
  MyInteger *triangle; /* [nt, TRIDIM2] */
} MeshData;


void* create_mesh2d_data(double *boundary, MySizeType bdim1, 
			 MySizeType bdim2, MyInteger *bc, MySizeType bcdim1, double refine);

void free_mesh2d_data(void* object);

void get_mesh2d_sizes(void* object, MyInteger *sizes, MySizeType dim);
void get_mesh2d_vertex(void* object, MyInteger index, double *v, MySizeType dim);


#ifdef __cplusplus
}
#endif


#endif /* MESHEXT_H */

