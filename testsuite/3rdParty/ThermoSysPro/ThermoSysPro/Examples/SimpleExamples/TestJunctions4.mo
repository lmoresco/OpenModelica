within ThermoSysPro.Examples.SimpleExamples;
model TestJunctions4 
  
  ThermoSysPro.WaterSteam.Junctions.DeheaterMixer2 deheaterMixer2_1(Tmax=308) 
    annotation (extent=[-20,20; 0,40]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss annotation (extent=[-60,20; -40,40]);
  annotation (Diagram);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss1 annotation (extent=[20,20; 40,40]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss2 annotation (extent=[-60,-20; -40,0]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkQ sinkP 
    annotation (extent=[60,20; 80,40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(T0=310) 
    annotation (extent=[-100,20; -80,40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.Source source(h0=30000) 
    annotation (extent=[-100,-20; -80,0]);
equation 
  connect(singularPressureLoss.C2, deheaterMixer2_1.Ce) annotation (points=[-40,
        30; -30,30; -30,36; -20,36], style(color=3, rgbcolor={0,0,255}));
  connect(deheaterMixer2_1.Cs, singularPressureLoss1.C1) annotation (points=[0,
        36; 10,36; 10,30; 20,30], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss2.C2, deheaterMixer2_1.Ce_mix) annotation (points=
       [-40,-10; -9.9,-10; -9.9,20], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss1.C2, sinkP.C) 
    annotation (points=[40,30; 60,30], style(color=3, rgbcolor={0,0,255}));
  connect(sourceP.C, singularPressureLoss.C1) 
    annotation (points=[-80,30; -60,30], style(color=3, rgbcolor={0,0,255}));
  connect(source.C, singularPressureLoss2.C1) 
    annotation (points=[-80,-10; -60,-10], style(color=3, rgbcolor={0,0,255}));
end TestJunctions4;
