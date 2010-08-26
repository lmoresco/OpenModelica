// name: ComponentNames
// keywords: component
// status: correct
//
// THIS TEST SHOULD FAIL
// Tests whether or not a component can have the same name as its type specifier
//

class TestClass
  parameter Integer x = 1;
end TestClass;

model ComponentNames
  TestClass TestClass(x = 2);
  Integer Integer = 2;
end ComponentNames;

// Result:
// class ComponentNames
// parameter Integer TestClass.x = 2;
// Integer Integer = 2;
// end ComponentNames;
// endResult
