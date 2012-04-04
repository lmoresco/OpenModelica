// name: ListReductionDimError
// cflags: +g=MetaModelica
// status: incorrect

class ListReductionDimError
  Real r[3];
equation
  r = {i for i guard i>0 in {-3,time,3}};
end ListReductionDimError;
// Result:
// Error processing file: ListReductionDimError.mo
// Error: Array equation has unknown size in {r[1],r[2],r[3]}=<reduction>array(i for i guard i > 0.0 in {-3.0,time,3.0})
// [ListReductionDimError.mo:8:3-8:41:writable] Error: Type mismatch in equation {r[1],r[2],r[3]}=<reduction>array(i for i guard i > 0.0 in {-3.0,time,3.0}) of type Real[3]=Real[:]
// Error: Error occurred while flattening model ListReductionDimError
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
