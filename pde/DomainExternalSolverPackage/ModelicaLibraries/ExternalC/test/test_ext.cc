#include <iostream>
#include <stdlib.h>
#include "poisson_rheolef.h"
#include "read_matrix.h"
#include "bamg.h"

using namespace std;

int main(int argc, char**argv) {

  if (argc != 7) {
    cerr << "Usage: " << argv[0] << " polygon_file bcfile nbr_points refine destmatrixfile destvecfile" << endl;
    cerr << "       " << argv[0] << " square.txt squarebc.txt 4 0.5 testout_m.txt testout_g.txt" << endl;
    exit(3);
  }

  MySizeType np = atoi(argv[3]);
  double refine = strtod(argv[4], 0);

  double *polygon = new double[2*np]; /* [np 2] */
  MyInteger *bc = new MyInteger[np];      /* [np] */

  char meshfile[] = "test_mesh2d.txt";

  read_matrix(argv[1], np, 2, polygon);
  read_vector_int(argv[2], np, bc);

  MyInteger status;

  bamg_generate_mesh("bamgrun.bat", meshfile, &status,
		     polygon, np, 2, 
		     bc, np,
		     refine);


  MyInteger sizes[3];

  bamg_read_sizes(meshfile, sizes, 3);

  MySizeType nv = sizes[0];
  MySizeType ne = sizes[1];
  MySizeType nt = sizes[2];

  double *laplace = new double[nv*nv];
  double *g = new double[nv];
  
  const unsigned int bcdim = 3;
  double *bcfull = new double[np*bcdim];

  for (unsigned int i=0; i< np; i++) {
    bcfull[i*bcdim + 0] = 1; // dirichlet
    bcfull[i*bcdim + 1] = 0; // value
    bcfull[i*bcdim + 2] = bc[i]; // index
  }

  get_rheolef_poisson_laplace(meshfile, nv, laplace, np, bcdim, bcfull);
  get_rheolef_poisson_g(meshfile, nv, g, np, bcdim, bcfull);

  cout << "laplace: " << endl;

  for (int i=0; i< nv; i++) {
    cout << endl;
    for (int j=0; j<nv; j++)
      cout << laplace[nv*i+j] << ", ";
  }

  cout << "g: " << endl;

  for (int i=0; i<nv; i++)
    cout << g[i] << endl;

  write_square_matrix(argv[5], nv, laplace);
  write_vector(argv[6], nv, g);
  

  delete [] laplace;
  delete [] g;

  return 0;

}
