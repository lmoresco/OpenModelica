// name: ErrorLocalElement
// cflags: +g=MetaModelica
// status: correct

class ErrorLocalElement
  function fn
    input Integer i;
    output Integer o;
  algorithm
    o := match i
      local
        type t = Integer;
        T t;
      case t then t;
    end match;
  end fn;

  constant Integer i = fn(1);
end ErrorLocalElement;

// Result:
// Error processing file: ErrorLocalElement.mo
// [ErrorLocalElement.mo:12:9-12:25:writable] Error: Only components are allowed in local declarations, got: type t = Integer;
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
