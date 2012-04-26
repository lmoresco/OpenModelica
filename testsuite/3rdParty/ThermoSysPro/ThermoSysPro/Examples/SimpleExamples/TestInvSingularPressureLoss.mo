within ThermoSysPro.Examples.SimpleExamples;
model TestInvSingularPressureLoss 
  
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourcePQ 
    annotation (extent=[-80,0; -60,20]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkQ 
    annotation (extent=[40,0; 60,20]);
  ThermoSysPro.WaterSteam.PressureLosses.InvSingularPressureLoss 
    invSingularPressureLoss annotation (extent=[-20,0; 0,20]);
equation 
  connect(sourcePQ.C, invSingularPressureLoss.C1) annotation (points=[-60,10;
        -20,10], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=8));
  connect(invSingularPressureLoss.C2, sinkQ.C) annotation (points=[0,10; 40,10],
      style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=8));
end TestInvSingularPressureLoss;
