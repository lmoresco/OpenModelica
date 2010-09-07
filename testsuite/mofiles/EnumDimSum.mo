// name: EnumDimSum
// keywords: enum dimension sum
// status: correct
//
// Checks that sum of an array whose dimension is an enumeration is expanded
// correctly.
//

model EnumDimSum
  type E = enumeration(one, two, three);
  Real X[E];
  Real x;
equation
  x = sum(X);
end EnumDimSum;

// Result:
// class EnumDimSum
//   Real X[E.one];
//   Real X[E.two];
//   Real X[E.three];
//   Real x;
// equation
//   x = X[E.one] + (X[E.two] + X[E.three]);
// end EnumDimSum;
// endResult
