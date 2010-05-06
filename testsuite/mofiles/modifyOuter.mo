// name:     modifyOuter
// keywords: modification inner outer innerouter
// status:   correct
// 
//  It is illegal to modify on pure "outer" elements.
//  we only issue a warning now and ignore the modification.
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

// Result:
// fclass inn
// Real ip.i;
// Real ip.v;
// Real io.ip.i = 3.0;
// Real io.ip.v;
// Real io.x;
// Real io.la.x;
// Real io.y.i;
// Real io.y.v;
// equation
//   der(io.la.x) = io.ip.v;
//   io.x = der(io.x) + ip.v;
//   io.y.v = 2.4;
// ip.v = io.y.v;
//   (-ip.i) + io.y.i = 0.0;
//   ip.i = 0.0;
// end inn;
// [modifyOuter.mo:24:2-24:9:readonly] Warning: Variable io.la: Ignoring the modification on outer element: io.la.ip (i = 3), class or component i
// 
// endResult
