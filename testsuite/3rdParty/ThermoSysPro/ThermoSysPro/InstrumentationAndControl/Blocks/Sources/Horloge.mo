within ThermoSysPro.InstrumentationAndControl.Blocks.Sources;
block Horloge 
  parameter Real offset=0 "Décalage de la sortie";
  parameter Real startTime=0 "Instant de départ de l'horloge";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Ellipse(extent=[-80, 80; 80, -80], style(color=9)),
      Line(points=[0, 80; 0, 60], style(color=9)),
      Line(points=[80, 0; 60, 0], style(color=9)),
      Line(points=[0, -80; 0, -60], style(color=9)),
      Line(points=[-80, 0; -60, 0], style(color=9)),
      Line(points=[37, 70; 26, 50], style(color=9)),
      Line(points=[70, 38; 49, 26], style(color=9)),
      Line(points=[71, -37; 52, -27], style(color=9)),
      Line(points=[39, -70; 29, -51], style(color=9)),
      Line(points=[-39, -70; -29, -52], style(color=9)),
      Line(points=[-71, -37; -50, -26], style(color=9)),
      Line(points=[-71, 37; -54, 28], style(color=9)),
      Line(points=[-38, 70; -28, 51], style(color=9)),
      Line(points=[0, 0; -50, 50], style(color=0, thickness=2)),
      Line(points=[0, 0; 40, 0], style(color=0, thickness=2))),
    Window(
      x=0.34,
      y=0.23,
      width=0.6,
      height=0.6),
    Diagram(
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Line(points=[-80, 68; -80, -80], style(color=8)),
      Line(points=[-80, 0; -10, 0; 60, 70], style(color=0, thickness=2)),
      Line(points=[-90, -70; 82, -70], style(color=8)),
      Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Polygon(points=[-34, 0; -37, -13; -30, -13; -34, 0], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-34, -13; -34, -70], style(
          color=8,
          pattern=1,
          thickness=1,
          arrow=0)),
      Polygon(points=[-34, -69; -37, -56; -31, -56; -34, -69; -34, -69], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Text(
        extent=[-81, -25; -35, -43],
        string="offset",
        style(color=9)),
      Text(
        extent=[-33, -71; 13, -89],
        string="startTime",
        style(color=9)),
      Text(
        extent=[-82, 90; -41, 70],
        string="y",
        style(color=9)),
      Text(
        extent=[70, -80; 94, -100],
        string="temps",
        style(color=9)),
      Line(points=[-10, 0; -10, -70], style(color=8, pattern=2)),
      Line(points=[-10, 0; 50, 0], style(color=8, pattern=2)),
      Line(points=[50, 0; 50, 60], style(color=8, pattern=2)),
      Text(
        extent=[35, 33; 50, 23],
        string="1",
        style(color=9)),
      Text(
        extent=[14, 13; 32, 1],
        string="1",
        style(color=9))),
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.Sources library</b></p>
</HTML>
<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
equation 
  
  y.signal = offset + (if (time < startTime) then 0 else time - startTime);
  
end Horloge;
