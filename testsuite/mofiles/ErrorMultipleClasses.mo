// name: ErrorMultipleClasses
// status: incorrect

class A
end A;

class A
end A;

class sin
end sin;
// Result:
// Error processing file: ErrorMultipleClasses.mo
// Error: Duplicate classes on top level is not allowed (got A).
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
