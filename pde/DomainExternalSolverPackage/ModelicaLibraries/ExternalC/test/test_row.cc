#include <iostream>
#include "poisson_rheolef.h"
#include "read_matrix.h"
#include "print.h"

using namespace std;

int main(int argc, char**argv) {

  if (argc != 5) {
    cerr << "Usage: " << argv[0] << " bamg-meshfile nv bcfil index" << endl;
    cerr << "       " << argv[0] << " test.bamg 79 temp_bc.txt 44" << endl;
    exit(3);
  }

  int nv = atoi(argv[2]);
  int index = atoi(argv[4]);

  double *row = new double[nv];

  int nbc, bcdim;

  read_matrix_size(argv[3],&nbc,&bcdim);
  double *bc = new double[nbc*bcdim];
  read_matrix(argv[3],nbc,bcdim,bc);

  get_rheolef_poisson_laplace_row(argv[1], nv, row, index, nbc, bcdim, bc);

  print_vector(cout, nv, row);

  
  delete [] row;

  return 0;

}
