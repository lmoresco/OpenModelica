// name: OperatorComponents
// keywords: operator
// status: incorrect
//
// Tests operator overloading, operators can only contain function declarations
//

record Rec
  Real r;
  operator '+'
    Real factor = 3.0;
    function add
      input Rec r1;
      input Rec r2;
      output Rec res;
    algorithm
      res := Rec(r = r1.r + r2.r + factor);
    end add;
  end '+';
end Rec;

model OperatorComplex
  Rec r1,r2,r3;
equation
  r1 = Rec(r = 2.0);
  r2 = Rec(r = 3.0);
  r3 = r1 + r2;
end OperatorComplex;
