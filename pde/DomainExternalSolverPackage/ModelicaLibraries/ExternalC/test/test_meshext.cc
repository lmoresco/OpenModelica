#include <iostream>
#include <stdlib.h>
#include "poisson_rheolef_ext.h"
#include "read_matrix.h"
#include "meshext.h"

using namespace std;

int main(int argc, char**argv) {

  if (argc != 5) {
    cerr << "Usage: " << argv[0] << " polygon_file bcfile nbr_points refine" << endl;
    cerr << "       " << argv[0] << " square.txt squarebc.txt 4 0.5" << endl;
    exit(3);
  }

  size_t np = atoi(argv[3]);
  double refine = strtod(argv[4], 0);

  double *polygon = new double[2*np]; /* [np 2] */
  MyInteger *bc = new MyInteger[np];      /* [np] */

  read_matrix(argv[1], np, 2, polygon);
  read_vector_int(argv[2], np, bc);

  int status;

  MeshData *data;

  data = (MeshData*) create_mesh2d_data(polygon, np, 2, bc, np, refine);

  cout << "vertices: " << endl;

  for (int i=0; i< data->nv; i++) {
    for (int j=0; j< XDIM2; j++)
      cout << data->x[XDIM2*i+j] << ", ";
    cout << endl;
  }

  cout << "edges: " << endl;

  for (int i=0; i< data->ne; i++) {
    for (int j=0; j< EDGEDIM2; j++)
      cout << data->edge[EDGEDIM2*i+j] << ", ";
    cout << endl;
  }

  cout << "triangles: " << endl;


  for (int i=0; i< data->nt; i++) {
    for (int j=0; j< TRIDIM2; j++)
      cout << data->triangle[TRIDIM2*i+j] << ", ";
    cout << endl;
  }

  cout << "getting sizes: ";

  MyInteger sizes[3];


  get_mesh2d_sizes((void*)data, sizes, 3);

  cout << "(" << sizes[0] << ", " << sizes[1] << ", " << sizes[2] << ")" << endl;

  cout << "getting vertices: " << endl;
  
  double v[XDIM2];
  for (int i=0; i<sizes[0]; i++) {
    get_mesh2d_vertex((void*)data, i, v, XDIM2);
    cout << i << ": ";
    for (int j=0; j<XDIM2; j++)
      cout << v[j] << ", ";
    cout << endl;
  }
  
  free_mesh2d_data(data);

  return 0;

}
