within ThermoSysPro.InstrumentationAndControl.Blocks.NonLineaire;
block BandeMorte 
  parameter Real uMax=1 "Limite supérieure de la bande morte";
  parameter Real uMin=-uMax "Limite inférieure de la bande morte";
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
      Line(points=[0, -90; 0, 68], style(color=8)),
      Polygon(points=[0, 90; -8, 68; 8, 68; 0, 90], style(color=8, fillColor=8)),
      Line(points=[-90, 0; 68, 0], style(color=8)),
      Polygon(points=[90, 0; 68, -8; 68, 8; 90, 0], style(color=8, fillColor=8)),
      Line(points=[-80, -60; -20, 0; 20, 0; 80, 60], style(color=0))),
    Diagram(
      Line(points=[0, -60; 0, 50], style(color=8)),
      Polygon(points=[0, 60; -5, 50; 5, 50; 0, 60], style(color=8, fillColor=8)),
      Line(points=[-76, 0; 74, 0], style(color=8)),
      Polygon(points=[84, 0; 74, -5; 74, 5; 84, 0], style(color=8, fillColor=8)),
      Line(points=[-81, -40; -38, 0; 40, 0; 80, 40], style(color=0)),
      Text(
        extent=[62, -5; 88, -23],
        string="u",
        style(color=10)),
      Text(
        extent=[-34, 68; -3, 46],
        string="y",
        style(color=10)),
      Text(
        extent=[-51, 1; -28, 19],
        string="uMin",
        style(color=10)),
      Text(
        extent=[27, 21; 52, 5],
        string="uMax",
        style(color=10))),
    Window(
      x=0.05,
      y=0.3,
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
  
  y.signal = if (u.signal) > uMax then u.signal - uMax else if (u.signal < uMin) then 
          u.signal - uMin else 0;
end BandeMorte;
