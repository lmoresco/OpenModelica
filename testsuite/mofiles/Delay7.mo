// name:     Delay7
// keywords: builtin
// status:   incorrect
// 
// Test flattening of the builtin function delay.
// Should fail as b is not a parameter or constant.
// 

model Delay
  Real x, y;
  Real a = 1.0, b=2.0;
equation
  x = sin(time);
  y = delay(x, a, b);
end Delay;
