// name:     Type7
// keywords: types
// status:   incorrect
// 
// This checks that Real and RealType are handled differently
// 

class Type7
  Real x;
equation
  x.start = x.start.start;
end Type7;
