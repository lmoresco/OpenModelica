//|name:     DependsRecursive
//|keywords: scoping
//|status:   incorrect
// 
// A recursive model can not be instantiated.
//

model DependsRecursive
  Real head;
  DependsRecursive tail;
end DependsRecursive;
