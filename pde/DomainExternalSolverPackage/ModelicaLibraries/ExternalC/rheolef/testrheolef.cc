#include "rheolef.h"
using namespace std;

int main(int argc, char**argv) {
    geo omega (argv[1]);
    space Vh (omega, argv[2]);
    Vh.block ("boundary");
    form a (Vh, Vh, "grad_grad");
    form m (Vh, Vh, "mass");
    field fh (Vh, 1);
    field uh (Vh);
    uh ["boundary"] = 0;

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

    vec<Float> b = m.uu*fh.u + m.ub*fh.b - a.ub*uh.b;

    cout << "b" << endl;
    cout << "b.size=" << b.size() << endl;
    cout << "----------------------------" << endl;
    cout << b << endl;


    return 0;
}
