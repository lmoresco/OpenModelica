//|name:     Faculty1
//|keywords: algorithm,scoping
//|status:   correct
// 
// Example for a recursive function. The function 'Faculty' must be 
// known during its definition in order to be called from itself.
// <Ruediger: Or should recursive functions not be supported in 
//  Modelica as recursive models are impossible in general?>
//

function Faculty1
  input Integer x;
  output Integer y;
algorithm
  y := if x > 0 then Faculty1(x-1) else 1;
end Faculty1;

// fclass Faculty1
//   Integer x;
//   Integer y;
// algorithm
//   y := if x > 0 then Faculty1(x-1) else 1;
// end Faculty1;

