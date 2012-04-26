within ThermoSysPro.Examples.SimpleExamples;
model TestStaticDrum1 
  annotation (Diagram);
  ThermoSysPro.WaterSteam.Junctions.StaticDrum StaticDrumTh1 
    annotation (extent=[-54,0; -34,20]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLossVALI1(K=1e-4) 
    annotation (extent=[0,-10; 20,10]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLossVALI2(K=1e-4) 
    annotation (extent=[-80,-50; -60,-30]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkQ sinkP1(Q0=10) 
    annotation (extent=[40,-10; 60,10]);
  ThermoSysPro.WaterSteam.Sensors.SensorT sensorT 
    annotation (extent=[10,-82; 30,-62]);
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource(
    option_temperature=2,
    W0={2.4e8},
    T0={290})   annotation (extent=[-80,20; -60,40]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLossVALI3(K=1e-4) 
    annotation (extent=[-20,50; 0,70]);
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sinkP2 
    annotation (extent=[60,50; 80,70]);
  ThermoSysPro.WaterSteam.Sensors.SensorT sensorT1 
    annotation (extent=[20,58; 40,78]);
  ThermoSysPro.WaterSteam.BoundaryConditions.RefP refP(P0=3e5) 
    annotation (extent=[-26,-90; -6,-70]);
  ThermoSysPro.WaterSteam.BoundaryConditions.RefQ refQ(Q0=100) 
    annotation (extent=[-56,-90; -36,-70]);
  ThermoSysPro.WaterSteam.BoundaryConditions.PlugA      sourcePlug 
    annotation (extent=[-90,-90; -70,-70]);
equation 
  connect(singularPressureLossVALI2.C2, StaticDrumTh1.Ce_eco) 
                                                          annotation (points=[-60,-40; 
        -60,0.6; -48,0.6],           style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=2,
      rgbfillColor={0,255,0},
      fillPattern=1));
  connect(singularPressureLossVALI1.C2, sinkP1.C) annotation (points=[20,0; 40,
        0],     style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=2,
      rgbfillColor={0,255,0},
      fillPattern=1));
  connect(sensorT.C2, singularPressureLossVALI2.C1) annotation (points=[30.2,-80; 
        40,-80; 40,-60; -80,-60; -80,-40],        style(color=3, rgbcolor={0,
          0,255}));
  connect(heatSource.C[1], StaticDrumTh1.Cth) 
                                          annotation (points=[-70,20.2; -70,
        10; -44,10],     style(color=46, rgbcolor={191,95,0}));
  connect(StaticDrumTh1.Cs_purg, singularPressureLossVALI1.C1) 
                                                           annotation (points=[-34.6,
        6.6; -19.3,6.6; -19.3,0; 0,0],         style(color=3, rgbcolor={0,0,
          255}));
  connect(StaticDrumTh1.Cs_sur, singularPressureLossVALI3.C1) 
                                                          annotation (points=[-40.2,
        19.4; -40.2,60; -20,60],        style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLossVALI3.C2, sensorT1.C1) 
    annotation (points=[0,60; 20,60], style(color=3, rgbcolor={0,0,255}));
  connect(sensorT1.C2, sinkP2.C) 
    annotation (points=[40.2,60; 60,60], style(color=3, rgbcolor={0,0,255}));
  connect(refP.C2, sensorT.C1) annotation (points=[-6,-80; 10,-80],   style(
        color=3, rgbcolor={0,0,255}));
  connect(refQ.C2, refP.C1) annotation (points=[-36,-80; -26,-80], style(
        color=3, rgbcolor={0,0,255}));
  connect(sourcePlug.C, refQ.C1) annotation (points=[-70,-80; -56,-80], style(
        color=3, rgbcolor={0,0,255}));
end TestStaticDrum1;
