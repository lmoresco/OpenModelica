// name:     Modification8
// keywords: modification
// status:   incorrect
// 
// These are seen as two modifications of the
// same element.
// 
// The 23rd meeting at Lund clarified that
// a.x=1.0, a.y=2, a(z=3) is seen as a(x=1.0,y=2,z=3)
// 

class Modification8
  class A
    Real x;
  end A;
  class B
    A a;
  end B;
  B b(a.x = 1.0, a(x = 2.0));
end Modification8;

// Result:
// Error processing file: Modification8.mo
// [Modification8.mo:17:5-17:8:writable] Error: Multiple modifiers in same scope for element b.a.x: x = 1.0, from calling scope: b, duplicates are: b.a.x: x = 2.0
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
