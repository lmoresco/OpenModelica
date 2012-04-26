within ThermoSysPro.Examples.CombinedCyclePowerPlant.Control;
model Drum_LevelControl "Drum level control" 
  parameter Real k=1 "Gain";
  parameter Real Ti=1 "Time constant (s)";
  parameter Real minval=0.01 "Minimum output value";
  
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
        extent=[-101,-59; -55,-91],
        style(color=42, rgbcolor={127,0,0}),
        string="Consigne Niveau"),
      Text(
        extent=[64,-92; 102,-100],
        style(color=42, rgbcolor={127,0,0}),
        string="Ouv Vanne")),
    Icon(
      Rectangle(extent=[-100, 100; 100, -100]),
      Rectangle(extent=[-80,81; 80,-80], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=46,
          rgbfillColor={127,127,0},
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
        string="Bache"),
      Text(
        extent=[-98,93; -60,85],
        style(color=42, rgbcolor={127,0,0}),
        string="Niveau ballon"),
      Text(
        extent=[-101,-31; -52,-64],
        style(color=42, rgbcolor={127,0,0}),
        string="Consigne Niveau"),
      Text(
        extent=[64,-86; 102,-94],
        style(color=42, rgbcolor={127,0,0}),
        string="Ouv Vanne")));
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal MesureNiveauEau 
    annotation (extent=[-110,85; -100,95]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal ConsigneNiveauEau 
    annotation (extent=[-110,-65; -100,-55]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal SortieReelle1 
    annotation (extent=[100,-95; 110,-85]);
  
  ThermoSysPro.InstrumentationAndControl.Blocks.Continu.PIsat pIsat(
    permanent=true,
    ureset0=0.8,
    k=k,
    Ti=Ti,
    minval=minval) 
    annotation (extent=[-39,-80; 19,-33],  rotation=270);
  ThermoSysPro.InstrumentationAndControl.Blocks.Continu.PT1 pT1_1(                              permanent=true,
    U0=1.1,
    Ti=10) 
    annotation (extent=[-13,69; 18,99]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Math.Add add(                          k1=-1, k2=+1) 
                                          annotation (extent=[48,53; 83,92]);
equation 
  connect(pIsat.y, SortieReelle1)  annotation (points=[-10,-82.35; -10,-90; 105,
        -90],          style(color=1, rgbcolor={255,0,0}));
  connect(MesureNiveauEau, pT1_1.u) annotation (points=[-105,90; -38,90; -38,84;
        -14.55,84], style(color=42, rgbcolor={127,0,0}));
  connect(ConsigneNiveauEau, add.u2) annotation (points=[-105,-60; -68,-60; -68,
        42; 35,42; 35,60.8; 46.25,60.8]);
  connect(pT1_1.y, add.u1) 
    annotation (points=[19.55,84; 32.9,84; 32.9,84.2; 46.25,84.2]);
  connect(add.y, pIsat.u) 
    annotation (points=[84.75,72.5; 96,72.5; 96,-30.65; -10,-30.65]);
end Drum_LevelControl;
