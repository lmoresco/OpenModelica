#include "rheolef.h"
using namespace std;

Float g(const point& x) {
  return 3;
}

int main(int argc, char**argv) {
  geo omega (argv[1]);
  space Vh (omega, argv[2]);
  Vh.block ("boundary1");

  form a (Vh, Vh, "grad_grad");
  form m (Vh, Vh, "mass");
  space Wh (omega, omega["boundary2"], argv[2]);
  form mb (Wh, Vh, "mass_bdr");
  field fh (Vh, 1);
  field gh = interpolate(Wh, g);
  field uh (Vh);
  uh ["boundary1"] = 0;

  cout << "geo" << endl;
  cout << "size=" << omega.size() << endl;
  cout << "vertices=" << omega.n_vertice() << endl;
  cout << "nodes=" << omega.n_node() << endl;
  cout << "elements=" << omega.n_element() << endl;
  cout << "triangles=" << omega.n_triangle() << endl;
  cout << "faces=" << omega.n_face() << endl;
  cout << "----------------------------" << endl;


  cout << "a" << endl;
  cout << "a.nrows=" << a.uu.nrow() << endl;
  cout << "a.ncols=" << a.uu.ncol() << endl;
  cout << "----------------------------" << endl;
  cout << a.uu << endl;

  cout << "mb.uu" << endl;
  cout << "mb.uu.nrows=" << mb.uu.nrow() << endl;
  cout << "mb.uu.ncols=" << mb.uu.ncol() << endl;
  cout << "----------------------------" << endl;
  cout << mb.uu << endl;

  cout << "mb.ub" << endl;
  cout << "mb.ub.nrows=" << mb.ub.nrow() << endl;
  cout << "mb.ub.ncols=" << mb.ub.ncol() << endl;
  cout << "----------------------------" << endl;
  cout << mb.ub << endl;

  vec<Float> b = m.uu*fh.u + m.ub*fh.b - a.ub*uh.b;

  cout << "b" << endl;
  cout << "b.size=" << b.size() << endl;
  cout << "----------------------------" << endl;
  cout << b << endl;

  cout << "gh" << endl;
  cout << "gh.size=" << gh.size() << endl;
  cout << "----------------------------" << endl;
  cout << gh << endl;


  return 0;
}
