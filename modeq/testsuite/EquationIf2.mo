// name:     EquationIf2
// keywords: equation
// status:   correct
// 
// Testing `if' clauses in equations.
// 

class EquationIf2
  parameter Boolean b = false;
  Real x;
equation
  if b then
    x = 1.0;
  else
    x = 2.0;
  end if;
end EquationIf2;

// fclass EquationIf2
//   parameter Boolean b;
//   Real x;
// equation
//   b = false;
//   x = 2.0;
// end EquationIf2;
