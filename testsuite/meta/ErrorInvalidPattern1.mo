// name: ErrorInvalidPattern1
// cflags: +g=MetaModelica
// status: incorrect

package ErrorInvalidPattern1

function fn
  input String str;
  output String outStr;
algorithm
  outStr := match str
    case (str+"") then str;
  end match;
end fn;

constant String str = fn("");

end ErrorInvalidPattern1;

// Result:
// Error processing file: ErrorInvalidPattern1.mo
// [ErrorInvalidPattern1.mo:12:10-12:19:writable] Error: Invalid pattern: str + "" of type String
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
