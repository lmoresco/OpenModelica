within ThermoSysPro.InstrumentationAndControl.Blocks.Sources;
block Pulse 
  parameter Real amplitude=1 "Amplitude des impulsions";
  parameter Real width=0.5 "Largeur des impulsions (s)";
  parameter Real period=1 "Periode des impulsions (s)";
  parameter Real offset=0 "Décalage de la sortie";
  parameter Real startTime=0 "Instant de départ des impulsions";
  
protected 
  Real T0;
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
      Text(extent=[-150, 150; 150, 110], string="%name")),
    Window(
      x=0.08,
      y=0.05,
      width=0.79,
      height=0.77),
    Diagram(
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Line(points=[-80, 68; -80, -80], style(color=8)),
      Line(points=[-90, -70; 82, -70], style(color=8)),
      Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Polygon(points=[-34, 1; -37, -12; -30, -12; -34, 1], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-34, -1; -34, -70], style(
          color=8,
          pattern=1,
          thickness=1,
          arrow=0)),
      Polygon(points=[-33, -70; -36, -57; -30, -57; -33, -70; -33, -70], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Text(
        extent=[-78, -24; -35, -36],
        string="offset",
        style(color=9)),
      Text(
        extent=[-31, -69; 15, -87],
        string="startTime",
        style(color=9)),
      Text(
        extent=[-82, 93; -41, 73],
        string="y",
        style(color=9)),
      Text(
        extent=[70, -80; 94, -100],
        string="temps",
        style(color=9)),
      Line(points=[-10, 0; -10, -70], style(color=8, pattern=2)),
      Line(points=[-80, 0; -10, 0; -10, 50; 30, 50; 30, 0; 50, 0; 50, 50; 90,
            50], style(color=0, thickness=2)),
      Line(points=[-10, 88; -10, 49], style(color=8, pattern=2)),
      Line(points=[30, 74; 30, 50], style(color=9, pattern=2)),
      Line(points=[50, 88; 50, 50], style(color=8, pattern=2)),
      Line(points=[-10, 83; 51, 83], style(color=8)),
      Line(points=[-10, 69; 30, 69], style(color=8)),
      Text(
        extent=[0, 97; 46, 85],
        string="period",
        style(color=9)),
      Text(
        extent=[-9, 81; 30, 69],
        string="width",
        style(color=9)),
      Line(points=[-43, 50; -10, 50], style(color=8, pattern=2)),
      Line(points=[-34, 50; -34, 1], style(
          color=8,
          pattern=1,
          thickness=1,
          arrow=0)),
      Text(
        extent=[-78, 34; -37, 20],
        string="amplitude",
        style(color=9)),
      Polygon(points=[-34, 49; -37, 36; -30, 36; -34, 49], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Polygon(points=[-34, 1; -37, 14; -31, 14; -34, 1; -34, 1], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[90, 50; 90, 0; 100, 0], style(color=0, thickness=2)),
      Polygon(points=[-10, 69; -1, 71; -1, 67; -10, 69], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Polygon(points=[30, 69; 22, 71; 22, 67; 30, 69], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Polygon(points=[-10, 83; -1, 85; -1, 81; -10, 83], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Polygon(points=[50, 83; 42, 85; 42, 81; 50, 83], style(
          color=8,
          fillColor=8,
          fillPattern=1))),
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.Sources library</b></p>
</HTML>
<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
equation 
  
  when sample(startTime, period) then
    T0 = time;
  end when;
  
  y.signal = offset + (if time < startTime or time >= T0 + width then 0 else 
    amplitude);
  
end Pulse;
