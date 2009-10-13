// name: DiscreteDeclConnector
// keywords: discrete
// status: correct
//
// Tests the discrete prefix on a connector type
//

connector DiscreteConnector
  Real r;
end DiscreteConnector;

class DiscreteDeclConnector
  discrete DiscreteConnector dc;
equation
  dc.r = 1.0;
end DiscreteDeclConnector;

// fclass DiscreteDeclConnector
// discrete Real dc.r;
// equation
//   dc.r = 1.0;
// end DiscreteDeclConnector;
