within ThermoSysPro.InstrumentationAndControl.Blocks.Math;
block Exp 
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Rectangle(extent=[-100, 100; 100, -100]),
      Line(points=[0, -80; 0, 68], style(color=8)),
      Polygon(points=[0, 90; -8, 68; 8, 68; 0, 90], style(color=8, fillColor=8)),
      Text(
        extent=[-86, 50; -14, 2],
        string="exp",
        style(color=8)),
      Line(points=[-80, -80; -31, -77.9; -6.03, -74; 10.9, -68.4; 23.7, -61;
            34.2, -51.6; 43, -40.3; 50.3, -27.8; 56.7, -13.5; 62.3, 2.23; 67.1,
             18.6; 72, 38.2; 76, 57.6; 80, 80], style(color=0)),
      Line(points=[-90, -80.3976; 68, -80.3976], style(color=8)),
      Polygon(points=[90, -80.3976; 68, -72.3976; 68, -88.3976; 90, -80.3976],
          style(color=8, fillColor=8))),
    Diagram(
      Line(points=[0, 80; -8, 80], style(color=8)),
      Line(points=[0, -80; -8, -80], style(color=8)),
      Line(points=[0, -90; 0, 84], style(color=8)),
      Text(
        extent=[3, 100; 34, 80],
        string="y",
        style(color=9)),
      Polygon(points=[0, 100; -6, 84; 6, 84; 0, 100], style(color=8, fillColor=
              8)),
      Line(points=[-100, -80.3976; 84, -80.3976], style(color=8)),
      Polygon(points=[100, -80.3976; 84, -74.3976; 84, -86.3976; 100, -80.3976],
           style(color=8, fillColor=8)),
      Line(points=[-80, -80; -31, -77.9; -6.03, -74; 10.9, -68.4; 23.7, -61;
            34.2, -51.6; 43, -40.3; 50.3, -27.8; 56.7, -13.5; 62.3, 2.23; 67.1,
             18.6; 72, 38.2; 76, 57.6; 80, 80], style(color=0)),
      Text(extent=[-31, 72; -11, 88], string="20"),
      Text(extent=[-92, -83; -72, -103], string="-3"),
      Text(extent=[70, -83; 90, -103], string="3"),
      Text(extent=[-18, -53; 2, -73], string="1"),
      Text(
        extent=[66, -52; 96, -72],
        string="u",
        style(color=9))),
    Window(
      x=0.03,
      y=0.35,
      width=0.35,
      height=0.49),
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.Math library</b></p>
</HTML>
<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u 
                                      annotation (extent=[-120, -10; -100, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
equation 
  
  y.signal = Modelica.Math.exp(u.signal);
end Exp;
