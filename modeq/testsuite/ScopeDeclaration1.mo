//|name:     ScopeDeclaration1
//|keywords: scoping,declaration
//|status:   incorrect
// 
// Is a variable already known on the right hand side of its 
// declaration equation? <Ruediger: assume not?>
//

class ScopeDeclaration1
  class B
    Real a = a;
  end B;
  B b;
end ScopeDeclaration1;
