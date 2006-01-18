// name:     Vectorizable1
// keywords: vectorized calls
// status:   correct
// 
// This tests vectorized calls.
// 
function foo 
  input Real x;
  output Real y;
algorithm
  y:=x+1;
end foo;


model Vectorizable1
  Real x[3];
  Real s[2];
  Real a,b,c;
equation 
  x=foo({a,b,c})+foo({1,2,3});
  der(s)=-fill(1,2);
end Vectorizable1;

// fclass Vectorizable1
// Real x[1];
// Real x[2];
// Real x[3];
// Real s[1];
// Real s[2];
// Real a;
// Real b;
// Real c;
// equation
//  {x[1],x[2],x[3]} = {foo(a) + 2.0,foo(b) + 3.0,foo(c) + 4.0};
//   der(s[1]) = -1.0;
//   der(s[2]) = -1.0;
// end Vectorizable1;
