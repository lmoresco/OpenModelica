// name: ProtectedAccess
// keywords: protected, access
// status: incorrect
//
// Tests access to protected elements of another class
//

model TestModel
protected
  Integer x = 2;
end TestModel;

model ProtectedAccess
  TestModel tm(x = 3);
end ProtectedAccess;
