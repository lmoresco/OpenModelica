// name:     MultipleDeclarations
// keywords: declaration, extends
// status:   incorrect
// 
// Multiple declarations (through extends) must be identical.
//
model A
 parameter Integer n(min=1);
 Real x[n];
end A;

model B
 extends A;
 parameter Integer n(min=1);
end B;

model B2
 extends A; 
 parameter Integer n(min=3);
end B2;

model test
  B b(n=1);
  B2 b2(n=1); // Error n in B2 and A is not identical
end test;
