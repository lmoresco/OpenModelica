// name:     Connect8
// keywords: connect
// status:   correct
// 
// If parameters are involved in connections, the parameters have to
// be known to generate the equations.
// 

connector C
  flow Real x;
end C;

class Connect8
  parameter Integer N = 3;
  C c[3], cx, cy;
equation
  connect(c[N],cx);
  connect(c[3],cy);
end Connect8;

// fclass Connect8
//   parameter Integer N;
//   Real c[1].x;
//   Real c[2].x;
//   Real c[3].x;
//   Real cx.x;
//   Real cy.x;
// equation
//   N = 3;
//   (-c[3].x) + (-cx.x) + (-cy.x) = 0.0;
// end Connect8;
