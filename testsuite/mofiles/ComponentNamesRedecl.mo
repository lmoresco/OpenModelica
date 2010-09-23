// name: RedeclarationComponentNames
// keywords: component
// status: correct
//
// This test should produce a warning (or even fail, according to Modelica Specifications)
// Tests whether or not a component can have the same name as its type specifier in a redeclaraton
//

class A
  Real x;
end A;

class B
  Real x;
  Real y;
end B;    

model Legal
  replaceable A B;
end Legal;

model IllegalRedeclaredComponentName
  extends Legal(redeclare B B);
end IllegalRedeclaredComponentName;

// Result:
// class IllegalRedeclaredComponentName
//   Real B.x;
//   Real B.y;
// end IllegalRedeclaredComponentName;
// 
// endResult
