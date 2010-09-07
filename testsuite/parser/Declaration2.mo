// name:     Declaration2
// keywords: declaration
// status:   incorrect
// 
// Misuse of component attributes.
//

class Declaration2
  constant discrete Real x;
end Declaration2;

// Result:
// Error processing file: Declaration2.mo
// [Declaration2.mo:9:12-9:20:writable] Error: No viable alternative near token: discrete
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
