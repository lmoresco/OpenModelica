// name:     EquationIf3
// keywords: equation
// status:   correct
// 
// Testing `if' clauses in equations.
// 

class EquationIf3
  parameter Real p = 10.0
  Real x;
equation
  if p<0.0 then
    x = 1.0;
  elseif p<10.0 then
    x = 2.0;
  elseif p > 10.0 then
    x = 3.0
  else
    x = 4.0;
  end if;
end EquationIf3;

// fclass EquationIf2
//   parameter Real p;
//   Real x;
// equation
//   p = 10.0;
//   x = 4.0;
// end EquationIf2;
