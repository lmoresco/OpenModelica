// name:     Circuit
// keywords: algorithm, equation
// status:   correct
//
// Drmodelica: 2.9 Conditional Expressions or Equations (p. 46)
//
package Modelica
  package SIunits
  type ElectricCurrent = Real (final quantity="ElectricCurrent", final unit="A");
  type Current = ElectricCurrent;
   type Voltage = ElectricPotential;
   type ElectricPotential = Real ( final quantity="ElectricPotential",
		final unit="V");
  end SIunits;
end Modelica;

connector Pin
  import Modelica.SIunits.Voltage;
  import Modelica.SIunits.Current;
  Voltage v;
  flow Current i;
end Pin;

partial class TwoPin "Superclass of elements with two electrical pins"
  import Modelica.SIunits.Voltage;
  import Modelica.SIunits.Current;
  Pin p;
  Pin n;
  Voltage v;
  Current i;
equation
  v = p.v - n.v;
  p.i + n.i = 0;
  i = p.i;
end TwoPin;

model Diode "Ideal diode"
  extends TwoPin;
  Real s;
  Boolean off;
equation
  off = s < 0;
  if off then
    v = s;
  else
    v = 0;
  end if;
  i = if off then 0 else s;
end Diode;

model Circuit
  import Modelica.Electrical.Analog.Basic.*;
  import Modelica.Electrical.Analog.Sources.*;
  Diode d;
  Resistor R1;
  Ground G;
  SineVoltage src;
equation
  connect(G.p, src.n);
  connect(src.p, R1.n);
  connect(R1.p, d.n);
  connect(d.p, src.p);
end Circuit;

