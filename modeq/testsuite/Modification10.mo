// name:     Modification10
// keywords: modification,unknown
// status:   incorrect
// 
// You can only modify local names.
// 

class B
  Real x = 1.0;
end B;

class C
  B b;
end C;

class A
  C c;
  B b;
end A;

class Modification10
  A a(B(x = 17.0));
end Modification10;
