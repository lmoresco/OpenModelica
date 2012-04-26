within ThermoSysPro.Examples.SimpleExamples;
model TestAirHumidity 
  
  ThermoSysPro.FlueGases.BoundaryConditions.SourcePQ sourceFlueGasesPQ(P0=1.e5,
      T0=293) annotation (extent=[-80,0; -60,20]);
  ThermoSysPro.FlueGases.BoundaryConditions.AirHumidity airHumidity(hum0=0.9) 
    annotation (extent=[-40,0; -20,20]);
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss 
    singularPressureLoss(K=1.e-5) annotation (extent=[0,0; 20,20]);
  ThermoSysPro.FlueGases.BoundaryConditions.Sink sinkFlueGases 
    annotation (extent=[40,0; 60,20]);
  annotation (Diagram);
equation 
  connect(sourceFlueGasesPQ.C, airHumidity.C1) annotation (points=[-60,10; -40,
        10], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=8));
  connect(airHumidity.C2, singularPressureLoss.C1) annotation (points=[-20,10;
        0,10], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=8));
  connect(singularPressureLoss.C2, sinkFlueGases.C) annotation (points=[20,10;
        40.2,10], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=8));
end TestAirHumidity;
