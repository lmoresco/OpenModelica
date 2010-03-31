// name:     Abs1
// keywords: abs operator
// status:   correct
// 
//  The abs operator
//


model Abs1
  Real x,y;
equation
  x=abs(x-y);
end Abs1;

// Result:
// fclass Abs1
// Real x;
// Real y;
// equation
//   x = abs(x - y);
// end Abs1;
// endResult
