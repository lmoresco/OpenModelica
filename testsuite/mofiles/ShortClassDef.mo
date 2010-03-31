// name: ShortClassDef
// keywords: class
// status: correct
//
// Tests short class definitions of the form class foo = bar;
//

class TestClass
  Integer i1;
end TestClass;

class ShortClassDef = TestClass;

// Result:
// fclass ShortClassDef
// Integer i1;
// end ShortClassDef;
// endResult
