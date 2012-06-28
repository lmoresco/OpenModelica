// name: dim16.mo
// keywords:
// status: correct
//

model B
  C c;
end B;

model C
  D d(widthDirection = {0, 1, 0});
end C;

model D
  parameter Types.Axis widthDirection = {0, 1, 0};
end D;

package Types
  type Axis = Real[3];
end Types;

model A
  B b;
end A;

// Result:
// 
// EXPANDED FORM:
// 
// class A
//   parameter Real b.c.d.widthDirection[1] = 0;
//   parameter Real b.c.d.widthDirection[2] = 1;
//   parameter Real b.c.d.widthDirection[3] = 0;
// end A;
// 
// 
// Found 0 components and 3 parameters.
// class A
//   parameter Real b.c.d.widthDirection[1] = 0.0;
//   parameter Real b.c.d.widthDirection[2] = 1.0;
//   parameter Real b.c.d.widthDirection[3] = 0.0;
// end A;
// endResult
