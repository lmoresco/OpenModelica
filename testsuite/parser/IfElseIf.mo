// name: IfElseIf
// status: incorrect

model IfElseIf
equation
  if cond then
    abc();
  elseif cond then
    def();
  end if;
end IfElseIf;

// Result:
// Error processing file: IfElseIf.mo
// [IfElseIf.mo:11:1-11:13:writable] Error: Parse error: Expected 'end if'; did you use a nested 'else if' instead of 'elseif'?
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
