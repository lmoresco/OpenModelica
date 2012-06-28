// name: conn1.mo
// keywords:
// status: incorrect
//

model A
  connector C
    Real e;
    flow Real f;
  end C;

  C c1, c2;
algorithm
  connect(c1, c2);
end A;

// Result:
// Error processing file: conn2.mo
// [conn2.mo:14:3-14:9:writable] Error: No viable alternative near token: connect
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
