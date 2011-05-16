// name:     EmptyArray
// keywords: array, constructor, empty
// status:   incorrect
// 
// Checks that empty array constructors are not allowed, as per 10.4 in the
// Modelica 3.2 specification.
// 

model EmptyArray
  Real r[:] = {};
end EmptyArray;

// Result:
// Error processing file: EmptyArray.mo
// [EmptyArray.mo:10:3-10:17:writable] Error: Array constructor may not be empty.
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
