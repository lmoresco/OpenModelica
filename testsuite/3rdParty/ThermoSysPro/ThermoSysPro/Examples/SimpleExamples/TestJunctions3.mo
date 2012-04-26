within ThermoSysPro.Examples.SimpleExamples;
model TestJunctions3 
  
  annotation (Diagram);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP 
                                           annotation (extent=[-104,0; -84,20]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1(                 P0=2e5) 
    annotation (extent=[-104,-60; -84,-40]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve valve1 
    annotation (extent=[-10,6; 10,26]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve valve2 
    annotation (extent=[-10,-54; 10,-34]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve valve3 
    annotation (extent=[50,-24; 70,-4]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP2 
                                          annotation (extent=[82,-30; 102,-10]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe2(
    Duration=1,
    Initialvalue=1,
    Finalvalue=0) annotation (extent=[32,20; 52,40]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe3(
                                    Initialvalue=1,
    Starttime=2,
    Finalvalue=0) 
    annotation (extent=[-30,30; -10,50]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe4(
                                    Initialvalue=1,
    Starttime=1,
    Finalvalue=0) 
    annotation (extent=[-30,-30; -10,-10]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe pipe1 
    annotation (extent=[-80,0; -60,20]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe pipe2 
    annotation (extent=[-80,-60; -60,-40]);
  ThermoSysPro.WaterSteam.Junctions.Mixer8 staticVolume 
    annotation (extent=[-40,0; -20,20]);
  ThermoSysPro.WaterSteam.Junctions.Mixer8 staticVolume1 
    annotation (extent=[20,-30; 40,-10]);
  ThermoSysPro.WaterSteam.Junctions.Mixer8 staticVolume2 
    annotation (extent=[-40,-60; -20,-40]);
equation 
  connect(valve3.C2, puitsP2.C)         annotation (points=[70,-20; 82,-20],
                     style(color=3, rgbcolor={0,0,255}));
  connect(rampe2.y, valve3.Ouv) 
    annotation (points=[53,30; 60,30; 60,-3]);
  connect(rampe3.y, valve1.Ouv)         annotation (points=[-9,40; 0,40; 0,27]);
  connect(rampe4.y, valve2.Ouv)         annotation (points=[-9,-20; 0,-20; 0,
        -33]);
  connect(sourceP.C, pipe1.C1) 
    annotation (points=[-84,10; -80,10], style(color=3, rgbcolor={0,0,255}));
  connect(sourceP1.C, pipe2.C1) 
    annotation (points=[-84,-50; -80,-50], style(color=3, rgbcolor={0,0,255}));
  connect(pipe1.C2, staticVolume.Ce4) annotation (points=[-60,10; -50,10; -50,14;
        -40.2,14], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=3,
      rgbfillColor={0,0,255},
      fillPattern=1));
  connect(staticVolume.Cs, valve1.C1) annotation (points=[-20,10; -10,10],
      style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=3,
      rgbfillColor={0,0,255},
      fillPattern=1));
  connect(staticVolume1.Cs, valve3.C1) annotation (points=[40,-20; 50,-20],
      style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=3,
      rgbfillColor={0,0,255},
      fillPattern=1));
  connect(valve1.C2, staticVolume1.Ce1) annotation (points=[10,10; 33,10; 33,
        -9.8], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=3,
      rgbfillColor={0,0,255},
      fillPattern=1));
  connect(valve2.C2, staticVolume1.Ce8) annotation (points=[10,-50; 33,-50; 33,
        -29.9], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=3,
      rgbfillColor={0,0,255},
      fillPattern=1));
  connect(pipe2.C2, staticVolume2.Ce4) annotation (points=[-60,-50; -50,-50;
        -50,-46; -40.2,-46], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=3,
      rgbfillColor={0,0,255},
      fillPattern=1));
  connect(staticVolume2.Cs, valve2.C1) annotation (points=[-20,-50; -10,-50],
      style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=3,
      rgbfillColor={0,0,255},
      fillPattern=1));
end TestJunctions3;
