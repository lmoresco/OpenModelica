within ThermoSysPro.InstrumentationAndControl.Blocks.Math;
block Atan 
  
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
      Line(points=[-80, -80; -52.7, -75.2; -37.4, -69.7; -26.9, -63; -19.7, -55.2;
             -14.1, -45.8; -10.1, -36.4; -6.03, -23.9; -1.21, -5.06; 5.23, 21;
            9.25, 34.1; 13.3, 44.2; 18.1, 52.9; 24.5, 60.8; 33.4, 67.6; 47,
            73.6; 69.5, 78.6; 80, 80], style(color=0)),
      Line(points=[-90, 0; 68, 0], style(color=8)),
      Polygon(points=[90, 0; 68, 8; 68, -8; 90, 0], style(color=8, fillColor=8)),
      Text(
        extent=[-86, 68; -14, 20],
        string="atan",
        style(color=8))),
    Diagram(
      Line(points=[0, 80; -8, 80], style(color=8)),
      Line(points=[0, -80; -8, -80], style(color=8)),
      Line(points=[0, -90; 0, 84], style(color=8)),
      Text(
        extent=[13, 102; 42, 82],
        string="outPort",
        style(color=9)),
      Polygon(points=[0, 100; -6, 84; 6, 84; 0, 100], style(color=8, fillColor=
              8)),
      Line(points=[-100, 0; 84, 0], style(color=8)),
      Polygon(points=[100, 0; 84, 6; 84, -6; 100, 0], style(color=8, fillColor=
              8)),
      Line(points=[-80, -80; -52.7, -75.2; -37.4, -69.7; -26.9, -63; -19.7, -55.2;
             -14.1, -45.8; -10.1, -36.4; -6.03, -23.9; -1.21, -5.06; 5.23, 21;
            9.25, 34.1; 13.3, 44.2; 18.1, 52.9; 24.5, 60.8; 33.4, 67.6; 47,
            73.6; 69.5, 78.6; 80, 80], style(color=0)),
      Text(extent=[-32, 91; -12, 71], string="1.4"),
      Text(extent=[-32, -71; -12, -91], string="-1.4"),
      Text(extent=[73, 26; 93, 10], string=" 5.8"),
      Text(extent=[-103, 20; -83, 4], string="-5.8"),
      Text(
        extent=[66, -8; 94, -28],
        string="inPort",
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
  
  y.signal = Modelica.Math.atan(u.signal);
end Atan;
