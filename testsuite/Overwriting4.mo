// Two arguments of a modifier shall not designate the same element.
//
// classification: modification&equation-incorrect

class E
  Real x[3,3] = zeros(3,3);
end E;

class Overwriting4 = E(x=identity(3), x[1]=2); // Error: x[1] defined twice
