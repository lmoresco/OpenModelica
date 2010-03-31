// name: SimpleInheritance
// keywords: class, inheritance
// status: correct
//
// Tests simple inheritance using the extends keyword
//

class C1
  Integer i1;
end C1;

class C2
  extends C1;
  Integer i2;
end C2;

// Result:
// fclass C2
// Integer i1;
// Integer i2;
// end C2;
// endResult
