// name:     ForIterator2
// keywords: for iterator
// status:   correct
// 
// For iterator handling, testcase derived from MultiBody.World model.
// 

model Cylinder
  parameter Real length=0;
  parameter Real lengthDirection[3]={0,0,0};
end Cylinder;
model ForIterator2
    parameter Integer n=3;
  parameter Real r[3]={1,2,3};
  parameter Real lines[3,3,3]={[1,2,3;4,5,6;7,8,9],[1,2,3;4,5,6;7,8,9],[1,2,3;4,5,6;7,8,9]};
  Cylinder c[n](length={r[i] for i in 1:n},lengthDirection={vector(lines[i,1,:]-lines[i,2,:]) for i in 1:n});

end ForIterator2;

// empty store
// empty store
// empty store
// empty store
// empty store
// fclass ForIterator2
// parameter Integer n = 3;
// parameter Real r[1] = 1;
// parameter Real r[2] = 2;
// parameter Real r[3] = 3;
// parameter Real lines[1,1,1] = 1;
// parameter Real lines[1,1,2] = 2;
// parameter Real lines[1,1,3] = 3;
// parameter Real lines[1,2,1] = 4;
// parameter Real lines[1,2,2] = 5;
// parameter Real lines[1,2,3] = 6;
// parameter Real lines[1,3,1] = 7;
// parameter Real lines[1,3,2] = 8;
// parameter Real lines[1,3,3] = 9;
// parameter Real lines[2,1,1] = 1;
// parameter Real lines[2,1,2] = 2;
// parameter Real lines[2,1,3] = 3;
// parameter Real lines[2,2,1] = 4;
// parameter Real lines[2,2,2] = 5;
// parameter Real lines[2,2,3] = 6;
// parameter Real lines[2,3,1] = 7;
// parameter Real lines[2,3,2] = 8;
// parameter Real lines[2,3,3] = 9;
// parameter Real lines[3,1,1] = 1;
// parameter Real lines[3,1,2] = 2;
// parameter Real lines[3,1,3] = 3;
// parameter Real lines[3,2,1] = 4;
// parameter Real lines[3,2,2] = 5;
// parameter Real lines[3,2,3] = 6;
// parameter Real lines[3,3,1] = 7;
// parameter Real lines[3,3,2] = 8;
// parameter Real lines[3,3,3] = 9;
// parameter Real c[1].length = r[1];
// parameter Real c[1].lengthDirection[1] = lines[1,1,1] - lines[1,2,1];
// parameter Real c[1].lengthDirection[2] = lines[1,1,2] - lines[1,2,2];
// parameter Real c[1].lengthDirection[3] = lines[1,1,3] - lines[1,2,3];
// parameter Real c[2].length = r[1];
// parameter Real c[2].lengthDirection[1] = lines[1,1,1] - lines[1,2,1];
// parameter Real c[2].lengthDirection[2] = lines[1,1,2] - lines[1,2,2];
// parameter Real c[2].lengthDirection[3] = lines[1,1,3] - lines[1,2,3];
// parameter Real c[3].length = r[1];
// parameter Real c[3].lengthDirection[1] = lines[1,1,1] - lines[1,2,1];
// parameter Real c[3].lengthDirection[2] = lines[1,1,2] - lines[1,2,2];
// parameter Real c[3].lengthDirection[3] = lines[1,1,3] - lines[1,2,3];
// end ForIterator2;
