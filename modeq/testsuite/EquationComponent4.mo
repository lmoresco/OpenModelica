// name:     EquationComponent4
// keywords: equation
// status:   correct
// 
// When an equation is between to complex types, the equation is split
// into separate equations for the components.
// 

class EquationComponent4
  record R
    Real x,y;
  end R;
  R a,b,c;
equation
  (if true then a else b) = if true then b else c;
end EquationComponent4;

// fclass EquationComponent4
// 	       Real    a.x;
// 	       Real    a.y;
// 	       Real    b.x;
// 	       Real    b.y;
// 	       Real    c.x;
// 	       Real    c.y;
// equation
//   __TMP__0 ::= if true then b else c;
//   __TMP__1 ::= if true then a else b;
//   __TMP__1.x = __TMP__0.x;
//   __TMP__1.y = __TMP__0.y;
// end EquationComponent4;
