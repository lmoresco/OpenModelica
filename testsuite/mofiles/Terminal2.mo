// name:     Terminal2
// keywords: The terminal operator
// status:   incorrect
// 
//  The terminal operator returns bool.
//

class Terminal2

  Real t;
equation 
 t=2.0*terminal();
end Terminal2; 
// Result:
// Error processing file: Terminal2.mo
// [Terminal2.mo:12:2-12:18:writable] Error: Failed to elaborate expression: 2.0 * terminal()
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
