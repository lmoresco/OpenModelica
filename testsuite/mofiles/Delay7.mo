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
// Result:
// Error processing file: Delay7.mo
// Error: Builtin function delay(expr,delayTime,delayMax*) failed in component <NO COMPONENT>:  use of delay: 
//  delay(real, real, real as parameter/constant)
//  or delay(real, real as parameter/constant).
// Error: Wrong type or wrong number of arguments to delay(x, a, b)'.
//  (in component <NO COMPONENT>)
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
