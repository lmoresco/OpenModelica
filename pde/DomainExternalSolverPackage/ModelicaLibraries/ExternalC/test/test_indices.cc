#include <iostream>
#include "poisson_rheolef.h"
#include "print.h"
#include "read_matrix.h"

using namespace std;

int main(int argc, char**argv) {

  if (argc != 7) {
    cerr << "Usage: " << argv[0] << " bamg-meshfile nv element-type bcfile nu nb" << endl;
    cerr << "       " << argv[0] << " test.bamg 79 P1 test_bc.txt 41 38" << endl;
    exit(3);
  }

  int nv = atoi(argv[2]);
  MyInteger nu = atoi(argv[5]);
  MyInteger nb = atoi(argv[6]);

  MyInteger *uind = new MyInteger[nu];
  MyInteger *bind = new MyInteger[nb];
  double *bval = new double[nb];

  int nbc, bcdim;

  read_matrix_size(argv[4],&nbc,&bcdim);
  double *bc = new double[nbc*bcdim];
  read_matrix(argv[4],nbc,bcdim,bc);


  get_rheolef_unknown_indices(argv[1], nv, nu, uind, nbc, bcdim, bc);
  get_rheolef_blocked_indices(argv[1], nv, nb, bind, nbc, bcdim, bc);
  get_rheolef_blocked_values(argv[1], nv, nb, bval, nbc, bcdim, bc);

  cout << "Unknown indices:" << endl;
  print_vector(cout, nu, uind);
  cout << "Blocked indices:" << endl;
  print_vector(cout, nb, bind);
  cout << "Blocked values:" << endl;
  print_vector(cout, nb, bval);

  delete [] uind;
  delete [] bind;
  delete [] bval;

  return 0;

}
