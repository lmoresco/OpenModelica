// name:     ClassExtendsInvalid2
// keywords: class, extends
// status:   incorrect
// cflags:   +d=scodeFlatten
// 
// Checks that it's not allowed to class extend a non-inherited class.
//

model X end X;

class ClassExtendsInvalid2
 redeclare model extends X end X;
end ClassExtendsInvalid2;

// Result:
// Error processing file: ClassExtendsInvalid2.mo
// [ClassExtendsInvalid2.mo:12:12-12:33:writable] Error: Invalid redeclaration of class X, class extends only allowed on inherited classes.
// Error: Error occurred while flattening model ClassExtendsInvalid2
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
