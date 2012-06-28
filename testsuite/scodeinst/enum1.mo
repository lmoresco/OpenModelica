// name: enum1.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//


model M
  type E = enumeration(one, two, three);
  E e = E.one;
  //E e2 = e.one "NOT VALID!";
  //E e2 = E;
end M;

// Result:
// 
// EXPANDED FORM:
// 
// class M
//   enumeration(one, two, three) e = M.E.one;
// end M;
// 
// 
// Found 1 components and 0 parameters.
// class M
//   enumeration(one, two, three) e = M.E.one;
// end M;
// endResult
