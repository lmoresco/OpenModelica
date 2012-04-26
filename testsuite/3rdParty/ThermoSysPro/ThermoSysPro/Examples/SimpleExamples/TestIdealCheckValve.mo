within ThermoSysPro.Examples.SimpleExamples;
model TestIdealCheckValve 
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram,
    Window(
      x=0.28,
      y=0.03,
      width=0.5,
      height=0.6));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP 
                                    annotation (extent=[-104,20; -84,40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP(
                                  P0=6e5) annotation (extent=[84,20; 104,40]);
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump staticCentrifugalPump1 
    annotation (extent=[-30,60; -10,80]);
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump staticCentrifugalPump2 
    annotation (extent=[-30,-20; -10,0]);
  ThermoSysPro.WaterSteam.Volumes.VolumeD volumeD annotation (extent=[-50,20; -30,40]);
  ThermoSysPro.WaterSteam.PressureLosses.IdealCheckValve idealCheckValve1 
    annotation (extent=[10,60; 30,80]);
  ThermoSysPro.WaterSteam.PressureLosses.IdealCheckValve idealCheckValve2 
    annotation (extent=[8,-20; 28,0]);
  ThermoSysPro.WaterSteam.Volumes.VolumeC volumeC annotation (extent=[30,20; 50,40]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe perteDP 
                                        annotation (extent=[-80,20; -60,40]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe perteDP1 
                                         annotation (extent=[60,20; 80,40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1 
                                     annotation (extent=[-60,-80; -40,-60]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP1(
                                   P0=6e5) annotation (extent=[80,-80; 100,-60]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Pulse pulse(
    amplitude=6e5,
    width=50,
    period=100,
    offset=3e5) annotation (extent=[-100,-80; -80,-60]);
  ThermoSysPro.WaterSteam.PressureLosses.IdealCheckValve idealCheckValve3 
    annotation (extent=[10,-80; 30,-60]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe perteDP2 
                                        annotation (extent=[-30,-80; -10,-60]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe perteDP3 
                                        annotation (extent=[50,-80; 70,-60]);
equation 
  connect(volumeD.Cs1, staticCentrifugalPump1.C1) annotation (points=[-40,40;
        -40,70; -30,70], style(color=3, rgbcolor={0,0,255}));
  connect(volumeD.Cs2, staticCentrifugalPump2.C1) annotation (points=[-40,20.2;
        -40,-10; -30,-10], style(color=3, rgbcolor={0,0,255}));
  connect(staticCentrifugalPump1.C2, idealCheckValve1.C1) annotation (points=[-10,70;
        -2,70; -2,70; 10,70],            style(color=3, rgbcolor={0,0,255}));
  connect(idealCheckValve1.C2, volumeC.Ce2) annotation (points=[30,70; 40,70;
        40,39], style(color=3, rgbcolor={0,0,255}));
  connect(idealCheckValve2.C2, volumeC.Ce3) annotation (points=[28,-10; 40,-10;
        40,20], style(color=3, rgbcolor={0,0,255}));
  connect(staticCentrifugalPump2.C2, idealCheckValve2.C1) annotation (points=[-10,-10;
        0,-10; 0,-10; 8,-10],              style(color=3, rgbcolor={0,0,255}));
  connect(perteDP.C2, volumeD.Ce) 
    annotation (points=[-60,30; -50,30], style(color=3, rgbcolor={0,0,255}));
  connect(volumeC.Cs, perteDP1.C1) 
    annotation (points=[50,30; 60,30], style(color=3, rgbcolor={0,0,255}));
  connect(perteDP1.C2, puitsP.C) 
    annotation (points=[80,30; 84,30], style(color=3, rgbcolor={0,0,255}));
  connect(sourceP.C, perteDP.C1) 
    annotation (points=[-84,30; -80,30], style(color=3, rgbcolor={0,0,255}));
  connect(sourceP1.C, perteDP2.C1) 
    annotation (points=[-40,-70; -30,-70], style(color=3, rgbcolor={0,0,255}));
  connect(perteDP2.C2, idealCheckValve3.C1) 
    annotation (points=[-10,-70; 10,-70],style(color=3, rgbcolor={0,0,255}));
  connect(idealCheckValve3.C2, perteDP3.C1) 
    annotation (points=[30,-70; 50,-70], style(color=3, rgbcolor={0,0,255}));
  connect(perteDP3.C2, puitsP1.C) 
    annotation (points=[70,-70; 80,-70], style(color=3, rgbcolor={0,0,255}));
  connect(pulse.y, sourceP1.IPressure) annotation (points=[-79,-70; -55,-70],
      style(
      fillColor=44,
      rgbfillColor={255,170,170},
      fillPattern=1));
end TestIdealCheckValve;
