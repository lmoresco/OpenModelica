// name: ListReductionDimError
// cflags: +g=MetaModelica
// status: correct

class ListReductionDimError
  Real r[3];
equation
  r = {i for i guard i>0 in {-3,time,3}};
end ListReductionDimError;
