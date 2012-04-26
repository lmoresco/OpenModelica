within ThermoSysPro.Examples.SimpleExamples;
model TestFlueGasesJunctions 
  
  ThermoSysPro.FlueGases.Junctions.Splitter2 splitter2 
    annotation (extent=[-20,40; 0,60]);
  ThermoSysPro.FlueGases.BoundaryConditions.SourceQ sourceP( Q0=200) 
    annotation (extent=[-100,40; -80,60]);
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss 
    singularPressureLoss annotation (extent=[-60,40; -40,60]);
  annotation (Diagram);
  ThermoSysPro.FlueGases.BoundaryConditions.Sink sinkP 
    annotation (extent=[80,80; 100,100]);
  ThermoSysPro.FlueGases.BoundaryConditions.SinkP sinkP1 
    annotation (extent=[80,0; 100,20]);
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss 
    singularPressureLoss1 annotation (extent=[40,80; 60,100]);
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss 
    singularPressureLoss2 annotation (extent=[40,0; 60,20]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante(k=0) 
             annotation (extent=[-40,60; -20,80]);
  ThermoSysPro.FlueGases.Junctions.Mixer2 mixer2_1 
    annotation (extent=[-20,-60; 0,-40]);
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss 
    singularPressureLoss3 
                         annotation (extent=[20,-60; 40,-40]);
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss 
    singularPressureLoss4 annotation (extent=[-60,-40; -40,-20]);
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss 
    singularPressureLoss5 annotation (extent=[-60,-80; -40,-60]);
  ThermoSysPro.FlueGases.BoundaryConditions.Source sourceP1 
    annotation (extent=[-100,-40; -80,-20]);
  ThermoSysPro.FlueGases.BoundaryConditions.SourceP sourceP2 
    annotation (extent=[-100,-80; -80,-60]);
  ThermoSysPro.FlueGases.BoundaryConditions.SinkQ sinkP2 
    annotation (extent=[60,-60; 80,-40]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante1(k=0.5) 
             annotation (extent=[-60,-60; -40,-40]);
equation 
  connect(constante.y, splitter2.Ialpha1) 
    annotation (points=[-19,70; -14,70; -14,56; -9,56]);
  connect(constante1.y, mixer2_1.Ialpha1) 
    annotation (points=[-39,-50; -28,-50; -28,-44; -17,-44]);
  connect(sourceP.C, singularPressureLoss.C1) annotation (points=[-80,50; -60,
        50], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(singularPressureLoss.C2, splitter2.Ce) annotation (points=[-40,50;
        -20,50], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(splitter2.Cs1, singularPressureLoss1.C1) annotation (points=[-6,60;
        -6,90; 40,90], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(splitter2.Cs2, singularPressureLoss2.C1) annotation (points=[-6,40;
        -6,10; 40,10], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(singularPressureLoss1.C2, sinkP.C) annotation (points=[60,90; 80.2,90],
      style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(singularPressureLoss2.C2, sinkP1.C) annotation (points=[60,10; 80.2,
        10], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(sourceP1.C, singularPressureLoss4.C1) annotation (points=[-80,-30;
        -60,-30], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(singularPressureLoss4.C2, mixer2_1.Ce1) annotation (points=[-40,-30;
        -14,-30; -14,-40], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(mixer2_1.Ce2, singularPressureLoss5.C2) annotation (points=[-14,-60;
        -14,-70; -40,-70], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(mixer2_1.Cs, singularPressureLoss3.C1) annotation (points=[0,-50; 20,
        -50], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(singularPressureLoss3.C2, sinkP2.C) annotation (points=[40,-50; 60.2,
        -50], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(sourceP2.C, singularPressureLoss5.C1) annotation (points=[-80,-70;
        -60,-70], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
end TestFlueGasesJunctions;
