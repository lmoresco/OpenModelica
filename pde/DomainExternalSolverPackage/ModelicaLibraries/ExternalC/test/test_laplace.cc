#include <iostream>
#include "poisson_rheolef.h"
#include "read_matrix.h"

using namespace std;

int main(int argc, char**argv) {

  if (argc != 8) {
    cerr << "Usage: " << argv[0] << " bamg-meshfile nv element-type bcfile destmatrixfile destmassfile destvecfile" << endl;
    cerr << "       " << argv[0] << " test.bamg 79 P1 test_bc.txt out_a.txt out_m.txt out_g.txt" << endl;
    exit(3);
  }

  int nv = atoi(argv[2]);

  double *laplace = new double[nv*nv];
  double *mass = new double[nv*nv];
  double *g = new double[nv];

  int nbc, bcdim;
  read_matrix_size(argv[4],&nbc,&bcdim);
  double *bc = new double[nbc*bcdim];
  read_matrix(argv[4],nbc,bcdim,bc);


  get_rheolef_poisson_laplace(argv[1], nv, laplace, nbc, bcdim, bc);
  get_rheolef_poisson_mass(argv[1], nv, mass, nbc, bcdim, bc);
  get_rheolef_poisson_g(argv[1], nv, g, nbc, bcdim, bc);


  write_square_matrix(argv[5], nv, laplace);
  write_square_matrix(argv[6], nv, mass);
  write_vector(argv[7], nv, g);
  

  delete [] laplace;
  delete [] mass;
  delete [] g;

  return 0;

}
