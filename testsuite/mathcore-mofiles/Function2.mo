// name:     Function2
// keywords: function
// status:   incorrect
// 
// This tests for illegal parts of a function definition.
// 

function f
  input Real x;
  output Real r;
  Real toomuch;
algorithm
  r := 2.0 * x;
end f;

model Function2
  Real x, z;
equation
  x = f(z);
end Function2;
