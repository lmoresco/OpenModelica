// name: MetaModelicaStringOpModelicaLexer
// keywords: string, lexing
// status: incorrect
//
// tests that the lexer/parser handles proper Modelica syntax for string operations

model MetaModelicaStringOpModelicaLexer
constant String s = "1" +& "2";
end MetaModelicaStringOpModelicaLexer;

// Result:
// Error processing file: MetaModelicaStringOpModelicaLexer.mo
// [MetaModelicaStringOpModelicaLexer.mo:8:26-8:26:writable] Error: Lexer failed to recognize '& "2";
// end '
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
