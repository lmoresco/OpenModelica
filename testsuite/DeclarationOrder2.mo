// name:     DeclarationOrder2
// keywords: declaration order
// status:   correct
// 
// A model or component is available in its entire scope,
// even before before it is declared.

package A
  model B 
    extends C;
  end B;
  model C
    Real y(start=x);
    parameter Real x=pi;
  equation
    der(y)=x;
  end C;
  model D
//    C c[size(c2,1)]; // causes ininite loop
    C c2[n];
    parameter Integer n=1;
  end D;
  constant Real pi=3.14;
end A;

model DeclarationOrder2
  A.D D;
end DeclarationOrder2;

// fclass DeclarationOrder2
//  parameter Integer D.n = 1;
//  parameter Real D.c2[1].x(start = 3.14);
//  parameter Real D.c[1].x = 3.14;
//  Real D.c2[1].y(start = D.c2[1].x);
//  Real D.c[1].y(start = D.c[1].x);
//equation
//  der(D.c2[1].y) = D.c2[1].x;
//  der(D.c[1].y) = D.c[1].x;
// end DeclarationOrder2




   
