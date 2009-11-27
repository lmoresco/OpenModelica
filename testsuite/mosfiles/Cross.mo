// name:     Cross
// keywords: equation, vector
// status:   correct
// 
// 

model Cross
  Real x[3] = {1,5,3};
  Real y1[3] = {2,10,6};
  Real y2[3] = {5,3,1};
  Real[3] z;
  Integer xi[3] = {1,5,3};
  Integer yi1[3] = {2,10,6};
  Integer yi2[3] = {5,3,1};
  Integer[3] zi;
equation
  z = cross(x,if time > 1.0 then y2 else y1);
  zi = if time > 1.0 then cross(xi,yi2) else cross(xi,yi1);
end Cross;
