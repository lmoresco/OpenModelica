#include <iostream>
#include "poisson_rheolef.h"
#include "print.h"
#include "read_matrix.h"

using namespace std;

int main(int argc, char**argv) {

  if (argc != 8) {
    cerr << "Usage: " << argv[0] << " bamg-meshfile nv element-type bcfile nu nb bndindex" << endl;
    cerr << "       " << argv[0] << " test.bamg 79 P1 temp_bc.txt 38 41 3" << endl;
    exit(3);
  }

  int nv = atoi(argv[2]);
  MyInteger nu = atoi(argv[5]);
  MyInteger nb = atoi(argv[6]);
  MyInteger bndindex = atoi(argv[7]);
  char *bcfile=argv[4];

  double *uu = new double[nu*nu];
  double *ub = new double[nu*nb];
  double *bu = new double[nb*nu];
  double *bb = new double[nb*nb];

  int nbc, bcdim;

  read_matrix_size(bcfile,&nbc,&bcdim);
  double *bc = new double[nbc*bcdim];
  read_matrix(bcfile,nbc,bcdim,bc);

  get_rheolef_form_mass_bdr_on_bnd(argv[1], bndindex, nv, nu, nb, uu, ub, bu, bb, nbc, bcdim, bc);

  cout << "mass_bdr_on_bnd on " << bndindex << endl;
  cout << "{ 4, " << endl;
  print_matrix(cout, nu, nu, uu);
  cout << ", " << endl;
  print_matrix(cout, nu, nb, ub);
  cout << ", " << endl;
  print_matrix(cout, nb, nu, bu);
  cout << ", " << endl;
  print_matrix(cout, nb, nb, bb);
  cout << "}";

  delete [] uu;
  delete [] ub;
  delete [] bu;
  delete [] bb;

  return 0;

}
