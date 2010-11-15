// name: ErrorLocalElement1
// cflags: +g=MetaModelica
// status: incorrect

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
// Error processing file: ErrorLocalElement1.mo
// [ErrorLocalElement1.mo:10:5-15:14:writable] Error: Only components without direction are allowed in local declarations, got: class t
// CLASS(t,_,_,TYPE,DERIVED(Integer,))
// end t;
// 
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
