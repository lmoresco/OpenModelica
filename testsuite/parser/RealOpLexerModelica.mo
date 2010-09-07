// name: RealOpLexerModelica
// keywords: real, lexing
// status: incorrect
//
// tests that the lexer/parser handles proper Modelica syntax for real operations
// also tests that the MetaModelica realAdd operator works
//

model A
constant Real x = 1+.2 "1+.2";
constant Real y = 1+. 2 "1+. 2"; // Invalid Modelica syntax
constant Real z = 1+ .2 "1+ .2";
end A;

// Result:
// Error processing file: RealOpLexerModelica.mo
// [RealOpLexerModelica.mo:11:21-11:22:writable] Error: No viable alternative near token: .
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
