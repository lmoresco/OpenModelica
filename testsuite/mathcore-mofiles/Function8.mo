// name:     Function8
// keywords: function
// status:   incorrect
// 
// This tests basic function functionality
//

function f
  input Real x;
  output Real r;
algorithm
  r := 2.0 * x;
end f;

model Function8
  Real x;
  String z;
equation
  x = f(z);
end Function8;
