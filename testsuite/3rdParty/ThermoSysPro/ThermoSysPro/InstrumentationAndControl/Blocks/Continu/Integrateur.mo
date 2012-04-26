within ThermoSysPro.InstrumentationAndControl.Blocks.Continu;
block Integrateur 
  parameter Real k=1 "Gain";
  parameter Real ureset0=0 
    "Valeur de la sortie sur reset (si ureset non connecté)";
  parameter Boolean permanent=false "Calcul du permanent";
  
protected 
  Real x;
  Real x0;
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Rectangle(extent=[-60, 60; 60, -60], style(fillColor=30, fillPattern=1)),
      Text(
        extent=[-60, 52; 60, 6],
        string="k",
        style(color=0)),
      Line(points=[-100, 0; -60, 0]),
      Line(points=[62, 0; 102, 0]),
      Line(points=[-50, 0; 50, 0], style(color=0)),
      Text(
        extent=[-60, -6; 60, -52],
        string="s",
        style(color=0))),
    Icon(
      Rectangle(extent=[-100, -100; 100, 100], style(
          color=3,
          pattern=1,
          thickness=1,
          arrow=0,
          fillPattern=0)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Line(points=[-80, 78; -80, -90], style(color=8)),
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-90, -80; 82, -80], style(color=8)),
      Polygon(points=[90, -80; 68, -72; 68, -88; 90, -80], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Text(
        extent=[-54, 84; 6, 24],
        string="I",
        style(color=8)),
      Line(points=[-80, -80; 80, 80]),
      Text(
        extent=[-36, -34; 54, -74],
        string="K=%k",
        style(color=0))),
    Window(
      x=0.23,
      y=0.15,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.Continuous library</b></p>
</HTML>
<html>
<p><b>Version 1.7</b></p>
</HTML>
"));
  
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u 
                                      annotation (extent=[-120, -10; -100, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical reset 
    annotation (extent=[-10, -120; 10, -100], rotation=90);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal ureset 
                                           annotation (extent=[-120, -90; -100, -70]);
initial equation 
  if permanent then
    der(x) = 0;
  else
    x = (1/k - 1) * ureset.signal/k;
  end if;
  
equation 
  
  if (cardinality(reset) == 0) then
    reset.signal = false;
  end if;
  
  if (cardinality(ureset) == 0) then
    ureset.signal = ureset0;
  end if;
  
  when not (reset.signal) then
    x0 = ureset.signal/k;
    reinit(x, x0);
  end when;
  
  der(x) = if reset.signal then 0 else u.signal;
  y.signal = if reset.signal then ureset.signal else k*x;
end Integrateur;
