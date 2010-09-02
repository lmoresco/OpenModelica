// name:     Assign1
// keywords: parse error
// status:   correct
// 

model Assign1
algorithm
  x = 3;
end Assign1;

// Result:
// Error processing file: Assign1.mo
// [Assign1.mo:8:8-8:8:writable] Error: Assignments use the := operator, not =.
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
