within ThermoSysPro.InstrumentationAndControl.Blocks.Math;
block Acos 
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Rectangle(extent=[-100, 100; 100, -100]),
      Polygon(points=[0, 90; -8, 68; 8, 68; 0, 90], style(color=8, fillColor=8)),
      Line(points=[-80, 80; -79.2, 72.8; -77.6, 67.5; -73.6, 59.4; -66.3, 49.8;
             -53.5, 37.3; -30.2, 19.7; 37.4, -24.8; 57.5, -40.8; 68.7, -52.7;
            75.2, -62.2; 77.6, -67.5; 80, -80], style(color=0)),
      Line(points=[0, -88; 0, 68], style(color=8)),
      Line(points=[-90, -80; 68, -80], style(color=8)),
      Polygon(points=[90, -80; 68, -72; 68, -88; 90, -80], style(color=8,
            fillColor=8)),
      Text(
        extent=[-86, -14; -14, -62],
        string="acos",
        style(color=8))),
    Diagram(
      Line(points=[0, 80; -8, 80], style(color=8)),
      Line(points=[0, -80; -8, -80], style(color=8)),
      Line(points=[0, -90; 0, 84], style(color=8)),
      Text(
        extent=[3, 98; 32, 80],
        string="y",
        style(color=9)),
      Polygon(points=[0, 100; -6, 84; 6, 84; 0, 100], style(color=8, fillColor=
              8)),
      Line(points=[-100, -80; 84, -80], style(color=8)),
      Polygon(points=[100, -80; 84, -74; 84, -86; 100, -80], style(color=8,
            fillColor=8)),
      Line(points=[-80, 80; -79.2, 72.8; -77.6, 67.5; -73.6, 59.4; -66.3, 49.8;
             -53.5, 37.3; -30.2, 19.7; 37.4, -24.8; 57.5, -40.8; 68.7, -52.7;
            75.2, -62.2; 77.6, -67.5; 80, -80], style(color=0)),
      Text(extent=[-30, 88; -5, 72], string=" pi"),
      Text(extent=[-94, -57; -74, -77], string="-1"),
      Text(extent=[80, -45; 100, -65], string="+1"),
      Text(
        extent=[76, -84; 102, -102],
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
  
  y.signal = Modelica.Math.acos(u.signal);
end Acos;
