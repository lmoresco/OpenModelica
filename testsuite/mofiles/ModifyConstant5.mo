// name:     ModifyConstant5
// keywords: scoping,modification
// status:   incorrect
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
// Error processing file: ModifyConstant5.mo
// [ModifyConstant5.mo:13:3-13:39:readonly] Error: Variable b.a: trying to override final variable in class: A
// 	by using modifiers: b.a((redeclare COMPONENT(c in/out:  mod:  = 2.0 tp: Real var :CONST)),  = final 1.0) that do not agree.
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
