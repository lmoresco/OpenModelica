// name: const8.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//


model M
  parameter Real A[i, j];
  parameter Integer i = size(A, 2);
  parameter Integer j = size(A, 1);
end M;

model M2
  parameter Real A[2, 3];
  parameter Integer j = size(A, i);
  parameter Integer i = size(A, 1);
end M2;

// Result:
// 
// EXPANDED FORM:
// 
// class M2
//   parameter Real A[1,1];
//   parameter Real A[1,2];
//   parameter Real A[1,3];
//   parameter Real A[2,1];
//   parameter Real A[2,2];
//   parameter Real A[2,3];
//   parameter Integer j = 3;
//   parameter Integer i = 2;
// end M2;
// 
// 
// Found 0 components and 8 parameters.
// class M2
//   parameter Real A[1,1];
//   parameter Real A[1,2];
//   parameter Real A[1,3];
//   parameter Real A[2,1];
//   parameter Real A[2,2];
//   parameter Real A[2,3];
//   parameter Integer i = 2;
//   parameter Integer j = size(A, i);
// end M2;
// Warning: Parameter A has neither value nor start value, and is fixed during initialization (fixed=true)
// 
// endResult
