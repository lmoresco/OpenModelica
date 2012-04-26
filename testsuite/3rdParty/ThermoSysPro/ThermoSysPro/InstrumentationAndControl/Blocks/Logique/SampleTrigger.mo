within ThermoSysPro.InstrumentationAndControl.Blocks.Logique;
block SampleTrigger 
  parameter Real period=1 "Periode des impulsions (s)";
  parameter Real startTime=0 "Instant de départ des impulsions";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
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
      Line(points=[-80, -70; -40, -70; -40, 44; 0, 44; 0, -70; 40, -70; 40, 44;
             79, 44], style(color=0)),
      Rectangle(extent=[-100, -102; 100, 100], style(
          color=3,
          pattern=1,
          thickness=1,
          gradient=0,
          arrow=0,
          fillColor=30,
          fillPattern=1)),
      Line(points=[-80, 68; -80, -80], style(color=8, fillColor=0)),
      Line(points=[-90, -70; 82, -70], style(color=8)),
      Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=9,
            fillColor=8)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Line(points=[-60, -70; -60, 70], style(color=0)),
      Line(points=[-20, -70; -20, 70], style(color=0)),
      Line(points=[20, -70; 20, 70], style(color=0)),
      Line(points=[60, -70; 60, 70], style(color=0))),
    Diagram(
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Line(points=[-80, 68; -80, -80], style(color=8)),
      Line(points=[-90, -70; 82, -70], style(color=8)),
      Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Text(
        extent=[-53, -71; -7, -89],
        string="startTime",
        style(color=9)),
      Text(
        extent=[-82, 91; -41, 71],
        string="y",
        style(color=9)),
      Text(
        extent=[70, -80; 94, -100],
        string="temps",
        style(color=9)),
      Line(points=[-30, 47; -30, 19], style(color=8, pattern=2)),
      Line(points=[0, 47; 0, 18], style(color=8, pattern=2)),
      Line(points=[-30, 41; 0, 41], style(color=8)),
      Text(
        extent=[-37, 61; 9, 49],
        string="period",
        style(color=9)),
      Line(points=[-80, 19; -30, 19], style(color=8, pattern=2)),
      Polygon(points=[-30, 41; -21, 43; -21, 39; -30, 41], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Polygon(points=[0, 41; -8, 43; -8, 39; 0, 41], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Text(
        extent=[-100, 28; -80, 13],
        string="true",
        style(color=9)),
      Text(
        extent=[-100, -56; -80, -71],
        string="false",
        style(color=9)),
      Line(points=[0, -70; 0, 19], style(color=0, thickness=2)),
      Line(points=[-30, -70; -30, 19], style(color=0, thickness=2)),
      Line(points=[30, -70; 30, 19], style(color=0, thickness=2)),
      Line(points=[60, -70; 60, 19], style(color=0, thickness=2))),
    Window(
      x=0.05,
      y=0.32,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.Sources library</b></p>
</HTML>
<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputLogical yL 
                                           annotation (extent=[100, -10; 120, 10]);
algorithm 
  
  yL.signal := sample(startTime, period);
  
end SampleTrigger;
