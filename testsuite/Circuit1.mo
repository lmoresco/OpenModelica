// name:     Circuit1
// keywords: 
// status:   correct
// 
// This is the example from the report.  It is here to have a somewhat
// larger test.
//

type Voltage = Real(unit="V");
type Current = Real(unit="A");


connector Pin 
  Voltage      v;
  flow Current i;
end Pin;

partial model TwoPin "Superclass of elements with two electrical pins" 
  Pin p, n;
  Voltage v;
  Current i;
equation
  v = p.v - n.v;
  0 = p.i + n.i; 
  i = p.i;
end TwoPin;

model Resistor "Ideal electrical resistor" 
  extends TwoPin;
  parameter Real R(unit="Ohm") "Resistance";
equation 
  R*i = v;
end Resistor;

model Capacitor "Ideal electrical capacitor" 
  extends TwoPin;
  parameter Real C(unit="F") "Capacitance";
equation 
  C*der(v) = i;
end Capacitor;

model Inductor "Ideal electrical inductor" 
  extends TwoPin;
  parameter Real L(unit="H") "Inductance";
equation 
  L*der(i) = v;
end Inductor;

model VsourceAC "Sin-wave voltage source" 
  extends TwoPin;
  parameter Voltage VA = 220 "Amplitude";
  parameter Real f(unit="Hz") = 50  "Frequency";
  constant  Real PI=3.141592653589793;  
equation 
  v = VA*sin(2*PI*f*time);
end VsourceAC;

model Ground "Ground" 
  Pin p;
equation 
  p.v = 0;
end Ground;

model Circuit1
  Resistor  R1(R=10);
  Capacitor C(C=0.01);
  Resistor  R2(R=100);
  Inductor  L(L=0.1);
  VsourceAC AC;
  Ground    G;
  
equation
  connect (AC.p, R1.p);		// Capacitor circuit
  connect (R1.n, C.p);
  connect (C.n, AC.n);
  connect (R1.p, R2.p);		// Inductor circuit
  connect (R2.n, L.p);
  connect (L.n,  C.n);
  connect (AC.n, G.p);		// Ground
end Circuit1;

// fclass Circuit1
// 	       Real    R1.p.v;
// 	       Real    R1.p.i;
// 	       Real    R1.n.v;
// 	       Real    R1.n.i;
// 	       Real    R1.v;
// 	       Real    R1.i;
//   parameter Real    R1.R;
// 	       Real    C.p.v;
// 	       Real    C.p.i;
// 	       Real    C.n.v;
// 	       Real    C.n.i;
// 	       Real    C.v;
// 	       Real    C.i;
//   parameter Real    C.C;
// 	       Real    R2.p.v;
// 	       Real    R2.p.i;
// 	       Real    R2.n.v;
// 	       Real    R2.n.i;
// 	       Real    R2.v;
// 	       Real    R2.i;
//   parameter Real    R2.R;
// 	       Real    L.p.v;
// 	       Real    L.p.i;
// 	       Real    L.n.v;
// 	       Real    L.n.i;
// 	       Real    L.v;
// 	       Real    L.i;
//   parameter Real    L.L;
// 	       Real    AC.p.v;
// 	       Real    AC.p.i;
// 	       Real    AC.n.v;
// 	       Real    AC.n.i;
// 	       Real    AC.v;
// 	       Real    AC.i;
//   parameter Real    AC.VA;
//   parameter Real    AC.f;
//   constant  Real    AC.PI;
// 	       Real    G.p.v;
// 	       Real    G.p.i;
// equation
//   R1.p.v.unit = "V";
//   R1.p.i.unit = "A";
//   R1.n.v.unit = "V";
//   R1.n.i.unit = "A";
//   R1.v.unit = "V";
//   R1.i.unit = "A";
//   R1.v = R1.p.v - R1.n.v;
//   Real(0) = R1.p.i + R1.n.i;
//   R1.i = R1.p.i;
//   R1.R.unit = "Ohm";
//   R1.R = Real(10);
//   R1.R * R1.i = R1.v;
//   C.p.v.unit = "V";
//   C.p.i.unit = "A";
//   C.n.v.unit = "V";
//   C.n.i.unit = "A";
//   C.v.unit = "V";
//   C.i.unit = "A";
//   C.v = C.p.v - C.n.v;
//   Real(0) = C.p.i + C.n.i;
//   C.i = C.p.i;
//   C.C.unit = "F";
//   C.C = 0.01;
//   C.C * der(C.v) = C.i;
//   R2.p.v.unit = "V";
//   R2.p.i.unit = "A";
//   R2.n.v.unit = "V";
//   R2.n.i.unit = "A";
//   R2.v.unit = "V";
//   R2.i.unit = "A";
//   R2.v = R2.p.v - R2.n.v;
//   Real(0) = R2.p.i + R2.n.i;
//   R2.i = R2.p.i;
//   R2.R.unit = "Ohm";
//   R2.R = Real(100);
//   R2.R * R2.i = R2.v;
//   L.p.v.unit = "V";
//   L.p.i.unit = "A";
//   L.n.v.unit = "V";
//   L.n.i.unit = "A";
//   L.v.unit = "V";
//   L.i.unit = "A";
//   L.v = L.p.v - L.n.v;
//   Real(0) = L.p.i + L.n.i;
//   L.i = L.p.i;
//   L.L.unit = "H";
//   L.L = 0.1;
//   L.L * der(L.i) = L.v;
//   AC.p.v.unit = "V";
//   AC.p.i.unit = "A";
//   AC.n.v.unit = "V";
//   AC.n.i.unit = "A";
//   AC.v.unit = "V";
//   AC.i.unit = "A";
//   AC.v = AC.p.v - AC.n.v;
//   Real(0) = AC.p.i + AC.n.i;
//   AC.i = AC.p.i;
//   AC.VA.unit = "V";
//   AC.VA = Real(220);
//   AC.f.unit = "Hz";
//   AC.f = Real(50);
//   AC.PI.unit = "";
//   AC.PI = 3.14159265358979;
//   AC.v = AC.VA * sin(Real(2) * AC.PI * AC.f * time);
//   G.p.v.unit = "V";
//   G.p.i.unit = "A";
//   G.p.v = Real(0);
//   L.n.i + C.n.i + AC.n.i + G.p.i = 0.0;
//   L.n.v = C.n.v;
//   C.n.v = AC.n.v;
//   AC.n.v = G.p.v;
//   R2.n.i + L.p.i = 0.0;
//   R2.n.v = L.p.v;
//   AC.p.i + R1.p.i + R2.p.i = 0.0;
//   AC.p.v = R1.p.v;
//   R1.p.v = R2.p.v;
//   R1.n.i + C.p.i = 0.0;
//   R1.n.v = C.p.v;
// end Circuit1;
