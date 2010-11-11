// name: ErrorInvalidPattern1
// cflags: +g=MetaModelica
// status: incorrect
package ErrorInvalidPattern3

uniontype Ut
  record UT
    Integer exp;
  end UT;
end Ut;

function fn
  input Ut ut;
  output String str;
algorithm
  str := match ut
    case UT(exp = 1, exp = 2, exp = 3) then "fail1";
    else "fail2";
  end match;
end fn;

constant String str = fn(UT(1));

end ErrorInvalidPattern3;

// Result:
// Error processing file: ErrorInvalidPattern3.mo
// [ErrorInvalidPattern3.mo:17:10-17:40:writable] Error: Invalid named fields: exp,exp
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
