// name: for3.mo
// keywords:
// status: incorrect
//

model A
  Real x;
equation
  for i in 1 loop
    x = x;
  end for;
end A;

// Result:
// Error processing file: for3.mo
// [for3.mo:9:3-11:10:writable] Error: Type error in for expression (1). Expected array got Integer.
// Error: Error occurred while flattening model A
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
