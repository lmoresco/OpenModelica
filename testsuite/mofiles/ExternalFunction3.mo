// name:     ExternalFunction3
// keywords: external function,code generation,constant propagation
// status:   correct
// cflags:   ExternalFunction3_addmatrices.c
// 
// Constant evaluation of function calls. Result of a function call with 
// constant arguments is inserted into flat modelica.
// 

function addmatrices
  input Real a[:,:];
  input Real b[size(a,1),size(a,2)];
  output Real c[size(a,1),size(a,2)];
external "C";
end addmatrices;

model ExternalFunction3
  constant Real a[2,2]={{1,2},{3,4}};
  constant Real b[2,2]={{5,6},{7,8}};
  Real c[2,2];
equation
  c = addmatrices(a,b);
end ExternalFunction3;

// function addmatrices
// input Real a;
// input Real b;
// output Real c;
// 
// external "C";
// end addmatrices;
// 
// Result:
// function addmatrices
// input Real a;
// input Real b;
// output Real c;
// 
// external "C";
// end addmatrices;
// 
// fclass ExternalFunction3
// constant Real a[1,1] = 1.0;
// constant Real a[1,2] = 2.0;
// constant Real a[2,1] = 3.0;
// constant Real a[2,2] = 4.0;
// constant Real b[1,1] = 5.0;
// constant Real b[1,2] = 6.0;
// constant Real b[2,1] = 7.0;
// constant Real b[2,2] = 8.0;
// Real c[1,1];
// Real c[1,2];
// Real c[2,1];
// Real c[2,2];
// equation
//   c = addmatrices({{1.0,2.0},{3.0,4.0}},{{5.0,6.0},{7.0,8.0}});
// end ExternalFunction3;
// endResult
