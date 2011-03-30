// name: RealOpLexerMetaModelica
// keywords: real, lexing
// cflags: +g=MetaModelica
// status: correct
//
// tests that the lexer/parser handles proper Modelica syntax for real operations
// also tests that the MetaModelica realAdd operator works
//

model A
constant Real x = 1+.2 "1+.2";
constant Real y = 1+. 2 "1+. 2";
constant Real z = 1+ .2 "1+ .2";
end A;

// Result:
// [RealOpLexerMetaModelica.mo:11:2-11:3:writable] Warning: Treating .2 as 0.2. This is not standard Modelica and only done for compatibility with old code. Support for this feature may be removed in the future.
// [RealOpLexerMetaModelica.mo:13:2-13:3:writable] Warning: Treating .2 as 0.2. This is not standard Modelica and only done for compatibility with old code. Support for this feature may be removed in the future.
// 
// class A
//   constant Real x = 1.2 "1+.2";
//   constant Real y = 3.0 "1+. 2";
//   constant Real z = 1.2 "1+ .2";
// end A;
// endResult
