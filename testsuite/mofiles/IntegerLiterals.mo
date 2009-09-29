// name: IntegerLiterals
// keywords: integer
// status: incorrect
//
// Tests declaration of integers
// i5 and i6 are not initialized properly
//

model IntegerLiterals
  constant Integer i1 = 33;
  constant Integer i2 = 0;
  constant Integer i3 = 100;
  constant Integer i4 = 30030044;
  constant Integer i5 = -2147483648;
  constant Integer i6 = 2147483647;
  Integer i;
equation
  i = -2;
end IntegerLiterals;
