within ThermoSysPro.InstrumentationAndControl.Blocks.Math;
block Log10 
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Rectangle(extent=[-100, 100; 100, -100]),
      Line(points=[-80, -80; -80, 68], style(color=8)),
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Line(points=[-80, -80; -79.2, -50.6; -78.4, -37; -77.6, -28; -76.8, -21.3;
             -75.2, -11.4; -72.8, -1.31; -69.5, 8.08; -64.7, 17.9; -57.5, 28; -47,
             38.1; -31.8, 48.1; -10.1, 58; 22.1, 68; 68.7, 78.1; 80, 80], style(
            color=0)),
      Line(points=[-90, 0; 68, 0], style(color=8)),
      Polygon(points=[90, 0; 68, 8; 68, -8; 90, 0], style(color=8, fillColor=8)),
      Text(
        extent=[-6, -24; 66, -72],
        string="log10",
        style(color=8))),
    Diagram(
      Line(points=[-80, 80; -88, 80], style(color=8)),
      Line(points=[-80, -80; -88, -80], style(color=8)),
      Line(points=[-80, -90; -80, 84], style(color=8)),
      Text(
        extent=[-79, 98; -52, 80],
        string="y",
        style(color=9)),
      Polygon(points=[-80, 100; -86, 84; -74, 84; -80, 100], style(color=8,
            fillColor=8)),
      Line(points=[-100, 0; 84, 0], style(color=8)),
      Polygon(points=[100, 0; 84, 6; 84, -6; 100, 0], style(color=8, fillColor=
              8)),
      Line(points=[-80, -80; -79.2, -50.6; -78.4, -37; -77.6, -28; -76.8, -21.3;
             -75.2, -11.4; -72.8, -1.31; -69.5, 8.08; -64.7, 17.9; -57.5, 28; -47,
             38.1; -31.8, 48.1; -10.1, 58; 22.1, 68; 68.7, 78.1; 80, 80], style(
            color=0)),
      Text(extent=[-105, 72; -85, 88], string="1.3"),
      Text(extent=[-109, -88; -89, -72], string="-1.3"),
      Text(extent=[70, -3; 90, -23], string="20"),
      Text(extent=[-78, -1; -58, -21], string="1"),
      Text(
        extent=[68, 28; 94, 8],
        string="u",
        style(color=9))),
    Window(
      x=0.36,
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
  
  y.signal = Modelica.Math.log10(u.signal);
end Log10;
