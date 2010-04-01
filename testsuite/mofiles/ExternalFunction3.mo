// name:     ExternalFunction3
// keywords: external function,code generation,constant propagation
// status:   correct
// setup_command: gcc -c -o ExternalFunction3_addmatrices.o ExternalFunction3_addmatrices.c
// teardown_command: rm -f ExternalFunction3_addmatrices.o
// 
// Constant evaluation of function calls. Result of a function call with 
// constant arguments is inserted into flat modelica.
// 

function addmatrices
  input Real a[:,:];
  input Real b[size(a,1),size(a,2)];
  output Real c[size(a,1),size(a,2)];
external "C" annotation(Library = "ExternalFunction3_addmatrices.o");
end addmatrices;

model ExternalFunction3
  constant Real a[2,2]={{1,2},{3,4}};
  constant Real b[2,2]={{5,6},{7,8}};
  Real c[2,2];
equation
  c = addmatrices(a,b);
end ExternalFunction3;

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
//   c[1,1] = 6.0;
//   c[1,2] = 8.0;
//   c[2,1] = 10.0;
//   c[2,2] = 12.0;
// end ExternalFunction3;
// endResult
