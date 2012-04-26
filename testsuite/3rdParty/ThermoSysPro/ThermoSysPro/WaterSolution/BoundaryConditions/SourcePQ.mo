within ThermoSysPro.WaterSolution.BoundaryConditions;
model SourcePQ "Pressure and mass flow source" 
  
  parameter ThermoSysPro.Units.AbsolutePressure P=1.e5 "Source presure";
  parameter Modelica.SIunits.MassFlowRate Q=10 "Mass flow rate";
  parameter ThermoSysPro.Units.AbsoluteTemperature T=300 "Source temperature";
  parameter Real Xh2o=0.05 "h2o mass fraction";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Rectangle(extent=[-40, 40; 40, -40], style(fillColor=9)),
      Line(points=[40, 0; 90, 0; 72, 10]),
      Line(points=[90, 0; 72, -10]),
      Polygon(points=[-40,-40; -40,40; 40,-40; -40,-40], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=44,
          rgbfillColor={255,170,170}))),
    Icon(
      Rectangle(extent=[-40, 40; 40, -40], style(fillColor=9)),
      Line(points=[40, 0; 90, 0; 72, 10]),
      Line(points=[90, 0; 72, -10]),
      Polygon(points=[-40,-40; -40,40; 40,-40; -40,-40], style(
          color=3,
          rgbcolor={0,0,255},
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
  ThermoSysPro.WaterSolution.Connectors.WaterSolutionOutlet Cs 
    annotation (extent=[90,-10; 110,10]);
equation 
  
  Cs.Xh2o = Xh2o;
  Cs.T = T;
  Cs.Q = Q;
  Cs.P = P;
  
end SourcePQ;
