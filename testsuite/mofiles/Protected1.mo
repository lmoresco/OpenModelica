// name:     Protected1
// keywords: protected
// status:   incorrect
// 
// This file tests information hiding using the 'protect' keyword
// 
// The file is not valid, the compiler should complaint about y and a
// being protected.

class A
  Real a = 1;
end A;

class B
  Real x = 1;
protected
  extends A;
  Real y = 1;
end B;

model Protected1
  B a(y=18);
  B b(a=3);
  B c;
end Protected1;
// Result:
// Error processing file: Protected1.mo
// Error: Attempt to modify protected element a.y
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
