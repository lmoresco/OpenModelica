// name:     ModifyConstant2
// keywords: scoping,modification
// status:   incorrect
// 
// Constant values cannot be changed in modifications.
//

class A
  constant Real c = 1.0;
end A;

class B
  A a(c = 2.0);
end B;

class C
  A a;
end C;

class ModifyConstant2
  B b;
  C c;
end ModifyConstant2;

// fclass ModifyConstant2
//   constant Real b.a.c;
//   constant Real c.a.c;
// equation
//   b.a.c = 2.0;
//   c.a.c = 1.0;
// end ModifyConstant2;
