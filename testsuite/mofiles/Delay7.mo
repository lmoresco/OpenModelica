// name:     Delay7
// keywords: builtin
// status:   correct
// 
// Test flattening of the builtin function delay.
// Should issue a warning as b is not a parameter or constant.
// Modelica.Electrical.Analog.Lines.TLine* uses delay(x, var)
// 

model Delay
  Real x, y;
  Real a = 1.0, b=2.0;
equation
  x = sin(time);
  y = delay(x, a, b);
end Delay;
// Result:
// class Delay
//   Real x;
//   Real y;
//   Real a = 1.0;
//   Real b = 2.0;
// equation
//   x = sin(time);
//   y = delay(x,a,b);
// end Delay;
// [Delay7.mo:15:3-15:21:writable] Warning: Improper use of builtin function delay(expr,delayTime,delayMax*) in component <NO COMPONENT>: delay(x, a, b) where argument #3 has to be parameter or constant expression but is a variable
// 
// endResult
