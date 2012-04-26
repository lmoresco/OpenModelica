within ThermoSysPro.Examples.SimpleExamples;
model TestFlueGasesVolumes1 
  
  annotation (Diagram);
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss 
    singularPressureLossFlueGases1 annotation (extent=[-60,-60; -40,-40]);
  ThermoSysPro.FlueGases.BoundaryConditions.SourceP sourceFlueGasesP 
    annotation (extent=[-100,-60; -80,-40]);
  ThermoSysPro.FlueGases.BoundaryConditions.SinkP sinkFlueGasesP 
    annotation (extent=[60,-60; 80,-40]);
  ThermoSysPro.FlueGases.Volumes.VolumeATh volumeFlueGasesATh 
    annotation (extent=[-20,-60; 0,-40]);
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss 
    singularPressureLossFlueGases2 annotation (extent=[20,-60; 40,-40]);
  ThermoSysPro.FlueGases.BoundaryConditions.SinkP sinkFlueGasesP1 
    annotation (extent=[60,-100; 80,-80]);
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss 
    singularPressureLossFlueGases4 annotation (extent=[20,-100; 40,-80]);
  ThermoSysPro.FlueGases.Volumes.VolumeCTh volumeFlueGasesCTh 
    annotation (extent=[-20,20; 0,40], rotation=-90);
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss 
    singularPressureLossFlueGases3 annotation (extent=[-20,0; 0,-20], rotation=
        90);
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss 
    singularPressureLossFlueGases5 annotation (extent=[-60,20; -40,40]);
  ThermoSysPro.FlueGases.BoundaryConditions.SourceP sourceFlueGasesP1 
    annotation (extent=[-100,20; -80,40]);
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss 
    singularPressureLossFlueGases6 annotation (extent=[-60,60; -40,80]);
  ThermoSysPro.FlueGases.BoundaryConditions.SourceP sourceFlueGasesP2 
    annotation (extent=[-100,60; -80,80]);
equation 
  connect(sourceFlueGasesP.C, singularPressureLossFlueGases1.C1) annotation (
      points=[-80,-50; -60,-50],
                               style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(singularPressureLossFlueGases1.C2, volumeFlueGasesATh.Ce1) 
    annotation (points=[-40,-50; -20,-50], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(singularPressureLossFlueGases2.C2, sinkFlueGasesP.C) annotation (
      points=[40,-50; 60.2,-50], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(singularPressureLossFlueGases4.C2, sinkFlueGasesP1.C) annotation (
      points=[40,-90; 60.2,-90], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(volumeFlueGasesATh.Cs1, singularPressureLossFlueGases2.C1) 
    annotation (points=[0,-50; 20,-50], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(volumeFlueGasesATh.Cs2, singularPressureLossFlueGases4.C1) 
    annotation (points=[-10,-60; -10,-90; 20,-90], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(volumeFlueGasesCTh.Cs, singularPressureLossFlueGases3.C1) annotation (
     points=[-10,20; -10,0], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(singularPressureLossFlueGases3.C2, volumeFlueGasesATh.Ce2) 
    annotation (points=[-10,-20; -10,-40], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(sourceFlueGasesP1.C, singularPressureLossFlueGases5.C1) 
                                                                 annotation (
      points=[-80,30; -60,30], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(singularPressureLossFlueGases5.C2, volumeFlueGasesCTh.Ce3) 
    annotation (points=[-40,30; -20,30], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(sourceFlueGasesP2.C, singularPressureLossFlueGases6.C1) 
                                                                 annotation (
      points=[-80,70; -60,70], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(singularPressureLossFlueGases6.C2, volumeFlueGasesCTh.Ce1) 
    annotation (points=[-40,70; -10,70; -10,40], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
end TestFlueGasesVolumes1;
