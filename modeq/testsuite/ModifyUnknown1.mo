//|name:     ModifyUnknown1
//|keywords: modification
//|status:   incorrect
// 
// Try to introduce a new member via modification.
//

class A
  Real a;
end A;

class ModifyUnknown1 = A(b = 5);
