
class A
  constant Integer c = 17;
end A;

class B
  A a;
  constant Integer d = a.c + 1;
end B;

// Equations:
//
//   a.c = 17
//   d = a.c + 1
//
