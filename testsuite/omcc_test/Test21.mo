// name: Test21.mo
// keywords:  this tests the "End" keyword in array subscript
// status:    correct
// 


class Arraytest
  Integer a[:] = 3:5;
  parameter Integer b[:] = {3,2};
  Real c[b[end]];
algorithm
  a[end-b[end]] := 1;
end Arraytest;

//succeed
//omccp v-2012

// Result:
// class Array9
// Integer a[1] = 3;
// Integer a[2] = 4;
// Integer a[3] = 5;
// parameter Integer b[1] = 3;
// parameter Integer b[2] = 2;
// Real c[1];
// Real c[2];
// algorithm
//   a[1] := 1;
// end Array9;
// endResult
