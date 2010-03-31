// name: DeclarationEquation2
// keywords: equation, array
// status: correct
//
// Tests declaration equations with vectors
//

model DeclarationEquation2
  Real x[2] = {1,2};
end DeclarationEquation2;

// Result:
// fclass DeclarationEquation2
// Real x[1] = 1.0;
// Real x[2] = 2.0;
// end DeclarationEquation2;
// endResult
