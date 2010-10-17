// name: ErrorMatchInOut2.mo
// cflags: +g=MetaModelica
// status: incorrect
package ErrorMatchInOut2

function fn
  input String str;
  output String outStr;
algorithm
  "" := match str
    case str then str;
  end match;
end fn;

constant String str = fn("");

end ErrorMatchInOut2;

// Result:
// Error processing file: ErrorMatchInOut2.mo
// [ErrorMatchInOut2.mo:10:3-12:12:writable] Error: Only component references are valid as output of a match expression. Got "".
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
