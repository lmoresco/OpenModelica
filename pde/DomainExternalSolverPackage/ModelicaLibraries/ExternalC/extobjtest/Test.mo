



model Test 
  import TestPackage.*;
  MeshData data = MeshData({{0,0},{1,0},{1,1},{0,1}}, {1, 1, 1, 1}, 0.5);
  Real x[3];
equation 
  x = getVertex(data, 0);
end Test;
