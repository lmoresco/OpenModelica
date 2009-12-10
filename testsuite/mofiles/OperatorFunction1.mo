// name: OperatorFunction1
// keywords: operator
// status: correct
//
// tests the shorthand operator function keyword
//

record Rec;
  Real r;
  operator function '+'
    input Rec r1;
    input Rec r2;
    output Rec res;
  algorithm
    res = Rec(r = r1.r + r2.r);
  end '+';
end Rec;

model OperatorIllegal
  Rec r1,r2,r3;
equation
  r1.r = 1.0;
  r2.r = 2.0;
  r3 = r1 + r2;
end OperatorIllegal;
