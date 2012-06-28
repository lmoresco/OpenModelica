// name: inst3.mo
// keywords:
// status: correct
//

package P
  constant Integer i = 2;

  model A
    constant Integer j = i;
  end A;
end P;

model B
  Real a[P.A.j];
end B;

// Result:
// 
// EXPANDED FORM:
// 
// class B
//   Real a[1];
//   Real a[2];
// end B;
// 
// 
// Found 2 components and 0 parameters.
// class B
//   Real a[1];
//   Real a[2];
// end B;
// endResult
