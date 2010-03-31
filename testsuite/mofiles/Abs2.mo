// name:     Abs2
// keywords: abs operator
// status:   incorrect
// 
//  The abs operator
//


model Abs
  Boolean b;
equation
  b=abs(b);
end Abs;

// Result:
// fclass Abs
// Real x;
// Real y;
// equation
//   x = abs(x - y);
// end Abs;
// endResult
