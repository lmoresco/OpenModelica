//|name:     ModifyConstant4
//|keywords: scoping,modification
//|status:   incorrect
// 
// Only members may be modified.
//

class A
  constant Real c = 1.0;
end A;

class B
  A a(A.c = 2.0);
end B;

class C
  A a;
end C;

class ModifyConstant4
  B b;
  C c;
end ModifyConstant4;
