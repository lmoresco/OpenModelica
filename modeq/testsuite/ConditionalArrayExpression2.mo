// name:     ConditionalArrayExpression2
// keywords: equation,array
// status:   correct
// 
// The sizes must fit in array expressions and equations.
//

model ConditionalArrayExpression2
  Real a=1.0, b=2.0, c[2], d, e;
equation
  [0.0; 0.0] = if a > b then c else [d; e];
end ConditionalArrayExpression2;

// fclass ConditionalArrayExpression2
//   Real a;
//   Real b;
//   Real c[2];
//   Real d;
//   Real e;
// equation
//   a = Real(1);
//   b = Real(2);
//   0 = if a > b then c[1] else d;
//   0 = if a > b then c[2] else e;
// end ConditionalArrayExpression2;
