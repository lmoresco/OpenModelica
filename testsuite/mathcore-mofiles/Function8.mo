// name:     Function8
// keywords: function
// status:   incorrect
// 
// This tests basic function functionality
//

function f
  input Real x;
  output Real r;
algorithm
  r := 2.0 * x;
end f;

model Function8
  Real x;
  String z;
equation
  x = f(z);
end Function8;
// Result:
// Error processing file: Function8.mo
// Error: No matching function found for f(z) of type function(x:String) => Real, candidates are function(x:Real) => Real
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
