// name:     modelica_1_1_Type10
// keywords: types
// status:   incorrect
// 
// Checks that subscripts are handled in a correct manner int the component clause.
// 
// 

class Type10
  Real[3] x[2];
  Real y[3,3];
  Real ok[3];
equation
  x = y;
  ok[1]=3.0;
end Type10
