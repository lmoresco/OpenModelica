// name:     ScopeDeclaration3
// keywords: scoping,declaration
// status:   incorrect
// 
// Modelica is a strict define-before-use language. A variable must be
// fully instantiated (defined after end of declaration, semicolon) 
// before it is referenced. 
//

class ScopeDeclaration3
  Real x;
equation
  x = y;
public
  Real y;
end ScopeDeclaration3;
