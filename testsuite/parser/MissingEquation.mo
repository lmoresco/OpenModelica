// status: incorrect

model MissingEquation
  Pin p,n;
  connect(p,n);
end MissingEquation;
// Result:
// Error processing file: MissingEquation.mo
// [MissingEquation.mo:5:3-5:9:writable] Error: Parse error: Found the start of a connect equation but expected an element (are you missing the equation keyword?)
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
