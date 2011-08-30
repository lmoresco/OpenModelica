// name: FlowDeclRecord2
// keywords: flow, record
// status: correct
//
// Checks that the flow prefix is propagated when used on structured components.
//

record R
  Real x;
  Real y;
end R;

connector C
  flow R r;
end C;

model FlowDeclRecord2
  C c1, c2;
equation
  connect(c1, c2);
end FlowDeclRecord2;

// Result:
// class FlowDeclRecord2
//   Real c1.r.x;
//   Real c1.r.y;
//   Real c2.r.x;
//   Real c2.r.y;
// equation
//   c1.r.x = 0.0;
//   c1.r.y = 0.0;
//   c2.r.x = 0.0;
//   c2.r.y = 0.0;
//   (-c1.r.x) + (-c2.r.x) = 0.0;
//   (-c1.r.y) + (-c2.r.y) = 0.0;
// end FlowDeclRecord2;
// endResult
