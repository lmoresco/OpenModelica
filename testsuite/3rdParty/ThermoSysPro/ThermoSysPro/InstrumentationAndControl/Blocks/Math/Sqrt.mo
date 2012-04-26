within ThermoSysPro.InstrumentationAndControl.Blocks.Math;
block Sqrt 
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Line(points=[50, 0; 100, 0]),
      Line(points=[50, 0; 100, 0]),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Line(points=[-90, -80; 68, -80], style(color=8)),
      Polygon(points=[90, -80; 68, -72; 68, -88; 90, -80], style(color=8,
            fillColor=8)),
      Line(points=[-80, -80; -79.2, -68.7; -78.4, -64; -76.8, -57.3; -73.6, -47.9;
             -67.9, -36.1; -59.1, -22.2; -46.2, -6.49; -28.5, 10.7; -4.42, 30;
            27.7, 51.3; 69.5, 74.7; 80, 80], style(color=0)),
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Line(points=[-80, -88; -80, 68], style(color=8)),
      Text(
        extent=[-8, -4; 64, -52],
        string="sqrt",
        style(color=8))),
    Diagram(
      Line(points=[-92, -80; 84, -80], style(color=8)),
      Polygon(points=[100, -80; 84, -74; 84, -86; 100, -80], style(color=8,
            fillColor=8)),
      Line(points=[-80, -80; -79.2, -68.7; -78.4, -64; -76.8, -57.3; -73.6, -47.9;
             -67.9, -36.1; -59.1, -22.2; -46.2, -6.49; -28.5, 10.7; -4.42, 30;
            27.7, 51.3; 69.5, 74.7; 80, 80], style(color=0)),
      Polygon(points=[-80, 98; -86, 82; -74, 82; -80, 98], style(color=8,
            fillColor=8)),
      Line(points=[-80, -90; -80, 84], style(color=8)),
      Text(
        extent=[-79, 100; -52, 80],
        string="y",
        style(color=9)),
      Text(
        extent=[60, -52; 84, -72],
        string="u",
        style(color=9))),
    Window(
      x=0.1,
      y=0.23,
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
  
  y.signal = sqrt(u.signal);
end Sqrt;
