// name: ih2.mo
// keywords:
// status: correct
//
// FAILREASON: Bad prefixing of P1.i and P2.i (should be P.P1.i and P.P2.i).
//


package P
package P
  constant Integer i;
end P;

model A
  package P1 = P(i = 2);
  package P2 = P(i = 3);
  Integer i1 = P1.i;
  Integer i2 = P2.i;
end A;
end P;

model A
  extends P.A;
end A;

// Result:
// 
// EXPANDED FORM:
// 
// class A
//   Integer i2 = 0;
//   Integer i1 = 0;
// end A;
// 
// 
// Found 2 components and 0 parameters.
// class A
//   Integer i1 = 2;
//   Integer i2 = 3;
// end A;
// endResult
