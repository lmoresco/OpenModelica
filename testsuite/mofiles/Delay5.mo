// name:     Delay5
// keywords: builtin
// status:   incorrect
// 
// Test flattening of the builtin function delay.
// Should fail, as a is not parameter/constant.
// 

model Delay
  Real x, y;
  Real a=1.0;
equation
  x = sin(time);
  y = delay(x, a);
end Delay;
