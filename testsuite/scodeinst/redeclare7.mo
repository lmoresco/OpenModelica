// name: redeclare7.mo
// keywords:
// status: correct
//
// FAILREASON: ??
//


model C
  replaceable package P = P1;
  Real z = P.x;
end C;

package P1
  constant Real x = 1;
end P1;

package P2
  constant Real x = 2;
end P2;

model D
  C b(redeclare package P = P2);
end D;

// Result:
// Failed to type cref b.P.x
// SCodeInst.instClass failed
// Error processing file: redeclare7.mo
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
