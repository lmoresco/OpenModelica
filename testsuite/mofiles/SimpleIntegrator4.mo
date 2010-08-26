// name:     SimpleIntegrator4
// keywords: declaration,modification
// status:   incorrect
// 
// Try to access non-existend attribute 'initial'.
//

model SimpleIntegrator4
  Real u = 1.0;
  Real x(initial = 2.0);
equation
  der(x) = u;
end SimpleIntegrator4;
// Result:
// [SimpleIntegrator4.mo:10:10-10:24:writable] Error: unexpected token: initial, parsing resumed at token ';' on line 10, column 24
// 
// Error processing file: SimpleIntegrator4.mo
// Error: Variable x not found in scope SimpleIntegrator4
// Error: Wrong type or wrong number of arguments to der(x) (in component <NO COMPONENT>)
// Error: Wrong type or wrong number of arguments to der(x)'.
//  (in component <NO COMPONENT>)
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
