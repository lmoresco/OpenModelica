within ThermoSysPro.InstrumentationAndControl.Blocks.Sources;
block Sinusoide 
  parameter Real amplitude=1 "Amplitude";
  parameter Real period=1 "Periode (s)";
  parameter Real phase=0 "Phase (rad)";
  parameter Real offset=0 "Décalage de la sortie";
  parameter Real startTime=0 "Instant de départ de la sinusoide (s)";
  
protected 
  constant Real pi=Modelica.Constants.pi;
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Line(points=[-80, -90; -80, 84], style(color=8)),
      Polygon(points=[-80, 100; -86, 84; -74, 84; -80, 100], style(color=8,
            fillColor=8)),
      Line(points=[-99, -40; 85, -40], style(color=8)),
      Polygon(points=[101, -40; 85, -34; 85, -46; 101, -40], style(color=8,
            fillColor=8)),
      Line(points=[-40, 0; -31.6, 34.2; -26.1, 53.1; -21.3, 66.4; -17.1, 74.6;
            -12.9, 79.1; -8.64, 79.8; -4.42, 76.6; -0.201, 69.7; 4.02, 59.4;
            8.84, 44.1; 14.9, 21.2; 27.5, -30.8; 33, -50.2; 37.8, -64.2; 42, -73.1;
             46.2, -78.4; 50.5, -80; 54.7, -77.6; 58.9, -71.5; 63.1, -61.9;
            67.9, -47.2; 74, -24.8; 80, 0], style(color=0, thickness=2)),
      Line(points=[-41, -2; -80, -2], style(color=0, thickness=2)),
      Text(
        extent=[-128, 7; -82, -11],
        string="offset",
        style(color=9)),
      Line(points=[-41, -2; -41, -40], style(color=8, pattern=2)),
      Text(
        extent=[-60, -43; -14, -61],
        string="startTime",
        style(color=9)),
      Text(
        extent=[84, -52; 108, -72],
        string="temps",
        style(color=9)),
      Text(
        extent=[-84, 106; -43, 86],
        string="y",
        style(color=9)),
      Line(points=[-9, 79; 43, 79], style(color=8, pattern=2)),
      Line(points=[-42, -1; 50, 0], style(color=8, pattern=2)),
      Polygon(points=[33, 80; 30, 67; 37, 67; 33, 80], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Text(
        extent=[37, 57; 83, 39],
        string="amplitude",
        style(color=9)),
      Polygon(points=[33, 1; 30, 14; 36, 14; 33, 1; 33, 1], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[33, 79; 33, 0], style(
          color=8,
          pattern=1,
          thickness=1,
          arrow=0))),
    Icon(
      Line(points=[-80, 68; -80, -80], style(color=8)),
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Line(points=[-41, -2; -80, -2], style(color=0)),
      Line(points=[-40, 0; -31.6, 34.2; -26.1, 53.1; -21.3, 66.4; -17.1, 74.6;
            -12.9, 79.1; -8.64, 79.8; -4.42, 76.6; -0.201, 69.7; 4.02, 59.4;
            8.84, 44.1; 14.9, 21.2; 27.5, -30.8; 33, -50.2; 37.8, -64.2; 42, -73.1;
             46.2, -78.4; 50.5, -80; 54.7, -77.6; 58.9, -71.5; 63.1, -61.9;
            67.9, -47.2; 74, -24.8; 80, 0], style(color=0)),
      Line(points=[-90, -70; 82, -70], style(color=8)),
      Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillPattern=0)),
      Text(extent=[-150, 150; 150, 110], string="%name")),
    Window(
      x=0.35,
      y=0.28,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.Sources library</b></p>
</HTML>
<html>
<p><b>Version 1.7</b></p>
</HTML>
"));
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
equation 
  
  y.signal = offset + (if time < startTime then 0 else amplitude*
    Modelica.Math.sin(2*pi*(time - startTime)/period + phase));
end Sinusoide;
