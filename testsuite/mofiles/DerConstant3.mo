// name:     DerConstant3
// keywords: derivative
// status:   incorrect
// 
// Operator der cannot be applied to Integer expressions which are not constant or parametric  
// 

class A 
  discrete Integer pa = 1; 
  Real a = der(pa);
end A; 
