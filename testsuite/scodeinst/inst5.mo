// name: inst5.mo
// keywords:
// status: incorrect
//

model M
  Real x;
  x y;
end M;

// Result:
// Error processing file: inst5.mo
// [inst5.mo:7:3-7:9:writable] Error: Found a component with same name when looking for type x
// Error: Error occurred while flattening model M
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
