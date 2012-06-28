// name: redeclare10.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//
// FAILREASON: ??
//

package B
  constant Real x = 1.0;
  constant Real y = 3.0;
end B;

model C
  replaceable package A
    constant Real x = 2.0;
  end A;
end C;

model D
  extends C(redeclare package A = B);
  //extends C;

  Real x = A.y;
end D;

// Result:
// SCodeInst.instClass failed
// Error processing file: redeclare10.mo
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
