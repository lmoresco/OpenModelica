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
// Result:
// Error processing file: ProtectedAccess.mo
// [ProtectedAccess.mo:14:3-14:22:readonly] Error: Variable tm: Attempt to modify protected element tm.x
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
