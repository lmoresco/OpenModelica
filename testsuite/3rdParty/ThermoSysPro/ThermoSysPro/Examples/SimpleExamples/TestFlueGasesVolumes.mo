within ThermoSysPro.Examples.SimpleExamples;
model TestFlueGasesVolumes 
  
  annotation (Diagram, Coordsys(extent=[-200,-150; 200,150], scale=0.1));
  ThermoSysPro.FlueGases.BoundaryConditions.SourcePQ Source_Fumees(
    Xso2=0,
    Xco2=0.0,
    Xh2o=0.006,
    Xo2=0.23,
    Q0=2,
    T0=300,
    P0=1.3e5) 
    annotation (extent=[-120,0; -100,20],   rotation=0);
  ThermoSysPro.FlueGases.BoundaryConditions.Sink Puits_Fumees 
    annotation (extent=[140,0; 120,20],   rotation=180);
  ThermoSysPro.FlueGases.Volumes.VolumeDTh dynamicExchanger 
    annotation (extent=[-40,0; -20,20]);
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource(
      option_temperature=2, W0={2e4}) 
                            annotation (extent=[-80,42; -60,62]);
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss 
    singularPressureLossFlueGases(K(fixed=true) = 10, Q(fixed=false, start=10)) 
                                  annotation (extent=[0,0; 20,20]);
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss 
    singularPressureLossFlueGases1(K(fixed=true) = 0.01, Q(fixed=false, start=
          11))                    annotation (extent=[-80,0; -60,20]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe(
    Starttime=50,
    Duration=50,
    Initialvalue=1e4,
    Finalvalue=2e4) annotation (extent=[-20,60; -40,80]);
  ThermoSysPro.FlueGases.Machines.StaticFan staticFan(
    VRotn=2700,
    rm=1,
    VRot=3000,
    a1=45.876,
    a2=-50,
    b1=-3.0752) 
               annotation (extent=[40,0; 60,20]);
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss 
    singularPressureLossFlueGases2(
                                  K(fixed=true) = 10, Q(fixed=false, start=10)) 
                                  annotation (extent=[80,0; 100,20]);
equation 
  connect(Source_Fumees.C, singularPressureLossFlueGases1.C1) annotation (
      points=[-100,10; -80,10],
                             style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(singularPressureLossFlueGases.C2, staticFan.C1) annotation (points=[20,10;
        40,10],   style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      gradient=3,
      fillColor=3,
      rgbfillColor={0,0,255}));
  connect(staticFan.C2, singularPressureLossFlueGases2.C1) annotation (points=[60,10;
        80,10],                        style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      gradient=3,
      fillColor=3,
      rgbfillColor={0,0,255}));
  connect(singularPressureLossFlueGases1.C2, dynamicExchanger.Ce) annotation (
      points=[-60,10; -40,10],
                             style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(dynamicExchanger.Cs3, singularPressureLossFlueGases.C1) annotation (
      points=[-20,10; 0,10], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(singularPressureLossFlueGases2.C2, Puits_Fumees.C) annotation (points=[100,10;
        110.1,10; 110.1,10; 120.2,10],         style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(rampe.y, heatSource.ISignal) annotation (points=[-41,70; -70,70; -70,
        57], style(
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=8));
  connect(heatSource.C[1], dynamicExchanger.Cth) annotation (points=[-70,42.2;
        -30,10], style(
      color=46,
      rgbcolor={191,95,0},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=8));
end TestFlueGasesVolumes;
