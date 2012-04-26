within ThermoSysPro.Examples.CombinedCyclePowerPlant;
model CombinedCycle_TripTAC "CCPP model to simulate a combustion turbine trip" 
  
  annotation (Diagram, Coordsys(extent=[-550,-460; 950,150], scale=0.1));
  ThermoSysPro.WaterSteam.Volumes.DynamicDrum BallonHP(
    L=16.27,
    Vertical=false,
    hl(fixed=false),
    hv(fixed=false),
    Vv(fixed=false),
    R=1.05,
    xmv(fixed=false),
    P(fixed=false, start=127.032e5),
    zl(start=1.05, fixed=true),
    Kvl=0,
    Mp=5000,
    Kpa=5)           annotation (extent=[8,8; -32,48]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_alimentationHP(Cvmax(fixed=
          false) = 135) 
                 annotation (extent=[48,44; 28,64]);
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante 
    constante_vanne_vapeurHP(                                                              k=0.5) 
    annotation (extent=[-48,68; -58,76]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_vapeurHP(
    Cvmax=47829.4,
    mode=0)      annotation (extent=[-52,44; -72,64]);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss GainChargeHP(
    z2=0,
    mode=1,
    K(fixed=false) = 720.183,
    Q(start=150, fixed=true),
    z1=10.83) 
            annotation (extent=[-12,-102; 8,-82],  rotation=180);
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeEvapHP(mode=1, V=5) 
                                           annotation (extent=[-22,-102; -42,
        -82]);
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases 
    EvaporateurHP(
    Dint=32.8e-3,
    Ntubes=1476,
    L=20.7,
    ExchangerWall(e=0.0026, lambda=47),
    Ns=3,
    TwoPhaseFlowPipe(
      advection=false,
      rugosrel=5e-6,
      z2=10.83,
      option_temperature=2,
      continuous_flow_reversal=true,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      Dext=0.038,
      step_L=0.092,
      step_T=0.0869,
      St=1,
      Fa=1,
      K(fixed=true, start=37.69),
      CSailettes=11.86442072,
      p_rho=1.05))        annotation (extent=[-64,-72; -24,-32],
                                                               rotation=90);
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases 
    EconomiseurHP4(
    Ns=3,
    L=20.726,
    Dint=0.0266,
    Ntubes=246,
    ExchangerWall(e=0.0026, lambda=47),
    TwoPhaseFlowPipe(
      advection=false,
      rugosrel=5e-6,
      z1=10.83,
      z2=0,
      option_temperature=2,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      Dext=0.0318,
      step_L=0.111,
      step_T=0.0869,
      St=1,
      Fa=1,
      CSailettes=11.39069779,
      K(fixed=true, start=47.53),
      p_rho=1.06))        annotation (extent=[76,-32; 36,-72],   rotation=270);
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases 
    SurchauffeurHP1(
    Ns=3,
    L=20.4,
    Dint=0.0324,
    Ntubes=246,
    ExchangerWall(e=0.0028, lambda=37.61),
    TwoPhaseFlowPipe(
      advection=false,
      rugosrel=5e-6,
      z1=10.83,
      option_temperature=2,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      Dext=0.038,
      step_L=0.111,
      step_T=0.0869,
      St=1,
      Fa=1,
      CSailettes=10.25056,
      K(fixed=true, start=34.71),
      p_rho=1.04))        annotation (extent=[-64,-72; -104,-32],
                                                               rotation=270);
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases 
    EconomiseurHP3(
    Dint=26.6e-3,
    Ntubes=1476,
    Ns=3,
    ExchangerWall(e=2.6e-3, lambda=47),
    L=20.726,
    TwoPhaseFlowPipe(
      rugosrel=5e-6,
      z2=0,
      advection=false,
      z1=10.767,
      inertia=true),
    ExchangerFlueGasesMetal(
      Dext=31.8e-3,
      step_L=74e-3,
      step_T=86.9e-3,
      Encras(fixed=false) = 1,
      Fa=1,
      CSailettes=12.451,
      K(fixed=true, start=36.03),
      p_rho=1.08)) 
                  annotation (extent=[156,-32; 196,-72],   rotation=90);
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases 
    EconomiseurHP2(
    Dint=26.6e-3,
    Ns=3,
    ExchangerWall(e=2.6e-3, lambda=47),
    L=20.767,
    Ntubes=1107,
    TwoPhaseFlowPipe(
      rugosrel=5e-6,
      z2=0,
      advection=false,
      z1=10.767,
      inertia=true),
    ExchangerFlueGasesMetal(
      Dext=31.8e-3,
      step_T=86.9e-3,
      Encras(fixed=false) = 1,
      Fa=1,
      step_L=111e-3,
      CSailettes=2.76134577,
      K(fixed=true, start=65.53),
      p_rho=1.11)) 
                  annotation (extent=[356,-72; 396,-32],   rotation=90);
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases 
    EconomiseurHP1(
    Dint=26.6e-3,
    Ns=3,
    ExchangerWall(e=2.6e-3, lambda=47),
    L=20.726,
    Ntubes=1107,
    TwoPhaseFlowPipe(
      rugosrel=5e-6,
      z2=0,
      advection=false,
      z1=10.767,
      inertia=true),
    ExchangerFlueGasesMetal(
      Dext=31.8e-3,
      step_L=74e-3,
      step_T=86.9e-3,
      Encras(fixed=false) = 1,
      Fa=1,
      CSailettes=8.30057632,
      K(fixed=true, start=40.24),
      p_rho=1.13)) 
                  annotation (extent=[476,-32; 516,-72],   rotation=90);
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases 
    SurchauffeurHP2(
    Ns=3,
    L=20.4,
    Dint=32e-3,
    Ntubes=246,
    ExchangerWall(e=3e-3, lambda=27),
    TwoPhaseFlowPipe(
      rugosrel=5e-6,
      z2=0,
      advection=false,
      z1=10.83,
      inertia=true),
    ExchangerFlueGasesMetal(
      step_T=86.9e-3,
      Encras(fixed=false) = 1,
      Fa=1,
      Dext=38e-3,
      step_L=111e-3,
      K(fixed=true, start=34.74),
      CSailettes=10.2505424803872,
      p_rho=1.02)) 
                  annotation (extent=[-224,-72; -184,-32],
                                                         rotation=90);
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases 
    SurchauffeurHP3(
    Ns=3,
    L=20.4,
    Ntubes=246,
    ExchangerWall(lambda=27, e=5e-3),
    Dint=28e-3,
    TwoPhaseFlowPipe(
      rugosrel=5e-6,
      z2=0,
      advection=false,
      z1=10.726,
      inertia=true),
    ExchangerFlueGasesMetal(
      step_T=86.9e-3,
      Encras(fixed=false) = 1,
      Fa=1,
      Dext=38e-3,
      step_L=111e-3,
      K(fixed=true, start=49.33),
      CSailettes=6.59672842597229,
      p_rho=1))   annotation (extent=[-344,-32; -304,-72],
                                                         rotation=90);
  ThermoSysPro.WaterSteam.Volumes.DynamicDrum BallonMP(
    L=16.27,
    Vertical=false,
    P0=27.29e5,
    hl(fixed=false),
    hv(fixed=false),
    Vv(fixed=false),
    R=1.05,
    P(fixed=false, start=37.3341e5),
    zl(start=1.05, fixed=true),
    Kvl=0,
    Kpa=5,
    Mp=5000)         annotation (extent=[328,8; 290,48]);
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante 
    constante_vanne_vapeurMP(                                                              k=0.5) 
    annotation (extent=[274,68; 262,78]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_alimentationMP(Cvmax(fixed=
          false) = 70) 
                 annotation (extent=[368,44; 348,64]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_vapeurMP(
    Pm(fixed=false),
    h(fixed=false),
    Cvmax=47829.4,
    mode=0)      annotation (extent=[268,44; 248,64]);
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases 
    EvaporateurMP(
    Dint=32.8e-3,
    L=20.767,
    Ntubes=738,
    ExchangerWall(e=2.6e-3, lambda=47),
    Ns=3,
    TwoPhaseFlowPipe(
      advection=false,
      rugosrel=5e-6,
      z1=0,
      z2=10.83,
      continuous_flow_reversal=true,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      K(fixed=true, start=30.22),
      Dext=38e-3,
      step_L=111e-3,
      step_T=86.9e-3,
      Fa=1,
      CSailettes=10.0676093,
      p_rho=1.1))         annotation (extent=[256,-72; 296,-32],
                                                               rotation=90);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss GainChargeMP(
    z2=0,
    z1=10.83,
    mode=1,
    K(fixed=false) = 1090.96,
    Q(start=150, fixed=true)) 
            annotation (extent=[308,-102; 328,-82],rotation=180,
    style(color=45, rgbcolor={255,128,0}));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeEvapMP(mode=1, V=5) 
                                           annotation (extent=[298,-102; 278,
        -82],
      style(color=45, rgbcolor={255,128,0}));
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases 
    EconomiseurMP(
    ExchangerWall(e=2.6e-3, lambda=47),
    L=20.726,
    Ns=3,
    Dint=26.6e-3,
    Ntubes=246,
    TwoPhaseFlowPipe(
      advection=false,
      rugosrel=5e-6,
      z1=10.767,
      z2=0,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      step_L=111e-3,
      step_T=86.9e-3,
      Fa=1,
      Dext=31.8e-3,
      K(fixed=true, start=47.78),
      CSailettes=7.16188651,
      p_rho=1.12))        annotation (extent=[416,-72; 456,-32],
                                                               rotation=90);
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases 
    SurchauffeurMP1(
    ExchangerWall(e=2.6e-3, lambda=47),
    L=20.726,
    Ns=3,
    Dint=32.8e-3,
    Ntubes=123,
    TwoPhaseFlowPipe(
      advection=false,
      rugosrel=5e-6,
      z2=0,
      z1=10.77,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      step_L=111e-3,
      step_T=86.9e-3,
      Fa=1,
      Dext=31.8e-3,
      K(fixed=true, start=22.09),
      CSailettes=14.46509765,
      p_rho=1.07))        annotation (extent=[96,-32; 136,-72],rotation=90);
  ThermoSysPro.WaterSteam.Volumes.VolumeB MelangeurHPMP 
    annotation (extent=[128,-122; 108,-102],
                                           rotation=90);
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases 
    SurchauffeurMP2(
    Ns=3,
    L=20.4,
    Dint=39.3e-3,
    Ntubes=369,
    ExchangerWall(e=2.6e-3, lambda=36.86),
    TwoPhaseFlowPipe(
      advection=false,
      z2=0,
      z1=10.83,
      rugosrel=1e-5,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      step_T=86.9e-3,
      Fa=1,
      Dext=44.5e-3,
      step_L=92e-3,
      K(fixed=true, start=45.22),
      CSailettes=5.814209831,
      p_rho=1.03))        annotation (extent=[-164,-72; -124,-32],
                                                               rotation=90);
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases 
    SurchauffeurMP3(
    Ns=3,
    L=20.4,
    Ntubes=369,
    Dint=45.6e-3,
    ExchangerWall(e=2.6e-3, lambda=27),
    TwoPhaseFlowPipe(
      advection=false,
      z2=0,
      z1=10.83,
      rugosrel=1e-5,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      step_T=86.9e-3,
      Fa=1,
      step_L=92e-3,
      Dext=50.8e-3,
      K(fixed=true, start=43.23),
      CSailettes=5.695842178,
      p_rho=1.01))        annotation (extent=[-284,-32; -244,-72],
                                                               rotation=90);
  ThermoSysPro.WaterSteam.Volumes.DynamicDrum BallonBP(
    Vertical=false,
    P0=5e5,
    Vv(fixed=false),
    L=8,
    hl(fixed=false),
    hv(fixed=false),
    R=2,
    P(fixed=false, start=539458),
    zl(start=1.75, fixed=true),
    Kvl=0,
    Kpa=5,
    Mp=5000)         annotation (extent=[588,8; 548,48]);
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante 
    constante_vanne_vapeurBP(                                                              k=0.5) 
    annotation (extent=[636,74; 624,84]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_vapeurBP(
    Cvmax(fixed=false) = 32000,
    p_rho=3)     annotation (extent=[528,44; 508,64]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_alimentationBP(
    h(fixed=false),
    Pm(fixed=false, start=5.0698e5),
    Cvmax=285)   annotation (extent=[620,42; 600,62]);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss GainChargeBP(
    z2=0,
    z1=10.767,
    Q(start=50, fixed=false),
    K=32766,
    mode=1) annotation (extent=[570,-102; 590,-82],rotation=180,
    style(color=45, rgbcolor={255,128,0}));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeEvapBP(h(start=642e3), mode=1,
    V=5)                                   annotation (extent=[562,-102; 542,
        -82],
      style(color=45, rgbcolor={255,128,0}));
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases 
    EvaporateurBP(
    Dint=32.8e-3,
    ExchangerWall(e=2.6e-3, lambda=47),
    L=20.726,
    Ntubes=984,
    Ns=3,
    TwoPhaseFlowPipe(
      advection=false,
      rugosrel=5e-6,
      z1=0,
      z2=10.767,
      continuous_flow_reversal=true,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      Dext=38e-3,
      step_T=86.9e-3,
      Fa=1,
      step_L=138e-3,
      K(fixed=true, start=30.62),
      CSailettes=11.07985,
      p_rho=1.14))        annotation (extent=[516,-72; 556,-32],
                                                               rotation=90);
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante 
    constante_ballonBP(                                                              k=1) 
    annotation (extent=[712,4; 698,16]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Vanne_alimentationMPHP(
      Pm(start=5.0698e5), mode=1,
    Cvmax=308.931) 
                 annotation (extent=[680,-16; 700,4]);
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases 
    SurchauffeurBP(
    Ns=3,
    L=20.726,
    Dint=39.3e-3,
    Ntubes=123,
    ExchangerWall(e=2.6e-3, lambda=47),
    TwoPhaseFlowPipe(
      advection=false,
      z2=0,
      rugosrel=1e-5,
      z1=10.767,
      inertia=true),
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      step_T=86.9e-3,
      Fa=1,
      Dext=44.5e-3,
      step_L=222.1e-3,
      K(fixed=true, start=30.46),
      CSailettes=3.25763059984175,
      p_rho=1.09))        annotation (extent=[216,-32; 256,-72],
                                                               rotation=90);
  ThermoSysPro.FlueGases.BoundaryConditions.SinkP PuitsFumees(
                P0=1.013e5) 
    annotation (extent=[702,-62; 682,-42],
                                         rotation=180);
  ThermoSysPro.MultiFluids.HeatExchangers.DynamicExchangerWaterSteamFlueGases 
    EconomiseurBP(
    Ns=3,
    Dint=32.8e-3,
    ExchangerWall(e=2.6e-3, lambda=47),
    Ntubes=3444,
    TwoPhaseFlowPipe(
      advection=false,
      rugosrel=5e-6,
      z1=0,
      z2=10.767,
      inertia=true),
    L=20.726,
    ExchangerFlueGasesMetal(
      Encras(fixed=false) = 1,
      step_T=86.9e-3,
      Fa=1,
      Dext=38e-3,
      step_L=92e-3,
      K(fixed=true, start=31.53),
      CSailettes=11.673758598919,
      p_rho=1.15))        annotation (extent=[630,-72; 670,-32],
                                                               rotation=90);
  ThermoSysPro.WaterSteam.Machines.StodolaTurbine TurbineHP(
    W_fric=1,
    Ps(fixed=false),
    Cst(fixed=false) = 7618660.65374636,
    Pe(fixed=true, start=124.31e5),
    eta_stato=1,
    eta_is(start=0.88057),
    eta_is_nom=0.88057,
    Qmax=140,
    eta_is_min=0.75) 
              annotation (extent=[-32,-252; 8,-212],   style(color=1, rgbcolor=
          {255,0,0}));
  ThermoSysPro.WaterSteam.Machines.StodolaTurbine TurbineMP(
    W_fric=1,
    Ps(fixed=false),
    Cst(fixed=false) = 278905.664031036,
    Pe(fixed=true, start=25.485e5),
    eta_stato=1,
    eta_is(start=0.9625),
    eta_is_nom=0.9625,
    Qmax=150,
    eta_is_min=0.75) 
                annotation (extent=[288,-252; 328,-212], style(color=1,
        rgbcolor={255,0,0}));
  ThermoSysPro.WaterSteam.Volumes.VolumeC MelangeurPostTMP1 
                                           annotation (extent=[398,-242; 378,
        -222], rotation=180);
  ThermoSysPro.WaterSteam.Machines.StodolaTurbine TurbineBP(
    W_fric=1,
    Cst(fixed=false) = 13491.6445678148,
    eta_stato=1,
    eta_is(start=0.9538),
    eta_is_nom=0.9538,
    Pe(fixed=true, start=4.768e5),
    Qmax=155,
    eta_is_min=0.75) 
                annotation (extent=[546,-252; 586,-212], style(color=1,
        rgbcolor={255,0,0}));
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier DoubleDebitHP(
                                                    alpha=2) 
    annotation (extent=[-332,-112; -312,-92],rotation=270);
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier DoubleDebitMP(
                                                    alpha=2) 
    annotation (extent=[-272,-112; -252,-92],rotation=270);
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier MoitieDebitHP(
                                                    alpha=0.5) 
    annotation (extent=[84,-182; 104,-162], style(color=1, rgbcolor={255,0,0}));
  ThermoSysPro.WaterSteam.HeatExchangers.SimpleDynamicCondenser Condenseur(
    D=0.018,
    V=1000,
    A=100,
    lambda=0.01,
    ntubes=28700,
    continuous_flow_reversal=true,
    P(fixed=false, start=6136),
    yNiveau(signal(fixed=false, start=1.5)),
    steady_state=false,
    Kvl=0,
    gravity_pressure=false,
    Vf0=0.15) 
    annotation (extent=[609,-386; 689,-306]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ SourceCaloporteur(
    h0=113.38e3, Q0=29804.5)     annotation (extent=[542,-379; 590,-331]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsCaloporteur 
    annotation (extent=[706,-376; 750,-332]);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK1(    K=1e-4) 
    annotation (extent=[610,-242; 630,-222],
                                           rotation=0,
    style(color=1, rgbcolor={255,0,0}));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeCond1(mode=1) 
    annotation (extent=[862,-310; 882,-330], rotation=270);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeKCond1(            mode=1, K=1e-4) 
    annotation (extent=[860,-260; 884,-284], rotation=270);
  ThermoSysPro.WaterSteam.Volumes.VolumeA VolumeAlimMPHP(mode=1) 
                                           annotation (extent=[712,-22; 732,-2]);
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump PompeAlimMP(
    a3=350,
    b1(fixed=true) = -3.7751,
    a1=-244551,
    Q(fixed=false),
    mode=1) annotation (extent=[774,-22; 794,-2]);
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump PompeAlimHP(
    a3=1600,
    a1=-28056.2,
    b1=-12.7952660447433,
    Q(fixed=false),
    mode=1)  annotation (extent=[774,-62; 794,-42]);
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier MoitieDebitBP(
                                                    alpha=0.5) 
    annotation (extent=[842,-330; 856,-310], rotation=0);
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier DoubleDebitBP(
                                                    alpha=2) 
    annotation (extent=[228,-112; 248,-92],  rotation=270,
    style(color=1, rgbcolor={255,0,0}));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss PerteChargeZero2(
    z2=0,
    mode=0,
    z1=0,
    C1(P(fixed=true, start=5.0185e5)),
    K(fixed=false) = 1e-4) 
            annotation (extent=[324,-290; 304,-270],
                                                   rotation=180,
    style(color=1, rgbcolor={255,0,0}));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK3(    K=1e-4, mode=1) 
    annotation (extent=[760,-62; 740,-42],   rotation=180);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK8(    K=1e-4, mode=1) 
    annotation (extent=[760,-22; 740,-2],    rotation=180);
  ThermoSysPro.WaterSteam.Machines.Generator Alternateur 
    annotation (extent=[372,-450; 492,-350]);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK(
                                                         K=1e-4, mode=1) 
    annotation (extent=[672,-448; 692,-428]);
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump PompeAlimBP(
    C2(P(fixed=false, start=22e5)),
    Qv(start=0.1),
    Q(start=194.502),
    mode=1,
    a1(fixed=true) = -6000,
    adiabatic_compression=false,
    a3=400) annotation (extent=[712,-448; 732,-428]);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK2(
                                                         K=1e-4, mode=1) 
    annotation (extent=[810,-448; 830,-428]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_extraction(            mode=1, Cvmax=
        1900)    annotation (extent=[772,-442; 792,-422]);
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitVapHP 
    annotation (extent=[-82,0; -94,12],  rotation=-90);
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauHP 
    annotation (extent=[57,14; 70,2],  rotation=-90);
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauMP 
    annotation (extent=[394,47; 379,61], rotation=0);
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitVapMP 
    annotation (extent=[198,62; 214,46], rotation=-180);
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitVapBP 
    annotation (extent=[476,62; 492,46], rotation=-180);
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauBP 
    annotation (extent=[627,38; 640,26], rotation=-90);
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauBPsortie 
    annotation (extent=[657,-13; 670,-1],
                                        rotation=0);
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauCondenseur 
    annotation (extent=[649,-424; 662,-404],
                                         rotation=-90);
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitVapCondenseur 
    annotation (extent=[648,-276; 661,-256],
                                         rotation=-90);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss lumpedStraightPipeK2(  K(fixed=
          false) = 10, C1(P(fixed=true, start=27.267e5))) 
    annotation (extent=[84,-122; 64,-102]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_entree_TurbineHP(
    h(fixed=false),
    mode=0,
    Pm(fixed=false),
    Cvmax(fixed=false) = 8000,
    C1(P(fixed=true, start=126.81e5))) 
                 annotation (extent=[-154,-236; -134,-216]);
  ThermoSysPro.FlueGases.BoundaryConditions.SourceQ SourceFumees(
    Xco2=0.0613,
    Xso2=0,
    Xh2o=0.0706,
    T0=893.75,
    Xo2=0.1380,
    Q0=606.94) 
    annotation (extent=[-478,-94; -376,-10]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante 
    ConsigneNiveauEauHP(                                                              k=1.05) 
    annotation (extent=[-188,111; -154,129]);
  ThermoSysPro.Examples.CombinedCyclePowerPlant.Control.Drum_LevelControl 
    regulation_Niveau_HP(
    pIsat(Ti=500),
    add(k1=-1, k2=+1),
    Ti=500) 
    annotation (extent=[-70,104; -50,124]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante 
    ConsigneNiveauEauMP(                                                              k=1.05) 
    annotation (extent=[143,111; 177,129]);
  ThermoSysPro.Examples.CombinedCyclePowerPlant.Control.Drum_LevelControl 
    regulation_Niveau_MP(
    pIsat(Ti=500),
    add(k1=-1, k2=+1),
    Ti=500) 
    annotation (extent=[232,104; 252,124]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante 
    ConsigneNiveauEauBP(                                                              k=1.75) 
    annotation (extent=[440,124; 474,142]);
  Control.Drum_LevelControl regulation_Niveau_BP(
                     add(k1=-1, k2=+1), pIsat(Ti=500),
    Ti=10) 
    annotation (extent=[538,106; 558,126]);
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante 
    ConsigneNiveauCondenseur1(                                 k=1.5) 
    annotation (extent=[686,-248; 710,-232]);
  ThermoSysPro.Examples.CombinedCyclePowerPlant.Control.Condenser_LevelControl 
    regulation_Niveau_Condenseur(pIsat(Ti=500), add(k1=+1, k2=-1)) 
                                 annotation (extent=[728,-284; 748,-264]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Tables.Table1DTemps Debit(Table=[0,606.94; 10,606.94; 600,
        50; 650,50]) 
                annotation (extent=[-532,-28; -462,46]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Tables.Table1DTemps Temperature(
      Table=[0,893.75; 10,893.75; 600,423; 650,423]) 
                   annotation (extent=[-532,-166; -462,-92]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Tables.Table1DTemps 
    ConstantVanneTurbineHP(                                                                Table=[0,0.8;
        10,0.8; 600,0.8; 650,0.8; 3000,0.2; 3100,0.2]) 
                   annotation (extent=[-238,-218; -168,-144]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesMp(
    Initialvalue=1400,
    Finalvalue=1000,
    Starttime=2000,
    Duration=1000) annotation (extent=[914,-44; 876,-12]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesHP(
    Initialvalue=1400,
    Finalvalue=1000,
    Starttime=2000,
    Duration=1000) annotation (extent=[915,-98; 877,-66]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesBP(
    Initialvalue=1400,
    Finalvalue=1000,
    Starttime=2000,
    Duration=1000) annotation (extent=[915,-460; 877,-428]);
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeECO_HP1_2(
    mode=1,
    V=1,
    h0=988332,
    h(start=988332),
    P0=70.1e5,
    P(start=70.1e5),
    dynamic_mass_balance=true)            annotation (extent=[426,-100; 406,-80],
      style(color=45, rgbcolor={255,128,0}));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeECO_HP2_3(
    mode=1,
    V=1,
    h0=983786,
    h(start=983786),
    P0=70.0e5,
    P(start=70.0e5),
    dynamic_mass_balance=true)            annotation (extent=[222,-22; 202,-2],
      style(color=45, rgbcolor={255,128,0}));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Vanne_alimentationMPHP1(
      Pm(start=5.0698e5), mode=1,
    Cvmax=308.931) 
                 annotation (extent=[724,-100; 700,-124]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Vanne_alimentationMPHP2(
      Pm(start=5.0698e5), mode=1,
    Cvmax=308.931) 
                 annotation (extent=[774,-140; 750,-164]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesMp1(
    Starttime=2000,
    Initialvalue=0.8,
    Finalvalue=0.01,
    Duration=1000)   annotation (extent=[916,-152; 878,-120]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesHP1(
    Starttime=2000,
    Initialvalue=0.8,
    Finalvalue=0.01,
    Duration=1000)   annotation (extent=[916,-196; 878,-164]);
  ThermoSysPro.WaterSteam.Volumes.VolumeD VolumePreTHP(
    P0=127e5,
    h0=3e6,
    P(start=127e5),
    h(start=3e6),
    dynamic_mass_balance=true)        annotation (extent=[-72,-242; -92,-222],
               rotation=180);
  ThermoSysPro.WaterSteam.Volumes.VolumeC MelangeurPreTMP(
    h0=3523910,
    h(start=3523910),
    P0=24e5,
    P(start=24e5),
    dynamic_mass_balance=true)            annotation (extent=[-70,-326; -90,
        -306], rotation=180,
    style(color=1, rgbcolor={255,0,0}));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_entree_TurbineMP(
    h(fixed=false),
    mode=0,
    Pm(fixed=false),
    Cvmax(fixed=false) = 1500,
    C1(P(fixed=true, start=25.486e5))) 
                 annotation (extent=[-154,-320; -134,-300]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Tables.Table1DTemps 
    ConstantVanneTurbineMP(                                                                Table=[0,0.8;
        10,0.8; 600,0.8; 2000,0.1; 3000,0.01; 3100,0.01]) 
                   annotation (extent=[-238,-302; -168,-228]);
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource(T0={303.16}) 
    annotation (extent=[-25,66; 1,96]);
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource1(T0={303.16}) 
    annotation (extent=[296,66; 322,96]);
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource2(T0={303.16}) 
    annotation (extent=[555,62; 581,92]);
equation 
  connect(SurchauffeurHP3.Cws1, SurchauffeurHP2.Cws2) 
    annotation (points=[-324,-32; -324,-12; -204,-12; -204,-32],
                                                             style(color=1,
        rgbcolor={255,0,0}));
  connect(SurchauffeurHP2.Cws1, SurchauffeurHP1.Cws2) 
    annotation (points=[-204,-72; -204,-92; -84,-92; -84,-72],
                                                             style(color=1,
        rgbcolor={255,0,0}));
  connect(constante_vanne_vapeurHP.y, vanne_vapeurHP.Ouv) 
    annotation (points=[-58.5,72; -62,72; -62,65]);
  connect(vanne_vapeurHP.C1, BallonHP.Cv) 
    annotation (points=[-52,48; -32,48],     style(color=1, rgbcolor={255,0,0}));
  connect(GainChargeHP.C1, BallonHP.Cd) 
    annotation (points=[8,-92; 18,-92; 18,8; 8,8],         style(color=45,
        rgbcolor={255,128,0}));
  connect(BallonHP.Cm, EvaporateurHP.Cws2) 
    annotation (points=[-32,8; -44,8; -44,-32]);
  connect(VolumeEvapHP.Cs, EvaporateurHP.Cws1) 
    annotation (points=[-42,-92; -42,-72; -44,-72],
                                         style(color=45, rgbcolor={255,128,0}));
  connect(VolumeEvapHP.Ce1, GainChargeHP.C2) 
                                      annotation (points=[-22,-92; -12,-92],
      style(color=45, rgbcolor={255,128,0}));
  connect(EconomiseurHP4.Cws1, EconomiseurHP3.Cws2) 
    annotation (points=[56,-72; 56,-84; 176,-84; 176,-72]);
  connect(BallonMP.Cm, EvaporateurMP.Cws2) 
    annotation (points=[290,8; 276,8; 276,-32]);
  connect(EvaporateurMP.Cws1, VolumeEvapMP.Cs) 
    annotation (points=[276,-72; 276,-82; 278,-82; 278,-92],
                                         style(color=45, rgbcolor={255,128,0}));
  connect(VolumeEvapMP.Ce1, GainChargeMP.C2) 
    annotation (points=[298,-92; 308,-92], style(color=45, rgbcolor={255,128,0}));
  connect(constante_vanne_vapeurMP.y, vanne_vapeurMP.Ouv) 
    annotation (points=[261.4,73; 258,73; 258,65]);
  connect(SurchauffeurHP1.Cfg2, EvaporateurHP.Cfg1)        annotation (points=[-74,-52;
        -54,-52],                              style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(EvaporateurHP.Cfg2, EconomiseurHP4.Cfg1)        annotation (points=[-34,-52;
        46,-52],          style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(EconomiseurHP4.Cfg2, SurchauffeurMP1.Cfg1)          annotation (
      points=[66,-52; 106,-52],                   style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(SurchauffeurMP1.Cfg2, EconomiseurHP3.Cfg1)           annotation (
      points=[126,-52; 166,-52], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(EvaporateurMP.Cfg2, EconomiseurHP2.Cfg1)           annotation (points=[286,-52;
        366,-52],          style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(EconomiseurHP2.Cfg2, EconomiseurMP.Cfg1)           annotation (points=[386,-52;
        426,-52],          style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(EconomiseurMP.Cfg2, EconomiseurHP1.Cfg1)           annotation (points=[446,-52;
        486,-52],          style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(GainChargeMP.C1, BallonMP.Cd) 
    annotation (points=[328,-92; 338,-92; 338,8; 328,8],   style(color=45,
        rgbcolor={255,128,0}));
  connect(SurchauffeurMP2.Cfg2, SurchauffeurHP1.Cfg1)          annotation (
      points=[-134,-52; -94,-52],  style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(SurchauffeurMP2.Cfg1, SurchauffeurHP2.Cfg2)           annotation (
      points=[-154,-52; -194,-52], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(SurchauffeurMP3.Cfg2, SurchauffeurHP2.Cfg1)           annotation (
      points=[-254,-52; -214,-52], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(SurchauffeurHP3.Cfg2, SurchauffeurMP3.Cfg1)           annotation (
      points=[-314,-52; -274,-52], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(SurchauffeurMP3.Cws1,SurchauffeurMP2. Cws2) 
    annotation (points=[-264,-32; -264,8; -144,8; -144,-32], style(color=1,
        rgbcolor={255,0,0}));
  connect(SurchauffeurMP1.Cws2, MelangeurHPMP.Ce2) annotation (points=[116,-72;
        116,-87; 118,-87; 118,-102],
                     style(
      color=1,
      rgbcolor={255,0,0},
      pattern=0));
  connect(vanne_vapeurBP.C1, BallonBP.Cv) 
    annotation (points=[528,48; 548,48],     style(color=1, rgbcolor={255,0,0}));
  connect(EvaporateurBP.Cws1, VolumeEvapBP.Cs)  annotation (points=[536,-72;
        536,-92; 542,-92],
                       style(color=45, rgbcolor={255,128,0}));
  connect(VolumeEvapBP.Ce1, GainChargeBP.C2) 
                                        annotation (points=[562,-92; 570,-92],
      style(color=45, rgbcolor={255,128,0}));
  connect(BallonBP.Cd, GainChargeBP.C1) 
                                       annotation (points=[588,8; 598,8; 598,
        -92; 590,-92], style(color=45, rgbcolor={255,128,0}));
  connect(EconomiseurBP.Cfg2, PuitsFumees.C)     annotation (points=[660,-52;
        682.2,-52],          style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(EconomiseurHP3.Cfg2, SurchauffeurBP.Cfg1)  annotation (
      points=[186,-52; 226,-52], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(SurchauffeurBP.Cfg2, EvaporateurMP.Cfg1)  annotation (
      points=[246,-52; 266,-52], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(EconomiseurHP1.Cfg2, EvaporateurBP.Cfg1) annotation (
      points=[506,-52; 526,-52], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(EvaporateurBP.Cfg2, EconomiseurBP.Cfg1) annotation (
      points=[546,-52; 640,-52], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(BallonBP.Cm, EvaporateurBP.Cws2) 
    annotation (points=[548,8; 536,8; 536,-32]);
  connect(vanne_vapeurMP.C1, BallonMP.Cv)   annotation (points=[268,48; 290,48],
              style(color=1, rgbcolor={255,0,0}));
  connect(Vanne_alimentationMPHP.Ouv, constante_ballonBP.y) 
    annotation (points=[690,5; 690,10; 697.3,10]);
  connect(SurchauffeurHP3.Cws2, DoubleDebitHP.Ce) 
    annotation (points=[-324,-72; -324,-82; -322,-82; -322,-92],
                                           style(color=1, rgbcolor={255,0,0}));
  connect(SurchauffeurMP3.Cws2, DoubleDebitMP.Ce) 
    annotation (points=[-264,-72; -264,-82; -262,-82; -262,-92],
                                           style(color=1, rgbcolor={255,0,0}));
  connect(VolumeCond1.Cs, perteChargeKCond1.C1) annotation (points=[872,-310;
        872,-284], style(color=3, rgbcolor={0,0,255}));
  connect(Vanne_alimentationMPHP.C2, VolumeAlimMPHP.Ce1) 
                                               annotation (points=[700,-12; 712,
        -12],                      style(color=3, rgbcolor={0,0,255}));
  connect(SurchauffeurBP.Cws2, DoubleDebitBP.Ce) 
    annotation (points=[236,-72; 236,-82; 238,-82; 238,-92],
                                         style(color=1, rgbcolor={255,0,0}));
  connect(perteChargeK8.C2, PompeAlimMP.C1) 
    annotation (points=[760,-12; 767,-12; 767,-12; 774,-12],
                                         style(color=3, rgbcolor={0,0,255}));
  connect(VolumeAlimMPHP.Cs1, perteChargeK8.C1) 
    annotation (points=[732,-12; 736,-12; 736,-12; 740,-12],
                                         style(color=3, rgbcolor={0,0,255}));
  connect(VolumeAlimMPHP.Cs2, perteChargeK3.C1) 
                                         annotation (points=[722,-22; 722,-52;
        740,-52],style(color=3, rgbcolor={0,0,255}));
  connect(perteChargeK3.C2, PompeAlimHP.C1) 
    annotation (points=[760,-52; 774,-52],
                                         style(color=3, rgbcolor={0,0,255}));
  connect(MelangeurPostTMP1.Ce2, PerteChargeZero2.C2) annotation (points=[388,-241;
        388,-280; 324,-280],       style(color=1, rgbcolor={255,0,0}));
  connect(perteChargeK.C2,PompeAlimBP. C1) 
                                         annotation (points=[692,-438; 712,-438],
      style(color=3, rgbcolor={0,0,255}));
  connect(vanne_extraction.C2, perteChargeK2.C1) annotation (points=[792,-438;
        810,-438],                       style(color=3, rgbcolor={0,0,255}));
  connect(vanne_alimentationHP.C1, CapteurDebitEauHP.C2) 
    annotation (points=[48,48; 58.3,48; 58.3,14.12]);
  connect(CapteurDebitEauHP.C1, EconomiseurHP4.Cws2) 
    annotation (points=[58.3,2; 56,2; 56,-32]);
  connect(vanne_vapeurHP.C2, CapteurDebitVapHP.C1) annotation (points=[-72,48;
        -83.2,48; -83.2,12],     style(color=1, rgbcolor={255,0,0}));
  connect(CapteurDebitVapHP.C2, SurchauffeurHP1.Cws1) annotation (points=[-83.2,
        -0.12; -83.2,-5.06; -84,-5.06; -84,-32],           style(color=1,
        rgbcolor={255,0,0}));
  connect(vanne_alimentationMP.C1, CapteurDebitEauMP.C2) 
    annotation (points=[368,48; 373.425,48; 373.425,48.4; 378.85,48.4]);
  connect(CapteurDebitVapMP.C1, vanne_vapeurMP.C2) annotation (points=[214,47.6;
        230,47.6; 230,48; 248,48],     style(color=1, rgbcolor={255,0,0}));
  connect(CapteurDebitVapMP.C2, SurchauffeurMP1.Cws1) annotation (points=[197.84,
        47.6; 116,47.6; 116,-32],      style(color=1, rgbcolor={255,0,0}));
  connect(CapteurDebitVapBP.C2, SurchauffeurBP.Cws1) annotation (points=[475.84,
        47.6; 460,47.6; 460,-4; 236,-4; 236,-32],        style(color=1,
        rgbcolor={255,0,0}));
  connect(CapteurDebitVapBP.C1, vanne_vapeurBP.C2) annotation (points=[492,47.6;
        500,47.6; 500,48; 508,48],     style(color=1, rgbcolor={255,0,0}));
  connect(CapteurDebitEauBP.C2, vanne_alimentationBP.C1) annotation (points=[628.3,
        38.12; 628.3,46; 620,46],       style(color=3, rgbcolor={0,0,255}));
  connect(CapteurDebitEauBPsortie.C2, Vanne_alimentationMPHP.C1) annotation (
      points=[670.13,-11.8; 675.065,-11.8; 675.065,-12; 680,-12], style(color=3,
        rgbcolor={0,0,255}));
  connect(CapteurDebitEauCondenseur.C2, perteChargeK.C1) annotation (points=[650.3,
        -424.2; 650.3,-438; 672,-438],       style(color=3, rgbcolor={0,0,255}));
  connect(perteChargeK1.C2, CapteurDebitVapCondenseur.C1) annotation (points=[630,-232;
        649.3,-232; 649.3,-256],           style(
      color=1,
      rgbcolor={255,0,0},
      fillColor=3,
      rgbfillColor={0,0,255},
      fillPattern=1));
  connect(MelangeurHPMP.Ce1, MoitieDebitHP.Cs) 
    annotation (points=[118,-122; 118,-172; 104,-172],
                                                    style(color=1, rgbcolor={
          255,0,0}));
  connect(perteChargeK2.C2, MoitieDebitBP.Ce) annotation (points=[830,-438; 832,
        -438; 832,-320; 842,-320], style(color=3, rgbcolor={0,0,255}));
  connect(MoitieDebitBP.Cs, VolumeCond1.Ce3) annotation (points=[856,-320; 862,
        -320], style(color=3, rgbcolor={0,0,255}));
  connect(SurchauffeurMP2.Cws1, lumpedStraightPipeK2.C2) 
    annotation (points=[-144,-72; -144,-112; 64,-112], style(color=1, rgbcolor=
          {255,0,0}));
  connect(lumpedStraightPipeK2.C1, MelangeurHPMP.Cs2) 
    annotation (points=[84,-112; 108.2,-112],style(color=1, rgbcolor={255,0,0}));
  connect(DoubleDebitHP.Cs, vanne_entree_TurbineHP.C1) annotation (points=[-322,
        -112; -322,-232; -154,-232], style(color=1, rgbcolor={255,0,0}));
  connect(DoubleDebitBP.Cs, PerteChargeZero2.C1) annotation (points=[238,-112;
        238,-280; 304,-280], style(color=1, rgbcolor={255,0,0}));
  connect(PompeAlimBP.C2, vanne_extraction.C1) annotation (points=[732,-438;
        772,-438],                       style(color=3, rgbcolor={0,0,255}));
  connect(SourceFumees.C, SurchauffeurHP3.Cfg1) annotation (points=[-376,-52;
        -334,-52],      style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(BallonHP.yLevel,regulation_Niveau_HP. MesureNiveauEau) 
    annotation (points=[-34,28; -98,28; -98,123; -70.5,123]);
  connect(regulation_Niveau_HP.SortieReelle1, vanne_alimentationHP.Ouv) 
    annotation (points=[-49.5,105; 38,105; 38,65]);
  connect(ConsigneNiveauEauMP.y,regulation_Niveau_MP. ConsigneNiveauEau) 
    annotation (points=[178.7,120; 204,120; 204,108; 231.5,108]);
  connect(BallonMP.yLevel,regulation_Niveau_MP. MesureNiveauEau) 
    annotation (points=[288.1,28; 222,28; 222,123; 231.5,123]);
  connect(regulation_Niveau_MP.SortieReelle1, vanne_alimentationMP.Ouv) 
    annotation (points=[252.5,105; 347.25,105; 347.25,65; 358,65]);
  connect(ConsigneNiveauEauBP.y,regulation_Niveau_BP. ConsigneNiveauEau) 
    annotation (points=[475.7,133; 499.85,133; 499.85,110; 537.5,110]);
  connect(BallonBP.yLevel,regulation_Niveau_BP. MesureNiveauEau) 
    annotation (points=[546,28; 488,28; 488,125; 537.5,125]);
  connect(ConsigneNiveauCondenseur1.y, regulation_Niveau_Condenseur.ConsigneNiveauEau) 
    annotation (points=[711.2,-240; 722,-240; 722,-271; 727.5,-271]);
  connect(regulation_Niveau_Condenseur.SortieReelle1, vanne_extraction.Ouv) 
    annotation (points=[748.5,-283; 782,-283; 782,-421]);
  connect(Temperature.y, SourceFumees.ITemperature) 
    annotation (points=[-458.5,-129; -427,-129; -427,-73]);
  connect(CapteurDebitEauBP.C1, EconomiseurBP.Cws2) 
    annotation (points=[628.3,26; 630,26; 630,4; 650,4; 650,-32]);
  connect(EconomiseurBP.Cws1, perteChargeKCond1.C2) annotation (points=[650,-72;
        650,-188; 872,-188; 872,-260]);
  connect(CapteurDebitVapCondenseur.Measure, regulation_Niveau_Condenseur.MesureDebitVapeur) 
    annotation (points=[661.13,-266; 674,-266; 674,-282.9; 727.6,-282.9]);
  connect(regulation_Niveau_Condenseur.MesureDebitEau,
    CapteurDebitEauCondenseur.Measure) annotation (points=[727.45,-276.95; 720,
        -276.95; 720,-312; 762,-312; 762,-414; 662.13,-414]);
  connect(ConstantVanneTurbineHP.y, vanne_entree_TurbineHP.Ouv) 
    annotation (points=[-164.5,-181; -144,-181; -144,-215]);
  connect(regulation_Niveau_BP.SortieReelle1, vanne_vapeurBP.Ouv) 
    annotation (points=[558.5,107; 570,107; 570,88; 518,88; 518,65]);
  connect(vanne_alimentationBP.Ouv, constante_vanne_vapeurBP.y) 
    annotation (points=[610,63; 610,79; 623.4,79]);
  connect(EconomiseurHP1.Cws2, VolumeECO_HP1_2.Ce1) annotation (points=[496,-72;
        496,-90; 426,-90],          style(color=3, rgbcolor={0,0,255}));
  connect(VolumeECO_HP1_2.Cs, EconomiseurHP2.Cws1) annotation (points=[406,-90;
        376,-90; 376,-72],      style(color=3, rgbcolor={0,0,255}));
  connect(EconomiseurHP2.Cws2, VolumeECO_HP2_3.Ce1) annotation (points=[376,-32;
        376,-12; 222,-12],          style(color=3, rgbcolor={0,0,255}));
  connect(VolumeECO_HP2_3.Cs, EconomiseurHP3.Cws1) annotation (points=[202,-12;
        176,-12; 176,-32],      style(color=3, rgbcolor={0,0,255}));
  connect(Vanne_alimentationMPHP1.C1, PompeAlimHP.C2) 
    annotation (points=[724,-104.8; 812,-104.8; 812,-52; 794,-52]);
  connect(PompeAlimMP.C2, Vanne_alimentationMPHP2.C1) annotation (points=[794,-12;
        840,-12; 840,-144.8; 774,-144.8],          style(color=3, rgbcolor={0,0,
          255}));
  connect(arretPomesMp1.y, Vanne_alimentationMPHP1.Ouv) 
    annotation (points=[876.1,-136; 826,-136; 826,-124; 712,-124; 712,-125.2]);
  connect(arretPomesHP1.y, Vanne_alimentationMPHP2.Ouv) 
    annotation (points=[876.1,-180; 853.05,-180; 853.05,-165.2; 762,-165.2]);
  connect(Vanne_alimentationMPHP1.C2, EconomiseurHP1.Cws1) annotation (points=[700,
        -104.8; 606,-104.8; 606,-108; 518,-108; 518,-8; 496,-8; 496,-32],
      style(color=3, rgbcolor={0,0,255}));
  connect(EconomiseurMP.Cws1, Vanne_alimentationMPHP2.C2) 
    annotation (points=[436,-72; 436,-144.8; 750,-144.8]);
  connect(ConstantVanneTurbineMP.y, vanne_entree_TurbineMP.Ouv) 
    annotation (points=[-164.5,-265; -144,-265; -144,-299]);
  connect(vanne_entree_TurbineHP.C2, VolumePreTHP.Ce) annotation (points=[-134,
        -232; -92,-232],                            style(color=1, rgbcolor={
          255,0,0}));
  connect(DoubleDebitMP.Cs, vanne_entree_TurbineMP.C1) annotation (points=[-262,
        -112; -262,-316; -154,-316], style(color=1, rgbcolor={255,0,0}));
  connect(vanne_entree_TurbineMP.C2, MelangeurPreTMP.Ce1) annotation (points=[-134,
        -316; -90,-316],                                 style(color=1,
        rgbcolor={255,0,0}));
  connect(SourceCaloporteur.C, Condenseur.Cee) annotation (points=[590,-355;
        608,-355; 608,-354; 609,-354.8], style(color=3, rgbcolor={0,0,255}));
  connect(Condenseur.Cse, PuitsCaloporteur.C) annotation (points=[689,-354; 706,
        -354], style(color=3, rgbcolor={0,0,255}));
  connect(CapteurDebitVapCondenseur.C2, Condenseur.Cv) annotation (points=[649.3,
        -276.2; 649.3,-290.1; 649,-290.1; 649,-306],       style(color=3,
        rgbcolor={0,0,255}));
  connect(CapteurDebitEauCondenseur.C1, Condenseur.Cl) 
    annotation (points=[650.3,-404; 649.8,-404; 649.8,-386]);
  connect(ConsigneNiveauEauHP.y, regulation_Niveau_HP.ConsigneNiveauEau) 
    annotation (points=[-152.3,120; -130,120; -130,108; -70.5,108]);
  connect(Condenseur.yNiveau, regulation_Niveau_Condenseur.MesureNiveauEau) 
    annotation (points=[693,-374.8; 750,-374.8; 750,-328; 702,-328; 702,-265;
        727.5,-265]);
  connect(BallonBP.Cs, CapteurDebitEauBPsortie.C1) annotation (points=[548,20;
        534,20; 534,14; 612,14; 612,-11.8; 657,-11.8], style(color=3, rgbcolor=
          {0,0,255}));
  connect(BallonBP.Ce1, vanne_alimentationBP.C2) 
    annotation (points=[588,48; 594,48; 594,46; 600,46]);
  connect(BallonMP.Ce1, vanne_alimentationMP.C2) 
    annotation (points=[328,48; 348,48]);
  connect(BallonHP.Ce1, vanne_alimentationHP.C2) 
    annotation (points=[8,48; 28,48]);
  connect(TurbineHP.Cs, MoitieDebitHP.Ce) annotation (points=[8.2,-232; 44,-232; 
        44,-172; 84,-172],       style(color=1, rgbcolor={255,0,0}));
  connect(VolumePreTHP.Cs3, TurbineHP.Ce) annotation (points=[-72,-232; -32.2,
        -232], style(color=1, rgbcolor={255,0,0}));
  connect(MelangeurPreTMP.Cs, TurbineMP.Ce) annotation (points=[-70,-316; 76,
        -316; 76,-232; 287.8,-232], style(color=1, rgbcolor={255,0,0}));
  connect(TurbineMP.Cs, MelangeurPostTMP1.Ce1) annotation (points=[328.2,-232;
        378,-232], style(color=1, rgbcolor={255,0,0}));
  connect(MelangeurPostTMP1.Cs, TurbineBP.Ce) annotation (points=[398,-232;
        545.8,-232], style(color=1, rgbcolor={255,0,0}));
  connect(TurbineBP.Cs, perteChargeK1.C1) annotation (points=[586.2,-232; 610,
        -232], style(color=1, rgbcolor={255,0,0}));
  connect(EconomiseurMP.Cws2, CapteurDebitEauMP.C1) annotation (points=[436,-32;
        440,-32; 440,48.4; 394,48.4],          style(color=3, rgbcolor={0,0,255}));
  connect(TurbineMP.MechPower, Alternateur.Wmec2) 
    annotation (points=[330,-250; 338,-250; 338,-380; 372,-380]);
  connect(TurbineBP.MechPower, Alternateur.Wmec1) annotation (points=[588,-250;
        598,-250; 598,-292; 358,-292; 358,-360; 372,-360]);
  connect(TurbineHP.MechPower, Alternateur.Wmec3) 
    annotation (points=[10,-250; 18,-250; 18,-400; 372,-400]);
  connect(Debit.y, SourceFumees.IMassFlow) 
    annotation (points=[-458.5,9; -427,9; -427,-31]);
  connect(heatSource.C[1], BallonHP.Cex) annotation (points=[-12,66.3; -12,48],
      style(color=46, rgbcolor={191,95,0}));
  connect(heatSource1.C[1], BallonMP.Cex) annotation (points=[309,66.3; 309,48],
      style(color=46, rgbcolor={191,95,0}));
  connect(heatSource2.C[1], BallonBP.Cex) annotation (points=[568,62.3; 568,48],
      style(color=46, rgbcolor={191,95,0}));
  connect(PompeAlimMP.rpm_or_mpower, arretPomesMp.y)
    annotation (points=[784,-23; 784,-28; 874.1,-28], style(smooth=0));
  connect(PompeAlimHP.rpm_or_mpower, arretPomesHP.y)
    annotation (points=[784,-63; 784,-82; 875.1,-82], style(smooth=0));
  connect(PompeAlimBP.rpm_or_mpower, arretPomesBP.y) annotation (points=[722,
        -449; 722,-460; 860,-460; 860,-444; 875.1,-444], style(smooth=0));
end CombinedCycle_TripTAC;
