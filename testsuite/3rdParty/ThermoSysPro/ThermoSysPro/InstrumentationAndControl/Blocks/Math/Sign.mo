within ThermoSysPro.InstrumentationAndControl.Blocks.Math;
block Sign 
  
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
      Line(points=[-90, 0; 68, 0], style(color=8)),
      Polygon(points=[90, 0; 68, 8; 68, -8; 90, 0], style(color=8, fillColor=8)),
      Line(points=[-80, -80; 0, -80], style(color=0)),
      Polygon(points=[0, 90; -8, 68; 8, 68; 0, 90], style(color=8, fillColor=8)),
      Line(points=[0, -80; 0, 68], style(color=8)),
      Text(
        extent=[-90, 72; -18, 24],
        string="sign",
        style(color=8)),
      Line(points=[0, 80; 80, 80], style(color=0)),
      Rectangle(extent=[-2, 2; 2, -4], style(
          color=0,
          fillColor=0,
          fillPattern=1))),
    Diagram(
      Line(points=[-90, 0; 68, 0], style(color=8)),
      Polygon(points=[90, 0; 68, 8; 68, -8; 90, 0], style(color=8, fillColor=8)),
      Line(points=[-80, -80; 0, -80], style(color=0)),
      Line(points=[-0.01, 0; 0.01, 0], style(color=0)),
      Line(points=[0, 80; 80, 80], style(color=0)),
      Rectangle(extent=[-2, 2; 2, -4], style(
          color=0,
          fillColor=0,
          fillPattern=1)),
      Polygon(points=[0, 100; -6, 84; 6, 84; 0, 100], style(color=8, fillColor=
              8)),
      Line(points=[0, -90; 0, 84], style(color=8)),
      Text(
        extent=[5, 102; 30, 82],
        string="y",
        style(color=9)),
      Text(
        extent=[70, -6; 94, -26],
        string="u",
        style(color=9)),
      Text(extent=[-25, 86; -5, 70], string="1"),
      Text(extent=[5, -72; 25, -88], string="-1")),
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
  
  y.signal = sign(u.signal);
end Sign;
