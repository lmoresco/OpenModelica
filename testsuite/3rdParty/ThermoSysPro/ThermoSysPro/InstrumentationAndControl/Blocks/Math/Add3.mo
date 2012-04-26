within ThermoSysPro.InstrumentationAndControl.Blocks.Math;
block Add3 
  parameter Real k1=+1;
  parameter Real k2=+1;
  parameter Real k3=+1;
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
      Line(points=[-100, 80; 0, 80]),
      Line(points=[-100, -80; 0, -80]),
      Text(
        extent=[-36, 34; 40, -34],
        string="+",
        style(color=0)),
      Line(points=[-100, 0; -80, 0]),
      Text(
        extent=[-100, 106; -60, 76],
        string="%k1",
        style(color=0)),
      Text(
        extent=[-102, 28; -62, -2],
        string="%k2",
        style(color=0)),
      Text(
        extent=[-100, -52; -60, -82],
        string="%k3",
        style(color=0))),
    Diagram(
      Line(points=[80, 0; 100, 0]),
      Line(points=[80, 0; 100, 0]),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Ellipse(extent=[-80, 80; 80, -80]),
      Line(points=[80, 0; 100, 0]),
      Line(points=[-100, 80; 0, 80]),
      Line(points=[-100, -80; 0, -80]),
      Text(
        extent=[-36, 34; 40, -34],
        string="+",
        style(color=0)),
      Line(points=[-100, 0; -80, 0]),
      Text(
        extent=[-100, 106; -60, 76],
        string="k1",
        style(color=0)),
      Text(
        extent=[-102, 28; -62, -2],
        string="k2",
        style(color=0)),
      Text(
        extent=[-100, -52; -60, -82],
        string="k3",
        style(color=0))),
    Window(
      x=0.25,
      y=0.16,
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
  
  y.signal = k1*u1.signal + k2*u2.signal + k3*u3.signal;
end Add3;
