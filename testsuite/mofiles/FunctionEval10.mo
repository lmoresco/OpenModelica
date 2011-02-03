// name:     FunctionEval10
// keywords: function, ceval, resizing
// status:   correct
// 
// Tests constant evaluation of functions with protected variables with flexible
// dimension sizes.
// 

function fun
  input Integer n;
  output Real m[:];
protected
  Real tmp[:];
algorithm
  tmp := ones(n);
  m := tmp;
end fun;

model FunctionEval10
  Real r[:] = fun(5);
end FunctionEval10;

// Result:
// function fun
//   input Integer n;
//   output Real[:] m;
//   protected Real[:] tmp;
// algorithm
//   tmp := /*/tp:REAL[:]/*/(fill(1,n));
//   m := tmp;
// end fun;
// 
// class FunctionEval10
//   Real r[1] = 1.0;
//   Real r[2] = 1.0;
//   Real r[3] = 1.0;
//   Real r[4] = 1.0;
//   Real r[5] = 1.0;
// end FunctionEval10;
// endResult
