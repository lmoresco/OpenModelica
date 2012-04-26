within ThermoSysPro.Examples.SimpleExamples;
model TestStaticWaterWaterExchanger 
  
  annotation (Diagram);
  ThermoSysPro.WaterSteam.HeatExchangers.StaticWaterWaterExchanger 
    plateHeatExchanger(modec=1, modef=1) 
               annotation (extent=[-20,44; 0,64]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP2(
                                            T0=340) 
    annotation (extent=[-80,44; -60,64]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP3 
    annotation (extent=[-60,24; -40,44]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP2 
                                          annotation (extent=[40,44; 60,64]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP3 
                                          annotation (extent=[20,24; 40,44]);
equation 
  connect(sourceP2.C, plateHeatExchanger.Ec) 
    annotation (points=[-60,54; -20,54],   style(color=3, rgbcolor={0,0,255}));
  connect(sourceP3.C, plateHeatExchanger.Ef) 
                                            annotation (points=[-40,34; -15,34;
        -15,48],       style(color=3, rgbcolor={0,0,255}));
  connect(plateHeatExchanger.Sc, puitsP2.C) 
                                           annotation (points=[0,54.2; 20,54.2;
        20,54; 40,54],          style(color=3, rgbcolor={0,0,255}));
  connect(plateHeatExchanger.Sf, puitsP3.C) 
                                           annotation (points=[-5,48; -6,48; -6,
        34; 20,34],      style(color=3, rgbcolor={0,0,255}));
end TestStaticWaterWaterExchanger;
