within ThermoSysPro.Examples.SimpleExamples;
model TestWaterHammer 
  
  annotation (Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]), Window(
      x=0.17,
      y=0.16,
      width=0.6,
      height=0.6),
    Diagram);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP PSource1(P0=3000000) 
                                                    annotation (extent=[-100,
        -20; -80, 0]);
  ThermoSysPro.WaterSteam.PressureLosses.WaterHammer waterHammer(
    L=600,
    D=0.5,
    lambda=0.018,
    a=1200) annotation (extent=[-60,-20; -40,0]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PSink1(P0=2400000) 
                                   annotation (extent=[60, -20; 80, 0]);
  WaterSteam.PressureLosses.ControlValve             VanneTORC1(
      continuous_flow_reversal=true)                               annotation (
      extent=[20,-14; 40,6]);
  InstrumentationAndControl.Blocks.Sources.Rampe rampe(
    Initialvalue=1,
    Finalvalue=0.01,
    Duration=0.15)  annotation (extent=[-40,20; -20,40]);
  WaterSteam.Volumes.VolumeA volumeA annotation (extent=[-20,-20; 0,0]);
equation 
  connect(PSource1.C, waterHammer.C1) 
                                  annotation (points=[-80,-10; -60,-10],
      style(color=3));
  connect(VanneTORC1.C2, PSink1.C)  annotation (points=[40,-10; 60,-10],
      style(color=3));
  connect(rampe.y, VanneTORC1.Ouv) 
    annotation (points=[-19,30; 30,30; 30,7], style(smooth=0));
  connect(waterHammer.C2, volumeA.Ce1) annotation (points=[-40,-10; -20,-10],
      style(
      color=3,
      rgbcolor={0,0,255},
      smooth=0));
  connect(volumeA.Cs1, VanneTORC1.C1) annotation (points=[0,-10; 20,-10], style(
      color=3,
      rgbcolor={0,0,255},
      smooth=0));
end TestWaterHammer;
