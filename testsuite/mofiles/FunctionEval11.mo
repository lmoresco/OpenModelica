// name:     FunctionEval11
// keywords: function, ceval
// status:   correct
// cflags: +d=nogen
// 
// Tests constant evaluation of reductions where the iterator shadows a function
// variable.
// 

function f
  input Integer i1;
  output Integer i := max(i for i in {1,2,3,i1});
end f;

model FunctionEval11
  constant Integer i = f(4);
end FunctionEval11;

// Result:
// function f
//   input Integer i1;
//   output Integer i = <reduction>max(i for i in {1,2,3,i1});
// end f;
// 
// class FunctionEval11
//   constant Integer i = 4;
// end FunctionEval11;
// endResult
