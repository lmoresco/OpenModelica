// name:     Real2Integer2
// keywords: type
// status:   incorrect
// 
// No implicit conversion from Real to Integer. Division via '/' always 
// gives a Real.
// 

class Real2Integer2
  Integer n1, n2;
algorithm
  n1 := 6;
  n2 := n1 / 2;
end Real2Integer2;
// Result:
// Error processing file: Real2Integer2.mo
// - Algorithm.makeAssignment failed
//     n2 := Real(n1) / 2.0
// - Algorithm.makeAssignment failed
//     n2 := Real(n1) / 2.0
// 
// Error: Type mismatch in assignment in n2 := Real(n1) / 2.0 of Integer := Real
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// - Algorithm.makeAssignment failed
//     n2 := Real(n1) / 2.0
// - Algorithm.makeAssignment failed
//     n2 := Real(n1) / 2.0
// 
// Execution failed!
// endResult
