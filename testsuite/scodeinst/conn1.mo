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
initial equation
  connect(c1, c2);
end A;

// Result:
// Error processing file: conn1.mo
// [conn1.mo:14:3-14:18:writable] Error: Connect equations are not allowed in initial equation sections.
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
