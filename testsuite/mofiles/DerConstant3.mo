// name:     DerConstant3
// keywords: derivative
// status:   incorrect
// 
// Operator der cannot be applied to Integer expressions which are not constant or parametric  
// 

class A 
  discrete Integer pa = 1; 
  Real a = der(pa);
end A; 
// Result:
// Error processing file: DerConstant3.mo
// [DerConstant3.mo:10:3-10:19:writable] Error: Illegal derivative. der(pa) in component <NO COMPONENT> is of type Integer, which is not a subtype of Real
// [DerConstant3.mo:10:3-10:19:writable] Error: Wrong type or wrong number of arguments to der(pa) (in component <NO COMPONENT>)
// Error: Wrong type or wrong number of arguments to der(pa)'.
//  (in component <NO COMPONENT>)
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
