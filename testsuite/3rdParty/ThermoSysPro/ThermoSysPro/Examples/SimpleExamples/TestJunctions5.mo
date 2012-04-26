within ThermoSysPro.Examples.SimpleExamples;
model TestJunctions5 
  
  annotation (Diagram);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP 
                                           annotation (extent=[-104,0; -84,20]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1(
                                            P0=2e5) 
    annotation (extent=[-104,-60; -84,-40]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve valve1 
    annotation (extent=[-10,66; 10,86]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP 
                                         annotation (extent=[20,60; 40,80]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve valve4 
    annotation (extent=[-10,-94; 10,-74]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP1 
                                          annotation (extent=[20,-100; 40,-80]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe(
      Initialvalue=0.5)            annotation (extent=[-30,80; -10,100]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe1(
      Initialvalue=0.5)             annotation (extent=[-30,-80; -10,-60]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve valve2 
    annotation (extent=[-10,6; 10,26]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve valve3 
    annotation (extent=[-10,-54; 10,-34]);
  ThermoSysPro.WaterSteam.Volumes.VolumeB volumeB1(dynamic_mass_balance=true) 
    annotation (extent=[20,-30; 40,-10], rotation=90);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve valve5 
    annotation (extent=[50,-24; 70,-4]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP2 
                                          annotation (extent=[82,-30; 102,-10]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe2(
    Duration=1,
    Initialvalue=1,
    Finalvalue=0) annotation (extent=[32,20; 52,40]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe3(Initialvalue=1, Finalvalue=0) 
    annotation (extent=[-30,30; -10,50]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe4(Initialvalue=1, Finalvalue=0) 
    annotation (extent=[-30,-30; -10,-10]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe pipe1(lambda=0) 
    annotation (extent=[-80,0; -60,20]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe pipe2(lambda=0) 
    annotation (extent=[-80,-60; -60,-40]);
  ThermoSysPro.WaterSteam.Junctions.Splitter2 splitter2_1 
    annotation (extent=[-50,0; -30,20]);
  ThermoSysPro.WaterSteam.Junctions.Splitter2 splitter2_2 
    annotation (extent=[-50,-60; -30,-40]);
equation 
  connect(valve4.C2, puitsP1.C)         annotation (points=[10,-90; 20,-90],
                 style(color=3, rgbcolor={0,0,255}));
  connect(rampe.y, valve1.Ouv)        annotation (points=[-9,90; 0,90; 0,87]);
  connect(rampe1.y, valve4.Ouv) 
    annotation (points=[-9,-70; 0,-70; 0,-73]);
  connect(valve5.C2, puitsP2.C)         annotation (points=[70,-20; 82,-20],
                     style(color=3, rgbcolor={0,0,255}));
  connect(rampe2.y, valve5.Ouv) 
    annotation (points=[53,30; 60,30; 60,-3]);
  connect(rampe3.y, valve2.Ouv)         annotation (points=[-9,40; 0,40; 0,27]);
  connect(rampe4.y, valve3.Ouv)         annotation (points=[-9,-20; 0,-20; 0,
        -33]);
  connect(sourceP.C, pipe1.C1) 
    annotation (points=[-84,10; -80,10], style(color=3, rgbcolor={0,0,255}));
  connect(sourceP1.C, pipe2.C1) 
    annotation (points=[-84,-50; -80,-50], style(color=3, rgbcolor={0,0,255}));
  connect(valve2.C2, volumeB1.Ce2)         annotation (points=[10,10; 30,10; 30,
        -10],                  style(color=3, rgbcolor={0,0,255}));
  connect(valve3.C2, volumeB1.Ce1)         annotation (points=[10,-50; 30,-50;
        30,-30],                        style(color=3, rgbcolor={0,0,255}));
  connect(volumeB1.Cs2, valve5.C1) 
    annotation (points=[39.8,-20; 50,-20], style(color=3, rgbcolor={0,0,255}));
  connect(valve1.C2, puitsP.C)        annotation (points=[10,70; 20,70],
                    style(color=3, rgbcolor={0,0,255}));
  connect(pipe1.C2, splitter2_1.Ce) 
    annotation (points=[-60,10; -50,10], style(color=3, rgbcolor={0,0,255}));
  connect(splitter2_1.Cs1, valve1.C1) annotation (points=[-36,20; -36,70; -10,
        70], style(color=3, rgbcolor={0,0,255}));
  connect(splitter2_1.Cs2, valve2.C1) annotation (points=[-36,0; -36,-4; -20,-4;
        -20,10; -10,10], style(color=3, rgbcolor={0,0,255}));
  connect(pipe2.C2, splitter2_2.Ce) 
    annotation (points=[-60,-50; -50,-50], style(color=3, rgbcolor={0,0,255}));
  connect(splitter2_2.Cs1, valve3.C1) annotation (points=[-36,-40; -36,-36; -20,
        -36; -20,-50; -10,-50], style(color=3, rgbcolor={0,0,255}));
  connect(splitter2_2.Cs2, valve4.C1) annotation (points=[-36,-60; -36,-90; -10,
        -90], style(color=3, rgbcolor={0,0,255}));
end TestJunctions5;
