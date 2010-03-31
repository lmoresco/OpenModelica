// name:     FunctionReturn
// keywords: function return
// status:   correct
// 
// This tests return in function

function f
  input Real x;
  output Real r;
algorithm
  r := 2.0 * x;
  if r>20 then return; end if;
  r := r * x;
end f;

model FunctionReturn
  Real x, y;
equation
  x = f(y);
  y = f(x);
end FunctionReturn;

// Result:
// fclass FunctionReturn
// Real x;
// Real y;
// Real z;
// equation
//   x = f(z);
//   y = f(z);
// end FunctionReturn;
// endResult
