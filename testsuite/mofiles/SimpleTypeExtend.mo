// name: SimpleTypeExtend
// keywords: inheritance
// status: incorrect
//
// Tests to make sure you cannot extend built-in types and add components
// THIS TEST SHOULD FAIL
//

model SimpleTypeExtend
  extends Real;
  Real illegalReal;
end SimpleTypeExtend;

