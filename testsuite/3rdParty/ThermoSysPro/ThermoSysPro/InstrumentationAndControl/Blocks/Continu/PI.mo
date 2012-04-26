within ThermoSysPro.InstrumentationAndControl.Blocks.Continu;
block PI 
  parameter Real k=1 "Gain";
  parameter Real Ti=1 "Constante de temps (s)";
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
    Icon(
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Line(points=[-74, 64; -74, -80], style(color=8)),
      Line(points=[-74, -80; 70, -80], style(color=8)),
      Polygon(points=[92, -80; 70, -72; 70, -88; 92, -80], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-74, -68; -74, 2; 66, 58], style(thickness=1)),
      Text(
        extent=[-32, 70; 0, 42],
        string="PI",
        style(color=8)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Text(
        extent=[-36, -34; 54, -74],
        string="Ti=%Ti",
        style(color=0)),
      Text(
        extent=[-38, 10; 52, -30],
        string="K=%k",
        style(color=0)),
      Polygon(points=[-74, 86; -82, 64; -66, 64; -74, 86], style(
          color=8,
          fillColor=8,
          fillPattern=1))),
    Diagram(
      Line(points=[-100, 0; -60, 0]),
      Line(points=[62, 0; 100, 0]),
      Rectangle(extent=[-60, 60; 60, -60], style(fillColor=30, fillPattern=1)),
      Rectangle(extent=[-60, 60; 60, -60], style(fillColor=30, fillPattern=1)),
      Text(
        extent=[-68, 24; -24, -18],
        string="k",
        style(color=0)),
      Text(
        extent=[-32, 48; 60, 0],
        string="T s + 1",
        style(color=0)),
      Text(
        extent=[-30, -8; 52, -40],
        string="T s",
        style(color=0)),
      Line(points=[-24, 0; 54, 0], style(color=0))),
    Window(
      x=0.19,
      y=0.2,
      width=0.58,
      height=0.65),
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.Continuous library</b></p>
</HTML>
<html>
<p><b>Version 1.6</b></p>
</HTML>
"));
  
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u 
                                      annotation (extent=[-120, -10; -100, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal ureset 
                                           annotation (extent=[-120, -90; -100, -70]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical reset 
    annotation (extent=[-10, -120; 10, -100], rotation=90);
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
    x0 = ureset.signal/k - u.signal;
    reinit(x, x0);
  end when;
  
  der(x) = if reset.signal then 0 else u.signal/Ti;
  y.signal = if reset.signal then ureset.signal else k*(x + u.signal);
  
end PI;
