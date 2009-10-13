// name:     ConditionalArrayExpression1
// keywords: equation, array
// status:   incorrect
// 
// The sizes must fit in array expressions and equations.
// 

model ConditionalArrayExpression1
  Real a=1, b=2, c[2], d, e;
equation
  0 = if a > b then c else [d; e];
end ConditionalArrayExpression1;
