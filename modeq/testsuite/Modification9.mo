// name:     Modification9
// keywords: modification,equation,array
// status:   incorrect
// 
// Two arguments of a modifier shall not designate the same element.
//

class E
  Real x[3,3] = zeros(3,3);
end E;

class Modification9 = E(x=eye(3), x[1]=2); // Error: x[1] defined twice
