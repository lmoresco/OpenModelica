// name:     InvalidExtends1
// keywords: extends invalid
// status:   incorrect
// 
// This test tests that the compiler issues an error if the name of an extends
// depends on an inherited element.
// 

class B
  class C
    Integer i;
  end C;
end B;

class C
  Integer j;
end C;

class A
  extends B;
	extends C; // C has been inherited from B, so this extends is illegal.
end A;

// Result:
// Error processing file: InvalidExtends1.mo
// [InvalidExtends1.mo:21:2-21:11:writable] Error: Extends .B depends on inherited element C.
// Error: Error occurred while flattening model A
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
