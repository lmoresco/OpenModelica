within ThermoSysPro.WaterSolution.BoundaryConditions;
model RefP "Fixed pressure reference" 
  parameter ThermoSysPro.Units.AbsolutePressure P0=1.e5 "Fixed fluid pressure";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Ellipse(extent=[-40,40; 40,-40], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=44,
          rgbfillColor={255,170,170})),
      Line(points=[0,100; 0,40], style(color=3, rgbcolor={0,0,255})),
      Line(points=[20,60; 0,40; -20,60], style(color=3, rgbcolor={0,0,255})),
      Line(points=[-90,0; -40,0], style(color=3, rgbcolor={0,0,255})),
      Line(points=[40,0; 90,0], style(color=3, rgbcolor={0,0,255})),
      Text(
        extent=[-28,30; 28,-26],
        style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=53,
          rgbfillColor={128,255,0},
          fillPattern=1),
        string="P")),
    Icon(
      Ellipse(extent=[-40,40; 40,-40], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=44,
          rgbfillColor={255,170,170})),
      Line(points=[0,100; 0,40], style(color=3, rgbcolor={0,0,255})),
      Line(points=[20,60; 0,40; -20,60], style(color=3, rgbcolor={0,0,255})),
      Line(points=[-90,0; -40,0], style(color=3, rgbcolor={0,0,255})),
      Line(points=[40,0; 90,0], style(color=3, rgbcolor={0,0,255})),
      Text(
        extent=[-28,30; 28,-26],
        style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=53,
          rgbfillColor={128,255,0},
          fillPattern=1),
        string="P")),
    Window(
      x=0.06,
      y=0.08,
      width=0.82,
      height=0.65),
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
"), DymolaStoredErrors);
  Connectors.WaterSolutionInlet C1 
    annotation (extent=[-110, -10; -90, 10]);
  Connectors.WaterSolutionOutlet C2 
    annotation (extent=[90, -10; 110, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal IPressure 
    annotation (extent=[-10,100; 10,120],rotation=270);
  
equation 
  if (cardinality(IPressure) == 0) then
    IPressure.signal = P0;
  end if;
  
  C1.P = C2.P;
  C1.T = C2.T;
  C1.Q = C2.Q;
  C1.Xh2o = C2.Xh2o;
  
  C1.P = IPressure.signal;
  
end RefP;
