// name:     ArrayModification4
// keywords: array,modification
// status:   correct
// origstatus:   correct,incomplete model
// 

class ArrayModification4
  class A
    Real x[3];
  end A;
  A a(x[1] = 1.0, x.unit = "V");
end ArrayModification4;

// fclass ArrayModification4
//   Real a.x[1];
//   Real a.x[2];
//   Real a.x[3];
// equation
//   a.x[1] = 1.0;
//   a.x[1].unit = "V";
//   a.x[2].unit = "V";
//   a.x[3].unit = "V";
// end ArrayModification4;
