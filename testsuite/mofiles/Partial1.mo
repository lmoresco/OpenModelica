// name:     Partial1
// keywords: partial
// status:   incorrect
// 
// This is a test of the `partial' keyword.  The class `A' is declared
// as `partial' which means that it cannot be instantiated.
// 

partial class A
  Real x;
end A;

model Partial1
  A a;
end Partial1;
