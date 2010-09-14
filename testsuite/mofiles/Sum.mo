// name: Sum
// keywords: sum
// status: correct
//
// Testing the built-in sum function.
//

model Sum
  parameter Real x[3](each fixed = false);
  Real y[3];
  Real a, b;
equation
  a = sum(x);
  b = sum(y);
end Sum;

// Result:
// class Sum
//   parameter Real x[1](fixed = false);
//   parameter Real x[2](fixed = false);
//   parameter Real x[3](fixed = false);
//   Real y[1];
//   Real y[2];
//   Real y[3];
//   Real a;
//   Real b;
// equation
//   a = x[1] + (x[2] + x[3]);
//   b = y[1] + (y[2] + y[3]);
// end Sum;
// endResult
