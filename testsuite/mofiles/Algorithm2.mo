// name:     Algorithm2
// keywords: algorithm
// status:   incorrect
// 
// Type checks in algorithms.
// 

class Algorithm2
  Integer i;
  Real x;
algorithm
  i := x;
end Algorithm2;
// Result:
// Error processing file: Algorithm2.mo
// - Algorithm.makeAssignment failed
//     i := x
// - Algorithm.makeAssignment failed
//     i := x
// 
// [Algorithm2.mo:12:3-12:9:writable] Error: Type mismatch in assignment in i := x of Integer := Real
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// - Algorithm.makeAssignment failed
//     i := x
// - Algorithm.makeAssignment failed
//     i := x
// 
// Execution failed!
// endResult
