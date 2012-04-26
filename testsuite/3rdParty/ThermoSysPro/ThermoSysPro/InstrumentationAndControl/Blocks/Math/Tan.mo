within ThermoSysPro.InstrumentationAndControl.Blocks.Math;
block Tan 
  
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
      Line(points=[-80, -80; -78.4, -68.4; -76.8, -59.7; -74.4, -50; -71.2, -40.9;
             -67.1, -33; -60.7, -24.8; -51.1, -17.2; -35.8, -9.98; -4.42, -1.07;
             33.4, 9.12; 49.4, 16.2; 59.1, 23.2; 65.5, 30.6; 70.4, 39.1; 73.6,
            47.4; 76, 56.1; 77.6, 63.8; 80, 80], style(color=0)),
      Line(points=[-90, 0; 68, 0], style(color=8)),
      Polygon(points=[90, 0; 68, 8; 68, -8; 90, 0], style(color=8, fillColor=8)),
      Text(
        extent=[-90, 72; -18, 24],
        string="tan",
        style(color=8))),
    Diagram(
      Line(points=[0, 80; -8, 80], style(color=8)),
      Line(points=[0, -80; -8, -80], style(color=8)),
      Line(points=[0, -88; 0, 86], style(color=8)),
      Text(
        extent=[1, 104; 28, 84],
        string="y",
        style(color=9)),
      Polygon(points=[0, 102; -6, 86; 6, 86; 0, 102], style(color=8, fillColor=
              8)),
      Text(extent=[-37, -72; -17, -88], string="-5.8"),
      Text(extent=[-33, 86; -13, 70], string=" 5.8"),
      Text(extent=[70, 25; 90, 5], string="1.4"),
      Line(points=[-100, 0; 84, 0], style(color=8)),
      Polygon(points=[100, 0; 84, 6; 84, -6; 100, 0], style(color=8, fillColor=
              8)),
      Line(points=[-80, -80; -78.4, -68.4; -76.8, -59.7; -74.4, -50; -71.2, -40.9;
             -67.1, -33; -60.7, -24.8; -51.1, -17.2; -35.8, -9.98; -4.42, -1.07;
             33.4, 9.12; 49.4, 16.2; 59.1, 23.2; 65.5, 30.6; 70.4, 39.1; 73.6,
            47.4; 76, 56.1; 77.6, 63.8; 80, 80], style(color=0)),
      Text(
        extent=[70, -6; 94, -26],
        string="u",
        style(color=9))),
    Window(
      x=0.45,
      y=0.01,
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
  
  y.signal = Modelica.Math.tan(u.signal);
end Tan;
