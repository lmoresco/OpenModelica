// name:     ModifyConstant6
// keywords: scoping,modification
// status:   incorrect
//
// Finalized constants can not be modified.
//

class A
  final constant Real c = 1.0;
end A;

class B
  A a(c = 2.0);
end B;

class C
  A a;
end C;

class ModifyConstant6
  B b;
  C c;
end ModifyConstant6;
