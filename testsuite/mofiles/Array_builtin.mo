// name:     Array_builtin
// keywords: array
// status:   incorrect
// 
// This is a simple test of basic array handling.
// A matrix can not be equal to an array

model Array_builtin
   Real x=1.0;
   Real y=2.0;
   Integer q;
   Integer A1[5]=[1,2,3,4,5];
   algorithm
    x:=ndims(A1);
    x:=sin(y);
end Array_builtin;

// Result:
// class Array_builtin
// end Array_builtin;
// endResult
