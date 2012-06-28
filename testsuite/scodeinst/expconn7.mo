// name: expconn7.mo
// keywords:
// status: incorrect
// cflags:   +d=scodeInst
//
// FAILREASON: This should fail, since neither of the connected components
//             exist.
//

expandable connector EC
end EC;

model M
  EC ec1, ec2;
equation
  connect(ec1.r, ec2.e);
end M;
