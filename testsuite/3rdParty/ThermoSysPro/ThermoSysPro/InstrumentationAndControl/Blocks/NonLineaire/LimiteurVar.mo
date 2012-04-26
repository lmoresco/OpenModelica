within ThermoSysPro.InstrumentationAndControl.Blocks.NonLineaire;
block LimiteurVar 
  parameter Real maxval=1 
    "Valeur maximale de la sortie si limit1 n'est pas connecté";
  parameter Real minval=-1 
    "Valeur minimale de la sortie si limit2 n'est pas connecté";
protected 
  Real uMax;
  Real uMin;
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Rectangle(extent=[-100, -100; 100, 100], style(
          color=3,
          pattern=1,
          thickness=1,
          arrow=0,
          fillPattern=0)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Line(points=[78, 60; 40, 60; -40, -60; -80, -60], style(color=0)),
      Line(points=[-86, 0; 88, 0], style(color=8)),
      Polygon(points=[96, 0; 86, -5; 86, 5; 96, 0], style(color=8, fillColor=8)),
      Polygon(points=[0, 84; -5, 74; 5, 74; 0, 84], style(color=8, fillColor=8)),
      Line(points=[0, -80; 0, 74], style(color=8)),
      Line(points=[-100, -80; -60, -80; -60, -66]),
      Line(points=[-100, 80; 60, 80; 60, 64]),
      Polygon(points=[-60, -62; -65, -72; -55, -72; -60, -62], style(color=69,
            fillColor=69)),
      Polygon(points=[56, 72; 64, 72; 60, 62; 56, 72; 56, 72], style(fillColor=
              69))),
    Diagram(
      Text(
        extent=[26, 90; 88, 68],
        string="umax",
        style(color=9, fillColor=0)),
      Text(
        extent=[-88, -64; -26, -86],
        string="umin",
        style(color=9, fillColor=0)),
      Line(points=[-86, 0; 88, 0], style(color=8)),
      Polygon(points=[96, 0; 86, -5; 86, 5; 96, 0], style(color=8, fillColor=8)),
      Polygon(points=[0, 84; -5, 74; 5, 74; 0, 84], style(color=8, fillColor=8)),
      Line(points=[0, -80; 0, 74], style(color=8)),
      Line(points=[78, 60; 40, 60; -40, -60; -80, -60], style(color=0))),
    Window(
      x=0.36,
      y=0.19,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.NonLinear library</b></p>
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
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal limit1 
                                           annotation (extent=[-120, 70; -100, 90]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal limit2 
                                           annotation (extent=[-120, -90; -100, -70]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputLogical ySMax 
                                      annotation (extent=[100,70; 120,90], layer="icon");
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputLogical ySMin 
                                      annotation (extent=[100,-90; 120,-70], layer="icon");
equation 
  
  if (cardinality(limit1) == 0) then
    limit1.signal = maxval;
  end if;
  
  if (cardinality(limit2) == 0) then
    limit2.signal = minval;
  end if;
  
  uMax = max(limit1.signal, limit2.signal);
  uMin = min(limit1.signal, limit2.signal);
  
  y.signal = if (u.signal > uMax) then uMax else if (u.signal < uMin) then uMin else 
          u.signal;
  
  ySMax.signal = (u.signal >= uMax);
  ySMin.signal = (u.signal <= uMin);
  
end LimiteurVar;
