// name:     ReplaceFunction
// keywords: modification
// status:   incorrect
//
// Function arguments must be identical, including their names,
// in functions of the same type.
//

function Sin
  input Real x;
  output Real y;
external
end Sin;

function Cos
  input Real xx;
  output Real yy;
external
end Cos;

model M 
  replaceable function f = Sin; 
end M;

model ReplaceFunction = M(redeclare function f = Cos);   // Error
