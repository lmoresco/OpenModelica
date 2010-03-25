// name: DoubleDeclaration
// keywords: component, declaration
// status: incorrect
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
