// name: PackageComponents
// keywords: package
// status: correct
//
// Tests simple package creation and instantation of its components
//

package TestPackage

class TestClass
  Integer i;
end TestClass;

end TestPackage;

model PackageComponents
  TestPackage.TestClass tc;
equation
  tc.i = 1;
end PackageComponents;

// fclass PackageComponents
// Integer tc.i;
// equation
//   tc.i = 1;
// end PackageComponents;
