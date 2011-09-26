// name: ErrorInvalidPattern4
// cflags: +g=MetaModelica
// status: incorrect
package ErrorInvalidPattern4

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
    case UT() then "fail1";
    else "fail2";
  end match;
end fn;

constant String str = fn(UT(1));

end ErrorInvalidPattern4;

// Result:
// Error processing file: ErrorInvalidPattern4.mo
// [ErrorInvalidPattern4.mo:17:10-17:15:writable] Error: Invalid pattern: ErrorInvalidPattern4.Ut.UT missing pattern for fields: exp
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
