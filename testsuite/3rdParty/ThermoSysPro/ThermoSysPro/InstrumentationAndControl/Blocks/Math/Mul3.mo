within ThermoSysPro.InstrumentationAndControl.Blocks.Math;
block Mul3 
  
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
      Line(points=[80, 0; 100, 0]),
      Ellipse(extent=[-80, 80; 80, -80]),
      Line(points=[80, 0; 100, 0]),
      Line(points=[-98, 80; 0, 80]),
      Line(points=[-98, -80; 0, -80]),
      Text(
        extent=[-38, 20; 38, -48],
        string="*",
        style(color=0)),
      Line(points=[-100, 0; -80, 0])),
    Diagram(
      Line(points=[80, 0; 100, 0]),
      Line(points=[80, 0; 100, 0]),
      Line(points=[80, 0; 100, 0]),
      Ellipse(extent=[-80, 80; 80, -80]),
      Line(points=[80, 0; 100, 0]),
      Line(points=[-98, 80; 0, 80]),
      Line(points=[-98, -80; 0, -80]),
      Text(
        extent=[-38, 20; 38, -48],
        string="*",
        style(color=0)),
      Line(points=[-100, 0; -80, 0])),
    Window(
      x=0.26,
      y=0.2,
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
                                       annotation (extent=[-120, 70; -100, 90]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u2 
                                       annotation (extent=[-120, -10; -100, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u3 
                                       annotation (extent=[-120, -90; -100, -70]);
equation 
  
  y.signal = u1.signal*u2.signal*u3.signal;
end Mul3;
