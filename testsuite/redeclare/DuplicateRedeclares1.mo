// name:     DuplicateRedeclares1
// keywords: redeclare
// status:   incorrect
// 
// Checks that the compiler issues an error on duplicate redeclares.
// 

model M
  replaceable Real r;
end M;

model DuplicateRedeclares1
  extends N(redeclare replaceable Real r = 1.5);

  redeclare replaceable Real r = 2.5;
end DuplicateRedeclares1;

// Result:
// Error processing file: DuplicateRedeclares1.mo
// [DuplicateRedeclares1.mo:13:3-13:48:writable] Error: Base class N not found in scope DuplicateRedeclares1
// Error: Error occurred while flattening model DuplicateRedeclares1
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
