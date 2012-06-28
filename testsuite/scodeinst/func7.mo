// name: func7.mo
// keywords:
// status: incorrect
// cflags:   +d=scodeInst
//

model A
  function f
    inner input Real x;
    output Real y;
  algorithm
    y := x;
  end f;

  Real x = f(x);
end A;

// Result:
// SCodeInst.instFunction failed: f
// Error processing file: func7.mo
// [func7.mo:9:5-9:23:writable] Error: Invalid prefix inner on formal parameter x.
// Error: Error occurred while flattening model A
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
