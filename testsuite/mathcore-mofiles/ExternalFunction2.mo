// name:     ExternalFunction2
// keywords: external function,code generation,constant propagation
// status:   correct
// cflags:   ExternalFunction2_f.c
// 
// Constant evaluation of function calls. Result of a function call with 
// constant arguments is inserted into flat modelica.
// 

function f
  input Real x[:];
  output Real y[size(x,1)];
external "C" ExternalFunction2_f(x,size(x,1),y,size(y,1));
end f;

model ExternalFunction2
  constant Real x[:]={3.0,4.0, 5.0, 6.0};
  Real y[size(x,1)];
equation
  y = f(x);
end ExternalFunction2;

// fclass ExternalFunction2
// constant Real x[1] = 3.0;
// constant Real x[2] = 4.0;
// constant Real x[3] = 5.0;
// constant Real x[4] = 6.0;
// Real y[1];
// Real y[2];
// Real y[3];
// Real y[4];
// equation
//   y[1] = 9.0;
//   y[2] = 12.0;
//   y[3] = 15.0;
//   y[4] = 18.0;
// end ExternalFunction2;


