// name: Log10
// keywords: log10
// status: correct
//
// Tests the built-in log10 function
//

model Log10
  Real r;
equation
  r = log10(45);
end Log10;

// Result:
// fclass Log10
// Real r;
// equation
//   r = 1.65321251377534;
// end Log10;
// endResult
