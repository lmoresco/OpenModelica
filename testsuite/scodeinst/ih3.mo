// name: ih3.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//
// FAILREASON: Bad prefixing of P1.i and P2.i.
//

package P
package P
  constant Integer i;
end P;

package P1 = P(i = 2);
package P2 = P(i = 3);

model A
  Integer i1 = P1.i;
  Integer i2 = P2.i;
end A;
end P;
