// name:     LogCall1
// keywords: external function, equation
// status:   correct
//
// Drmodelica: 
// 

function log "Natural logarithm"
  input Real x;
  output Real y;
  external "C";
end log;

model LogCall1
  Real res;
equation
  res = log(100);
end LogCall1;


// fclass LogCall1
// Real res;
// equation
//   res = 4.60517018598809;
// end LogCall1;
