// name:     modifyOuter
// keywords: modification inner outer innerouter
// status:   incorrect
// 
//  It is illegal to modify on pure "outer" elements.
//

connector Pin "Pin of an electrical component"
  flow Real i;
  Real v;
end Pin;

model last
 outer Pin ip(i=3);
 Real x;
 equation
  der(x) = ip.v;
end last;

model mid
 inner outer Pin ip(i=3);
 Real x;
 last la;
 Pin y;
equation
  x = der(x)+ip.v;
  connect(ip,y);
    y.v = 2.4;
end mid;

model inn 
 inner Pin ip;
 mid io;
 equation 
end inn;
// Error, modification on outer element: io.la.ip
// #|Execution failed!
// Execution failed!
