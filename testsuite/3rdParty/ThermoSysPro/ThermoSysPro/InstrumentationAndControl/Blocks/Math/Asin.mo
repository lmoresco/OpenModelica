within ThermoSysPro.InstrumentationAndControl.Blocks.Math;
block Asin 
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Rectangle(extent=[-100, 100; 100, -100]),
      Polygon(points=[0, 90; -8, 68; 8, 68; 0, 90], style(color=8, fillColor=8)),
      Line(points=[0, -80; 0, 68], style(color=8)),
      Line(points=[-80, -80; -79.2, -72.8; -77.6, -67.5; -73.6, -59.4; -66.3, -49.8;
             -53.5, -37.3; -30.2, -19.7; 37.4, 24.8; 57.5, 40.8; 68.7, 52.7;
            75.2, 62.2; 77.6, 67.5; 80, 80], style(color=0)),
      Line(points=[-90, 0; 68, 0], style(color=8)),
      Polygon(points=[90, 0; 68, 8; 68, -8; 90, 0], style(color=8, fillColor=8)),
      Text(
        extent=[-88, 78; -16, 30],
        string="asin",
        style(color=8))),
    Diagram(
      Line(points=[0, 80; -8, 80], style(color=8)),
      Line(points=[0, -80; -8, -80], style(color=8)),
      Line(points=[0, -90; 0, 84], style(color=8)),
      Text(
        extent=[5, 100; 32, 80],
        string="y",
        style(color=9)),
      Polygon(points=[0, 100; -6, 84; 6, 84; 0, 100], style(color=8, fillColor=
              8)),
      Text(extent=[-40, -72; -15, -88], string="-pi/2"),
      Text(extent=[-38, 88; -13, 72], string=" pi/2"),
      Text(extent=[70, 25; 90, 5], string="+1"),
      Text(extent=[-90, 21; -70, 1], string="-1"),
      Line(points=[-100, 0; 84, 0], style(color=8)),
      Polygon(points=[100, 0; 84, 6; 84, -6; 100, 0], style(color=8, fillColor=
              8)),
      Line(points=[-80, -80; -79.2, -72.8; -77.6, -67.5; -73.6, -59.4; -66.3, -49.8;
             -53.5, -37.3; -30.2, -19.7; 37.4, 24.8; 57.5, 40.8; 68.7, 52.7;
            75.2, 62.2; 77.6, 67.5; 80, 80], style(color=0)),
      Text(
        extent=[74, -4; 100, -26],
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
  
  y.signal = Modelica.Math.asin(u.signal);
end Asin;
