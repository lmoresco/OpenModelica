#include <iostream>
#include "poisson_rheolef.h"
#include "print.h"
#include "read_matrix.h"

using namespace std;

int main(int argc, char**argv) {

  if (argc != 9) {
    cerr << "Usage: " << argv[0] << " bamg-meshfile nv element-type bcfile nu nb pdim bndindex" << endl;
    cerr << "       " << argv[0] << " test.bamg 79 P1 temp_bc.txt 38 41 2 3" << endl;
    exit(3);
  }

  int nv = atoi(argv[2]);
  MyInteger nu = atoi(argv[5]);
  MyInteger nb = atoi(argv[6]);
  MyInteger pdim = atoi(argv[7]);
  MyInteger bndindex = atoi(argv[8]);
  char *bcfile=argv[4];

  
  double *pu = new double[nu*pdim];
  double *pb = new double[nu*pdim];

  int nbc, bcdim;

  read_matrix_size(bcfile,&nbc,&bcdim);
  double *bc = new double[nbc*bcdim];
  read_matrix(bcfile,nbc,bcdim,bc);


  get_rheolef_interpolate_bdr_coords(argv[1], bndindex, nv, nu, nb, pdim, pu, pb, nbc, bcdim, bc);

  cout << "bdr_coords on " << bndindex << endl;
  cout << "{ 2, " << endl;
  print_matrix(cout, nu, pdim, pu);
  cout << ", " << endl;
  print_matrix(cout, nb, pdim, pb);
  cout << "}";

  delete [] pu;
  delete [] pb;

  return 0;

}
