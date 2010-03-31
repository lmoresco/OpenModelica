// name:     ConstructParameters1
// keywords: declaration,algorithm
// status:   correct
// 
// This is not legal Modelica, see ConstructParameters2
// for an example of how to do it.
//
// This syntax has been discussed to generate
// several parameters from one function call.
//
// N.B! Panic mode handles this by simply skipping the bad construct.
//      There is no error output, but there should be.

function fc
  output Real p3, p4;
  input  Real p1, p2;
algorithm
  p3 := p1*p2;
  p4 := p3*p1 + p2;
end fc; 

model ConstructParameters1
  parameter Real p1=2.0, p2=3.0;
protected
  parameter Real (p3,p4) = fc(p1,p2);
end ConstructParameters1;

// function fc
// output Real p3;
// output Real p4;
// input Real p1;
// input Real p2;
// algorithm
//   p3 := p1 * p2;
//   p4 := p3 * p1 + p2;
// end fc;
// 
// Result:
// fclass ConstructParameters1
// parameter Real p1 = 2.0;
// parameter Real p2 = 3.0;
// end ConstructParameters1;
// endResult
