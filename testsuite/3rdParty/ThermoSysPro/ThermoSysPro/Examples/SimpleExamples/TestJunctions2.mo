within ThermoSysPro.Examples.SimpleExamples;
model TestJunctions2 
  
  ThermoSysPro.WaterSteam.Junctions.Mixer2 mixer2_1 
    annotation (extent=[0,60; 20,80]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss annotation (extent=[40,60; 60,80]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss1 annotation (extent=[-40,80; -20,100]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss2 annotation (extent=[-40,40; -20,60]);
  annotation (Diagram);
  ThermoSysPro.WaterSteam.BoundaryConditions.Source sourceP 
    annotation (extent=[-80,80; -60,100]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1 
    annotation (extent=[-80,40; -60,60]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkQ sinkP 
    annotation (extent=[80,60; 100,80]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante(k=0) 
             annotation (extent=[-40,60; -20,80]);
  ThermoSysPro.WaterSteam.Junctions.Mixer3 mixer2_2 
    annotation (extent=[0,-60; 20,-40]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss3 annotation (extent=[40,-60; 60,-40]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss4 annotation (extent=[-40,-40; -20,-20]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss5 annotation (extent=[-40,-80; -20,-60]);
  ThermoSysPro.WaterSteam.BoundaryConditions.Source sourceP2 
    annotation (extent=[-80,-40; -60,-20]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP3 
    annotation (extent=[-80,-80; -60,-60]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkQ sinkP1 
    annotation (extent=[80,-60; 100,-40]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante1(k=
        0.5) annotation (extent=[-40,-20; -20,0]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ sourceQ 
    annotation (extent=[-80,-60; -60,-40]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss6 annotation (extent=[-40,-60; -20,-40]);
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier massFlowMultiplier(alpha=
       2) annotation (extent=[0,20; 20,40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ sourceQ1 
    annotation (extent=[-80,20; -60,40]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss7 annotation (extent=[-40,20; -20,40]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss8 annotation (extent=[40,20; 60,40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP2 
    annotation (extent=[80,20; 100,40]);
equation 
  connect(singularPressureLoss1.C2, mixer2_1.Ce1) annotation (points=[-20,90; 6,
        90; 6,80], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss2.C2, mixer2_1.Ce2) annotation (points=[-20,50; 6,
        50; 6,60], style(color=3, rgbcolor={0,0,255}));
  connect(mixer2_1.Cs, singularPressureLoss.C1) 
    annotation (points=[20,70; 40,70], style(color=3, rgbcolor={0,0,255}));
  connect(sourceP.C, singularPressureLoss1.C1) 
    annotation (points=[-60,90; -40,90], style(color=3, rgbcolor={0,0,255}));
  connect(sourceP1.C, singularPressureLoss2.C1) 
    annotation (points=[-60,50; -40,50], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss.C2, sinkP.C) 
    annotation (points=[60,70; 80,70], style(color=3, rgbcolor={0,0,255}));
  connect(constante.y, mixer2_1.Ialpha1) 
    annotation (points=[-19,70; -8,70; -8,76; 3,76]);
  connect(singularPressureLoss4.C2, mixer2_2.Ce1) annotation (points=[-20,-30;
        6,-30; 6,-40], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss5.C2, mixer2_2.Ce2) annotation (points=[-20,-70;
        6,-70; 6,-60], style(color=3, rgbcolor={0,0,255}));
  connect(mixer2_2.Cs, singularPressureLoss3.C1) 
    annotation (points=[20,-50; 40,-50], style(color=3, rgbcolor={0,0,255}));
  connect(sourceP2.C, singularPressureLoss4.C1) 
    annotation (points=[-60,-30; -40,-30], style(color=3, rgbcolor={0,0,255}));
  connect(sourceP3.C, singularPressureLoss5.C1) 
    annotation (points=[-60,-70; -40,-70], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss3.C2, sinkP1.C) 
    annotation (points=[60,-50; 80,-50], style(color=3, rgbcolor={0,0,255}));
  connect(sourceQ.C, singularPressureLoss6.C1) 
    annotation (points=[-60,-50; -40,-50], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss6.C2, mixer2_2.Ce3) annotation (points=[-20,-50;
        -10,-50; -10,-50; 0,-50], style(color=3, rgbcolor={0,0,255}));
  connect(constante1.y, mixer2_2.Ialpha1) 
    annotation (points=[-19,-10; -8,-10; -8,-44; 3,-44]);
  connect(sourceQ1.C, singularPressureLoss7.C1) 
    annotation (points=[-60,30; -40,30], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss7.C2, massFlowMultiplier.Ce) 
    annotation (points=[-20,30; 0,30], style(color=3, rgbcolor={0,0,255}));
  connect(massFlowMultiplier.Cs, singularPressureLoss8.C1) 
    annotation (points=[20,30; 40,30], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss8.C2, sinkP2.C) 
    annotation (points=[60,30; 80,30], style(color=3, rgbcolor={0,0,255}));
end TestJunctions2;
