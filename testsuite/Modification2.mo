// name:     Modification2
// keywords: modification
// status:   incorrect
// 
// Cannot modify all elements of a certain type in this way.


class B
  class A
    parameter Real p=1.0;
  end A;
  A a;
end B;

class Modification2
  B b(A(p=2.0));
end Modification2;

