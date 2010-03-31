// name:     EquationComponent1
// keywords: equation
// status:   correct
// 
// When an equation is between to complex types, the equation is split
// into separate equations for the components.
// 

class EquationComponent1
  record R
    Real x,y;
  end R;
  R a,b;
equation
  a = b;
end EquationComponent1;

// Result:
// fclass EquationComponent1
// 	      Real    a.x;
// 	      Real    a.y;
// 	      Real    b.x;
// 	      Real    b.y;
// equation
//   a.x = b.x;
//   a.y = b.y;
// end EquationComponent1;
// endResult
