#include <iostream>
#include "poisson_rheolef.h"
#include "print.h"
#include "read_matrix.h"

using namespace std;

int main(int argc, char**argv) {

  if (argc != 5) {
    cerr << "Usage: " << argv[0] << " bamg-meshfile nv element-type bcfile" << endl;
    cerr << "       " << argv[0] << " test.bamg 79 P1 temp_bc.txt" << endl;
    exit(3);
  }

  int nv = atoi(argv[2]);

  int nbc, bcdim;

  read_matrix_size(argv[4],&nbc,&bcdim);
  double *bc = new double[nbc*bcdim];
  read_matrix(argv[4],nbc,bcdim,bc);

  MyInteger nu, nb;
  get_rheolef_form_size(argv[1], nv, &nu, &nb, nbc, bcdim, bc);


  cout << "nu=" << nu << ", nb=" << nb << endl;

  delete [] bc;

  return 0;

}
