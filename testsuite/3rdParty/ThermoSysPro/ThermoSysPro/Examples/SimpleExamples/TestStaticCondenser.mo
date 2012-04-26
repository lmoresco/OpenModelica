within ThermoSysPro.Examples.SimpleExamples;
model TestStaticCondenser 
  
  annotation (Diagram, Coordsys(extent=[-200,-200; 200,200]));
  WaterSteam.BoundaryConditions.SourceQ               Source_condenseur(
    h0=60e3, Q0(fixed=true) = 4000) 
          annotation (extent=[-180,0; -160,20]);
  WaterSteam.BoundaryConditions.SinkP             Puit_condenseur 
             annotation (extent=[160,0; 180,20]);
  ThermoSysPro.WaterSteam.HeatExchangers.StaticCondenser condenseur(
    CPCE=0,
    KCO=100,
    QC0=200,
    z=5,
    SCO=15e3,
    Qee(start=4000, fixed=false),
    Pcond(fixed=false, start=2154.77))     annotation (extent=[-20,-16; 72,82]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(
    P0(fixed=false) = 1e5,
    option_temperature=2,
    mode=0,
    h0=2.5817e6,
    C(Q(fixed=true, start=100))) 
            annotation (extent=[-100,140; -80,160]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1(
    option_temperature=2,
    mode=0,
    h0=2.5481e6,
    C(Q(fixed=true, start=1e-5)),
    P0(fixed=false) = 1e5)        annotation (extent=[-182,80; -162,100]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP2(
    option_temperature=2,
    mode=0,
    h0=2.5055e6,
    C(Q(fixed=true, start=1e-5)),
    P0(fixed=false) = 44000)       annotation (extent=[-180,40; -160,60]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss(K=10) 
                         annotation (extent=[-100,80; -80,100]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss1(K=10) 
                          annotation (extent=[-100,40; -80,60]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss2(K=1e-4) 
                          annotation (extent=[-100,0; -80,20]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss3(K=10) 
                          annotation (extent=[-40,140; -20,160]);
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink Puit_condenseur1 
             annotation (extent=[100,-100; 120,-80]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss4(K=1e-4) 
                          annotation (extent=[100,0; 120,20]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss5(K=1e-4) 
                          annotation (extent=[40,-100; 60,-80]);
  
equation 
  connect(sourceP1.C, singularPressureLoss.C1) 
    annotation (points=[-162,90; -100,90], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss.C2, condenseur.Cev) annotation (points=[-80,90;
        -50,90; -50,62.89; -20,62.89],    style(color=3, rgbcolor={0,0,255}));
  connect(sourceP2.C, singularPressureLoss1.C1) 
    annotation (points=[-160,50; -100,50], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss1.C2, condenseur.Cep) annotation (points=[-80,50;
        -52,50; -52,42.31; -20,42.31],    style(color=3, rgbcolor={0,0,255}));
  connect(Source_condenseur.C, singularPressureLoss2.C1) 
    annotation (points=[-160,10; -100,10], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss2.C2, condenseur.Cee) annotation (points=[-80,10;
        -52,10; -52,3.11; -20,3.11], style(color=3, rgbcolor={0,0,255}));
  connect(sourceP.C, singularPressureLoss3.C1) 
    annotation (points=[-80,150; -40,150], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss3.C2, condenseur.Cvt) annotation (points=[-20,150;
        26,150; 26,82.49], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss4.C2, Puit_condenseur.C) 
    annotation (points=[120,10; 160,10], style(color=3, rgbcolor={0,0,255}));
  connect(condenseur.Cse, singularPressureLoss4.C1) annotation (points=[72.92,
        3.11; 86,3.11; 86,10; 100,10],
                                 style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss5.C2, Puit_condenseur1.C) 
    annotation (points=[60,-90; 100,-90], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss5.C1, condenseur.Cex) 
    annotation (points=[40,-90; 26.46,-90; 26.46,-16.98]);
end TestStaticCondenser;
