// name:     ReinitInvalidType
// keywords: reinit
// status:   correct
// 
// Tests that the compiler checks that the first argument to reinit is a Real.
// 

class ReinitInvalidType
  Boolean b;
equation
  when initial() then
    reinit(b, true);
  end when;
end ReinitInvalidType;

// Result:
// Error processing file: ReinitInvalidType.mo
// [ReinitInvalidType.mo:12:5-12:20:writable] Error: The first argument to reinit must be a subtype of Real in reinit of b.
// Error: Error occurred while flattening model ReinitInvalidType
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
