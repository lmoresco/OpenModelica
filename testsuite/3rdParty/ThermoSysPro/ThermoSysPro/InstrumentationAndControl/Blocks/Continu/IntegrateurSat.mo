within ThermoSysPro.InstrumentationAndControl.Blocks.Continu;
block IntegrateurSat 
  parameter Real k=1 "Gain";
  parameter Real maxval=1 "Valeur maximale de la sortie";
  parameter Real minval=0 "Valeur minimale de la sortie";
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
    Diagram,
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
      Text(
        extent=[-36, -34; 54, -74],
        string="K=%k",
        style(color=0)),
      Line(points=[-80, -80; 20, 20; 80, 20])),
    Window(
      x=0.39,
      y=0.15,
      width=0.72,
      height=0.72),
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
  
  assert(maxval > minval,
    "IntegrateurSat : Le paramètre maxval doit être supérieur au paramètre minval");
  
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
  
  der(x) = if (reset.signal or ((y.signal > maxval) and (u.signal > 0)) or ((y.
    signal < minval) and (u.signal < 0))) then 0 else u.signal;
  y.signal = if reset.signal then ureset.signal else k*x;
end IntegrateurSat;
