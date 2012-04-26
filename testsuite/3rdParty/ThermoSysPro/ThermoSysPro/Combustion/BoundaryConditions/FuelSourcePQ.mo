within ThermoSysPro.Combustion.BoundaryConditions;
model FuelSourcePQ "Fuel source with fixed pressure and mass flow rate" 
  parameter ThermoSysPro.Units.AbsolutePressure P0=1e5 
    "Fuel pressure (active if pressure input port is not connected)";
  parameter Modelica.SIunits.MassFlowRate Q0=10 
    "Fuel mass flow rate (active if mass flow input port is not connected)";
  parameter ThermoSysPro.Units.AbsoluteTemperature T0=300 "Fuel temperature";
  parameter Modelica.SIunits.SpecificEnergy LHV=48e6 "Lower heating value";
  parameter Modelica.SIunits.SpecificHeatCapacity Cp=1e3 
    "Fuel specific heat capacity at 273.15K";
  parameter Real Hum=0.0 "Fuel humidity (%)";
  parameter Real Xc=0.75 "C mass fraction";
  parameter Real Xh=0.25 "H mass fraction";
  parameter Real Xo=0 "O mass fraction";
  parameter Real Xn=0 "N mass fraction";
  parameter Real Xs=0 "S mass fraction";
  parameter Real Xashes=0 "Ashes mass fraction";
  parameter Real Vol=0 "Volatile matter mass fraction";
  parameter Modelica.SIunits.Density rho=0.72 "Fuel density";
  
  Connectors.FuelOutlet C                   annotation (extent=[90,-10; 110,10],
      style(fillPattern=10));
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal IMassFlow 
    annotation (extent=[-10,40; 10,60],   rotation=-90);
  InstrumentationAndControl.Connectors.InputReal IPressure 
    annotation (extent=[-60,-10; -40,10]);
equation 
  
 /* Fuel composition */
 C.hum = Hum;
 C.Xc = Xc;
 C.Xh = Xh;
 C.Xo = Xo;
 C.Xn = Xn;
 C.Xs = Xs;
 C.Xashes = Xashes;
 C.VolM = Vol;
  
 /* Mass flow rate */
  if (cardinality(IMassFlow) == 0) then
    IMassFlow.signal = Q0;
  end if;
  
  C.Q = IMassFlow.signal;
  
 /* Temperature */
  C.T = T0;
  
 /* Pressure */
  if (cardinality(IPressure) == 0) then
    IPressure.signal = P0;
  end if;
  
  C.P = IPressure.signal;
  
 /* LHV */
  C.LHV = LHV;
  
 /* Specific heat capacity */
  C.cp = Cp;
  
 /* Density */
  C.rho = rho;
  
  annotation (Diagram(
      Line(points=[40,0; 90,0; 72,10]),
      Line(points=[90,0; 72,-10]),
      Rectangle(extent=[-40,40; 40,-40], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=10)),
      Text(extent=[-30,60; -12,40],   string="Q"),
      Text(
        extent=[-64,26; -40,6],
        style(color=3, rgbcolor={0,0,255}),
        string="P")), Icon(
      Text(
        extent=[-38,60; -4,40],
        style(color=3, rgbcolor={0,0,255}),
        string="Q"),
      Rectangle(extent=[-40,40; 40,-40], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=10)),
      Line(points=[40,0; 90,0; 72,10]),
      Line(points=[90,0; 72,-10]),
      Text(
        extent=[-64,26; -40,6],
        style(color=3, rgbcolor={0,0,255}),
        string="P")),
    Documentation(revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Baligh El Hefni</li>
</ul>
</html>
", info="<html>
<p><h4>Copyright &copy; EDF 2002 - 2012</h4></p>
<p><b>ThermoSysPro Version 3.0</b> </p>
</html>"));
end FuelSourcePQ;
