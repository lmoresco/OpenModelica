#include "rheolef/rheolef.h"
#include "BoundaryCondition.hh"
#include "heatgeneric.hh"

void makeXh(geo & omega, 
	    const string& eltype,
	    const vector<BoundaryCondition> & bclist,
	    space & Xh) {

  domain toblock;
  int ndir=0;

  for (unsigned int i=0; i<bclist.size(); i++) {
    domain d = omega[bclist[i].getName()];
    if (bclist[i].is_dirichlet) {
      ndir++;
      toblock += d;
    }
  }

  /*
  if (ndir == 0) {
    cerr << "Zero dirichlet conditions. Don't know what to do." << endl;
    exit(1);
  }
  */

  if (ndir > 0)
    Xh.block (toblock);
}


void heatgeneric(const string& geofile, 
		 const vector<BoundaryCondition> & bclist,
		 const string& eltype,
		 Float c,
		 BoundaryCondition::space_function *f) {

  geo omega (geofile);
  heatgeneric(omega, bclist, eltype, c, f);
}


void heatgeneric(geo & omega, 
		 const vector<BoundaryCondition> & bclist,
		 const string& eltype,
		 Float c,
		 BoundaryCondition::space_function *f) {

  /*
  N = omega.dimension();
  c = 1;
  Tout = 20;
  q = 54000;
  Tright =  50;
  */

  int nneumann=0, nrobin=0;

  space Xh(omega, eltype);
  makeXh(omega, eltype, bclist, Xh);

  form a (Xh, Xh, "grad_grad");
  form m (Xh, Xh, "mass");
  field fh = interpolate (Xh, f);
  field uh (Xh);

  vec<Float> solvec = m.uu*fh.u + m.ub*fh.b;
  a = c*a;

  for (unsigned int i=0; i<bclist.size(); i++) {
    domain d = omega[bclist[i].getName()];
    space Wh (omega, d, eltype);
    field gh = interpolate(Wh, bclist[i].g);
    if (bclist[i].is_dirichlet) {
      uh[d] = gh;
    } else {
      form mb (Wh, Xh, "mass_bdr");
      solvec += mb.uu*gh.u + mb.ub*gh.b;
      if (bclist[i].q == 0) 
	nneumann++; 
      else {
	nrobin++;
	form ab (Xh, Xh, "mass_bdr", d);
	a = a + bclist[i].q*ab;
      }
    }
  }

  solvec -= a.ub*uh.b;

  ssk<Float> fact = ldlt (a.uu);
  uh.u = fact.solve (solvec);

  cout << uh;
  /*
  cout << endl << endl << "Robin domains and values:" << endl << endl;
  vector<domain>::iterator rd = robindomains.begin();
  vector<field>::iterator rdv = robindomainvalues.begin();
  for (; (rd != robindomains.end()) && (rdv != robindomainvalues.end()); ++rd, ++rdv) {
    //    field uhrd = uh[*rd];
    cout << "---------------" << endl;
    cout << (*rd).name() << endl << "---" << endl;
    //    cout << "New Value:" << uhrd << endl << "---" << endl;
    cout << "Old Value:" << *rdv << endl << "---------------" << endl;
  }
  */
}


void heatgenerictime(const string& geofile, 
		     const vector<BoundaryCondition> & bclist,
		     const string& eltype,
		     Float da,
		     Float c,
		     BoundaryCondition::space_function *f,
		     Float dt,
		     field & uprev) {
  
  geo omega (geofile);
  heatgenerictime(omega, bclist, eltype, da, c, f, dt, uprev);
}


void heatgenerictime(geo & omega, 
		     const vector<BoundaryCondition> & bclist,
		     const string& eltype,
		     Float da,
		     Float c,
		     BoundaryCondition::space_function *f,
		     Float dt,
		     field & uprev) {

  /*
  N = omega.dimension();
  c = 1;
  Tout = 20;
  q = 54000;
  Tright =  50;
  */

  int nneumann=0, nrobin=0;

  dt = dt / da;

  space Xh(omega, eltype);
  makeXh(omega, eltype, bclist, Xh);

  form a (Xh, Xh, "grad_grad");
  form m (Xh, Xh, "mass");
  field fh = dt * interpolate (Xh, f) + uprev;

  field uh (Xh);

  vec<Float> solvec = m.uu*fh.u + m.ub*fh.b;

  a = c * dt * a;

  form ut (Xh, Xh, "mass");
  a = a + ut;

  // theta = 1, backward euler scheme. See Langtangen p.123

  for (unsigned int i=0; i<bclist.size(); i++) {
    domain d = omega[bclist[i].getName()];
    space Wh (omega, d, eltype);
    field gh = interpolate(Wh, bclist[i].g);
    if (bclist[i].is_dirichlet) {
      uh[d] = gh;
    } else {
      form mb (Wh, Xh, "mass_bdr");
      mb = dt * mb;
      solvec += mb.uu*gh.u + mb.ub*gh.b;
      if (bclist[i].q == 0) 
	nneumann++; 
      else {
	nrobin++;
	form ab (Xh, Xh, "mass_bdr", d);
	a = a + bclist[i].q * dt * ab;
	/*
	field rh = interpolate(Wh, bclist[i].r);
	uh[d] = rh;  // is this needed?
	             // Nope!
	*/
      }
    }
  }

  solvec -= a.ub*uh.b;

  ssk<Float> fact = ldlt (a.uu);
  uh.u = fact.solve (solvec);

  uprev = uh;
}
