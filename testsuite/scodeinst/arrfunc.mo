// name: arrfunc.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//
// FAILREASON: Function calls can't handle subscripts.
//


model A
  constant Real z;

  function f
    input Real x;
    output Real y;
  algorithm
    y := x * z;
  end f;
end A;

model B
  A a[2](z = {1, 2});
  Real x1 = a[1].f(3);
  Real x2 = a[2].f(3);
end B;

// Result:
// SCodeInst.instClass failed
// Error processing file: arrfunc.mo
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
