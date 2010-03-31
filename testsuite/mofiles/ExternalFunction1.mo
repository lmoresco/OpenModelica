// name:     ExternalFunction1
// keywords: external function,code generation,constant propagation
// status:   correct
// cflags:   ExternalFunction1_f.c
// 
// Constant evaluation of function calls. Result of a function call with 
// constant arguments is inserted into flat modelica.
// 

function f
  input Real x;
  output Real y;
external "C" y=ExternalFunction1_f(x);
end f;

model ExternalFunction1
  constant Real x=5;
  Real y;
equation
  y = f(x);
end ExternalFunction1;


// function f
// input Real x;
// output Real y;
// 
// external "C";
// end f;
// 
// Result:
// function f
// input Real x;
// output Real y;
// 
// external "C";
// end f;
// 
// fclass ExternalFunction1
// constant Real x = 5.0;
// Real y;
// equation
//   y = f(5.0);
// end ExternalFunction1;
// endResult
