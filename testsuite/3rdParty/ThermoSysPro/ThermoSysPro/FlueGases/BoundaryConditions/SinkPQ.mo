within ThermoSysPro.FlueGases.BoundaryConditions;
model SinkPQ "Flue gas sink with fixed pressure and mass flow rate" 
  parameter ThermoSysPro.Units.AbsolutePressure P0=100000 "Sink pressure";
  parameter Modelica.SIunits.MassFlowRate Q0=100 "Sink mass flow rate";
  
public 
  ThermoSysPro.Units.AbsolutePressure P "Fluid pressure";
  Modelica.SIunits.MassFlowRate Q "Mass flow";
  ThermoSysPro.Units.AbsoluteTemperature T "Fluid temperature";
  Real Xco2 "CO2 mass fraction";
  Real Xh2o "H2O mass fraction";
  Real Xo2 "O2 mass fraction";
  Real Xso2 "SO2 mass fraction";
  Real Xn2 "N2 mass fraction";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Rectangle(extent=[-40, 40; 40, -40], style(
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=8)),
      Text(
        extent=[-40,40; 40,-40],
        style(fillColor=9, fillPattern=1),
        string="PQ"),
      Line(points=[-90, 0; -40, 0; -58, 10]),
      Line(points=[-40, 0; -58, -10]),
      Text(
        extent=[40,28; 64,6],
        style(color=3, rgbcolor={0,0,255}),
        string="P"),
      Text(
        extent=[-40,60; -6,40],
        style(color=3, rgbcolor={0,0,255}),
        string="Q")),
    Icon(
      Rectangle(extent=[-40, 40; 40, -40], style(
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=8)),
      Text(
        extent=[-40,40; 40,-40],
        style(fillColor=9, fillPattern=1),
        string="PQ"),
      Line(points=[-90, 0; -40, 0; -58, 10]),
      Line(points=[-40, 0; -58, -10]),
      Text(
        extent=[40,28; 64,6],
        style(color=3, rgbcolor={0,0,255}),
        string="P"),
      Text(
        extent=[-40,60; -6,40],
        style(color=3, rgbcolor={0,0,255}),
        string="Q")),
    Window(
      x=0.09,
      y=0.2,
      width=0.66,
      height=0.69),
    Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.0</b></p>
</HTML>
", revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Baligh El Hefni</li>
</ul>
</html>
"));
public 
  ThermoSysPro.FlueGases.Connectors.FlueGasesInlet C 
    annotation (extent=[-108, -10; -88, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal IPressure 
    annotation (extent=[60,-9; 40,9]);
public 
  InstrumentationAndControl.Connectors.InputReal IMassFlow 
    annotation (extent=[-10,40; 10,60],   rotation=-90);
equation 
  
  C.P = P;
  C.Q = Q;
  C.T = T;
  
  /* Flue gas composition */
  C.Xco2 = Xco2;
  C.Xh2o = Xh2o;
  C.Xo2 = Xo2;
  C.Xso2 = Xso2;
  
  Xn2 = 1 - Xco2 - Xh2o - Xo2 - Xso2;
  
  /* Pressure */
  if (cardinality(IPressure) == 0) then
    IPressure.signal = P0;
  end if;
  
  P = IPressure.signal;
  
  /* Mass flow rate */
  if (cardinality(IMassFlow) == 0) then
    IMassFlow.signal = Q0;
  end if;
  
  Q = IMassFlow.signal;
  
end SinkPQ;
