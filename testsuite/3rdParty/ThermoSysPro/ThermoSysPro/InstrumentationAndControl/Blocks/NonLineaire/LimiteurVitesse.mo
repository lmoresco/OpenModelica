within ThermoSysPro.InstrumentationAndControl.Blocks.NonLineaire;
block LimiteurVitesse 
  parameter Real dmax=1 "Valeur maximale de la dérivée de la sortie";
  parameter Real dmin=-1 "Valeur minimale de la dérivée de la sortie";
  parameter Real Ti(min=Modelica.Constants.small) = 0.01 
    "Constante de temps (s)";
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
      Line(points=[-86, 0; 88, 0], style(color=9)),
      Polygon(points=[96, 0; 86, -5; 86, 5; 96, 0], style(color=9, fillColor=9)),
      Polygon(points=[0, 84; -5, 74; 5, 74; 0, 84], style(color=9, fillColor=9)),
      Line(points=[0, -80; 0, 74], style(color=9)),
      Text(
        extent=[-94, -8; -32, -30],
        string="%dmin",
        style(color=9, fillColor=0)),
      Text(
        extent=[30, 34; 92, 12],
        string="%dmax",
        style(color=9, fillColor=0))),
    Diagram,
    Window(
      x=0.19,
      y=0.24,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Version 1.7</b></p>
</HTML>
"));
  
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u 
                                      annotation (extent=[-120, -10; -100, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
  Continu.Derivee Derivee1(Ti=Ti) annotation (extent=[-60, -10; -40, 10]);
  Continu.Integrateur Integrateur1 annotation (extent=[40, -10; 60, 10]);
  Limiteur Limiteur1(maxval=dmax, minval=dmin) 
    annotation (extent=[-10, -10; 10, 10]);
  Sources.Horloge Horloge1 annotation (extent=[-80, -60; -60, -40]);
  Sources.Constante Constante1(k=0) annotation (extent=[-80, -100; -60, -80]);
  Math.Supeg Supeg1 annotation (extent=[-40, -80; -20, -60]);
  Logique.Edge Edge1 annotation (extent=[0, -80; 20, -60]);
equation 
  connect(u, Derivee1.u) annotation (points=[-110,0; -61,0]);
  connect(Integrateur1.y, y) 
    annotation (points=[61,0; 110,0],   style(color=3));
  connect(Derivee1.y, Limiteur1.u) 
    annotation (points=[-39,0; -11,0],   style(color=3));
  connect(Limiteur1.y, Integrateur1.u) 
    annotation (points=[11,0; 39,0],   style(color=3));
  connect(u, Integrateur1.ureset) 
    annotation (points=[-110,0; -80,0; -80,-20; 28,-20; 28,-8; 39,-8]);
  connect(Horloge1.y, Supeg1.u1) annotation (points=[-59,-50; -50,-50; -50,-64;
        -41,-64],   style(color=3));
  connect(Constante1.y, Supeg1.u2) annotation (points=[-59,-90; -50,-90; -50,
        -76; -41,-76],   style(color=3));
  connect(Supeg1.yL, Edge1.uL) annotation (points=[-19,-70; -1,-70]);
  connect(Edge1.yL, Integrateur1.reset) 
    annotation (points=[21,-70; 50,-70; 50,-11]);
end LimiteurVitesse;
