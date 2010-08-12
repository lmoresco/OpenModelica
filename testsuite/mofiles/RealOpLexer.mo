// name: RealOpLexer
// keywords: real, lexing
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
// fclass A
//   constant Real x = 1.2 "1+.2";
//   constant Real y = 3.0 "1+. 2";
//   constant Real z = 1.2 "1+ .2";
// end A;
// endResult
