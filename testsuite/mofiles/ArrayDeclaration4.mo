// name: ArrayDeclaration4
// keywords: array
// status: correct
//
// Tests declaring arrays with negative dimensions
// This test should fail
//

model ArrayDeclaration4
  Real errArr[-2];
end ArrayDeclaration4;

// Result:
// class ArrayDeclaration4
// end ArrayDeclaration4;
// endResult
