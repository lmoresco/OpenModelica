within ThermoSysPro.InstrumentationAndControl.Blocks.Discret;
block Pre 
  parameter Real Gain=1 "Gain";
  parameter Real initialCond=0 "Condition initiale";
  parameter Real SampleOffset=0 "Instant de départ de l'échantillonnage (s)";
  parameter Real SampleInterval=0.01 "Période d'échantillonnage (s)";
  
protected 
  Real x(start=initialCond);
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Rectangle(extent=[-100, 100; 100, -100], style(fillColor=8)),
      Line(points=[-60, 0; 60, 0], style(color=0, thickness=2)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Text(
        extent=[-55, 55; 55, 5],
        string="1",
        style(color=0)),
      Text(
        extent=[-55, -5; 55, -55],
        string="z",
        style(color=0))),
    Diagram(
      Rectangle(extent=[-60, 60; 60, -60], style(color=73)),
      Line(points=[-100, 0; -60, 0], style(color=73)),
      Line(points=[60, 0; 100, 0], style(color=73)),
      Line(points=[40, 0; -40, 0], style(color=0)),
      Text(
        extent=[-55, 55; 55, 5],
        string="1",
        style(color=0)),
      Text(
        extent=[-55, -5; 55, -55],
        string="z",
        style(color=0))),
    Window(
      x=0.23,
      y=0.2,
      width=0.65,
      height=0.65),
    Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u 
                                      annotation (extent=[-120, -10; -100, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
algorithm 
  
  when sample(SampleOffset, SampleInterval) then
    x := u.signal;
  end when;
  
  when sample(SampleOffset, SampleInterval) then
    y.signal := Gain*pre(x);
  end when;
end Pre;
