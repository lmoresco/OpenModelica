within ThermoSysPro.InstrumentationAndControl.Blocks.Discret;
block Echant 
  parameter Real Gain=1 "Gain";
  parameter Real SampleOffset=0 "Instant de départ de l'échantillonnage (s)";
  parameter Real SampleInterval=0.01 "Période d'échantillonnage (s)";
  
protected 
  Real uc;
  Real ud;
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Rectangle(extent=[-100, 100; 100, -100], style(fillColor=8)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Ellipse(extent=[-25, -10; -45, 10], style(color=3, fillColor=7)),
      Ellipse(extent=[45, -10; 25, 10], style(color=73, fillColor=7)),
      Line(points=[-100, 0; -45, 0], style(color=3)),
      Line(points=[45, 0; 100, 0], style(color=73)),
      Line(points=[-35, 0; 30, 35], style(color=3))),
    Diagram(
      Ellipse(extent=[-25, -10; -45, 10], style(color=3, fillColor=7)),
      Ellipse(extent=[45, -10; 25, 10], style(color=73, fillColor=7)),
      Line(points=[-100, 0; -45, 0], style(color=3)),
      Line(points=[45, 0; 100, 0], style(color=73)),
      Line(points=[-35, 0; 30, 35], style(color=3)),
      Line(points=[0, -20; 0, -100], style(pattern=3))),
    Window(
      x=0.17,
      y=0.12,
      width=0.65,
      height=0.65),
    Documentation(info="<html>
<p><b>Adapted from the ModelicaAdditions.Blocks.Discrete library</b></p>
</HTML>
<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u 
                                      annotation (extent=[-120, -10; -100, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical continu 
    annotation (extent=[-10, -120; 10, -100], rotation=90);
equation 
  if (cardinality(continu) == 0) then
    continu.signal = false;
  end if;
  
algorithm 
  when {sample(SampleOffset, SampleInterval),not (continu.signal)} then
    ud := u.signal;
  end when;
  
  uc := u.signal;
  
  y.signal := Gain*(if continu.signal then uc else ud);
end Echant;
