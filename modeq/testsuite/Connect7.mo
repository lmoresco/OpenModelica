// name:     Connect7
// keywords: connect
// status:   correct
// 
// If parameters are involved in connections, the parameters have to
// be known to generate the equations.  If the parameter N would have
// been set to 3 instead, only one big connection set would have been
// generated.
// 

connector C
  flow Real x;
end C;

class Connect7
  parameter Integer N = 2;
  C c[3], cx, cy;
equation
  connect(c[N],cx);
  connect(c[3],cy);
end Connect7;

// fclass Connect7
//   parameter Integer N;
//   Real c[1].x;
//   Real c[2].x;
//   Real c[3].x;
//   Real cx.x;
//   Real cy.x;
// equation
//   N = 2;
//   (-c[2].x) + (-cx.x) = 0.0;
//   (-c[3].x) + (-cy.x) = 0.0;
// end Connect7;
