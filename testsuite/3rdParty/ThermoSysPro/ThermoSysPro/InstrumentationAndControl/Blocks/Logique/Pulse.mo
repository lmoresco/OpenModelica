within ThermoSysPro.InstrumentationAndControl.Blocks.Logique;
block Pulse 
  parameter Real width=0.5 "Largeur des impulsions (s)";
  parameter Real period=1 "Periode des impulsions (s)";
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
      Rectangle(extent=[-100, -102; 100, 100], style(
          color=3,
          pattern=1,
          thickness=1,
          gradient=0,
          arrow=0,
          fillColor=30,
          fillPattern=1)),
      Line(points=[-80, -70; -40, -70; -40, 44; 0, 44; 0, -70; 40, -70; 40, 44;
             79, 44], style(color=0)),
      Line(points=[-80, 68; -80, -80], style(color=8, fillColor=0)),
      Line(points=[-90, -70; 82, -70], style(color=8)),
      Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=9,
            fillColor=8)),
      Text(extent=[-150, 150; 150, 110], string="%name")),
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
        extent=[-60, -72; -14, -90],
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
      Line(points=[-78, -70; -40, -70; -40, 20; 20, 20; 20, -70; 50, -70; 50,
            20; 100, 20], style(color=0, thickness=2)),
      Line(points=[-40, 61; -40, 21], style(color=8, pattern=2)),
      Line(points=[20, 44; 20, 20], style(color=9, pattern=2)),
      Line(points=[50, 58; 50, 20], style(color=8, pattern=2)),
      Line(points=[-40, 53; 50, 53], style(color=8)),
      Line(points=[-40, 35; 20, 35], style(color=8)),
      Text(
        extent=[-30, 67; 16, 55],
        string="period",
        style(color=9)),
      Text(
        extent=[-35, 49; 14, 37],
        string="width",
        style(color=9)),
      Line(points=[-80, 20; -41, 20], style(color=8, pattern=2)),
      Polygon(points=[-40, 35; -31, 37; -31, 33; -40, 35], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Polygon(points=[20, 35; 12, 37; 12, 33; 20, 35], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Polygon(points=[-40, 53; -31, 55; -31, 51; -40, 53], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Polygon(points=[50, 53; 42, 55; 42, 51; 50, 53], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Text(
        extent=[-109, 28; -77, 14],
        string="true",
        style(color=9)),
      Text(
        extent=[-101, -56; -80, -71],
        string="false",
        style(color=9))),
    Window(
      x=0.09,
      y=0.3,
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
  
  when sample(startTime, period) then
    T0 := time;
  end when;
  
  yL.signal := (if time < startTime or time >= T0 + width then false else true);
  
end Pulse;
