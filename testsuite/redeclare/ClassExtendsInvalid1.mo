// name:     ClassExtendsInvalid1
// keywords: class,extends
// status:   incorrect
// cflags:   +d=scodeFlatten
// 
// Checks that it's not allowed to class extend a non-replaceable class.
//

class Y
  model X end X;
end Y;

class ClassExtendsInvalid1
 extends Y;

 redeclare model extends X end X;
end ClassExtendsInvalid1;

// Result:
// Error processing file: ClassExtendsInvalid1.mo
// Notification: From here:
// [ClassExtendsInvalid1.mo:10:3-10:16:writable] Error: Non-replaceable base class X in class extends.
// Error: Error occurred while flattening model ClassExtendsInvalid1
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
