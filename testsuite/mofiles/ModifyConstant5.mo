// name:     ModifyConstant5
// keywords: scoping,modification
// status:   erroneous
//
// Finalized members can not be redeclared.
//

class A
  final constant Real c = 1.0;
end A;

class B
  A a(redeclare constant Real c = 2.0);
end B;

class C
  A a;
end C;

class ModifyConstant5
  B b;
  C c;
end ModifyConstant5;
// Result:
// TODO: Needs a real error message
// Error processing file: ModifyConstant5.mo
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
