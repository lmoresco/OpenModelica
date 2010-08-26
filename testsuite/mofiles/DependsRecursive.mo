// name:     DependsRecursive
// keywords: scoping
// status:   incorrect
// 
// A recursive model can not be instantiated.
//

model DependsRecursive
  Real head;
  DependsRecursive tail;
end DependsRecursive;
// Result:
// Error processing file: DependsRecursive.mo
// Error: Class DependsRecursive has a recursive definition, i.e. contains an instance of itself
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
