within ThermoSysPro.InstrumentationAndControl.Blocks.Math;
block Gain 
  parameter Real Gain=1 "Gain";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Polygon(points=[-100, 100; 100, 0; -100, -100; -100, 100], style(
            fillPattern=0)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Text(
        extent=[-54, 20; -6, -16],
        string="%Gain",
        style(color=0))),
    Diagram(Polygon(points=[-100, 100; 100, 0; -100, -100; -100, 100], style(
            fillPattern=0)), Text(
        extent=[-54, 20; -6, -16],
        string="Gain",
        style(color=0))),
    Window(
      x=0.24,
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
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u 
                                      annotation (extent=[-120, -10; -100, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
equation 
  
  y.signal = Gain*u.signal;
end Gain;
