// name:     ConditionalArrayExpression2
// keywords: equation,array
// status:   correct
// 
// The sizes must fit in array expressions and equations.
//

model ConditionalArrayExpression2
  Real a=1.0, b=2.0, c[2,1], d, e;
equation
  [0.0; 0.0] = if a > b then c else [d; e];
end ConditionalArrayExpression2;

// fclass ConditionalArrayExpression2
//   Real a;
//   Real b;
//   Real c[1,1];
//   Real c[2,1];
//   Real d;
//   Real e;
// equation
//   a = 1.0;
//   b = 2.0;
//   0.0 = if a > b then c[1,1] else d;
//   0.0 = if a > b then c[2,1] else e;
// end ConditionalArrayExpression2;
