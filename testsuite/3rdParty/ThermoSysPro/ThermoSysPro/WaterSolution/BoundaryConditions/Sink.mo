within ThermoSysPro.WaterSolution.BoundaryConditions;
model Sink 
  
public 
  ThermoSysPro.Units.AbsolutePressure P "Sink pressure";
  Modelica.SIunits.MassFlowRate Q "Mass flow rate";
  ThermoSysPro.Units.AbsoluteTemperature T "Sink Temperature";
  Real Xh2o "h2o mas fraction";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Rectangle(extent=[-40, 40; 40, -40], style(fillColor=9)),
      Polygon(points=[-40,40; -40,-40; 40,-40; -40,40], style(
          pattern=0,
          thickness=4,
          fillColor=44,
          rgbfillColor={255,170,170})),
      Line(points=[-90, 0; -40, 0; -58, 10]),
      Line(points=[-40, 0; -58, -10])),
    Icon(
      Rectangle(extent=[-40, 40; 40, -40], style(fillColor=9)),
      Line(points=[-90, 0; -40, 0; -58, 10]),
      Line(points=[-40, 0; -58, -10]),
      Polygon(points=[-40,40; -40,-40; 40,-40; -40,40], style(
          pattern=0,
          thickness=4,
          fillColor=44,
          rgbfillColor={255,170,170}))),
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
    Benoît Bride</li>
<li>
    Daniel Bouskela</li>
</html>
"));
  ThermoSysPro.WaterSolution.Connectors.WaterSolutionInlet Ce 
    annotation (extent=[-110,-10; -90,10]);
equation 
  
  Ce.Xh2o = Xh2o;
  Ce.T = T;
  Ce.Q = Q;
  Ce.P = P;
  
end Sink;
