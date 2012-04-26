within ThermoSysPro.Examples.SimpleExamples;
model TestLumpedStraightPipe 
  
  annotation (Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]), Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Diagram);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP SourceP1 
    annotation (extent=[-100,20; -80,40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsP1 
                                          annotation (extent=[60,20; 80,40]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe lumpedStraightPipe 
                                          annotation (extent=[-20,20; 0,40]);
  ThermoSysPro.WaterSteam.Volumes.Tank tank annotation (extent=[-60,-40; -40,-20]);
  ThermoSysPro.WaterSteam.Volumes.Tank tank1(z0=10) annotation (extent=[20,-40; 40,-20]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe lumpedStraightPipe1(inertia=
        true, lambda_fixed=false)         annotation (extent=[-20,-80; 0,-60]);
equation 
  connect(lumpedStraightPipe.C2, PuitsP1.C) 
    annotation (points=[0,30; 60,30],                        style(color=3));
  connect(SourceP1.C, lumpedStraightPipe.C1) 
    annotation (points=[-80,30; -20,30], style(color=3, rgbcolor={0,0,255}));
  connect(tank.Cs2, lumpedStraightPipe1.C1) annotation (points=[-40,-36; -30,-36;
        -30,-70; -20,-70], style(color=3, rgbcolor={0,0,255}));
  connect(lumpedStraightPipe1.C2, tank1.Ce2) annotation (points=[0,-70; 10,-70;
        10,-36; 20,-36], style(color=3, rgbcolor={0,0,255}));
end TestLumpedStraightPipe;
