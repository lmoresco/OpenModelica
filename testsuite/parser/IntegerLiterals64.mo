// name: IntegerLiterals (64-bit)
// keywords: integer
// status: incorrect
//
// Tests declaration of integers
//

model IntegerLiterals64
  constant Integer r6 = 4611686018427387903;
end IntegerLiterals64;

// Result:
// [IntegerLiterals64.mo:9:25-9:44:writable] Warning: OpenModelica (64-bit) only supports 63-bit signed integers! Transforming: 4611686018427387903 into a real
// 
// Error processing file: IntegerLiterals64.mo
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
