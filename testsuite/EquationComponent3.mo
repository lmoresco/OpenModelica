// name:     EquationComponent3
// keywords: equation
// status:   correct
// 
// When an equation is between to complex types, the equation is split
// into separate equations for the components.
// 

class EquationComponent3
  record R
    Real x,y;
  end R;
  R a,b,c;
equation
  (if true then a else b) = c;
end EquationComponent3;

// fclass EquationComponent3
// 	       Real    a.x;
// 	       Real    a.y;
// 	       Real    b.x;
// 	       Real    b.y;
// 	       Real    c.x;
// 	       Real    c.y;
// equation
//   __TMP__0 ::= if true then a else b;
//   __TMP__0.x = c.x;
//   __TMP__0.y = c.y;
// end EquationComponent3;
