// name: enum3.mo
// keywords:
// status: correct
//
// FAILREASON: Enumeration array dimensions not supported.
//


model M
  type E = enumeration(one, two, three);
  E e[E] = E;
end M;

// Result:
// Failed to type cref E
// SCodeInst.instClass failed
// Error processing file: enum3.mo
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
