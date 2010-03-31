// name:     AddReal1
// keywords: external function, equation
// status:   correct


function add
  input Real x;
  input Real y;
  output Real res;
  external "C";
end add;

model AddReal1
  parameter Real a=2.3;
  parameter Real b=4.5;
  Real c;
equation
  c = add(a, b);
end AddReal1;

// Result:
// function add
// input Real x;
// input Real y;
// output Real res;
// 
// external "C";
// end add;
// 
// fclass AddReal1
// parameter Real a = 2.3;
// parameter Real b = 4.5;
// Real c;
// equation
//   c = add(a,b);
// end AddReal1;
// endResult
