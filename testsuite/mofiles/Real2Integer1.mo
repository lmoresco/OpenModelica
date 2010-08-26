// name:     Real2Integer1
// keywords: type
// status:   erroneous
//
// No implicit conversion from 'Real' to 'Integer'. But integers are 
// converted to reals in equations with real-expressions.
// 

class Real2Integer1
  Real a = 5.6;
  Integer n = a;
end Real2Integer1;

// Result:
// TODO: Needs a real error message
// Error processing file: Real2Integer1.mo
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
