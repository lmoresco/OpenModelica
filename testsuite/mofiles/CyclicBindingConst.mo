// name: CyclicBindingConst
// keywords: cyclic
// status: erroneous
//
// Tests cyclic binding of constants
//

model CyclicBindingConst
  constant Real p = 2*q;
  constant Real q = 2*p;
end CyclicBindingConst;
