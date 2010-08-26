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
// Error: Cannot resolve type of expression 2.0 * terminal() (expressions :2.0, terminal() types: Real, Boolean) in component <NO COMPONENT>
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
