// name:     Abs1
// keywords: abs operator
// status:   correct
// 
//  The abs operator
//


model Abs
  Real x,y;
equation
  x=abs(x-y);
end Abs;

// fclass Abs
// Real x;
// Real y;
// equation
//   x = abs(x - y);
// end Abs;
