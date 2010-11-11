// name:     Abs2
// keywords: abs operator
// status:   incorrect
// 
//  The abs operator
//


model Abs
  Boolean b;
equation
  b=abs(b);
end Abs;

// Result:
// Error processing file: Abs2.mo
// [Abs2.mo:12:3-12:11:writable] Error: Wrong type or wrong number of arguments to abs(b)'.
//  (in component <NO COMPONENT>)
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
