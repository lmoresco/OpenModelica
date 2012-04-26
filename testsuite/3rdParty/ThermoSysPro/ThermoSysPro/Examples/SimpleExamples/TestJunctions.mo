within ThermoSysPro.Examples.SimpleExamples;
model TestJunctions 
  
  ThermoSysPro.WaterSteam.Junctions.Splitter2 splitter2 
    annotation (extent=[-20,40; 0,60]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ sourceP(Q0=200) 
    annotation (extent=[-100,40; -80,60]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss annotation (extent=[-60,40; -40,60]);
  annotation (Diagram);
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sinkP 
    annotation (extent=[80,80; 100,100]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP1 
    annotation (extent=[80,0; 100,20]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss1 annotation (extent=[40,80; 60,100]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss2 annotation (extent=[40,0; 60,20]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante(k=
        0.5) annotation (extent=[-40,60; -20,80]);
  ThermoSysPro.WaterSteam.Junctions.Splitter3 splitter3 
    annotation (extent=[-20,-60; 0,-40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ sourceP1(Q0=400) 
    annotation (extent=[-100,-60; -80,-40]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss3 annotation (extent=[-60,-60; -40,-40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sinkP2 
    annotation (extent=[80,-20; 100,0]);
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sinkP3 
    annotation (extent=[80,-100; 100,-80]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss4 annotation (extent=[40,-20; 60,0]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss5 annotation (extent=[40,-100; 60,-80]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante1(k=
        0) annotation (extent=[-40,-40; -20,-20]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP4 
    annotation (extent=[80,-60; 100,-40]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante2(k=
        0) annotation (extent=[-40,-80; -20,-60]);
equation 
  connect(sourceP.C, singularPressureLoss.C1) 
    annotation (points=[-80,50; -60,50], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss.C2, splitter2.Ce) 
    annotation (points=[-40,50; -20,50], style(color=3, rgbcolor={0,0,255}));
  connect(splitter2.Cs1, singularPressureLoss1.C1) annotation (points=[-6,60;
        -6,90; 40,90], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss1.C2, sinkP.C) 
    annotation (points=[60,90; 80,90], style(color=3, rgbcolor={0,0,255}));
  connect(splitter2.Cs2, singularPressureLoss2.C1) annotation (points=[-6,40;
        -6,10; 40,10], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss2.C2, sinkP1.C) 
    annotation (points=[60,10; 80,10], style(color=3, rgbcolor={0,0,255}));
  connect(constante.y, splitter2.Ialpha1) 
    annotation (points=[-19,70; -14,70; -14,56; -9,56]);
  connect(sourceP1.C, singularPressureLoss3.C1) 
    annotation (points=[-80,-50; -60,-50], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss3.C2, splitter3.Ce) annotation (points=[-40,-50;
        -19.8,-50], style(color=3, rgbcolor={0,0,255}));
  connect(splitter3.Cs1, singularPressureLoss4.C1) annotation (points=[-6,-40;
        -6,-10; 40,-10], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss4.C2, sinkP2.C) 
    annotation (points=[60,-10; 80,-10], style(color=3, rgbcolor={0,0,255}));
  connect(splitter3.Cs2, singularPressureLoss5.C1) annotation (points=[-6,-60;
        -6,-90; 40,-90], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss5.C2, sinkP3.C) 
    annotation (points=[60,-90; 80,-90], style(color=3, rgbcolor={0,0,255}));
  connect(constante1.y, splitter3.Ialpha1) 
    annotation (points=[-19,-30; -14,-30; -14,-44; -9,-44]);
  connect(splitter3.Cs3, sinkP4.C) 
    annotation (points=[0,-50; 80,-50], style(color=3, rgbcolor={0,0,255}));
  connect(splitter3.Ialpha2, constante2.y) 
    annotation (points=[-9,-56; -14,-56; -14,-70; -19,-70]);
end TestJunctions;
