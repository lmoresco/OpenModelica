#include <iostream>
#include "poisson_rheolef.h"
#include "read_matrix.h"

using namespace std;

int main(int argc, char**argv) {

  if (argc != 8) {
    cerr << "Usage: " << argv[0] << " bamg-meshfile nu element-type bcfile destvecfile" << endl;
    cerr << "       " << argv[0] << " test.bamg P1 test_bc.txt out_mbu.txt" << endl;
    exit(3);
  }

  int nu = atoi(argv[2]);

  double *mbu = new double[nu];

  int nbc, bcdim;
  read_matrix_size(argv[4],&nbc,&bcdim);
  double *bc = new double[nbc*bcdim];
  read_matrix(argv[4],nbc,bcdim,bc);


  get_rheolef_massbdr_u(argv[1], argv[3], nu, g, nbc, bcdim, bc);

  write_vector(argv[5], nu, mbu);
  

  delete [] mbu;

  return 0;

}
