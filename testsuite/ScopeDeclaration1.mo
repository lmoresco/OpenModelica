// name:     ScopeDeclaration1
// keywords: scoping,declaration
// status:   incorrect
// 
// Modelica is a strict define-before-use language. A variable must be
// fully instantiated (defined after end of declaration, semicolon) 
// before it is referenced. 
//

class ScopeDeclaration1
  Real a = a;
end ScopeDeclaration1;
