// name:     EnumInvalidLiteral
// keywords: enumeration enum invalid
// status:   incorrect
// 
// Tests detection of invalid enumeration literals.
// 

model EnumInvalidLiteral
  type enum = enumeration(one, start);
  type enum2 = enumeration(quantity, two);
  enum e;
end EnumInvalidLiteral;


// Result:
// Error processing file: EnumInvalidLiteral.mo
// Error: [EnumInvalidLiteral.mo:9:3-9:38] Invalid use of reserved attribute name start as enumeration literal.
// Error: [EnumInvalidLiteral.mo:10:3-10:42] Invalid use of reserved attribute name quantity as enumeration literal.
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
