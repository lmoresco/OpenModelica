// name: ComponentNames
// keywords: component
// status: correct
//
// THIS TEST SHOULD FAIL according to Modelica Specifications.
// But MSL contains such errors, so the test only results in a warning
// Tests whether or not a component can have the same name as its type specifier
//

class TestClass
  parameter Integer x = 1;
end TestClass;

model ComponentNames
  TestClass TestClass(x = 2);
  Integer Integer;
end ComponentNames;

// Result:
// class ComponentNames
//   parameter Integer TestClass.x = 2;
//   Integer Integer;
// end ComponentNames;
// Warning: Component TestClass has the same name as its type TestClass . This is forbidden by Modelica specifications and may lead to lookup error
// Warning: Component Integer has the same name as its type Integer . This is forbidden by Modelica specifications and may lead to lookup error
// 
// endResult
