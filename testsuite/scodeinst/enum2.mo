// name: enum2.mo
// keywords:
// status: correct
//


model M
  type E1 = enumeration(one, two, three);
  type E2 = E1(start = two);
  E2 e;
end M;

// Result:
// 
// EXPANDED FORM:
// 
// class M
//   enumeration(one, two, three) e;
// end M;
// 
// 
// Found 1 components and 0 parameters.
// class M
//   enumeration(one, two, three) e(start = M.E1.two);
// end M;
// endResult
