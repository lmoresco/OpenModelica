within ThermoSysPro.InstrumentationAndControl.Blocks.Sources;
block Echelon 
  parameter Real hauteur=1 "Hauteur de l'échelon";
  parameter Real offset=0 "Décalage de la sortie";
  parameter Real startTime=0 "Instant de départ de l'échelon";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Line(points=[-80, 68; -80, -80], style(color=8)),
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Line(points=[-90, -70; 82, -70], style(color=8)),
      Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(color=8,
            fillColor=8)),
      Line(points=[-80, -70; 0, -70; 0, 50; 80, 50], style(color=0))),
    Window(
      x=0.18,
      y=0.17,
      width=0.6,
      height=0.6),
    Diagram(
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Line(points=[-80, 68; -80, -80], style(color=8)),
      Line(points=[-80, -18; 0, -18; 0, 50; 80, 50], style(color=0, thickness=2)),
      Line(points=[-90, -70; 82, -70], style(color=8)),
      Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(color=8,
            fillColor=8)),
      Text(
        extent=[70, -80; 94, -100],
        string="temps",
        style(color=9)),
      Text(
        extent=[-21, -72; 25, -90],
        string="startTime",
        style(color=9)),
      Line(points=[0, -17; 0, -71], style(color=8, pattern=2)),
      Text(
        extent=[-68, -36; -22, -54],
        string="offset",
        style(color=9)),
      Line(points=[-13, 50; -13, -17], style(
          color=8,
          pattern=1,
          thickness=1,
          arrow=0)),
      Polygon(points=[2, 50; -19, 50; 2, 50], style(color=8, pattern=2)),
      Polygon(points=[-13, -17; -16, -4; -10, -4; -13, -17; -13, -17], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Polygon(points=[-13, 50; -16, 37; -9, 37; -13, 50], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Text(
        extent=[-68, 26; -22, 8],
        string="hauteur",
        style(color=9)),
      Polygon(points=[-13, -69; -16, -56; -10, -56; -13, -69; -13, -69], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-13, -18; -13, -70], style(
          color=8,
          pattern=1,
          thickness=1,
          arrow=0)),
      Polygon(points=[-13, -18; -16, -31; -9, -31; -13, -18], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Text(
        extent=[-78, 90; -37, 70],
        string="y",
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
  
  y.signal = offset + (if time < startTime then 0 else hauteur);
end Echelon;
