within ThermoSysPro.InstrumentationAndControl.Blocks.Sources;
block Random 
  parameter Integer seed=1 "Source du générateur aléatoire";
  parameter Real SampleOffset=0 "Instant de départ de l'échantillonnage (s)";
  parameter Real SampleInterval=0.01 "Période d'échantillonnage (s)";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Line(points=[-80, 68; -80, -80], style(color=8)),
      Line(points=[-90, -70; 82, -70], style(color=8)),
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(color=8,
            fillColor=8)),
      Text(
        extent=[-89, 90; -36, 72],
        string="y",
        style(color=9)),
      Text(
        extent=[70, -80; 94, -100],
        string="temps",
        style(color=9)),
      Line(points=[-60, -20; -40, 20; -20, -40; 0, -60; 20, 0; 40, 40; 60, 0],
          style(color=0))),
    Icon(
      Line(points=[50, 0; 100, 0]),
      Line(points=[50, 0; 100, 0]),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Line(points=[-80, 68; -80, -80], style(color=8)),
      Line(points=[-90, -70; 82, -70], style(color=8)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Line(points=[-60, -20; -40, 20; -20, -40; 0, -60; 20, 0; 40, 40; 60, 0],
          style(color=0))),
    Window(
      x=0.32,
      y=0.33,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Version 1.6</b></p>
</HTML>
"));
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
equation 
  
  when initial() then
    Commun.srand(seed);
  end when;
  
  when sample(SampleOffset, SampleInterval) then
    y.signal = Commun.fmod(Commun.rand()/32768*10, 1);
  end when;
end Random;
