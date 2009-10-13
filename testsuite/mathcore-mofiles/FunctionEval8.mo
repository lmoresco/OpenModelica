// name:     FunctionEval8
// keywords: function,constant propagation
// status:   correct
// 
// Constant evaluation of function calls. Result of a function call with 
// constant arguments is inserted into flat modelica. 

function test3
  input  Real x;
  output Real y;
protected
algorithm
  y := x + 7;
end test3;

function test
  input  Real x;
  output Real y;
protected
algorithm
  y := cos(x) + 4;
end test;

model FunctionEval8
  parameter Real a=5;
  parameter Real b[3]={1,2,3};
  Real x1=test(a);
  parameter Real x2=size({4,5,6,7},1);
  Real y;
  Real z;
equation
  y = test3(x1+x2);
  z = test(y);
end FunctionEval8;


// function test3
// input Real x;
// output Real y;
// algorithm
//   y := x + 7.0;
// end test3;
// 
// function test
// input Real x;
// output Real y;
// algorithm
//   y := cos(x) + 4.0;
// end test;
// 
// fclass FunctionEval8
// parameter Real a = 5;
// parameter Real b[1] = 1;
// parameter Real b[2] = 2;
// parameter Real b[3] = 3;
// Real x1 = test(a);
// parameter Real x2 = 4;
// Real y;
// Real z;
// equation
//   y = test3(x1 + x2);
//   z = test(y);
// end FunctionEval8;
