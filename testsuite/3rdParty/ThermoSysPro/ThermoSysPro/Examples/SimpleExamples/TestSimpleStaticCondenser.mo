within ThermoSysPro.Examples.SimpleExamples;
model TestSimpleStaticCondenser 
  
  ThermoSysPro.WaterSteam.HeatExchangers.SimpleStaticCondenser 
    simpleStaticCondenser annotation (extent=[-20,20; 0,40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP 
    annotation (extent=[-60,20; -40,40]);
  annotation (Diagram);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1(T0=400) 
    annotation (extent=[-60,-20; -40,0]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP 
    annotation (extent=[20,20; 40,40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP1 
    annotation (extent=[20,-20; 40,0]);
equation 
  connect(sourceP.C, simpleStaticCondenser.Ef) annotation (points=[-40,30; -20,
        30], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
  connect(sourceP1.C, simpleStaticCondenser.Ec) annotation (points=[-40,-10;
        -16,-10; -16,20], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
  connect(simpleStaticCondenser.Sf, sinkP.C) annotation (points=[0,29.9; 10,
        29.9; 10,30; 20,30], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
  connect(simpleStaticCondenser.Sc, sinkP1.C) annotation (points=[-4,20; -4,-10;
        20,-10], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
end TestSimpleStaticCondenser;
