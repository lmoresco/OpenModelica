//|name:     DependsMutual
//|keywords: scoping
//|status:   incorrect
// 
// Mutual dependence is not supported as only previously declared models 
// are known and no forward declaration exists in Modelica.
//

class A
 Real x;
 DependsMutual b;
end A;

class DependsMutual
  Real x;
  A a;
end DependsMutual;
