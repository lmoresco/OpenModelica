#include "meshext.h"
#include "bamg.h"

#ifdef __cplusplus
extern "C" {
#endif

void * create_mesh2d_data(double *boundary, MySizeType bdim1, 
			 MySizeType bdim2, MyInteger *bc, MySizeType bcdim1, double h)
{
  MyInteger status;
  MyInteger sizes[3];
  char meshfile[]="default_extmesh2d.txt";
  
  MY_ASSERT ( bdim2 == 2, "Boundary is not  two dimensional!");
  MY_ASSERT ( bdim1 == bcdim1, "Size of boundary conditions not same as boundary points");

  bamg_generate_mesh("bamgrun.bat", meshfile, &status, boundary, bdim1, bdim2, bc, bcdim1, h);
  bamg_read_sizes(meshfile, sizes, 3);
  
  MeshData* data = (MeshData*)malloc(sizeof(MeshData));
  MY_ASSERT ( data != NULL, "Error allocating memory for mesh data");

  data->nv = sizes[0]; 
  data->ne = sizes[1]; 
  data->nt = sizes[2]; 

  data->x = (double*)malloc(data->nv * XDIM2 * sizeof(double));
  MY_ASSERT ( data->x != NULL, "Error allocating memory for mesh data->x");
  data->edge = (MyInteger*)malloc(data->ne * EDGEDIM2 * sizeof(double));
  MY_ASSERT ( data->edge != NULL, "Error allocating memory for mesh data->edge");
  data->triangle = (MyInteger*)malloc(data->nt * TRIDIM2 * sizeof(double));
  MY_ASSERT ( data->triangle != NULL, "Error allocating memory for mesh data->triangle");

  bamg_read_vertices(meshfile, data->x, data->nv, XDIM2);
  bamg_read_edges(meshfile, data->edge, data->ne, EDGEDIM2);
  bamg_read_triangles(meshfile, data->triangle, data->nt, TRIDIM2);

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




