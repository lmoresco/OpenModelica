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
  parameter Integer N = 2;
  C c[2], cx(x=1), cy(x=time);
equation
  connect(c[N],cx);
  connect(c[2],cy);
  c[1].x=time; // Extra equation required compared to Connect7 example.
end Connect8;

// fclass Connect8
// parameter Integer N = 2;
// Real c[1].x;
// Real c[2].x;
// Real cx.x;
// Real cy.x;
// equation
//   cx.x = 1.0;
//   cy.x = time;
//   c[1].x = time;
//   -c[2].x + -cx.x + -cy.x = 0.0;
// end Connect8;
