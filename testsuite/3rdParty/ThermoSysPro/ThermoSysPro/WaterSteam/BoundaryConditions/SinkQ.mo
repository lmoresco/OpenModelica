within ThermoSysPro.WaterSteam.BoundaryConditions;
model SinkQ "Water/steam sink with fixed mass flow rate" 
  parameter Modelica.SIunits.MassFlowRate Q0=100 
    "Mass flow (active if IMassFlow connector is not connected)";
  parameter ThermoSysPro.Units.SpecificEnthalpy h0=100000 
    "Fluid specific enthalpy (active if IEnthalpy connector is not connected)";
  
protected 
  ThermoSysPro.Units.AbsolutePressure P "Fluid pressure";
  Modelica.SIunits.MassFlowRate Q "Mass flow rate";
  ThermoSysPro.Units.SpecificEnthalpy h "Fluid specific enthalpy";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Line(points=[-90,0; -40,0; -54,10]),
      Line(points=[-54, -10; -40, 0]),
      Text(extent=[12,60; 32,40],   string="Q"),
      Text(extent=[10,-40; 30,-60], string="h"),
      Rectangle(extent=[-40, 40; 40, -40], style(fillColor=6, rgbfillColor={255,
              255,0})),
      Text(
        extent=[-20,20; 22,-24],
        style(color=3, rgbcolor={0,0,255}),
        string="Q")),
    Icon(
      Rectangle(extent=[-40, 40; 40, -40], style(fillColor=6, rgbfillColor={255,
              255,0})),
      Text(extent=[12,60; 32,40],   string="Q"),
      Text(extent=[10,-40; 30,-60], string="h"),
      Line(points=[-90,0; -40,0; -54,10]),
      Line(points=[-54, -10; -40, 0]),
      Text(
        extent=[-20,22; 22,-24],
        style(color=3, rgbcolor={0,0,255}),
        string="Q")),
    Window(
      x=0.23,
      y=0.15,
      width=0.81,
      height=0.71),
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
<li>
    Daniel Bouskela</li>
</ul>
</html>
"));
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal IMassFlow 
    annotation (extent=[-10, 40; 10, 60], rotation=-90);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal ISpecificEnthalpy 
    annotation (extent=[-10, -40; 10, -60], rotation=-90);
  Connectors.FluidInlet C 
    annotation (extent=[-110,-10; -90,10]);
equation 
  
  C.P = P;
  C.Q = Q;
  C.h_vol = h;
  
  /* Mass flow */
  if (cardinality(IMassFlow) == 0) then
    IMassFlow.signal = Q0;
  end if;
  
  Q = IMassFlow.signal;
  
  /* Specific enthalpy */
  if (cardinality(ISpecificEnthalpy) == 0) then
    ISpecificEnthalpy.signal = h0;
  end if;
  
  h = ISpecificEnthalpy.signal;
  
end SinkQ;
