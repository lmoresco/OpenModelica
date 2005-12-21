// name:     TempDepResistorCircuitInherited
// keywords: <insert keywords here>
// status:   correct
// 
// 
// The flattened model should be the same for test TempDepResistorCircuit and
// TempDepResistorCircuitInherited


type ElectricPotential = Real (final quantity="ElectricPotential", final unit ="V");
type Voltage = ElectricPotential;
type ElectricCurrent = Real (final quantity="ElectricCurrent", 
     final unit="A");
type Current = ElectricCurrent;

// From Modelica.Electrical.Analog.Interfaces
connector Pin
  Voltage v;
  flow Current i;
end Pin; 

model Resistor "Electrical resistor"
  Pin p, n "positive and negative pins";
  Voltage v;
  Current i;
    parameter Real R(unit="Ohm") "Resistance";
  equation
    v = i*R;
end Resistor;

model ResistorCircuit // Circuit of three Resistors connected at one node
  Resistor R1(R = 100);
  Resistor R2(R = 200);
  Resistor R3(R = 300);
equation
  connect(R1.p, R2.p);
  connect(R1.p, R3.p);
end ResistorCircuit;

model GenericResistorCircuit // The ResistorCircuit made generic
  replaceable Resistor R1(R = 100); // Formal class parameter
  replaceable Resistor R2(R = 200); // Formal class parameter
  replaceable Resistor R3(R = 300); // Formal class parameter
equation
  connect(R1.p, R2.p);
  connect(R1.p, R3.p);
end GenericResistorCircuit;

model TempResistor
  extends Resistor;
  Real Temp;
  Real RT;
end TempResistor;

model TempDepResistorCircuitInherited
  Real Temp;
  TempResistor R1(R=100, RT=0.1, Temp=Temp);
  TempResistor R2(R=200);
  replaceable Resistor R3(R=300);
equation
  connect(R1.p, R2.p);
  connect(R1.p, R3.p);
end TempDepResistorCircuitInherited;

// fclass TempDepResistorCircuitInherited
// Real Temp;
// Real R1.p.v;
// Real R1.p.i;
// Real R1.n.v;
// Real R1.n.i;
// Real R1.v;
// Real R1.i;
// parameter Real R1.R = 100 "Resistance";
// Real R1.Temp;
// Real R1.RT;
// Real R2.p.v;
// Real R2.p.i;
// Real R2.n.v;
// Real R2.n.i;
// Real R2.v;
// Real R2.i;
// parameter Real R2.R = 200 "Resistance";
// Real R2.Temp;
// Real R2.RT;
// Real R3.p.v;
// Real R3.p.i;
// Real R3.n.v;
// Real R3.n.i;
// Real R3.v;
// Real R3.i;
// parameter Real R3.R = 300 "Resistance";
// equation
//   R1.Temp = Temp;
//   R1.RT = 0.1;
//   R1.v = R1.i * R1.R;
//   R2.v = R2.i * R2.R;
//   R3.v = R3.i * R3.R;
//   R1.p.i + R2.p.i + R3.p.i = 0.0;
//   R1.p.v = R2.p.v;
//   R2.p.v = R3.p.v;
//   R1.n.i = 0.0;
//   R2.n.i = 0.0;
//   R3.n.i = 0.0;
// end TempDepResistorCircuitInherited;
