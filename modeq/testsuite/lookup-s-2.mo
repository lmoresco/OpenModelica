
class A
  constant Integer c = 17;
  constant Real q = 3.0;
end A;

class B
  constant Integer d = A.c + 1;
end B;

// Equations:
//
//  A.c = 17
//  d = A.c +(int) 1
//
