// name:     ModifyUnknown2
// keywords: modification
// status:   incorrect
// 
// Try to introduce a new member via modification.
//

class A
  Real a;
end A;

class ModifyUnknown2 = A(redeclare Real b = 5);
