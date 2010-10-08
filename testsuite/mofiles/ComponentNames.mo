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
// [ComponentNames.mo:15:3-15:29:writable] Warning: Component TestClass has the same name as its type ComponentNames.TestClass.
// 	This is forbidden by Modelica specifications and may lead to lookup errors.
// [ComponentNames.mo:16:3-16:18:writable] Warning: Component Integer has the same name as its type ComponentNames.Integer.
// 	This is forbidden by Modelica specifications and may lead to lookup errors.
// 
// endResult
