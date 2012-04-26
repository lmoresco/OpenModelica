within ThermoSysPro.Examples.SimpleExamples;
model TestMassFlowMultiplier 
  
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourcePQ 
    annotation (extent=[-100,0; -80,20]);
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink 
    annotation (extent=[60,0; 80,20]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss annotation (extent=[-60,0; -40,20]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss1 annotation (extent=[20,0; 40,20]);
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier massFlowMultiplier 
    annotation (extent=[-20,0; 0,20]);
equation 
  connect(sourcePQ.C, singularPressureLoss.C1) annotation (points=[-80,10; -60,
        10], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
  connect(singularPressureLoss1.C2, sink.C) annotation (points=[40,10; 60,10],
      style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
  connect(singularPressureLoss.C2, massFlowMultiplier.Ce) annotation (points=[
        -40,10; -20,10], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
  connect(massFlowMultiplier.Cs, singularPressureLoss1.C1) annotation (points=[
        0,10; 20,10], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
end TestMassFlowMultiplier;
