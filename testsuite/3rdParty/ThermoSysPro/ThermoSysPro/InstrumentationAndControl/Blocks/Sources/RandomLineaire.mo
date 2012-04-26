within ThermoSysPro.InstrumentationAndControl.Blocks.Sources;
block RandomLineaire 
  parameter Integer seed=1 "Source du générateur aléatoire";
  parameter Real SampleOffset=0 "Instant de départ de l'échantillonnage";
  parameter Real SampleInterval=0.01 "Période d'échantillonnage";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Line(points=[-80, 68; -80, -80], style(color=8)),
      Line(points=[-90,0; 82,0],       style(color=8)),
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Polygon(points=[98,0; 76,8; 76,-8; 98,0],            style(color=8,
            fillColor=8)),
      Text(
        extent=[-89, 90; -36, 72],
        string="y",
        style(color=9)),
      Text(
        extent=[72,-8; 96,-28],
        string="temps",
        style(color=9)),
      Line(points=[-60, -20; -40, 20; -20, -40; 0, -60; 20, 0; 40, 40; 60, 0],
          style(color=0)),
      Text(
        extent=[-88,64; -58,46],
        style(color=3, rgbcolor={0,0,255}),
        string="1"),
      Text(
        extent=[-88,-52; -58,-70],
        style(color=3, rgbcolor={0,0,255}),
        string="-1")),
    Icon(
      Line(points=[50, 0; 100, 0]),
      Line(points=[50, 0; 100, 0]),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Line(points=[-82,66; -82,-82],   style(color=8)),
      Line(points=[-92,-2; 80,-2],     style(color=8)),
      Polygon(points=[-82,88; -90,66; -74,66; -82,88],     style(color=8,
            fillColor=8)),
      Polygon(points=[96,-2; 74,6; 74,-10; 96,-2],         style(color=8,
            fillColor=8)),
      Line(points=[-62,-22; -42,18; -22,-42; -2,-62; 18,-2; 38,38; 58,-2],
          style(color=0)),
      Text(
        extent=[-90,62; -60,44],
        style(color=3, rgbcolor={0,0,255}),
        string="1"),
      Text(
        extent=[-90,-54; -60,-72],
        style(color=3, rgbcolor={0,0,255}),
        string="-1")),
    Window(
      x=0.32,
      y=0.33,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.Sources library</b></p>
</HTML>
"));
protected 
  Real p1;
  Real p2;
  Real t1;
  Real t2;
  discrete Real Interval;
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                   annotation (extent=[100,-10; 120,10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical uL 
    annotation (extent=[-10,-120; 10,-100],rotation=90);
algorithm 
  
  when initial() then
    Commun.srand(seed);
    t1 := 0;
    t2 := SampleOffset;
    p1 := 0;
    p2 := 0;
    Interval := if uL.signal then SampleInterval else Modelica.Constants.inf;
  end when;
  
  when change(uL.signal) then
    Interval := if uL.signal then SampleInterval else Modelica.Constants.inf;
  end when;
  
  when edge(uL.signal) then
   p2 := 0;
   p1 := 0;
  end when;
  
  when (sample(SampleOffset, Interval) and uL.signal) then
    p1 := p2;
    p2 := 2*(Commun.fmod(Commun.rand()/32768*10, 1) - 0.5);
    t1 := time;
    t2 := t2 + SampleInterval;
  end when;
  
  y.signal := if uL.signal then p1 + (p2 - p1)/SampleInterval*(time - t1) else 0;
  
end RandomLineaire;
