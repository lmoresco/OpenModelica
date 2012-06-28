// name: mod2.mo
// keywords:
// status: incorrect
//


type T1 = Real(min = 0);
type T2 = Real(max = 10);

model A
  replaceable parameter T1 x = 2;
  replaceable input Real y[2];
end A;

model B
  A a(replaceable T2 x, redeclare T2 y);
  A b(y[1] = 1, y[2] = 2, y = {1, 2}) = 2;
  //A b(x = 3, y = {1, 2}) = 2;
  A c(x(start = 1));
end B;

// Result:
// Error processing file: mod2.mo
// [mod2.mo:17:7-17:15:writable] Error: Subscripted modifier is illegal.
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
