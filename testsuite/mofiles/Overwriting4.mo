// name:      Overwriting4
// keywords:  modification, equation
// Two arguments of a modifier shall not designate the same element.
// status:    erroneous

class E
  Real x[3,3] = zeros(3,3);
end E;

class Overwriting4 = E(x=identity(3), x[1]=2); // Error: x[1] defined twice
// Result:
// Error processing file: Overwriting4.mo
// TODO: Needs a real error message
// [Overwriting4.mo:7:3-7:27:readonly] Warning: Variable x: Non-array modification '2' for array component, possibly due to missing 'each'.
// 
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
