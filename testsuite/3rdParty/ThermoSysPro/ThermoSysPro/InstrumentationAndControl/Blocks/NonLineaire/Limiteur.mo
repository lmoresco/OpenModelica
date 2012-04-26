within ThermoSysPro.InstrumentationAndControl.Blocks.NonLineaire;
block Limiteur 
  parameter Real maxval=1 "Valeur maximale de la sortie";
  parameter Real minval=-1 "Valeur minimale de la sortie";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Rectangle(extent=[-100, -100; 100, 100], style(
          color=3,
          pattern=1,
          thickness=1,
          arrow=0,
          fillPattern=0)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Line(points=[78, 60; 40, 60; -40, -60; -80, -60], style(color=0)),
      Text(
        extent=[26, 90; 88, 68],
        string="%maxval",
        style(color=0)),
      Text(
        extent=[-88, -64; -26, -86],
        string="%minval",
        style(color=0)),
      Line(points=[-86, 0; 88, 0], style(color=8)),
      Polygon(points=[96, 0; 86, -5; 86, 5; 96, 0], style(color=8, fillColor=8)),
      Polygon(points=[0, 84; -5, 74; 5, 74; 0, 84], style(color=8, fillColor=8)),
      Line(points=[0, -80; 0, 74], style(color=8))),
    Diagram(
      Text(
        extent=[26, 90; 88, 68],
        string="maxval",
        style(color=9, fillColor=0)),
      Text(
        extent=[-88, -64; -26, -86],
        string="minval",
        style(color=9, fillColor=0)),
      Line(points=[-86, 0; 88, 0], style(color=8)),
      Polygon(points=[96, 0; 86, -5; 86, 5; 96, 0], style(color=8, fillColor=8)),
      Polygon(points=[0, 84; -5, 74; 5, 74; 0, 84], style(color=8, fillColor=8)),
      Line(points=[0, -80; 0, 74], style(color=8)),
      Line(points=[78, 60; 40, 60; -40, -60; -80, -60], style(color=0))),
    Window(
      x=0.27,
      y=0.23,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.NonLinear library</b></p>
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
  
  assert(maxval > minval,
    "Limiteur : Le paramètre maxval doit être supérieur au paramètre minval");
  
  y.signal = if u.signal > maxval then maxval else if u.signal < minval then 
    minval else u.signal;
end Limiteur;
