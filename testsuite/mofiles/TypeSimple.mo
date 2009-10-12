// name: TypeSimple
// keywords: type
// status: correct
//
// Tests simple type declaration
//

type MyType = Integer;

model TypeSimple
  MyType mt;
equation
  mt = 2;
end TypeSimple;

// fclass TypeSimple
// Integer mt;
// equation
//   mt = 2;
// end TypeSimple;
