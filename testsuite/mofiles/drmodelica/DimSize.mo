// name:     DimSize 
// keywords: array
// status:   incorrect
// 
// Expected flat file unkown
// Not yet implemented

class DimSize 
  Real[4, 1, 6] x = fill(1., 4, 1, 6);
  Real dim = ndims(x);           // Returns 3
  Real dimsize = size(x, 1);     // Returns 4
  Real specsize[3] = size(x);    // Returns the vector {4, 1, 6}
equation 
  //size(2*x + x) = size(x);                // This equation holds
end DimSize;