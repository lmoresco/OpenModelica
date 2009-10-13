// name: TypeClass1
// keywords: type
// status: correct
//
// Tests type declaration from a legal class
//

class LegalClass
  extends Integer;
end LegalClass;

type LegalType = LegalClass;

model TypeClass1
  LegalType lt;
equation
  lt = 1;
end TypeClass1;

// fclass TypeClass1
// Integer lt;
// equation
//   lt = 1;
// end TypeClass1;
