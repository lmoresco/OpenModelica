within ThermoSysPro.Examples.SimpleExamples;
model TestDynamicOnePhaseFlowPipe 
  
  ThermoSysPro.WaterSteam.HeatExchangers.DynamicOnePhaseFlowPipe 
    dynamicOnePhaseFlowPipe annotation (extent=[-20,20; 0,40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP 
    annotation (extent=[-60,20; -40,40]);
  annotation (Diagram);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP 
    annotation (extent=[20,20; 40,40]);
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource(
    T0={1000,1100,1200,1300,1400,1500,1600,1700,1800,1900},
    option_temperature=2,
    W0={2e6,2e6,2e6,2e6,2e6,2e6,2e6,2e6,2e6,2e6}) 
    annotation (extent=[-20,60; 0,80]);
  ThermoSysPro.Thermal.HeatTransfer.HeatExchangerWall heatExchangerWall(Ns=10) 
    annotation (extent=[-20,40; 0,60]);
equation 
  connect(sourceP.C, dynamicOnePhaseFlowPipe.C1) annotation (points=[-40,30;
        -20,30], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=68,
      rgbfillColor={170,213,255},
      fillPattern=1));
  connect(dynamicOnePhaseFlowPipe.C2, sinkP.C) annotation (points=[0,30; 20,30],
      style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=68,
      rgbfillColor={170,213,255},
      fillPattern=1));
  connect(heatSource.C, heatExchangerWall.WT2) annotation (points=[-10,60.2;
        -10,52], style(color=46, rgbcolor={191,95,0}));
  connect(heatExchangerWall.WT1, dynamicOnePhaseFlowPipe.CTh) 
    annotation (points=[-10,48; -10,33], style(color=46, rgbcolor={191,95,0}));
end TestDynamicOnePhaseFlowPipe;
