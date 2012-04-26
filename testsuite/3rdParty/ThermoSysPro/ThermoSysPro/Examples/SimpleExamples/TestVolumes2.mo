within ThermoSysPro.Examples.SimpleExamples;
model TestVolumes2 
  
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP 
    annotation (extent=[-98,40; -78,60]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1 
    annotation (extent=[-100,-100; -80,-80]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe lumpedStraightPipe 
    annotation (extent=[-70,40; -50,60]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe lumpedStraightPipe1 
    annotation (extent=[-70,-100; -50,-80]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve controlValve 
    annotation (extent=[-56,-20; -36,0], rotation=90);
  annotation (Diagram);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve controlValve1 
    annotation (extent=[-56,-80; -36,-60], rotation=90);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve controlValve2 
    annotation (extent=[-20,16; 0,36]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve controlValve3 
    annotation (extent=[20,16; 40,36]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve controlValve4 
    annotation (extent=[0,-44; 20,-24]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP 
    annotation (extent=[40,-50; 60,-30]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe lumpedStraightPipe2 
    annotation (extent=[50,10; 70,30]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP1 
    annotation (extent=[80,10; 100,30]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe V4(Starttime=4, Duration=
       2)         annotation (extent=[-40,60; -20,80]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe V5(Initialvalue=1) 
    annotation (extent=[0,60; 20,80]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe V3(
    Initialvalue=1,
    Finalvalue=0,
    Starttime=4,
    Duration=3) annotation (extent=[-20,-20; 0,0]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe V1 
    annotation (extent=[-100,-20; -80,0]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe V2 
    annotation (extent=[-100,-80; -80,-60]);
  ThermoSysPro.WaterSteam.Volumes.VolumeC volumeC(V=1e-18) 
    annotation (extent=[-50,10; -30,30]);
  ThermoSysPro.WaterSteam.Volumes.VolumeA volumeA(V=1e-18) 
    annotation (extent=[-50,-30; -30,-50]);
equation 
  connect(sourceP.C, lumpedStraightPipe.C1) 
    annotation (points=[-78,50; -70,50], style(color=3, rgbcolor={0,0,255}));
  connect(sourceP1.C, lumpedStraightPipe1.C1) 
    annotation (points=[-80,-90; -70,-90], style(color=3, rgbcolor={0,0,255}));
  connect(lumpedStraightPipe1.C2, controlValve1.C1) annotation (points=[-50,-90;
        -40,-90; -40,-80], style(color=3, rgbcolor={0,0,255}));
  connect(controlValve4.C2, sinkP.C) 
    annotation (points=[20,-40; 40,-40], style(color=3, rgbcolor={0,0,255}));
  connect(controlValve2.C2, controlValve3.C1) 
    annotation (points=[0,20; 20,20], style(color=3, rgbcolor={0,0,255}));
  connect(controlValve3.C2, lumpedStraightPipe2.C1) 
    annotation (points=[40,20; 50,20], style(color=3, rgbcolor={0,0,255}));
  connect(lumpedStraightPipe2.C2, sinkP1.C) 
    annotation (points=[70,20; 80,20], style(color=3, rgbcolor={0,0,255}));
  connect(V4.y, controlValve2.Ouv) annotation (points=[-19,70; -10,70; -10,37]);
  connect(V5.y, controlValve3.Ouv) annotation (points=[21,70; 30,70; 30,37]);
  connect(V3.y, controlValve4.Ouv) annotation (points=[1,-10; 10,-10; 10,-23]);
  connect(V1.y, controlValve.Ouv) annotation (points=[-79,-10; -57,-10]);
  connect(V2.y, controlValve1.Ouv) annotation (points=[-79,-70; -57,-70]);
  connect(volumeC.Cs, controlValve2.C1) 
    annotation (points=[-30,20; -20,20], style(color=3, rgbcolor={0,0,255}));
  connect(lumpedStraightPipe.C2, volumeC.Ce2) annotation (points=[-50,50; -40,
        50; -40,29], style(color=3, rgbcolor={0,0,255}));
  connect(volumeC.Ce3, controlValve.C2) annotation (points=[-40,10; -40,0]);
  connect(controlValve.C1, volumeA.Cs2) annotation (points=[-40,-20; -40,-30]);
  connect(volumeA.Cs1, controlValve4.C1) 
    annotation (points=[-30,-40; 0,-40], style(color=3, rgbcolor={0,0,255}));
  connect(volumeA.Ce2, controlValve1.C2) 
    annotation (points=[-40,-49.8; -40,-60]);
end TestVolumes2;
