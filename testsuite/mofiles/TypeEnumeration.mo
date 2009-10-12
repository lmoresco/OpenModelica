// name: TypeEnumeration
// keywords: type
// status: incorrect
//
// Tests declaring a type from an enumeration
// THIS TEST SHOULD NOT FAIL
//

type EnumType = enumeration(test1,test2,test3);

model TypeEnumeration
  EnumType et;
equation
  et = test3;
end TypeEnumeration;
