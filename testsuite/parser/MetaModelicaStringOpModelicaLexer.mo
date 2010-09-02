// name: MetaModelicaStringOpModelicaLexer
// keywords: string, lexing
// status: erroneous
//
// tests that the lexer/parser handles proper Modelica syntax for string operations

model MetaModelicaStringOpModelicaLexer
constant String s = "1" +& "2";
end MetaModelicaStringOpModelicaLexer;

// Result:
// Error processing file: MetaModelicaStringOpModelicaLexer.mo
// [RealOpLexerModelica.mo:11:21-11:21:writable] Error: Parser error near: '.'. 
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
