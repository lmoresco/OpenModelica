// name: ArraySizeFromFunc
// keywords: array, wholedim, function
// status: correct
//
// Tests determination of array size from function call with parameter as
// argument.
//

function f
  input Integer n;
  output Real x[n];
algorithm
  x := ones(n);
end f;

model ArraySizeFromFunc
  parameter Integer n = 5;
  parameter Real x[:] = f(n);
end ArraySizeFromFunc;

// Result:
// function f
// input Integer n;
// output Real[n] x;
// algorithm
//   x := /*/tp:REAL[]/*/(fill(1,n));
// end f;
// 
// class ArraySizeFromFunc
// parameter Integer n = 5;
// parameter Real x[1] = f(n)[1];
// parameter Real x[2] = f(n)[2];
// parameter Real x[3] = f(n)[3];
// parameter Real x[4] = f(n)[4];
// parameter Real x[5] = f(n)[5];
// end ArraySizeFromFunc;
// endResult
