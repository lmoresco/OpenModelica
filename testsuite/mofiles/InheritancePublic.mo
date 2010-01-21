// name: InheritancePublic
// keywords: inheritance
// status: correct
//
// Tests public inheritance
//

class A
  parameter Real a;
end A;

class B
  public extends A;
end B;

// fclass B
// parameter Real a;
// end B;
