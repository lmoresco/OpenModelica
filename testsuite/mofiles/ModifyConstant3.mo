// name:     ModifyConstant3
// keywords: scoping,modification
// status:   incorrect
// 
// Only declared members may be redeclared. Using A.c in a redeclaration 
// is a syntactic error.
//

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
