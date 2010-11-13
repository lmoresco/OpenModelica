// name: ErrorLocalElement
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
// Error processing file: ErrorLocalElement.mo
// [ErrorLocalElement.mo:10:5-15:14:writable] Error: Only components are allowed in local declarations, got: CLASSDEF(t,CLASS(t,_,_,TYPE,DERIVED(Integer,))
// )
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
