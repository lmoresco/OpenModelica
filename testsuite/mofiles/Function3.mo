// name:     Function3
// keywords: function
// status:   incorrect
// 
// This tests for illegal parts of a function definition.
// 

function Function3
  input Real x;
  output Real y;
  type Voltage = Real;
algorithm
  y := x;
end Function3;
