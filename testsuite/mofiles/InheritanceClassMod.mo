// name: InheritanceClassMod
// keywords: inheritance
// status: correct
//
// Tests simple inheritance with class modifications
//

class A
  parameter Real a;
end A;

class B
  extends A(a = 2.0);
end B;

// fclass B
// parameter Real a = 2.0;
// end B;
