// name:     Faculty1
// keywords: algorithm,scoping
// status:   incorrect
// 
// Example for a recursive function. The function 'Faculty' must be 
// known during its definition in order to be called from itself.
//
// Only fully instantiated classes are known. Consequently recursive 
// function are not supported inside Modelica.
//

function Faculty1
  input Integer x;
  output Integer y;
algorithm
  y := if x > 0 then Faculty1(x-1) else 1;
end Faculty1;
