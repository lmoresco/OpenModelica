// name: ErrorRecursionLimit
// status: incorrect

model ErrorRecursionLimit
  model M
    model N
      extends M;
    end N;
    N n;
  end M;

  M m;
end ErrorRecursionLimit;

// Result:
// Error processing file: ErrorRecursionLimit.mo
// [ErrorRecursionLimit.mo:6:5-8:10:writable] Error: The maximum recursion depth was reached, probably due to mutual recursion. The current scope: ErrorRecursionLimit.M.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.N.
// Error: Error occurred while flattening model ErrorRecursionLimit
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
