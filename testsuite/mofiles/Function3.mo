// name:     Function3
// keywords: function
// status:   erroneous
// 
// This tests for illegal parts of a function definition.
// 

class Function3

function fn
  input Real x;
  output Real y;
  type Voltage = Real;
algorithm
  y := x;
end fn;

Real x = fn(time);

end Function3;
