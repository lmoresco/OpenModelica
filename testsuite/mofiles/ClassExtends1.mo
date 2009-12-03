// name:     ClassExtends1
// keywords: class,extends
// status:   correct
// 
// 
class Y
  replaceable model X
    Integer x;
  end X;
end Y;

class ClassExtends1
 extends Y(X(x(start=5)));

 redeclare replaceable model extends X(x(start=4))
   parameter Integer y;
 end X;
 
 X component;
initial equation
 component.y = 5;
end ClassExtends1;

// Result:
// fclass ClassExtends1
// Integer component.x(start = 4);
// parameter Integer component.y;
// initial equation
//   component.y = 5;
// end ClassExtends1;
// endResult
