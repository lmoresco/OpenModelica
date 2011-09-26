// name:     Lookup8
// keywords: scoping
// status:   incorrect
// 
// A component is not allowed to have the same name as its type specifier.
// 


model Cytosol
  Real V = 1;
end Cytosol;

model Test
  Real Cytosol_V=Cytosol.V;
  Cytosol Cytosol;
end Test;

// Result:
// Error processing file: Lookup8.mo
// [Lookup8.mo:15:3-15:18:writable] Error: Found a component with same name when looking for type Cytosol
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
