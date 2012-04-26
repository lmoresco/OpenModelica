within ThermoSysPro.Examples.SimpleExamples;
model TestTank 
  
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe PerteDP1 
    annotation (extent=[20,-40; 40,-20]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve VanneReglante1 
    annotation (extent=[-60,12; -40,32]);
  annotation (Diagram);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP SourceP1 
                                            annotation (extent=[-100,6; -80,26]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsP1 
                                          annotation (extent=[60,-40; 80,-20]);
  ThermoSysPro.WaterSteam.Volumes.Tank Tank1(z(fixed=false, start=5)) 
    annotation (extent=[-20,0; 0,20]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe Rampe1 
    annotation (extent=[-100,40; -80,60]);
equation 
  connect(PerteDP1.C2, PuitsP1.C) 
    annotation (points=[40,-30; 60,-30], style(color=3, rgbcolor={0,0,255}));
  connect(SourceP1.C, VanneReglante1.C1) 
    annotation (points=[-80,16; -60,16], style(color=3, rgbcolor={0,0,255}));
  connect(Tank1.Cs2, PerteDP1.C1)  annotation (points=[0,4; 10,4; 10,-30; 20,
        -30], style(color=3, rgbcolor={0,0,255}));
  connect(Rampe1.y, VanneReglante1.Ouv) 
    annotation (points=[-79,50; -50,50; -50,33]);
  connect(VanneReglante1.C2, Tank1.Ce1) annotation (points=[-40,16; -30,16; -30,
        16; -20,16],     style(color=3, rgbcolor={0,0,255}));
end TestTank;
