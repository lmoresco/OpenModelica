#include "poisson_rheolef.h"
#include "read_matrix.h"
#include <iostream>
#include <fstream>
#include <string>
#include "print.h"

using namespace std;

const char usage[]=" [-a | -m | -g | -fgg | -fmass | -fmassbdr bndindex | -fmassbdrbnd bndindex | -fsize | -fsizebdr bndindex | -form formname | -uind nbr_unknowns | -bind nbr_blockeds | -bval nbr_blockeds | -interpolate ] bamg-meshfile nv element-type bcfile";

int main(unsigned int argc, char**argv) {
  
  enum Modes { none=0, laplace, mass, g, fh, fgg, fmass, fmassbdr, fmassbdrbnd, fsize, fsizebdr, form, uindices, bindices, bvalues, interpolate };
  
  Modes mode=none;

  unsigned int nbr_indices=0;
  unsigned int bndindex=0;
  int argi=1;
  string formname;

#ifdef EXTSOLVERDEBUG
  cout << "arguments are: " << argc << endl;
  for (unsigned int i=0; i<argc; i++) {
    cout << argv[i] << " ";
  }
  cout << endl;
#endif

  if (argc - argi < 1) {
    cerr << "Usage: " << argv[0] << usage << endl;
    exit(3);
  }
  
  if (! strcmp(argv[argi], "-a"))
    mode=laplace;
  if (! strcmp(argv[argi], "-m"))
    mode=mass;
  if (! strcmp(argv[argi], "-g"))
    mode=g;
  if (! strcmp(argv[argi], "-fh"))
    mode=fh;
  if (! strcmp(argv[argi], "-fgg"))
    mode=fgg;
  if (! strcmp(argv[argi], "-fmass"))
    mode=fmass;
  if (! strcmp(argv[argi], "-fsize"))
    mode=fsize;
  if (! strcmp(argv[argi], "-interpolate")) {
    mode=interpolate;
    argi++;
    bndindex = atoi(argv[argi]);
  }
  if (! strcmp(argv[argi], "-fsizebdr")) {
    mode=fsizebdr;
    argi++;
    bndindex = atoi(argv[argi]);
  }
  if (! strcmp(argv[argi], "-fmassbdr")) {
    mode=fmassbdr;
    argi++;
    bndindex = atoi(argv[argi]);
  }
  if (! strcmp(argv[argi], "-fmassbdrbnd")) {
    mode=fmassbdrbnd;
    argi++;
    bndindex = atoi(argv[argi]);
  }
  if (! strcmp(argv[argi], "-form")) {
    mode=form;
    argi++;
    formname = string(argv[argi]);
  }
  if (! strcmp(argv[argi], "-uind")) {
    mode=uindices;
    argi++;
    nbr_indices = atoi(argv[argi]);
  }
  if (! strcmp(argv[argi], "-bind")) {
    mode=bindices;
    argi++;
    nbr_indices = atoi(argv[argi]);
  }
  if (! strcmp(argv[argi], "-bval")) {
    mode=bvalues;
    argi++;
    nbr_indices = atoi(argv[argi]);
  }

  argi++;

  if (argc - argi != 4) {
    cerr << "Usage: " << argv[0] << usage << endl;
    exit(3);
  }

  string filename = string(argv[argi]);
  argi++;
  int nv = atoi(argv[argi]);
  argi++;
  string eltype = string(argv[argi]);
  argi++;
  string bcfile = string(argv[argi]);
  argi++;


#ifdef EXTSOLVERDEBUG
  cerr << "filename: " << filename << endl;
  cerr << "eltype: " << eltype << endl;
  cerr << "bcfile: " << bcfile << endl;
  cerr << "mode: " << mode << endl;
  cerr << "argi: " << argi << endl;
  cerr << "nv: " << nv << endl;
  cerr << "nbr_indices: " << nbr_indices << endl;
#endif


  int nbc, bcdim;

  read_matrix_size(bcfile.c_str(),&nbc,&bcdim);

  double *bc = new double[nbc*bcdim];

  read_matrix(bcfile.c_str(),nbc,bcdim,bc);

  ifstream in(filename.c_str());
  
  if (!in) {
    cerr << "Mesh file not found: " << filename.c_str() << endl;
    exit(1);
  }
  in.close();


  switch (mode) {

  case laplace: 
    {
      double *laplace = new double[nv*nv];
    
      get_rheolef_poisson_laplace(filename.c_str(), eltype.c_str(), nv, laplace, nbc, bcdim, bc);
    
      print_matrix(cout, nv, nv, laplace);
    
      delete [] laplace;
    } 
    break;

  case mass: 
    {
      double *mass = new double[nv*nv];

      get_rheolef_poisson_mass(filename.c_str(), eltype.c_str(), nv, mass, nbc, bcdim, bc);
    
      print_matrix(cout, nv, nv, mass);    
    
      delete [] mass;
    } 
    break;

  case fsize: 
    {
      unsigned int nu=0,nb=0;
      unsigned int s[2];
      get_rheolef_form_size(filename.c_str(), nv, &nu, &nb, nbc, bcdim, bc);
      s[0]=nu;
      s[1]=nb;
      print_vector(cout, 2, s);
    } 
    break;

  case fsizebdr: 
    {
      unsigned int nu=0,nb=0;
      unsigned int s[2];
      get_rheolef_form_size_bdr(filename.c_str(), bndindex, nv, &nu, &nb, nbc, bcdim, bc);
      s[0]=nu;
      s[1]=nb;
      print_vector(cout, 2, s);
    } 
    break;

  case form:
    {
      unsigned int nu=0,nb=0;
      unsigned int fnu=0,fnb=0;
      get_rheolef_form_size(filename.c_str(), nv, &nu, &nb, nbc, bcdim, bc);
      double *uu = new double[nu*nu];
      double *ub = new double[nu*nb];
      double *bu = new double[nb*nu];
      double *bb = new double[nb*nb];
      get_rheolef_form(formname.c_str(), filename.c_str(), nv, nu, nb, &fnu, &fnb, uu, ub, bu, bb, nbc, bcdim, bc);
      
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
    } 
    break;

  case fgg:
    {
      unsigned int nu=0,nb=0;
      unsigned int fnu=0,fnb=0;
      get_rheolef_form_size(filename.c_str(), nv, &nu, &nb, nbc, bcdim, bc);
      double *uu = new double[nu*nu];
      double *ub = new double[nu*nb];
      double *bu = new double[nb*nu];
      double *bb = new double[nb*nb];
      get_rheolef_form_grad_grad(filename.c_str(), nv, nu, nb, &fnu, &fnb, uu, ub, bu, bb, nbc, bcdim, bc);
      
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
    } 
    break;

  case fmass:
    {
      unsigned int nu=0,nb=0;
      unsigned int fnu=0,fnb=0;
      get_rheolef_form_size(filename.c_str(), nv, &nu, &nb, nbc, bcdim, bc);
      double *uu = new double[nu*nu];
      double *ub = new double[nu*nb];
      double *bu = new double[nb*nu];
      double *bb = new double[nb*nb];
      get_rheolef_form_mass(filename.c_str(), nv, nu, nb, &fnu, &fnb, uu, ub, bu, bb, nbc, bcdim, bc);
      
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
    } 
    break;


  case fmassbdr:
    {
      unsigned int nu=0,nb=0;
      unsigned int fnu=0,fnb=0;
      get_rheolef_form_size(filename.c_str(), nv, &nu, &nb, nbc, bcdim, bc);
      double *uu = new double[nu*nu];
      double *ub = new double[nu*nb];
      double *bu = new double[nb*nu];
      double *bb = new double[nb*nb];
      get_rheolef_form_mass_bdr(filename.c_str(), bndindex, nv, nu, nb, &fnu, &fnb, uu, ub, bu, bb, nbc, bcdim, bc);
      
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
    } 
    break;

  case fmassbdrbnd:
    {
      unsigned int nu=0,nb=0;
      unsigned int fnu=0,fnb=0;
      get_rheolef_form_size(filename.c_str(), nv, &nu, &nb, nbc, bcdim, bc);
      double *uu = new double[nu*nu];
      double *ub = new double[nu*nb];
      double *bu = new double[nb*nu];
      double *bb = new double[nb*nb];
      get_rheolef_form_mass_bdr_on_bnd(filename.c_str(), bndindex, nv, nu, nb, &fnu, &fnb, uu, ub, bu, bb, nbc, bcdim, bc);
      
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
    } 
    break;

  case g:
    {
      double *g = new double[nv];
      
      get_rheolef_poisson_g(filename.c_str(), eltype.c_str(), nv, g, nbc, bcdim, bc);
      
      print_vector(cout, nv, g);
      
      delete [] g;
    } 
    break;

  case fh:
    {
      double *fh = new double[nv];
      
      get_rheolef_poisson_fh(filename.c_str(), eltype.c_str(), nv, fh, nbc, bcdim, bc);
      
      print_vector(cout, nv, fh);
      
      delete [] fh;
    } 
    break;

  case uindices:
    {
      int *ind = new int[nbr_indices];
      get_rheolef_unknown_indices(filename.c_str(), eltype.c_str(), nv, nbr_indices, ind, nbc, bcdim, bc);
      
      print_vector(cout, nbr_indices, ind);
      
      delete [] ind;
    } 
    break;

  case bindices:
    {
      int *ind = new int[nbr_indices];
      get_rheolef_blocked_indices(filename.c_str(), eltype.c_str(), nv, nbr_indices, ind, nbc, bcdim, bc);
      
      print_vector(cout, nbr_indices, ind);
      
      delete [] ind;
    } 
    break;

  case bvalues:
    {
      double *val = new double[nbr_indices];
      get_rheolef_blocked_values(filename.c_str(), eltype.c_str(), nv, nbr_indices, val, nbc, bcdim, bc);
      
      print_vector(cout, nbr_indices, val);
      
      delete [] val;
    } 
    break;

  case interpolate: 
    {
      double v;
      unsigned int nu, nb;
      get_rheolef_form_size_bdr(filename.c_str(), bndindex, nv, &nu, &nb, nbc, bcdim, bc);
      const int pdim = 2;
      double *pu = new double[nu*pdim];
      double *pb = new double[nb*pdim];

      get_rheolef_interpolate_bdr_coords(filename.c_str(), bndindex, nv, nu, nb, pdim, pu, pb, nbc, bcdim, bc);

      cout << "{ 2, " << endl;
      print_matrix(cout, nu, pdim, pu);
      cout << ", " << endl;
      print_matrix(cout, nb, pdim, pb);
      cout << "}" << endl;

      delete [] pu;
      delete [] pb;    
    } 
    break;

  case none:
  default:
    {
      cerr << "Usage: " << argv[0] << usage << endl;
      exit(3);
    } 
  }

  delete [] bc;

  return 0;
  
}

