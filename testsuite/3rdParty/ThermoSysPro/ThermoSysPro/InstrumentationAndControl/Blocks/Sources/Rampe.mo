within ThermoSysPro.InstrumentationAndControl.Blocks.Sources;
block Rampe 
  parameter Real Starttime=1 "Instant de départ de la rampe (s)";
  parameter Real Duration=2 "Durée de la rampe (s)";
  parameter Real Initialvalue=0 "Valeur initiale de la sortie";
  parameter Real Finalvalue=1 "Valeur finale de la sortie";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Line(points=[-80, 68; -80, -80], style(color=8)),
      Line(points=[-80, -20; -20, -20; 50, 50], style(color=0, thickness=2)),
      Line(points=[-90, -70; 82, -70], style(color=8)),
      Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Polygon(points=[-30, -20; -32, -30; -27, -30; -30, -20], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-30, -20; -30, -70], style(
          color=8,
          pattern=1,
          thickness=1,
          arrow=0)),
      Polygon(points=[-30, -70; -33, -60; -28, -60; -30, -70; -30, -70], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Text(
        extent=[-80, -33; -30, -50],
        string="initialValue",
        style(color=9)),
      Text(
        extent=[-40, -70; 6, -88],
        string="startTime",
        style(color=9)),
      Text(
        extent=[-80, 92; -39, 72],
        string="y",
        style(color=9)),
      Text(
        extent=[70, -80; 94, -100],
        string="temps",
        style(color=9)),
      Line(points=[-20, -20; -20, -70], style(color=8, pattern=2)),
      Line(points=[-19, -20; 50, -20], style(
          color=8,
          pattern=1,
          thickness=1,
          arrow=0)),
      Line(points=[50, 50; 101, 50], style(color=0, thickness=2)),
      Line(points=[50, 50; 50, -62], style(
          color=8,
          pattern=1,
          thickness=1,
          arrow=0)),
      Polygon(points=[50, -20; 42, -18; 42, -22; 50, -20], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Polygon(points=[-20, -20; -11, -18; -11, -22; -20, -20], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Polygon(points=[50, 50; 48, 40; 53, 40; 50, 50], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Polygon(points=[50, -72; 47, -62; 52, -62; 50, -72; 50, -72], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Text(
        extent=[53, 25; 100, 8],
        string="finalValue",
        style(color=9)),
      Text(
        extent=[0, -17; 35, -37],
        string="duration",
        style(color=9))),
    Icon(
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Line(points=[-80, 68; -80, -80], style(color=8)),
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Line(points=[-90, -70; 82, -70], style(color=8)),
      Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-80, -70; -40, -70; 31, 38], style(color=0)),
      Line(points=[31, 38; 86, 38], style(color=0)),
      Text(extent=[-150, 150; 150, 110], string="%name")),
    Window(
      x=0.2,
      y=0.15,
      width=0.6,
      height=0.6),
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
  
  y.signal = if time < Starttime then (Initialvalue) else if time > (Starttime
     + Duration) then (Finalvalue) else (Initialvalue + (Finalvalue -
    Initialvalue)*(time - Starttime)/Duration);
end Rampe;
