// name:     Cardinality
// keywords: cardinality
// status:   correct
// 
// Testing the cardinality operator
// 

connector Pin 
  Real v;
  flow Real i;
end Pin;

model Resistor
  Pin p;
  Pin n;
  Pin q;
  //Real x,x2;
  Real y[n_conn];
  constant Integer n_conn = cardinality(p);
equation
  connect(p,q);
  //if  cardinality(p) == 1 then x = 2; else x=3; end if;
  //if cardinality(p) == 2 then x2 = 2; else x2=3; end if;
end Resistor;

model circuit
  Pin p;
  Resistor R1,R2;

equation 

    connect(R1.p,p); // R1.n_conn = cardinality(R1.p) = 2;
end circuit;

// fclass circuit
// Real p.v;
// Real p.i;
// Real R1.p.v;
// Real R1.p.i;
// Real R1.n.v;
// Real R1.n.i;
// Real R1.q.v;
// Real R1.q.i;
// Real R1.y[1];
// Real R1.y[2];
// constant Integer R1.n_conn = 2;
// Real R2.p.v;
// Real R2.p.i;
// Real R2.n.v;
// Real R2.n.i;
// Real R2.q.v;
// Real R2.q.i;
// Real R2.y[1];
// constant Integer R2.n_conn = 1;
// equation
//  -R1.p.i + -R1.q.i = 0.0;
//   R1.p.v = R1.q.v;
//   -R2.p.i + -R2.q.i = 0.0;
//   R2.p.v = R2.q.v;
//   R1.p.i + -p.i = 0.0;
//   R1.p.v = p.v;
//   R1.q.i = 0.0;
//   R1.n.i = 0.0;
//   R2.q.i = 0.0;
//   R2.n.i = 0.0;
//   R2.p.i = 0.0;
// end circuit;
