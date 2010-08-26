// name:     ModifyUnknown2
// keywords: modification
// status:   incorrect
// 
// Try to introduce a new member via modification.
//

class A
  Real a;
end A;

class ModifyUnknown2 = A(redeclare Real b = 5);
// Result:
// Error processing file: ModifyUnknown2.mo
// Error: In modifier  redeclare(b), class or component b not found in <A>
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
