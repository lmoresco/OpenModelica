// name:     ConstructParameters
// keywords: declaration,algorithm,unknown
// status:   incorrect
// 
// A set of parameters can be computed from a set of other parameters 
// by using a function call.
//
// david: whereever did you come up with this syntax? It is wrong
//

function fc
  output Real p3, p4;
  input  Real p1, p2;
algorithm
  p3 := p1*p2;
  p4 := p3*p1 + p2;
end fc; 

model ConstructParameters
  parameter Real p1=2.0, p2=3.0;
protected
  parameter Real (p3,p4) = fc(p1,p2);
end ConstructParameters;

// fclass ConstructParameters
//   parameter Real p1;
//   parameter Real p2;
// protected
//   parameter Real p3;
//   parameter Real p4;
//   Real fc~1.p3;
//   Real fc~1.p4;
//   Real fc~1.p1;
//   Real fc~1.p2;
// equation
//   p1 = Real(2);
//   p2 = Real(3);
//   fc~1.p1 = p1;
//   fc~1.p2 = p2;
//   p3 = fc~1.p3;
//   p4 = fc~1.p4;
// algorithm
//   fc~1.p3 := fc~1.p1*fc~1.p2;
//   fc~1.p4 := fc~1.p3*fc~1.p1 + fc~1.p2;
// end ConstructParameters;
