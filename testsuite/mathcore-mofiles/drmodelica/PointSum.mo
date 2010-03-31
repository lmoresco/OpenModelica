// name:     PointSum
// keywords: array
// status:   incorrect

class PointSum	
  extends PointInst(p2[5, :] = p1[2, :] + p1[4, :]);
  Real r[3] = p1[2, :];		// Equivalent to r[3] = p1[2]
//equation	
  //p2[5] = p1[2] + p2[4];	// Equivalent to p2[5, :] = p1[2, :] + p2[4, :]
end PointSum;// Result:
// Error processing file: PointSum.mo
// Error: Base class PointInst not found in scope PointSum
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
