within ThermoSysPro.InstrumentationAndControl.Blocks.Math;
block Sin 
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Line(points=[50, 0; 100, 0]),
      Line(points=[50, 0; 100, 0]),
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Line(points=[-80, -80; -80, 68], style(color=8)),
      Line(points=[-90, 0; 68, 0], style(color=8)),
      Line(points=[-80, 0; -68.7, 34.2; -61.5, 53.1; -55.1, 66.4; -49.4, 74.6;
            -43.8, 79.1; -38.2, 79.8; -32.6, 76.6; -26.9, 69.7; -21.3, 59.4; -14.9,
             44.1; -6.83, 21.2; 10.1, -30.8; 17.3, -50.2; 23.7, -64.2; 29.3, -73.1;
             35, -78.4; 40.6, -80; 46.2, -77.6; 51.9, -71.5; 57.5, -61.9; 63.9,
             -47.2; 72, -24.8; 80, 0], style(color=0)),
      Polygon(points=[90, 0; 68, 8; 68, -8; 90, 0], style(color=8, fillColor=8)),
      Text(
        extent=[12, 84; 84, 36],
        string="sin",
        style(color=8))),
    Diagram(
      Line(points=[-80, 80; -88, 80], style(color=8)),
      Line(points=[-80, -80; -88, -80], style(color=8)),
      Line(points=[-80, -90; -80, 84], style(color=8)),
      Text(
        extent=[-75, 98; -46, 78],
        string="y",
        style(color=9)),
      Polygon(points=[-80, 96; -86, 80; -74, 80; -80, 96], style(color=8,
            fillColor=8)),
      Line(points=[-100, 0; 84, 0], style(color=8)),
      Polygon(points=[100, 0; 84, 6; 84, -6; 100, 0], style(color=8, fillColor=
              8)),
      Line(points=[-80, 0; -68.7, 34.2; -61.5, 53.1; -55.1, 66.4; -49.4, 74.6;
            -43.8, 79.1; -38.2, 79.8; -32.6, 76.6; -26.9, 69.7; -21.3, 59.4; -14.9,
             44.1; -6.83, 21.2; 10.1, -30.8; 17.3, -50.2; 23.7, -64.2; 29.3, -73.1;
             35, -78.4; 40.6, -80; 46.2, -77.6; 51.9, -71.5; 57.5, -61.9; 63.9,
             -47.2; 72, -24.8; 80, 0], style(color=0)),
      Text(extent=[-105, 72; -85, 88], string="1"),
      Text(extent=[70, 25; 90, 5], string="2*pi"),
      Text(extent=[-105, -72; -85, -88], string="-1"),
      Text(
        extent=[76, -10; 98, -30],
        string="u",
        style(color=9))),
    Window(
      x=0.26,
      y=0.22,
      width=0.6,
      height=0.6),
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
  
  y.signal = Modelica.Math.sin(u.signal);
end Sin;
