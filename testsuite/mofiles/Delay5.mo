// name:     Delay5
// keywords: builtin
// status:   correct
// 
// Test flattening of the builtin function delay.
// Should issue a warning as a is not parameter/constant.
// Modelica.Electrical.Analog.Lines.TLine* uses delay(x, var)
// 

model Delay
  Real x, y, z;
  Real a=1.0;
equation
  x = sin(time);
  y = delay(x, a);
  z = delay(x, a, a);
end Delay;
// Result:
// class Delay
//   Real x;
//   Real y;
//   Real z;
//   Real a = 1.0;
// equation
//   x = sin(time);
//   y = delay(x,a,a);
//   z = delay(x,a,a);
// end Delay;
// Warning: Improper use of builtin function delay(expr,delayTime,delayMax*) in component <NO COMPONENT>: delay(x, a) where argument #2 has to be parameter or constant expression but is a variable
// Warning: Improper use of builtin function delay(expr,delayTime,delayMax*) in component <NO COMPONENT>: delay(x, a, a) where argument #3 has to be parameter or constant expression but is a variable
// 
// endResult
