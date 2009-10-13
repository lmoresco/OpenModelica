// name:     Type8
// keywords: types
// status:   incorrect
// 
// This checks that Real and RealType are handled differently
// 

class Type8
  Real x;
equation
  x = x.start;
end Type8;
