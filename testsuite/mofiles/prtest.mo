// name:     prtest
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
end Type10;

// Result:
// class Type10
//            String  ok[1].unit;
//            Real    ok[1];
//            String  ok[2].unit;
//            Real    ok[2];
//            String  ok[3].unit;
//            Real    ok[3];
// equation
//  ok[1].unit = "";
//  ok[2].unit = "";
//  ok[3].unit = "";
//  ok[1] = 3.0;
// end Type10;
// endResult
