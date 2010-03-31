// name: ArrayDeclaration5
// keywords: array
// status: correct
//
// Tests declaring arrays with unspecified dimensions
//

model ArrayDeclaration5
  Real realArray[:] = {1,2,3,4};
end ArrayDeclaration5;

// Result:
// fclass ArrayDeclaration5
// Real realArray[1] = 1.0;
// Real realArray[2] = 2.0;
// Real realArray[3] = 3.0;
// Real realArray[4] = 4.0;
// end ArrayDeclaration5;
// endResult
