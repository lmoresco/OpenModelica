within ThermoSysPro.WaterSolution.BoundaryConditions;
model SinkP "Pressure sink" 
  parameter ThermoSysPro.Units.AbsolutePressure P0=300000 "Source pressure";
  parameter ThermoSysPro.Units.AbsoluteTemperature T0=290 "Source temperature";
  parameter Real Xh2o0=0.05 "Source water mass fraction";
  
public 
  ThermoSysPro.Units.AbsolutePressure P "Fluid pressure";
  Modelica.SIunits.MassFlowRate Q "Mass flow";
  ThermoSysPro.Units.AbsoluteTemperature T "Fluid temperature";
  ThermoSysPro.Units.SpecificEnthalpy Xh2o "Water mass fraction";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Line(points=[-90, 0; -40, 0; -58, 10]),
      Line(points=[-40, 0; -58, -10]),
      Text(extent=[40, 28; 58, 8], string="P"),
      Text(extent=[-28, 60; -10, 40], string="T"),
      Text(extent=[-28, -40; -10, -60], string="Xh2o"),
      Rectangle(extent=[-40,40; 40,-40],   style(fillColor=9)),
      Polygon(points=[-40,40; -40,-40; 40,-40; -40,40], style(
          pattern=0,
          thickness=4,
          fillColor=44,
          rgbfillColor={255,170,170})),
      Text(extent=[-94,26; 98,-30],   string="P")),
    Window(
      x=0.06,
      y=0.16,
      width=0.67,
      height=0.71),
    Icon(
      Line(points=[-90, 0; -40, 0; -58, 10]),
      Line(points=[-40, 0; -58, -10]),
      Text(extent=[-28, 60; -10, 40], string="T"),
      Text(extent=[40, 28; 58, 8], string="P"),
      Text(extent=[-28, -40; -10, -60], string="Xh2o"),
      Rectangle(extent=[-40,40; 40,-40],   style(fillColor=9)),
      Polygon(points=[-40,40; -40,-40; 40,-40; -40,40], style(
          pattern=0,
          thickness=4,
          fillColor=44,
          rgbfillColor={255,170,170})),
      Text(extent=[-94,26; 98,-30],   string="P")),
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
    Benoît Bride</li>
<li>
    Daniel Bouskela</li>
</html>
"));
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal IPressure 
    annotation (extent=[40, -10; 60, 10], rotation=-180);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal ITemperature 
    annotation (extent=[-10, 40; 10, 60], rotation=-90);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal IXh2o 
    annotation (extent=[-10, -40; 10, -60], rotation=-90);
  Connectors.WaterSolutionInlet C 
                                annotation (extent=[-110, -10; -90, 10]);
equation 
  
  C.P = P;
  C.Q = Q;
  C.T = T;
  C.Xh2o = Xh2o;
  
  if (cardinality(IPressure) == 0) then
    IPressure.signal = P0;
  end if;
  
  P = IPressure.signal;
  
  if (cardinality(ITemperature) == 0) then
    ITemperature.signal = T0;
  end if;
  
  T = ITemperature.signal;
  
  if (cardinality(IXh2o) == 0) then
    IXh2o.signal = Xh2o0;
  end if;
  
  Xh2o = IXh2o.signal;
  
end SinkP;
