// name: DoubleDeclaration
// keywords: component, declaration
// status: correct
//
// Tests double declaration of components
// THIS TEST SHOULD FAIL!
//

model DoubleDeclaration
  Integer x;
  Real x;
equation
  x = 1;
end DoubleDeclaration;

// fclass DoubleDeclaration
// Integer x;
// equation
//   x = 1.0;
// end DoubleDeclaration;
