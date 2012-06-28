// name: const17.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//
// FAILREASON: This test fails because SCodeLook.crefStripEnvPrefix strips A.B
// from A.B.c, so SCodeInst can't find it since it's looking for only c.
// crefStripEnvPrefix should be removed when we switch to the new instantiation.
//

package A
  package B
    constant Integer i = A.B.c;

    package A
      package B
        constant Integer c = 2;
      end B;
    end A;
  end B;
end A;

model M
  Real x = A.B.i;
end M;
