// name: CondDeclaration
// keywords: conditional, declaration
// status: correct
//
// Tests conditional declaration of components
//

model CondDeclaration
  Real r1 if true;
  Real r2 if false;
end CondDeclaration;

// fclass CondDeclaration
// Real r1;
// end CondDeclaration;
