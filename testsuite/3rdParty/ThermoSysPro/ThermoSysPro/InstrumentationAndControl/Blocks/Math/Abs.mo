within ThermoSysPro.InstrumentationAndControl.Blocks.Math;
block Abs 
  
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
      Polygon(points=[92, 0; 70, 8; 70, -8; 92, 0], style(color=8, fillColor=8)),
      Line(points=[-80, 80; 0, 0; 80, 80], style(color=0)),
      Line(points=[0, -14; 0, 68], style(color=8)),
      Polygon(points=[0, 90; -8, 68; 8, 68; 0, 90], style(color=8, fillColor=8)),
      Text(
        extent=[-34, -28; 38, -76],
        string="abs",
        style(color=8)),
      Line(points=[-88, 0; 76, 0], style(color=8))),
    Diagram(
      Line(points=[-100, 0; 76, 0], style(color=8)),
      Polygon(points=[92, 0; 76, 6; 76, -6; 92, 0], style(color=8, fillColor=8)),
      Line(points=[-80, 80; 0, 0; 80, 80], style(color=0)),
      Line(points=[0, -80; 0, 68], style(color=8)),
      Polygon(points=[0, 90; -8, 68; 8, 68; 0, 90], style(color=8, fillColor=8)),
      Line(points=[0, -80; 0, 68], style(color=8)),
      Polygon(points=[0, 90; -8, 68; 8, 68; 0, 90], style(color=8, fillColor=8)),
      Text(
        extent=[3, 92; 30, 72],
        string="y",
        style(color=9)),
      Text(
        extent=[74, -8; 96, -28],
        string="u",
        style(color=9)),
      Text(extent=[52, -3; 72, -23], string="1"),
      Text(extent=[-86, -1; -66, -21], string="-1"),
      Text(extent=[-28, 79; -8, 59], string="1")),
    Window(
      x=0.1,
      y=0.3,
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
  
  y.signal = abs(u.signal);
end Abs;
