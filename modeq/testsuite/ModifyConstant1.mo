// name:     ModifyConstant1
// keywords: scoping,modification
// status:   correct
// 
// Constants can be redeclared.
//

class A
  constant Real c = 1.0;
end A;

class B
  A a(redeclare constant Real c = 2.0);
end B;

class C
  A a;
end C;

class ModifyConstant1
  B b;
  C c;
end ModifyConstant1;

// fclass ModifyConstant1
//   constant Real b.a.c;
//   constant Real c.a.c;
// equation
//   b.a.c = 2.0;
//   c.a.c = 1.0;
// end ModifyConstant1;
