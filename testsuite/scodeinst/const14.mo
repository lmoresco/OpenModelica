// name: const14.mo
// keywords:
// status: incorrect
// cflags:   +d=scodeInst
//
// Correct, but old inst fails.
//

package B
  package A
    package B
      constant Integer j = 2;
    end B;
  end A;
end B;

package A
  package B
    package A
      package B
        constant Integer i = .B.A.B.j;
      end B;
    end A;
  end B;
end A;

model M
  Integer x = A.B.A.B.i;
end M;


// Result:
// 
// EXPANDED FORM:
// 
// class M
//   Integer x = 2;
// end M;
// 
// 
// Found 1 components and 0 parameters.
// Error processing file: const14.mo
// [const14.mo:21:9-21:38:writable] Error: Variable .B.A.B.j not found in scope A.B.A.B
// [const14.mo:28:3-28:24:writable] Error: Variable A.B.A.B.i not found in scope M
// Error: Error occurred while flattening model M
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
