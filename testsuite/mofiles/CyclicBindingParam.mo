// name: CyclicBindingParam
// keywords: cyclic
// status: incorrect
//
// Tests cyclic binding of parameters
//

model CyclicBindingParam
  parameter Real p = 2*q;
  parameter Real q = 2*p;
end CyclicBindingParam;
