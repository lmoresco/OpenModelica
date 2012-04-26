within ThermoSysPro.InstrumentationAndControl.Blocks.Continu;
block PT1 
  parameter Real k=1 "Gain";
  parameter Real Ti=1 "Constante de temps (s)";
  parameter Real U0=0 
    "Valeur de la sortie à l'instant initial (si non permanent et si u0 non connecté)";
  parameter Boolean permanent=false "Calcul du permanent";
  
protected 
  Real x;
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
      Text(
        extent=[-60, 0; 60, -60],
        string="T s + 1",
        style(color=0)),
      Line(points=[-100, 0; -60, 0]),
      Line(points=[62, 0; 102, 0]),
      Line(points=[-50, 0; 50, 0], style(color=0))),
    Icon(
      Rectangle(extent=[-100, -100; 100, 100], style(
          color=3,
          pattern=1,
          thickness=1,
          arrow=0,
          fillPattern=0)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Line(points=[-80, 78; -80, -90], style(color=8)),
      Line(points=[-90, -80; 82, -80], style(color=8)),
      Polygon(points=[90, -80; 68, -72; 68, -88; 90, -80], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-80, -80; -70, -45.11; -60, -19.58; -50, -0.9087; -40, 12.75;
             -30, 22.75; -20, 30.06; -10, 35.41; 0, 39.33; 10, 42.19; 20, 44.29;
             30, 45.82; 40, 46.94; 50, 47.76; 60, 48.36; 70, 48.8; 80, 49.12]),
      Text(
        extent=[-64, 82; -4, 22],
        string="PT1",
        style(color=8)),
      Text(
        extent=[-38, 10; 52, -30],
        string="K=%k",
        style(color=0)),
      Text(
        extent=[-36, -34; 54, -74],
        string="Ti=%Ti",
        style(color=0)),
      Polygon(points=[-80, 94; -88, 72; -72, 72; -80, 94], style(
          color=8,
          fillColor=8,
          fillPattern=1))),
    Window(
      x=0.33,
      y=0.24,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.Continuous library</b></p>
</HTML>
"));
  
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u 
                                      annotation (extent=[-120, -10; -100, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u0 
                                       annotation (extent=[-120,-90; -100,-70]);
initial equation 
  if permanent then
    der(x) = 0;
  else
    x = (u0.signal)/k;
  end if;
  
equation 
  if (cardinality(u0) == 0) then
    u0.signal = U0;
  end if;
  
  der(x) = (u.signal - x)/Ti;
  y.signal = k*x;
end PT1;
