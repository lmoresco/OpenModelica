#ifndef _BOUNDARYCONDITION_HH_
#define _BOUNDARYCONDITION_HH_

#include <string>

class point;
typedef double Float;

class BoundaryCondition {

protected:
  string name;

public:
  typedef Float (*space_function_ptr) (const point& x);


public:
  BoundaryCondition(string nm,
		    space_function_ptr gIn,
		    bool dirichlet=true,
		    Float qIn=0)
    : name(nm), g(gIn), q(qIn), is_dirichlet(dirichlet)  {
  }
  space_function_ptr g;
  Float q;

  bool is_dirichlet;

  const string& getName() const { 
    return name; 
  }
};

#endif
