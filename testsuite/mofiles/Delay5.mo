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
// Result:
// Error processing file: Delay5.mo
// Error: Builtin function delay(expr,delayTime,delayMax*) failed in component <NO COMPONENT>: delay(x, a) where argument #2 has to be paramter or constant expression
// Error: Builtin function delay(expr,delayTime,delayMax*) failed in component <NO COMPONENT>:  use of delay: 
//  delay(real, real, real as parameter/constant)
//  or delay(real, real as parameter/constant).
// Error: Wrong type or wrong number of arguments to delay(x, a)'.
//  (in component <NO COMPONENT>)
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
