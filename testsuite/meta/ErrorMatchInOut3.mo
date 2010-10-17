// name: ErrorMatchInOut3.mo
// cflags: +g=MetaModelica
// status: incorrect
package ErrorMatchInOut3

function fn
  input String str;
  output String outStr;
algorithm
  outStr := match ""
    case str then str;
  end match;
end fn;

constant String str = fn("");

end ErrorMatchInOut3;

// Result:
// Error processing file: ErrorMatchInOut3.mo
// [ErrorMatchInOut3.mo:11:10-11:14:writable] Error: Only component references are valid as input of a match expression. Got "".
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
