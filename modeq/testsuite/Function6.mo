// name:     Function6
// keywords: function,type
// status:   correct
// 
// This tests basic function functionality
//

function f
  input Real x;
  output Real r;
algorithm
  r := 2.0 * x;
end f;

model Function6
  Real x;
  Integer z;
equation
  x = f(z);
end Function6;

// fclass Function6
//   Real    x;
//   Integer z;
// equation
//   x = f(Real(z));
// end Function6;
