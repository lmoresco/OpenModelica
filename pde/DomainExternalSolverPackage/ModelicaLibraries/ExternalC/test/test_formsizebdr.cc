#include <iostream>
#include "poisson_rheolef.h"
#include "print.h"
#include "read_matrix.h"

using namespace std;

int main(int argc, char**argv) {

  if (argc != 6) {
    cerr << "Usage: " << argv[0] << " bamg-meshfile nv element-type bcfile bndindex" << endl;
    cerr << "       " << argv[0] << " test.bamg 79 P1 temp_bc.txt 3" << endl;
    exit(3);
  }

  int nv = atoi(argv[2]);

  MyInteger bndindex = atoi(argv[5]);
  char *bcfile=argv[4];

  int nbc, bcdim;

  read_matrix_size(bcfile,&nbc,&bcdim);
  double *bc = new double[nbc*bcdim];
  read_matrix(bcfile,nbc,bcdim,bc);

  MyInteger nu, nb;
  get_rheolef_form_size_bdr(argv[1], bndindex, nv, &nu, &nb, nbc, bcdim, bc);

  cout << "nu=" << nu << ", nb=" << nb << endl;

  delete [] bc;

  return 0;

}
