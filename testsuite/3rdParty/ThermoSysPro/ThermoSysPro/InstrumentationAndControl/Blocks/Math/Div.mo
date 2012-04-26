within ThermoSysPro.InstrumentationAndControl.Blocks.Math;
block Div 
  
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
      Line(points=[80, 0; 100, 0]),
      Line(points=[80, 0; 100, 0]),
      Ellipse(extent=[-80, 80; 80, -80]),
      Line(points=[80, 0; 100, 0]),
      Line(points=[-100, 60; -52, 60]),
      Line(points=[-100, -60; -52, -60]),
      Text(
        extent=[-36, 34; 40, -34],
        string="/",
        style(color=0))),
    Diagram(
      Line(points=[50, 0; 100, 0]),
      Line(points=[50, 0; 100, 0]),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Line(points=[80, 0; 100, 0]),
      Line(points=[80, 0; 100, 0]),
      Ellipse(extent=[-80, 80; 80, -80]),
      Line(points=[80, 0; 100, 0]),
      Line(points=[-100, 60; -52, 60]),
      Line(points=[-100, -60; -52, -60]),
      Text(
        extent=[-36, 34; 40, -34],
        string="/",
        style(color=0))),
    Window(
      x=0.31,
      y=0.18,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.Math library</b></p>
</HTML>
<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u1 
                                       annotation (extent=[-120, 50; -100, 70]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u2 
                                       annotation (extent=[-120, -70; -100, -50]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
equation 
  
  y.signal = u1.signal/u2.signal;
end Div;
