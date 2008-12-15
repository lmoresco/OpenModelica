// name:     BlockMatrix3
// keywords: array
// status:   incorrect

class BlockMatrix3
  Real[3, 3]	P = [ 1, 2, 3; 
  				4, 5, 6; 
  				7, 8, 9];				
  Real[6, 6]	Q;									
equation
  Q[1:3, 1:3] = P;	// OK!
  Q[1:3, 4:6] = [Q[1:3, 1:2], -Q[1:3, 3]];	// OK, correct promotion
  Q[4:6, 1:3] = [Q[1:2, 1:3], -Q[3, 1:3]];	// ERROR!
  Q[4:6, 4:6] = P;	// OK!
end BlockMatrix3;

