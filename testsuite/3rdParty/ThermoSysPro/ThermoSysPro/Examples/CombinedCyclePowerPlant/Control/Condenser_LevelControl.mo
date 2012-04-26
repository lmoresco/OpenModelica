within ThermoSysPro.Examples.CombinedCyclePowerPlant.Control;
model Condenser_LevelControl "Condenser level control" 
  
  annotation (
    Coordsys(grid=[1, 1], component=[10, 10],
      extent=[-100,-100; 100,100],
      scale=0.1),
    Diagram(
      Text(
        extent=[-97,99; -59,91],
        style(color=42, rgbcolor={127,0,0}),
        string="Niveau ballon"),
      Text(
        extent=[-99,58; -53,26],
        style(color=42, rgbcolor={127,0,0}),
        string="Consigne Niveau"),
      Text(
        extent=[-103,-21; -65,-29],
        style(color=42, rgbcolor={127,0,0}),
        string="Débit Eau"),
      Text(
        extent=[-99,-92; -61,-100],
        style(color=42, rgbcolor={127,0,0}),
        string="Débit Vapeur"),
      Text(
        extent=[64,-92; 102,-100],
        style(color=42, rgbcolor={127,0,0}),
        string="Ouv Vanne")),
    Icon(
      Rectangle(extent=[-100, 100; 100, -100]),
      Rectangle(extent=[-80,81; 80,-80], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=51,
          rgbfillColor={255,255,170},
          fillPattern=1)),
      Text(
        extent=[-88,65; 74,-26],
        style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=51,
          rgbfillColor={255,255,170},
          fillPattern=1),
        string="Régulation Niveau "),
      Text(
        extent=[-41,-9; 38,-58],
        style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=51,
          rgbfillColor={255,255,170},
          fillPattern=1),
        string="Ballon"),
      Text(
        extent=[-98,93; -60,85],
        style(color=42, rgbcolor={127,0,0}),
        string="Niveau ballon"),
      Text(
        extent=[-99,46; -50,13],
        style(color=42, rgbcolor={127,0,0}),
        string="Consigne Niveau"),
      Text(
        extent=[-103,-27; -65,-35],
        style(color=42, rgbcolor={127,0,0}),
        string="Débit Eau"),
      Text(
        extent=[-97,-86; -59,-94],
        style(color=42, rgbcolor={127,0,0}),
        string="Débit Vapeur"),
      Text(
        extent=[64,-86; 102,-94],
        style(color=42, rgbcolor={127,0,0}),
        string="Ouv Vanne")));
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal MesureDebitVapeur 
    annotation (extent=[-109,-94; -99,-84]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal MesureDebitEau 
    annotation (extent=[-110.5,-34.5; -100.5,-24.5]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal MesureNiveauEau 
    annotation (extent=[-110,85; -100,95]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal ConsigneNiveauEau 
    annotation (extent=[-110,25; -100,35]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal SortieReelle1 
    annotation (extent=[100,-95; 110,-85]);
  
  ThermoSysPro.InstrumentationAndControl.Blocks.Math.Add add(                          k1=+1, k2=-1) 
                                          annotation (extent=[63,65; 88,91]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Continu.PIsat pIsat(
    permanent=true,
    ureset0=0,
    Ti=10,
    k=10) 
    annotation (extent=[66,-88; 86,-68],   rotation=180);
  ThermoSysPro.InstrumentationAndControl.Blocks.Math.Add add1(
                             k1=+1, k2=+1) 
                                          annotation (extent=[-39,-75; -19,
        -55],
      rotation=180);
  ThermoSysPro.InstrumentationAndControl.Blocks.Continu.PIsat pIsat1(
    permanent=false,
    k=1,
    Ti=10,
    ureset0(fixed=true) = 0.8) 
    annotation (extent=[-73,-75; -53,-55], rotation=180);
  ThermoSysPro.InstrumentationAndControl.Blocks.Continu.PT1 pT1_1(                              permanent=true, U0=1.05) 
    annotation (extent=[31,71; 51,91]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Continu.PT1 pT1_2(                              permanent=true, U0=1.05) 
    annotation (extent=[-27,3; -7,23], rotation=270);
  ThermoSysPro.InstrumentationAndControl.Blocks.Continu.PT1 pT1_3(                              permanent=true, U0=1.05) 
    annotation (extent=[5,3; 25,23],   rotation=270);
  ThermoSysPro.InstrumentationAndControl.Blocks.Math.Add add2(
                            k1=+1, k2=-1) annotation (extent=[-21,-39; -1,-19],
      rotation=270);
  ThermoSysPro.InstrumentationAndControl.Blocks.Logique.Edge edge annotation (extent=[-50,-40; -40,-30]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Logique.Echelon echelon 
    annotation (extent=[-76,-11; -66,-1]);
equation 
  connect(pIsat.u,add. y) annotation (points=[87,-78; 89,-78; 89,78; 89.25,78]);
  connect(pIsat1.u,add1. y) annotation (points=[-52,-65; -40,-65]);
  connect(pT1_1.y,add. u1) annotation (points=[52,81; 57,81; 57,85.8; 61.75,
        85.8]);
  connect(pT1_2.y,add2. u2) annotation (points=[-17,2; -17,-8; -17,-8; -17,-18]);
  connect(pT1_3.y,add2. u1) 
    annotation (points=[15,2; 15,-7; -5,-7; -5,-18]);
  connect(pIsat.y,add1. u1) annotation (points=[65,-78; 19,-78; 19,-71; -18,-71]);
  connect(pIsat1.y, SortieReelle1) annotation (points=[-74,-65; -79,-65; -79,
        -90; 105,-90], style(color=1, rgbcolor={255,0,0}));
  connect(MesureDebitVapeur, pT1_3.u) annotation (points=[-104,-89; -91,-89;
        -91,-40; -64,-40; -64,29; 15,29; 15,24], style(color=1, rgbcolor={255,
          0,0}));
  connect(MesureDebitEau, pT1_2.u) 
    annotation (points=[-105.5,-29.5; -79,-29.5; -79,37; -17,37; -17,24]);
  connect(MesureNiveauEau, pT1_1.u) annotation (points=[-105,90; -38,90; -38,
        81; 30,81], style(color=42, rgbcolor={127,0,0}));
  connect(ConsigneNiveauEau, add.u2) annotation (points=[-105,30; -93,30; -93,
        50; 55,50; 55,70.2; 61.75,70.2],
                                  style(color=42, rgbcolor={127,0,0}));
  connect(add2.y, add1.u2) annotation (points=[-11,-40; -11,-59; -18,-59]);
  connect(echelon.yL, edge.uL) 
    annotation (points=[-65.5,-6; -60,-6; -60,-35; -50.5,-35]);
  connect(edge.yL, pIsat1.reset) 
    annotation (points=[-39.5,-35; -31,-35; -31,-46; -62,-46; -62,-54]);
end Condenser_LevelControl;
