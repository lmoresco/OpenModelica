within ThermoSysPro.Examples.SimpleExamples;
model TestSensors 
  
  ThermoSysPro.WaterSteam.Sensors.SensorH specificEnthalpySensor 
    annotation (extent=[-60,8; -40,28]);
  ThermoSysPro.WaterSteam.Sensors.SensorQ massFlowSensor 
    annotation (extent=[-20,8; 0,28]);
  ThermoSysPro.WaterSteam.Sensors.SensorQv volumetricFlowSensor 
    annotation (extent=[20,8; 40,28]);
  ThermoSysPro.WaterSteam.Sensors.SensorP pressureSensor 
    annotation (extent=[-60,-32; -40,-12]);
  ThermoSysPro.WaterSteam.Sensors.SensorT temperatureSensor 
    annotation (extent=[-20,-32; 0,-12]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP 
                                         annotation (extent=[60,-40; 80,-20]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP 
                                           annotation (extent=[-100,0; -80,20]);
  annotation (Diagram);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe perteDP 
    annotation (extent=[20,-40; 40,-20]);
equation 
  connect(sourceP.C, specificEnthalpySensor.C1) 
    annotation (points=[-80,10; -60,10], style(color=3, rgbcolor={0,0,255}));
  connect(specificEnthalpySensor.C2, massFlowSensor.C1) 
    annotation (points=[-39.8,10; -20,10], style(color=3, rgbcolor={0,0,255}));
  connect(massFlowSensor.C2, volumetricFlowSensor.C1) 
    annotation (points=[0.2,10; 20,10], style(color=3, rgbcolor={0,0,255}));
  connect(volumetricFlowSensor.C2, pressureSensor.C1) annotation (points=[40.2,
        10; 60,10; 60,0; -80,0; -80,-30; -60,-30], style(color=3, rgbcolor={0,0,
          255}));
  connect(pressureSensor.C2, temperatureSensor.C1) annotation (points=[-39.8,
        -30; -20,-30], style(color=3, rgbcolor={0,0,255}));
  connect(temperatureSensor.C2, perteDP.C1) 
    annotation (points=[0.2,-30; 20,-30], style(color=3, rgbcolor={0,0,255}));
  connect(perteDP.C2, puitsP.C) 
    annotation (points=[40,-30; 60,-30], style(color=3, rgbcolor={0,0,255}));
end TestSensors;
