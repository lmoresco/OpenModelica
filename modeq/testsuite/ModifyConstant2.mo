//|name:     ModifyConstant2
//|keywords: scoping,modification
//|status:   incorrect
// 
// Constant values may not be changed.
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
