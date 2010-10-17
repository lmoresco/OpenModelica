// name: ErrorInvalidPattern
// cflags: +g=MetaModelica
// status: incorrect
package ErrorInvalidPattern

function fn
  input String str;
  output String outStr;
algorithm
  outStr := match str
    case (str+"") then str;
  end match;
end fn;

constant String str = fn("");

end ErrorInvalidPattern;
// Result:
// Error processing file: ErrorInvalidPattern.mo
// [ErrorInvalidPattern.mo:11:10-11:19:writable] Error: Invalid pattern: str + ""
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
