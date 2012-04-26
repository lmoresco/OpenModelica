within ThermoSysPro.Examples.SimpleExamples;
model TestDynamicWaterWaterExchanger 
  
  ThermoSysPro.WaterSteam.HeatExchangers.DynamicWaterWaterExchanger 
    echangeurAPlaques1D(
    modec=1,
    modef=1,
    N=5) annotation (extent=[-20,40; 0,60]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(
                                           T0=340) 
    annotation (extent=[-80,40; -60,60]);
  annotation (Diagram);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1 
                                            annotation (extent=[-60,20; -40,40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP 
                                         annotation (extent=[40,40; 60,60]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP1 
                                          annotation (extent=[20,20; 40,40]);
equation 
  connect(sourceP.C, echangeurAPlaques1D.Ec) 
    annotation (points=[-60,50; -20,50], style(color=3, rgbcolor={0,0,255}));
  connect(sourceP1.C, echangeurAPlaques1D.Ef) annotation (points=[-40,30; -15,
        30; -15,44], style(color=3, rgbcolor={0,0,255}));
  connect(echangeurAPlaques1D.Sc, puitsP.C) annotation (points=[0,50.2; 20,50.2;
        20,50; 40,50], style(color=3, rgbcolor={0,0,255}));
  connect(echangeurAPlaques1D.Sf, puitsP1.C) annotation (points=[-5,44; -6,44;
        -6,30; 20,30], style(color=3, rgbcolor={0,0,255}));
end TestDynamicWaterWaterExchanger;
