// name:     ModifyConstant3
// keywords: scoping,modification
// status:   correct
// 
// Only declared members may be redeclared. Using A.c in a redeclaration 
// is a syntactic error.
//
// N.B! Panic mode handles this by simply skipping the bad construct.
//      There is no error output, but there should be.

class A
  constant Real c = 1.0;
end A;

class B
  A a(redeclare constant Real A.c = 2.0);
end B;

class C
  A a;
end C;

class ModifyConstant3
  B b;
  C c;
end ModifyConstant3;

// fclass ModifyConstant3
// constant Real c.a.c = 1.0;
// end ModifyConstant3;
