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
  output Real p3;
  input  Real p1, p2;
algorithm
  p3 := p1*p2;
end fc; 

model ConstructParameters
  parameter Real p1=2.0, p2=3.0;
protected
  parameter Real p3 = fc(p1,p2);
end ConstructParameters;
