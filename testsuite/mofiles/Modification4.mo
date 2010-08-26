// name:     Modification4
// keywords: modification
// status:   incorrect
//
// Error since no p inside A.

class A
  Integer x = 1;
end A;

class B
  A a;
end B;

class Modification4
  B b(a(p=2));
end Modification4;

// Result:
// class Modification4;
// equation
//   b.a.x = 1
// end Modification4;
// endResult
