#include "meshext.h"

#ifdef __cplusplus
extern "C" {
#endif

void* create_mesh2d_data(double *boundary, MySizeType bdim1, 
			 MySizeType bdim2, MyInteger *bc, MySizeType bcdim1, double h)
{
  MyInteger status;
  MyInteger sizes[3];

  
  MY_ASSERT ( bdim2 == 2, "Boundary is not  two dimensional!");
  MY_ASSERT ( bdim1 == bcdim1, "Size of boundary conditions not same as boundary points");
  
  MeshData* data = (MeshData*)malloc(sizeof(MeshData));
  MY_ASSERT ( data != NULL, "Error allocating memory for mesh data");

  data->nv = 3; 
  data->ne = 3;
  data->nt = 1;

  data->x = (double*)malloc(data->nv * XDIM2 * sizeof(double));
  MY_ASSERT ( data->x != NULL, "Error allocating memory for mesh data->x");
  data->edge = (MyInteger*)malloc(data->ne * EDGEDIM2 * sizeof(double));
  MY_ASSERT ( data->edge != NULL, "Error allocating memory for mesh data->edge");
  data->triangle = (MyInteger*)malloc(data->nt * TRIDIM2 * sizeof(double));
  MY_ASSERT ( data->triangle != NULL, "Error allocating memory for mesh data->triangle");

  data->x[0*XDIM2+0] = 15.5; data->x[0*XDIM2+1] = 17.7; data->x[0*XDIM2+2] = 1;
  data->x[1*XDIM2+0] = 25.5; data->x[1*XDIM2+1] = 27.7; data->x[1*XDIM2+2] = 1;
  data->x[2*XDIM2+0] = 35.5; data->x[2*XDIM2+1] = 37.7; data->x[2*XDIM2+2] = 1;
  data->edge[0*EDGEDIM2+0] = 1; data->edge[0*EDGEDIM2+1] = 2; data->edge[0*EDGEDIM2+2] = 1;
  data->edge[1*EDGEDIM2+0] = 2; data->edge[1*EDGEDIM2+1] = 3; data->edge[1*EDGEDIM2+2] = 1;
  data->edge[2*EDGEDIM2+0] = 3; data->edge[2*EDGEDIM2+1] = 1; data->edge[2*EDGEDIM2+2] = 1;
  data->triangle[0]=1; data->triangle[1]=2; data->triangle[2]=3; data->triangle[3]=1;

  return (void*) data;
};


void free_mesh2d_data(void* object) {
  /*
  MeshData* data = (MeshData*) object;
  if ( data == NULL )
    return;

  if (data->x != NULL)
    free(data->x);
  if (data->edge != NULL)
    free(data->edge);
  if (data->triangle != NULL)
    free(data->triangle);

  free(data);
  */
}

void get_mesh2d_sizes(void* object, MyInteger *sizes, MySizeType dim) {

  MeshData *data = (MeshData*) object;

  MY_ASSERT ( data != NULL, "External object pointer zero");
  MY_ASSERT ( dim == 3, "Size vector must be of length 3 (vertices, edges, triangles)");

  sizes[0]=data->nv;
  sizes[1]=data->ne;
  sizes[2]=data->nt;
  
}

void get_mesh2d_vertex(void* object, MyInteger index, double *v, MySizeType dim) {
  MyInteger j;
  MeshData *data = (MeshData*) object;

  MY_ASSERT ( data != NULL, "External object pointer zero");
  MY_ASSERT ( dim == XDIM2, "Vertex second dimension mismatch");
  MY_ASSERT ( index < data->nv , "Vertex index out of bounds");

  for (j=0; j<XDIM2; j++)
    v[j] = data->x[index*XDIM2 + j];
  
}


#ifdef __cplusplus
}
#endif




