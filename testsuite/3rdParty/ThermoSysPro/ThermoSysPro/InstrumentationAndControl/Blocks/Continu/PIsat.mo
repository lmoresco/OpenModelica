within ThermoSysPro.InstrumentationAndControl.Blocks.Continu;
block PIsat 
  parameter Real k=1 "Gain";
  parameter Real Ti=1 "Constante de temps (s)";
  parameter Real maxval=1 "Valeur maximale de la sortie";
  parameter Real minval=0 "Valeur minimale de la sortie";
  parameter Real ureset0=0 
    "Valeur de la sortie sur reset (si ureset non connecté)";
  parameter Boolean permanent=false "Calcul du permanent";
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
      Line(points=[-74, -68; -74, 2; 30, 42], style(thickness=1)),
      Text(
        extent=[-32, 70; 0, 42],
        string="PI",
        style(color=8)),
      Line(points=[30, 42; 86, 42]),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Text(
        extent=[-38, 10; 52, -30],
        string="K=%k",
        style(color=0)),
      Text(
        extent=[-36, -34; 54, -74],
        string="Ti=%Ti",
        style(color=0)),
      Polygon(points=[-74, 86; -82, 64; -66, 64; -74, 86], style(
          color=8,
          fillColor=8,
          fillPattern=1))),
    Window(
      x=0.12,
      y=0.18,
      width=0.56,
      height=0.73),
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.Continuous library</b></p>
</HTML>
"), Diagram);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u 
                                      annotation (extent=[-120, -10; -100, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
  NonLineaire.Limiteur Limiteur1(maxval=maxval, minval=minval) 
    annotation (extent=[70,-10; 90,10]);
  Math.Add Add2(k1=-1, k2=+1) 
                             annotation (extent=[40,60; 20,80]);
  Math.Gain Gain3(Gain=1/k)       annotation (extent=[0,60; -20,80]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal ureset 
                                           annotation (extent=[-120,-90; -100,-70]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical reset 
    annotation (extent=[-20,-120; 0,-100], rotation=90);
  Math.Gain Gain(Gain=k) annotation (extent=[-46,20; -26,40]);
  Math.Feedback Feedback1 annotation (extent=[-80,40; -60,20]);
  Integrateur Integrateur1(k=1/Ti, permanent=permanent,
    ureset0=ureset0)               annotation (extent=[-10,20; 10,40]);
  Math.Add Add1 annotation (extent=[32,-10; 52,10]);
  Math.Gain Gain1(Gain=k) annotation (extent=[-46,-40; -26,-20]);
  NonLineaire.Selecteur Selecteur1(C1=0) annotation (extent=[0,-30; 20,-10]);
equation 
  
  if (cardinality(ureset) == 1) then
    Integrateur1.ureset.signal = ureset0;
  end if;
  
  if (cardinality(reset) == 2) then
    Integrateur1.reset.signal = false;
  end if;
  
  connect(Limiteur1.y, y) annotation (points=[91,0; 110,0]);
  connect(Gain3.u, Add2.y) annotation (points=[1,70; 19,70]);
  connect(u, Feedback1.u1) annotation (points=[-110,0; -90,0; -90,30; -81,30]);
  connect(Limiteur1.y, Add2.u1) annotation (points=[91,0; 94,0; 94,76; 41,76]);
  connect(Gain3.y, Feedback1.u2) annotation (points=[-21,70; -70,70; -70,41]);
  connect(Integrateur1.y, Add1.u1) 
    annotation (points=[11,30; 20,30; 20,6; 31,6]);
  connect(ureset, Integrateur1.ureset) 
    annotation (points=[-110,-80; -20,-80; -20,22; -11,22]);
  connect(reset, Integrateur1.reset) 
    annotation (points=[-10,-110; -10,10; 0,10; 0,19], style(pattern=2));
  connect(Add1.y, Limiteur1.u) annotation (points=[53,0; 69,0]);
  connect(Add1.y, Add2.u2) annotation (points=[53,0; 60,0; 60,64; 41,64]);
  connect(Feedback1.y, Gain.u) annotation (points=[-59,30; -47,30]);
  connect(Gain.y, Integrateur1.u) annotation (points=[-25,30; -11,30]);
  connect(u, Gain1.u) annotation (points=[-110,0; -90,0; -90,-30; -47,-30]);
  connect(Selecteur1.y, Add1.u2) 
    annotation (points=[21,-20; 26,-20; 26,-6; 31,-6]);
  connect(Gain1.y, Selecteur1.u2) 
    annotation (points=[-25,-30; -14,-30; -14,-28; -1,-28]);
  connect(reset, Selecteur1.uCond) 
    annotation (points=[-10,-110; -10,-20; -1,-20], style(pattern=2));
end PIsat;
