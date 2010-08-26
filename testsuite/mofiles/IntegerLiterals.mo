// name: IntegerLiterals
// keywords: integer
// status: incorrect
//
// Tests declaration of integers
// i5 and i6 are not initialized properly
//

model IntegerLiterals
  constant Integer i1 = 33;
  constant Integer i2 = 0;
  constant Integer i3 = 100;
  constant Integer i4 = 30030044;
  constant Integer i5 = -2147483648;
  constant Integer i6 = 2147483647;
  Integer i;
equation
  i = -2;
end IntegerLiterals;
// Result:
// 
// IntegerLiterals.mo:14:26 Warning: Modelica supports only 32 bit signed integers! Transforming: 2147483648 into a real
// 
// IntegerLiterals.mo:15:25 Warning: OpenModelica supports only 31 bit signed integers! Truncating integer: 2147483647 to: 1073741823
// Error processing file: IntegerLiterals.mo
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
