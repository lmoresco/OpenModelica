// name: SimpleTypeExtend
// keywords: inheritance
// status: incorrect
//
// Tests to make sure you cannot extend built-in types and add components
// THIS TEST SHOULD FAIL
//

model SimpleTypeExtend
  extends Real;
  Real illegalReal;
end SimpleTypeExtend;

// Result:
// Error processing file: SimpleTypeExtend.mo
// [SimpleTypeExtend.mo:9:1-12:21:writable] Error: Class SimpleTypeExtend inherits primary type but has components
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
