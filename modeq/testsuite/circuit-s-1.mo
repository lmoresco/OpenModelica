
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
end Capacitor;

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

model circuit 
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
end circuit;
