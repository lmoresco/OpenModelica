// name:     Function7
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

model Function7
  String x;
  Real z;
equation
  x = f(z);
end Function7;
