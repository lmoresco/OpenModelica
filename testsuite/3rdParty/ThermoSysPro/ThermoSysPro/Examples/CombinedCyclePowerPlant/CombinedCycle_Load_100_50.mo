within ThermoSysPro.Examples.CombinedCyclePowerPlant;
model CombinedCycle_Load_100_50 
  "CCPP model to simulate a load variation from 100% to 50%" 
  
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
    Kpa=5)           annotation (extent=[38,10; -2,50]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_alimentationHP(Cvmax(fixed=
          false) = 135) 
                 annotation (extent=[78,46; 58,66]);
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante 
    constante_vanne_vapeurHP(                                                              k=0.5) 
    annotation (extent=[-18,70; -28,78]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_vapeurHP(
    Cvmax=47829.4,
    mode=0)      annotation (extent=[-22,46; -42,66]);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss GainChargeHP(
    z2=0,
    mode=1,
    K(fixed=false) = 720.183,
    Q(start=150, fixed=true),
    z1=10.83) 
            annotation (extent=[18,-100; 38,-80],  rotation=180);
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeEvapHP(mode=1, V=5) 
                                           annotation (extent=[8,-100; -12,-80]);
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
      p_rho=1.05))        annotation (extent=[-34,-70; 6,-30], rotation=90);
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
      p_rho=1.06))        annotation (extent=[106,-30; 66,-70],  rotation=270);
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
      p_rho=1.04))        annotation (extent=[-34,-70; -74,-30],
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
                  annotation (extent=[186,-30; 226,-70],   rotation=90);
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
                  annotation (extent=[386,-70; 426,-30],   rotation=90);
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
                  annotation (extent=[506,-30; 546,-70],   rotation=90);
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
                  annotation (extent=[-194,-70; -154,-30],
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
      p_rho=1))   annotation (extent=[-314,-30; -274,-70],
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
    Mp=5000)         annotation (extent=[358,10; 320,50]);
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante 
    constante_vanne_vapeurMP(                                                              k=0.5) 
    annotation (extent=[304,70; 292,80]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_alimentationMP(Cvmax(fixed=
          false) = 70) 
                 annotation (extent=[398,46; 378,66]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_vapeurMP(
    Pm(fixed=false),
    h(fixed=false),
    Cvmax=47829.4,
    mode=0)      annotation (extent=[298,46; 278,66]);
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
      p_rho=1.1))         annotation (extent=[286,-70; 326,-30],
                                                               rotation=90);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss GainChargeMP(
    z2=0,
    z1=10.83,
    mode=1,
    K(fixed=false) = 1090.96,
    Q(start=150, fixed=true)) 
            annotation (extent=[338,-100; 358,-80],rotation=180,
    style(color=45, rgbcolor={255,128,0}));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeEvapMP(mode=1, V=5) 
                                           annotation (extent=[328,-100; 308,
        -80],
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
      p_rho=1.12))        annotation (extent=[446,-70; 486,-30],
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
      p_rho=1.07))        annotation (extent=[126,-30; 166,-70],
                                                               rotation=90);
  ThermoSysPro.WaterSteam.Volumes.VolumeB MelangeurHPMP 
    annotation (extent=[158,-120; 138,-100],
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
      p_rho=1.03))        annotation (extent=[-134,-70; -94,-30],
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
      p_rho=1.01))        annotation (extent=[-254,-30; -214,-70],
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
    Mp=5000)         annotation (extent=[618,10; 578,50]);
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante 
    constante_vanne_vapeurBP(                                                              k=0.5) 
    annotation (extent=[666,76; 654,86]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_vapeurBP(
    Cvmax(fixed=false) = 32000,
    p_rho=3)     annotation (extent=[558,46; 538,66]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_alimentationBP(
    h(fixed=false),
    Pm(fixed=false, start=5.0698e5),
    Cvmax=285)   annotation (extent=[650,44; 630,64]);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss GainChargeBP(
    z2=0,
    z1=10.767,
    Q(start=50, fixed=false),
    K=32766,
    mode=1) annotation (extent=[600,-100; 620,-80],rotation=180,
    style(color=45, rgbcolor={255,128,0}));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeEvapBP(h(start=642e3), mode=1,
    V=5)                                   annotation (extent=[592,-100; 572,
        -80],
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
      p_rho=1.14))        annotation (extent=[546,-70; 586,-30],
                                                               rotation=90);
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante 
    constante_ballonBP(                                                              k=1) 
    annotation (extent=[742,6; 728,18]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Vanne_alimentationMPHP(
      Pm(start=5.0698e5), mode=1,
    Cvmax=308.931) 
                 annotation (extent=[710,-14; 730,6]);
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
      p_rho=1.09))        annotation (extent=[246,-30; 286,-70],
                                                               rotation=90);
  ThermoSysPro.FlueGases.BoundaryConditions.SinkP PuitsFumees(P0=1.013e5) 
    annotation (extent=[732,-60; 712,-40],
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
      p_rho=1.15))        annotation (extent=[660,-70; 700,-30],
                                                               rotation=90);
  ThermoSysPro.WaterSteam.Machines.StodolaTurbine TurbineHP(
    W_fric=1,
    Ps(fixed=false),
    Cst(fixed=false) = 7618660.65374636,
    Pe(fixed=true, start=124.31e5),
    eta_stato=1,
    eta_is(start=0.88057),
    Qmax=140,
    eta_is_nom=0.88057,
    eta_is_min=0.75) 
              annotation (extent=[-2,-250; 38,-210],   style(color=1, rgbcolor=
          {255,0,0}));
  ThermoSysPro.WaterSteam.Machines.StodolaTurbine TurbineMP(
    W_fric=1,
    Ps(fixed=false),
    Cst(fixed=false) = 278905.664031036,
    Pe(fixed=true, start=25.485e5),
    eta_stato=1,
    eta_is(start=0.9625),
    Qmax=150,
    eta_is_nom=0.9625,
    eta_is_min=0.75) 
                annotation (extent=[318,-250; 358,-210], style(color=1,
        rgbcolor={255,0,0}));
  ThermoSysPro.WaterSteam.Volumes.VolumeC MelangeurPostTMP1 
                                           annotation (extent=[428,-240; 408,
        -220], rotation=180);
  ThermoSysPro.WaterSteam.Machines.StodolaTurbine TurbineBP(
    W_fric=1,
    Cst(fixed=false) = 13491.6445678148,
    Pe(fixed=true, start=4.768e5),
    eta_stato=1,
    eta_is(start=0.9538),
    Qmax=150,
    eta_is_nom=0.9538,
    eta_is_min=0.75) 
                annotation (extent=[576,-250; 616,-210], style(color=1,
        rgbcolor={255,0,0}));
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier DoubleDebitHP(
                                                    alpha=2) 
    annotation (extent=[-302,-110; -282,-90],rotation=270);
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier DoubleDebitMP(
                                                    alpha=2) 
    annotation (extent=[-242,-110; -222,-90],rotation=270);
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier MoitieDebitHP(
                                                    alpha=0.5) 
    annotation (extent=[114,-180; 134,-160],style(color=1, rgbcolor={255,0,0}));
  ThermoSysPro.WaterSteam.HeatExchangers.SimpleDynamicCondenser Condenseur(
    D=0.018,
    V=1000,
    A=100,
    lambda=0.01,
    ntubes=28700,
    continuous_flow_reversal=true,
    P(fixed=false, start=6136),
    yNiveau(signal(fixed=false, start=1.5)),
    Vf0=0.15,
    steady_state=false) 
    annotation (extent=[639,-384; 719,-304]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ SourceCaloporteur(
    h0=113.38e3, Q0=29804.5)     annotation (extent=[572,-377; 620,-329]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsCaloporteur 
    annotation (extent=[736,-374; 780,-330]);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK1(    K=1e-4) 
    annotation (extent=[640,-240; 660,-220],
                                           rotation=0,
    style(color=1, rgbcolor={255,0,0}));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeCond1(mode=1) 
    annotation (extent=[892,-308; 912,-328], rotation=270);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeKCond1(    K=1e-4, mode=1) 
    annotation (extent=[890,-258; 914,-282], rotation=270);
  ThermoSysPro.WaterSteam.Volumes.VolumeA VolumeAlimMPHP(mode=1) 
                                           annotation (extent=[742,-20; 762,0]);
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump PompeAlimMP(
    a3=350,
    b1(fixed=true) = -3.7751,
    a1=-244551,
    Q(fixed=false),
    mode=1) annotation (extent=[804,-20; 824,0]);
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump PompeAlimHP(
    a3=1600,
    a1=-28056.2,
    b1=-12.7952660447433,
    Q(fixed=false),
    mode=1)  annotation (extent=[804,-60; 824,-40]);
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier MoitieDebitBP(
                                                    alpha=0.5) 
    annotation (extent=[872,-328; 886,-308], rotation=0);
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier DoubleDebitBP(
                                                    alpha=2) 
    annotation (extent=[258,-110; 278,-90],  rotation=270,
    style(color=1, rgbcolor={255,0,0}));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss PerteChargeZero2(
    z2=0,
    mode=0,
    z1=0,
    C1(P(fixed=true, start=5.0185e5)),
    K(fixed=false) = 1e-4) 
            annotation (extent=[354,-288; 334,-268],
                                                   rotation=180,
    style(color=1, rgbcolor={255,0,0}));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK3(    K=1e-4, mode=1) 
    annotation (extent=[790,-60; 770,-40],   rotation=180);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK8(    K=1e-4, mode=1) 
    annotation (extent=[790,-20; 770,0],     rotation=180);
  ThermoSysPro.WaterSteam.Machines.Generator Alternateur 
    annotation (extent=[402,-448; 522,-348]);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK(
                                                         K=1e-4, mode=1) 
    annotation (extent=[702,-446; 722,-426]);
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump PompeAlimBP(
    C2(P(fixed=false, start=22e5)),
    Qv(start=0.1),
    Q(start=194.502),
    mode=1,
    a1(fixed=true) = -6000,
    a3=400) annotation (extent=[742,-446; 762,-426]);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss perteChargeK2(
                                                         K=1e-4, mode=1) 
    annotation (extent=[840,-446; 860,-426]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_extraction(            mode=1, Cvmax=
        2000)    annotation (extent=[802,-440; 822,-420]);
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitVapHP 
    annotation (extent=[-52,2; -64,14],  rotation=-90);
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauHP 
    annotation (extent=[85,38; 98,26], rotation=-90);
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauMP 
    annotation (extent=[424,49; 409,63], rotation=0);
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitVapMP 
    annotation (extent=[228,64; 244,48], rotation=-180);
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitVapBP 
    annotation (extent=[506,64; 522,48], rotation=-180);
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauBP 
    annotation (extent=[657,40; 670,28], rotation=-90);
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauBPsortie 
    annotation (extent=[687,-11; 700,1],rotation=0);
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitEauCondenseur 
    annotation (extent=[679,-422; 692,-402],
                                         rotation=-90);
  ThermoSysPro.WaterSteam.Sensors.SensorQ CapteurDebitVapCondenseur 
    annotation (extent=[678,-274; 691,-254],
                                         rotation=-90);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss lumpedStraightPipeK2(  K(fixed=
          false) = 10, C1(P(fixed=true, start=27.267e5))) 
    annotation (extent=[114,-120; 94,-100]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_entree_TurbineHP(
    h(fixed=false),
    mode=0,
    Pm(fixed=false),
    Cvmax(fixed=false) = 8000,
    C1(P(fixed=true, start=126.81e5))) 
                 annotation (extent=[-124,-234; -104,-214]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante 
    ConsigneNiveauEauHP(                                                              k=1.05) 
    annotation (extent=[-158,113; -124,131]);
  ThermoSysPro.Examples.CombinedCyclePowerPlant.Control.Drum_LevelControl 
    regulation_Niveau_HP(
    pIsat(Ti=500),
    add(k1=-1, k2=+1),
    Ti=500) 
    annotation (extent=[-40,106; -20,126]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante 
    ConsigneNiveauEauMP(                                                              k=1.05) 
    annotation (extent=[173,113; 207,131]);
  ThermoSysPro.Examples.CombinedCyclePowerPlant.Control.Drum_LevelControl 
    regulation_Niveau_MP(
    pIsat(Ti=500),
    add(k1=-1, k2=+1),
    Ti=500) 
    annotation (extent=[262,106; 282,126]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante 
    ConsigneNiveauEauBP(                                                              k=1.75) 
    annotation (extent=[470,126; 504,144]);
  Control.Drum_LevelControl regulation_Niveau_BP(
                     add(k1=-1, k2=+1), pIsat(Ti=500),
    Ti=10) 
    annotation (extent=[568,108; 588,128]);
   ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante 
    ConsigneNiveauCondenseur1(                                 k=1.5) 
    annotation (extent=[716,-246; 740,-230]);
  ThermoSysPro.Examples.CombinedCyclePowerPlant.Control.Condenser_LevelControl 
    regulation_Niveau_Condenseur(pIsat(Ti=500), add(k1=+1, k2=-1)) 
                                 annotation (extent=[758,-282; 778,-262]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Tables.Table1DTemps 
    ConstantVanneTurbineHP(Table=[0,0.8; 10,0.8; 600,0.8; 650,0.8; 3000,0.8;
        3100,0.8]) annotation (extent=[-208,-216; -138,-142]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesMp(
    Initialvalue=1400,
    Finalvalue=1000,
    Duration=1000,
    Starttime=200000) 
                   annotation (extent=[944,-42; 906,-10]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesHP(
    Initialvalue=1400,
    Finalvalue=1000,
    Duration=1000,
    Starttime=200000) 
                   annotation (extent=[945,-96; 907,-64]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesBP(
    Initialvalue=1400,
    Finalvalue=1000,
    Duration=1000,
    Starttime=200000) 
                   annotation (extent=[945,-458; 907,-426]);
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeECO_HP1_2(
    mode=1,
    V=1,
    h0=988332,
    h(start=988332),
    P0=70.1e5,
    P(start=70.1e5),
    dynamic_mass_balance=true)            annotation (extent=[456,-98; 436,-78],
      style(color=45, rgbcolor={255,128,0}));
  ThermoSysPro.WaterSteam.Volumes.VolumeC VolumeECO_HP2_3(
    mode=1,
    V=1,
    h0=983786,
    h(start=983786),
    P0=70.0e5,
    P(start=70.0e5),
    dynamic_mass_balance=true)            annotation (extent=[252,-20; 232,0],
      style(color=45, rgbcolor={255,128,0}));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Vanne_alimentationMPHP1(
      Pm(start=5.0698e5), mode=1,
    Cvmax=308.931) 
                 annotation (extent=[754,-98; 730,-122]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Vanne_alimentationMPHP2(
      Pm(start=5.0698e5), mode=1,
    Cvmax=308.931) 
                 annotation (extent=[804,-138; 780,-162]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesMp1(
    Initialvalue=0.8,
    Finalvalue=0.01,
    Duration=1000,
    Starttime=200000) 
                     annotation (extent=[946,-150; 908,-118]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe arretPomesHP1(
    Initialvalue=0.8,
    Finalvalue=0.01,
    Duration=1000,
    Starttime=200000) 
                     annotation (extent=[946,-194; 908,-162]);
  ThermoSysPro.WaterSteam.Volumes.VolumeD VolumePreTHP(
    P0=127e5,
    h0=3e6,
    P(start=127e5),
    h(start=3e6),
    dynamic_mass_balance=true)        annotation (extent=[-42,-240; -62,-220],
               rotation=180);
  ThermoSysPro.WaterSteam.Volumes.VolumeC MelangeurPreTMP(
    h0=3523910,
    h(start=3523910),
    P0=24e5,
    P(start=24e5),
    dynamic_mass_balance=true)            annotation (extent=[-40,-324; -60,
        -304], rotation=180,
    style(color=1, rgbcolor={255,0,0}));
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve vanne_entree_TurbineMP(
    h(fixed=false),
    mode=0,
    Pm(fixed=false),
    Cvmax(fixed=false) = 1500,
    C1(P(fixed=true, start=25.486e5))) 
                 annotation (extent=[-124,-318; -104,-298]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Tables.Table1DTemps 
    ConstantVanneTurbineMP(Table=[0,0.8; 10,0.8; 600,0.8; 2000,0.8; 3000,0.8;
        3100,0.8]) annotation (extent=[-208,-300; -138,-226]);
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource(T0={303.16}) 
    annotation (extent=[5,68; 31,98]);
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource1(T0={303.16}) 
    annotation (extent=[326,68; 352,98]);
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource2(T0={303.16}) 
    annotation (extent=[585,64; 611,94]);
  ThermoSysPro.Combustion.BoundaryConditions.FuelSourcePQ sourceCombustible(
    Cp=1282,
    Hum=0,
    Xo=0,
    Xn=0,
    Xs=0,
    Xc=0.7345402123,
    Xh=0.2265526676,
    rho=0.838,
    T0=454.058203125,
    LHV=47274523.4375,
    Q0=13.4368286133) 
          annotation (extent=[-420,26; -384,62]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourceEau(Q0=1e-4) 
          annotation (extent=[-470,22; -442,52]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Humidite(k=0.9231689453125) 
    annotation (extent=[-504,-16; -483,4]);
  ThermoSysPro.FlueGases.BoundaryConditions.SourcePQ SourceFumees(
    Xso2=0,
    T0=297.0679077148,
    Xco2=0,
    Xh2o=0,
    Xo2=0.20994,
    P0=1.013e5,
    Q0=600) 
    annotation (extent=[-538,-73; -494,-27]);
  ThermoSysPro.FlueGases.TAC.GasTurbine GasTurbine(
    Wpth=1e6,
    comp_tau_n=13.784,
    comp_eff_n=0.87375,
    Kcham=1.114801,
    exp_tau_n=0.0816,
    TurbQred=0.01787,
    exp_eff_n=0.89) 
    annotation (extent=[-468,-114; -338,14]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampeQfuel(
    Initialvalue=13.4368286133,
    Starttime=200,
    Finalvalue=8.25,
    Duration=800)    annotation (extent=[-548,60; -528,80]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampeIQair(
    Starttime=200,
    Duration=800,
    Initialvalue=594,
    Finalvalue=497.5) 
                   annotation (extent=[-548,-16; -528,4]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Math.Gain Gain_2GasTurbine(Gain=
       2) annotation (extent=[-18,-448; 2,-428]);
equation 
  connect(SurchauffeurHP3.Cws1, SurchauffeurHP2.Cws2) 
    annotation (points=[-294,-30; -294,-10; -174,-10; -174,-30],
                                                             style(color=1,
        rgbcolor={255,0,0}));
  connect(SurchauffeurHP2.Cws1, SurchauffeurHP1.Cws2) 
    annotation (points=[-174,-70; -174,-90; -54,-90; -54,-70],
                                                             style(color=1,
        rgbcolor={255,0,0}));
  connect(constante_vanne_vapeurHP.y, vanne_vapeurHP.Ouv) 
    annotation (points=[-28.5,74; -32,74; -32,67]);
  connect(vanne_vapeurHP.C1, BallonHP.Cv) 
    annotation (points=[-22,50; -2,50],      style(color=1, rgbcolor={255,0,0}));
  connect(GainChargeHP.C1, BallonHP.Cd) 
    annotation (points=[38,-90; 48,-90; 48,10; 38,10],     style(color=45,
        rgbcolor={255,128,0}));
  connect(BallonHP.Cm, EvaporateurHP.Cws2) 
    annotation (points=[-2,10; -14,10; -14,-30]);
  connect(VolumeEvapHP.Cs, EvaporateurHP.Cws1) 
    annotation (points=[-12,-90; -12,-70; -14,-70],
                                         style(color=45, rgbcolor={255,128,0}));
  connect(VolumeEvapHP.Ce1, GainChargeHP.C2) 
                                      annotation (points=[8,-90; 18,-90],
      style(color=45, rgbcolor={255,128,0}));
  connect(EconomiseurHP4.Cws1, EconomiseurHP3.Cws2) 
    annotation (points=[86,-70; 86,-82; 206,-82; 206,-70]);
  connect(BallonMP.Cm, EvaporateurMP.Cws2) 
    annotation (points=[320,10; 306,10; 306,-30]);
  connect(EvaporateurMP.Cws1, VolumeEvapMP.Cs) 
    annotation (points=[306,-70; 306,-80; 308,-80; 308,-90],
                                         style(color=45, rgbcolor={255,128,0}));
  connect(VolumeEvapMP.Ce1, GainChargeMP.C2) 
    annotation (points=[328,-90; 338,-90], style(color=45, rgbcolor={255,128,0}));
  connect(constante_vanne_vapeurMP.y, vanne_vapeurMP.Ouv) 
    annotation (points=[291.4,75; 288,75; 288,67]);
  connect(SurchauffeurHP1.Cfg2, EvaporateurHP.Cfg1)        annotation (points=[-44,-50;
        -24,-50],                              style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(EvaporateurHP.Cfg2, EconomiseurHP4.Cfg1)        annotation (points=[-4,-50;
        76,-50],          style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(EconomiseurHP4.Cfg2, SurchauffeurMP1.Cfg1)          annotation (
      points=[96,-50; 136,-50],                   style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(SurchauffeurMP1.Cfg2, EconomiseurHP3.Cfg1)           annotation (
      points=[156,-50; 196,-50], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(EvaporateurMP.Cfg2, EconomiseurHP2.Cfg1)           annotation (points=[316,-50;
        396,-50],          style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(EconomiseurHP2.Cfg2, EconomiseurMP.Cfg1)           annotation (points=[416,-50;
        456,-50],          style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(EconomiseurMP.Cfg2, EconomiseurHP1.Cfg1)           annotation (points=[476,-50;
        516,-50],          style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(GainChargeMP.C1, BallonMP.Cd) 
    annotation (points=[358,-90; 368,-90; 368,10; 358,10], style(color=45,
        rgbcolor={255,128,0}));
  connect(SurchauffeurMP2.Cfg2, SurchauffeurHP1.Cfg1)          annotation (
      points=[-104,-50; -64,-50],  style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(SurchauffeurMP2.Cfg1, SurchauffeurHP2.Cfg2)           annotation (
      points=[-124,-50; -164,-50], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(SurchauffeurMP3.Cfg2, SurchauffeurHP2.Cfg1)           annotation (
      points=[-224,-50; -184,-50], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(SurchauffeurHP3.Cfg2, SurchauffeurMP3.Cfg1)           annotation (
      points=[-284,-50; -244,-50], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(SurchauffeurMP3.Cws1,SurchauffeurMP2. Cws2) 
    annotation (points=[-234,-30; -234,10; -114,10; -114,-30],
                                                             style(color=1,
        rgbcolor={255,0,0}));
  connect(SurchauffeurMP1.Cws2, MelangeurHPMP.Ce2) annotation (points=[146,-70;
        146,-85; 148,-85; 148,-100],
                     style(
      color=1,
      rgbcolor={255,0,0},
      pattern=0));
  connect(vanne_vapeurBP.C1, BallonBP.Cv) 
    annotation (points=[558,50; 578,50],     style(color=1, rgbcolor={255,0,0}));
  connect(EvaporateurBP.Cws1, VolumeEvapBP.Cs)  annotation (points=[566,-70;
        566,-90; 572,-90],
                       style(color=45, rgbcolor={255,128,0}));
  connect(VolumeEvapBP.Ce1, GainChargeBP.C2) 
                                        annotation (points=[592,-90; 600,-90],
      style(color=45, rgbcolor={255,128,0}));
  connect(BallonBP.Cd, GainChargeBP.C1) 
                                       annotation (points=[618,10; 628,10; 628,
        -90; 620,-90], style(color=45, rgbcolor={255,128,0}));
  connect(EconomiseurBP.Cfg2, PuitsFumees.C)     annotation (points=[690,-50;
        712.2,-50],          style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(EconomiseurHP3.Cfg2, SurchauffeurBP.Cfg1)  annotation (
      points=[216,-50; 256,-50], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(SurchauffeurBP.Cfg2, EvaporateurMP.Cfg1)  annotation (
      points=[276,-50; 296,-50], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(EconomiseurHP1.Cfg2, EvaporateurBP.Cfg1) annotation (
      points=[536,-50; 556,-50], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(EvaporateurBP.Cfg2, EconomiseurBP.Cfg1) annotation (
      points=[576,-50; 670,-50], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(BallonBP.Cm, EvaporateurBP.Cws2) 
    annotation (points=[578,10; 566,10; 566,-30]);
  connect(vanne_vapeurMP.C1, BallonMP.Cv)   annotation (points=[298,50; 320,50],
              style(color=1, rgbcolor={255,0,0}));
  connect(Vanne_alimentationMPHP.Ouv, constante_ballonBP.y) 
    annotation (points=[720,7; 720,12; 727.3,12]);
  connect(SurchauffeurHP3.Cws2, DoubleDebitHP.Ce) 
    annotation (points=[-294,-70; -294,-80; -292,-80; -292,-90],
                                           style(color=1, rgbcolor={255,0,0}));
  connect(SurchauffeurMP3.Cws2, DoubleDebitMP.Ce) 
    annotation (points=[-234,-70; -234,-80; -232,-80; -232,-90],
                                           style(color=1, rgbcolor={255,0,0}));
  connect(VolumeCond1.Cs, perteChargeKCond1.C1) annotation (points=[902,-308;
        902,-282], style(color=3, rgbcolor={0,0,255}));
  connect(Vanne_alimentationMPHP.C2, VolumeAlimMPHP.Ce1) 
                                               annotation (points=[730,-10; 742,
        -10],                      style(color=3, rgbcolor={0,0,255}));
  connect(SurchauffeurBP.Cws2, DoubleDebitBP.Ce) 
    annotation (points=[266,-70; 266,-80; 268,-80; 268,-90],
                                         style(color=1, rgbcolor={255,0,0}));
  connect(perteChargeK8.C2, PompeAlimMP.C1) 
    annotation (points=[790,-10; 797,-10; 797,-10; 804,-10],
                                         style(color=3, rgbcolor={0,0,255}));
  connect(VolumeAlimMPHP.Cs1, perteChargeK8.C1) 
    annotation (points=[762,-10; 766,-10; 766,-10; 770,-10],
                                         style(color=3, rgbcolor={0,0,255}));
  connect(VolumeAlimMPHP.Cs2, perteChargeK3.C1) 
                                         annotation (points=[752,-20; 752,-50;
        770,-50],style(color=3, rgbcolor={0,0,255}));
  connect(perteChargeK3.C2, PompeAlimHP.C1) 
    annotation (points=[790,-50; 804,-50],
                                         style(color=3, rgbcolor={0,0,255}));
  connect(MelangeurPostTMP1.Ce2, PerteChargeZero2.C2) annotation (points=[418,-239;
        418,-278; 354,-278],       style(color=1, rgbcolor={255,0,0}));
  connect(perteChargeK.C2,PompeAlimBP. C1) 
                                         annotation (points=[722,-436; 742,-436],
      style(color=3, rgbcolor={0,0,255}));
  connect(vanne_extraction.C2, perteChargeK2.C1) annotation (points=[822,-436;
        840,-436],                       style(color=3, rgbcolor={0,0,255}));
  connect(vanne_alimentationHP.C1, CapteurDebitEauHP.C2) 
    annotation (points=[78,50; 86.3,50; 86.3,38.12]);
  connect(vanne_vapeurHP.C2, CapteurDebitVapHP.C1) annotation (points=[-42,50;
        -53.2,50; -53.2,14],     style(color=1, rgbcolor={255,0,0}));
  connect(CapteurDebitVapHP.C2, SurchauffeurHP1.Cws1) annotation (points=[-53.2,
        1.88; -53.2,-3.06; -54,-3.06; -54,-30],            style(color=1,
        rgbcolor={255,0,0}));
  connect(vanne_alimentationMP.C1, CapteurDebitEauMP.C2) 
    annotation (points=[398,50; 403.425,50; 403.425,50.4; 408.85,50.4]);
  connect(CapteurDebitVapMP.C1, vanne_vapeurMP.C2) annotation (points=[244,49.6;
        260,49.6; 260,50; 278,50],     style(color=1, rgbcolor={255,0,0}));
  connect(CapteurDebitVapMP.C2, SurchauffeurMP1.Cws1) annotation (points=[227.84,
        49.6; 146,49.6; 146,-30],      style(color=1, rgbcolor={255,0,0}));
  connect(CapteurDebitVapBP.C2, SurchauffeurBP.Cws1) annotation (points=[505.84,
        49.6; 490,49.6; 490,-2; 266,-2; 266,-30],        style(color=1,
        rgbcolor={255,0,0}));
  connect(CapteurDebitVapBP.C1, vanne_vapeurBP.C2) annotation (points=[522,49.6;
        530,49.6; 530,50; 538,50],     style(color=1, rgbcolor={255,0,0}));
  connect(CapteurDebitEauBP.C2, vanne_alimentationBP.C1) annotation (points=[658.3,
        40.12; 658.3,48; 650,48],       style(color=3, rgbcolor={0,0,255}));
  connect(CapteurDebitEauBPsortie.C2, Vanne_alimentationMPHP.C1) annotation (
      points=[700.13,-9.8; 705.065,-9.8; 705.065,-10; 710,-10],   style(color=3,
        rgbcolor={0,0,255}));
  connect(CapteurDebitEauCondenseur.C2, perteChargeK.C1) annotation (points=[680.3,
        -422.2; 680.3,-436; 702,-436],       style(color=3, rgbcolor={0,0,255}));
  connect(perteChargeK1.C2, CapteurDebitVapCondenseur.C1) annotation (points=[660,-230;
        679.3,-230; 679.3,-254],           style(
      color=1,
      rgbcolor={255,0,0},
      fillColor=3,
      rgbfillColor={0,0,255},
      fillPattern=1));
  connect(MelangeurHPMP.Ce1, MoitieDebitHP.Cs) 
    annotation (points=[148,-120; 148,-170; 134,-170],
                                                    style(color=1, rgbcolor={
          255,0,0}));
  connect(perteChargeK2.C2, MoitieDebitBP.Ce) annotation (points=[860,-436; 862,
        -436; 862,-318; 872,-318], style(color=3, rgbcolor={0,0,255}));
  connect(MoitieDebitBP.Cs, VolumeCond1.Ce3) annotation (points=[886,-318; 892,
        -318], style(color=3, rgbcolor={0,0,255}));
  connect(SurchauffeurMP2.Cws1, lumpedStraightPipeK2.C2) 
    annotation (points=[-114,-70; -114,-110; 94,-110], style(color=1, rgbcolor=
          {255,0,0}));
  connect(lumpedStraightPipeK2.C1, MelangeurHPMP.Cs2) 
    annotation (points=[114,-110; 138.2,-110],
                                             style(color=1, rgbcolor={255,0,0}));
  connect(DoubleDebitHP.Cs, vanne_entree_TurbineHP.C1) annotation (points=[-292,
        -110; -292,-230; -124,-230], style(color=1, rgbcolor={255,0,0}));
  connect(DoubleDebitBP.Cs, PerteChargeZero2.C1) annotation (points=[268,-110;
        268,-278; 334,-278], style(color=1, rgbcolor={255,0,0}));
  connect(PompeAlimBP.C2, vanne_extraction.C1) annotation (points=[762,-436;
        802,-436],                       style(color=3, rgbcolor={0,0,255}));
  connect(BallonHP.yLevel,regulation_Niveau_HP. MesureNiveauEau) 
    annotation (points=[-4,30; -68,30; -68,125; -40.5,125]);
  connect(regulation_Niveau_HP.SortieReelle1, vanne_alimentationHP.Ouv) 
    annotation (points=[-19.5,107; 68,107; 68,67]);
  connect(ConsigneNiveauEauMP.y,regulation_Niveau_MP. ConsigneNiveauEau) 
    annotation (points=[208.7,122; 234,122; 234,110; 261.5,110]);
  connect(BallonMP.yLevel,regulation_Niveau_MP. MesureNiveauEau) 
    annotation (points=[318.1,30; 252,30; 252,125; 261.5,125]);
  connect(regulation_Niveau_MP.SortieReelle1, vanne_alimentationMP.Ouv) 
    annotation (points=[282.5,107; 377.25,107; 377.25,67; 388,67]);
  connect(ConsigneNiveauEauBP.y,regulation_Niveau_BP. ConsigneNiveauEau) 
    annotation (points=[505.7,135; 529.85,135; 529.85,112; 567.5,112]);
  connect(BallonBP.yLevel,regulation_Niveau_BP. MesureNiveauEau) 
    annotation (points=[576,30; 518,30; 518,127; 567.5,127]);
  connect(ConsigneNiveauCondenseur1.y, regulation_Niveau_Condenseur.ConsigneNiveauEau) 
    annotation (points=[741.2,-238; 752,-238; 752,-269; 757.5,-269]);
  connect(regulation_Niveau_Condenseur.SortieReelle1, vanne_extraction.Ouv) 
    annotation (points=[778.5,-281; 812,-281; 812,-419]);
  connect(CapteurDebitEauBP.C1, EconomiseurBP.Cws2) 
    annotation (points=[658.3,28; 660,28; 660,6; 680,6; 680,-30]);
  connect(EconomiseurBP.Cws1, perteChargeKCond1.C2) annotation (points=[680,-70;
        680,-186; 902,-186; 902,-258]);
  connect(CapteurDebitVapCondenseur.Measure, regulation_Niveau_Condenseur.MesureDebitVapeur) 
    annotation (points=[691.13,-264; 704,-264; 704,-280.9; 757.6,-280.9]);
  connect(regulation_Niveau_Condenseur.MesureDebitEau,
    CapteurDebitEauCondenseur.Measure) annotation (points=[757.45,-274.95; 750,
        -274.95; 750,-310; 792,-310; 792,-412; 692.13,-412]);
  connect(ConstantVanneTurbineHP.y, vanne_entree_TurbineHP.Ouv) 
    annotation (points=[-134.5,-179; -114,-179; -114,-213]);
  connect(regulation_Niveau_BP.SortieReelle1, vanne_vapeurBP.Ouv) 
    annotation (points=[588.5,109; 600,109; 600,90; 548,90; 548,67]);
  connect(vanne_alimentationBP.Ouv, constante_vanne_vapeurBP.y) 
    annotation (points=[640,65; 640,81; 653.4,81]);
  connect(EconomiseurHP1.Cws2, VolumeECO_HP1_2.Ce1) annotation (points=[526,-70;
        526,-88; 456,-88],          style(color=3, rgbcolor={0,0,255}));
  connect(VolumeECO_HP1_2.Cs, EconomiseurHP2.Cws1) annotation (points=[436,-88;
        406,-88; 406,-70],      style(color=3, rgbcolor={0,0,255}));
  connect(EconomiseurHP2.Cws2, VolumeECO_HP2_3.Ce1) annotation (points=[406,-30;
        406,-10; 252,-10],          style(color=3, rgbcolor={0,0,255}));
  connect(VolumeECO_HP2_3.Cs, EconomiseurHP3.Cws1) annotation (points=[232,-10;
        206,-10; 206,-30],      style(color=3, rgbcolor={0,0,255}));
  connect(Vanne_alimentationMPHP1.C1, PompeAlimHP.C2) 
    annotation (points=[754,-102.8; 842,-102.8; 842,-50; 824,-50]);
  connect(PompeAlimMP.C2, Vanne_alimentationMPHP2.C1) annotation (points=[824,-10;
        870,-10; 870,-142.8; 804,-142.8],          style(color=3, rgbcolor={0,0,
          255}));
  connect(arretPomesMp1.y, Vanne_alimentationMPHP1.Ouv) 
    annotation (points=[906.1,-134; 856,-134; 856,-122; 742,-122; 742,-123.2]);
  connect(arretPomesHP1.y, Vanne_alimentationMPHP2.Ouv) 
    annotation (points=[906.1,-178; 883.05,-178; 883.05,-163.2; 792,-163.2]);
  connect(Vanne_alimentationMPHP1.C2, EconomiseurHP1.Cws1) annotation (points=[730,
        -102.8; 636,-102.8; 636,-106; 548,-106; 548,-6; 526,-6; 526,-30],
      style(color=3, rgbcolor={0,0,255}));
  connect(EconomiseurMP.Cws1, Vanne_alimentationMPHP2.C2) 
    annotation (points=[466,-70; 466,-142.8; 780,-142.8]);
  connect(ConstantVanneTurbineMP.y, vanne_entree_TurbineMP.Ouv) 
    annotation (points=[-134.5,-263; -114,-263; -114,-297]);
  connect(vanne_entree_TurbineHP.C2, VolumePreTHP.Ce) annotation (points=[-104,
        -230; -62,-230],                            style(color=1, rgbcolor={
          255,0,0}));
  connect(DoubleDebitMP.Cs, vanne_entree_TurbineMP.C1) annotation (points=[-232,
        -110; -232,-314; -124,-314], style(color=1, rgbcolor={255,0,0}));
  connect(vanne_entree_TurbineMP.C2, MelangeurPreTMP.Ce1) annotation (points=[-104,
        -314; -60,-314],                                 style(color=1,
        rgbcolor={255,0,0}));
  connect(SourceCaloporteur.C, Condenseur.Cee) annotation (points=[620,-353;
        638,-353; 638,-352; 639,-352.8], style(color=3, rgbcolor={0,0,255}));
  connect(Condenseur.Cse, PuitsCaloporteur.C) annotation (points=[719,-352; 736,
        -352], style(color=3, rgbcolor={0,0,255}));
  connect(CapteurDebitVapCondenseur.C2, Condenseur.Cv) annotation (points=[679.3,
        -274.2; 679.3,-288.1; 679,-288.1; 679,-304],       style(color=3,
        rgbcolor={0,0,255}));
  connect(CapteurDebitEauCondenseur.C1, Condenseur.Cl) 
    annotation (points=[680.3,-402; 679.8,-402; 679.8,-384]);
  connect(ConsigneNiveauEauHP.y, regulation_Niveau_HP.ConsigneNiveauEau) 
    annotation (points=[-122.3,122; -100,122; -100,110; -40.5,110]);
  connect(Condenseur.yNiveau, regulation_Niveau_Condenseur.MesureNiveauEau) 
    annotation (points=[723,-372.8; 780,-372.8; 780,-326; 732,-326; 732,-263;
        757.5,-263]);
  connect(BallonBP.Cs, CapteurDebitEauBPsortie.C1) annotation (points=[578,22;
        564,22; 564,16; 642,16; 642,-9.8; 687,-9.8],   style(color=3, rgbcolor=
          {0,0,255}));
  connect(BallonBP.Ce1, vanne_alimentationBP.C2) 
    annotation (points=[618,50; 624,50; 624,48; 630,48]);
  connect(BallonMP.Ce1, vanne_alimentationMP.C2) 
    annotation (points=[358,50; 378,50]);
  connect(BallonHP.Ce1, vanne_alimentationHP.C2) 
    annotation (points=[38,50; 58,50]);
  connect(TurbineHP.Cs, MoitieDebitHP.Ce) annotation (points=[38.2,-230; 74,
        -230; 74,-170; 114,-170],style(color=1, rgbcolor={255,0,0}));
  connect(VolumePreTHP.Cs3, TurbineHP.Ce) annotation (points=[-42,-230; -2.2,
        -230], style(color=1, rgbcolor={255,0,0}));
  connect(MelangeurPreTMP.Cs, TurbineMP.Ce) annotation (points=[-40,-314; 106,
        -314; 106,-230; 317.8,-230],style(color=1, rgbcolor={255,0,0}));
  connect(TurbineMP.Cs, MelangeurPostTMP1.Ce1) annotation (points=[358.2,-230;
        408,-230], style(color=1, rgbcolor={255,0,0}));
  connect(MelangeurPostTMP1.Cs, TurbineBP.Ce) annotation (points=[428,-230;
        575.8,-230], style(color=1, rgbcolor={255,0,0}));
  connect(TurbineBP.Cs, perteChargeK1.C1) annotation (points=[616.2,-230; 640,
        -230], style(color=1, rgbcolor={255,0,0}));
  connect(EconomiseurMP.Cws2, CapteurDebitEauMP.C1) annotation (points=[466,-30;
        470,-30; 470,50.4; 424,50.4],          style(color=3, rgbcolor={0,0,255}));
  connect(TurbineMP.MechPower, Alternateur.Wmec2) 
    annotation (points=[360,-248; 368,-248; 368,-378; 402,-378]);
  connect(TurbineBP.MechPower, Alternateur.Wmec1) annotation (points=[618,-248;
        628,-248; 628,-290; 388,-290; 388,-358; 402,-358]);
  connect(TurbineHP.MechPower, Alternateur.Wmec3) 
    annotation (points=[40,-248; 48,-248; 48,-398; 402,-398]);
  connect(heatSource.C[1], BallonHP.Cex) annotation (points=[18,68.3; 18,50],
      style(color=46, rgbcolor={191,95,0}));
  connect(heatSource1.C[1], BallonMP.Cex) annotation (points=[339,68.3; 339,50],
      style(color=46, rgbcolor={191,95,0}));
  connect(heatSource2.C[1], BallonBP.Cex) annotation (points=[598,64.3; 598,50],
      style(color=46, rgbcolor={191,95,0}));
  connect(SourceFumees.C, GasTurbine.Entree_air) 
                                                annotation (points=[-494,-50;
        -468,-50],style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=2,
      rgbfillColor={0,255,0},
      fillPattern=1));
  connect(sourceCombustible.C, GasTurbine.Entree_combustible) annotation (
      points=[-384,44; -372,44; -372,42; -364,42; -364,14], style(color=0,
        rgbcolor={0,0,0}));
  connect(sourceEau.C, GasTurbine.Entree_eau_combustion) 
    annotation (points=[-442,37; -442,14], style(color=3, rgbcolor={0,0,255}));
  connect(sourceCombustible.IMassFlow, rampeQfuel.y) 
    annotation (points=[-402,53; -402,70; -527,70]);
  connect(Humidite.y, GasTurbine.Huminide) 
    annotation (points=[-481.95,-6; -470.6,-6; -470.6,-11.6]);
  connect(rampeIQair.y, SourceFumees.IMassFlow) 
    annotation (points=[-527,-6; -516,-6; -516,-38.5]);
  connect(GasTurbine.Sortie_fumees, SurchauffeurHP3.Cfg1) annotation (points=[
        -338,-50; -304,-50], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(GasTurbine.PuissanceMeca, Gain_2GasTurbine.u) 
    annotation (points=[-335.4,-75.6; -320,-75.6; -320,-438; -19,-438]);
  connect(Gain_2GasTurbine.y, Alternateur.Wmec5) 
    annotation (points=[3,-438; 402,-438]);
  connect(CapteurDebitEauHP.C1, EconomiseurHP4.Cws2) 
    annotation (points=[86.3,26; 86,26; 86,-30], style(smooth=0));
  connect(PompeAlimMP.rpm_or_mpower, arretPomesMp.y)
    annotation (points=[814,-21; 814,-26; 904.1,-26], style(smooth=0));
  connect(PompeAlimHP.rpm_or_mpower, arretPomesHP.y)
    annotation (points=[814,-61; 814,-80; 905.1,-80], style(smooth=0));
  connect(PompeAlimBP.rpm_or_mpower, arretPomesBP.y) annotation (points=[752,
        -447; 754,-447; 754,-460; 878,-460; 878,-442; 905.1,-442], style(smooth
        =0));
end CombinedCycle_Load_100_50;
