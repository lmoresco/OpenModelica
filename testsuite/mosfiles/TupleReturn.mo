function ftest
  input Real a;
  output Real c[2];
  output Real b[2];
algorithm
  (c, b) := ftest2(a);
end ftest;

function ftest2
  input Real a;
  output Real b[2];
  output Real c[2];
algorithm
  b := {a, 2*a};
  c := {a/2, a};
end ftest2;

model TupleReturn
  Real a;
  Real b[2];
  Real c[2];
equation
  a = 2;
  (b,c) = ftest(a);
end TupleReturn;
