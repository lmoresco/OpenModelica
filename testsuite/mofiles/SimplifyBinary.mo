// name:     SimplifyBinary
// keywords: simplify
// status:   correct
// 


model SimplifyBinary
  Real x(start=0);
  Real a,b,c,d,e,f,g,h,i;
equation 
  10 = x+der(x);
  a = x-der(x);
  b = (a*x)/x;
  c = (a*x)/a;
  d = (-a*x)/x;
  e = (-a*x)/a;
  f = (a*(-x))/a;
  g = (a*x)/(-x);
  h = (a*x)/(-a);
  i = ((-a)*x)/(-a);
end SimplifyBinary;

// Result:
// class SimplifyBinary
//   Real x(start = 0.0);
//   Real a;
//   Real b;
//   Real c;
//   Real d;
//   Real e;
//   Real f;
//   Real g;
//   Real h;
//   Real i;
// equation
//   10.0 = x + der(x);
//   a = x - der(x);
//   b = a;
//   c = x;
//   d = -a;
//   e = -x;
//   f = -x;
//   g = -a;
//   h = -x;
//   i = x;
// end SimplifyBinary;
// endResult
