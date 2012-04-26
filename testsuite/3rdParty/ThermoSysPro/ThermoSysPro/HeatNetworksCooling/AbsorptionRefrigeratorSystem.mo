within ThermoSysPro.HeatNetworksCooling;
model AbsorptionRefrigeratorSystem "Refrigeration system by absorption" 
  
  parameter Real DesEff=.362979 "Desorber efficiency";
  parameter Real Pth=0.33 "Desorber thermal losses (0-1 %W)";
  parameter Real ExchEff=0.99 "Exchanger water LiBr efficiency";
  parameter Real EvapEff=0.99 "Evaporator efficiency";
  parameter Modelica.SIunits.MassFlowRate Qsol=8.856 "Solution mass flow rate";
  parameter Modelica.SIunits.MassFlowRate Qnom=8.856 
    "Pump solution nominal mass flow rate";
  parameter ThermoSysPro.Units.DifferentialPressure DPnom=3386.05 
    "Pump solution nominal delta pressure";
  
  annotation (Diagram(
      Text(
        extent=[-22,-94; 4,-98],
        style(color=3, rgbcolor={0,0,255}),
        string="Absorber"),
      Text(
        extent=[14,-48; 84,-54],
        style(color=3, rgbcolor={0,0,255}),
        string="Water at ambient temperature"),
      Text(
        extent=[-44,52; 10,46],
        style(color=3, rgbcolor={0,0,255}),
        string="Water outlet (ambient)"),
      Text(
        extent=[-100,50; -74,46],
        style(color=3, rgbcolor={0,0,255}),
        string="Desorber"),
      Text(
        extent=[-122,-4; -92,-8],
        style(color=3, rgbcolor={0,0,255}),
        string="Heat source"),
      Text(
        extent=[-140,-24; -82,-36],
        style(color=3, rgbcolor={0,0,255}),
        string="Solution heat exchanger"),
      Text(
        extent=[-130,-60; -86,-74],
        style(color=3, rgbcolor={0,0,255}),
        string="Solution expansion"),
      Text(
        extent=[-62,-82; -24,-90],
        style(color=3, rgbcolor={0,0,255}),
        string="Solution pump"),
      Text(
        extent=[-2,34; 20,30],
        style(color=3, rgbcolor={0,0,255}),
        string="Condensor"),
      Text(
        extent=[46,8; 72,4],
        style(color=3, rgbcolor={0,0,255}),
        string="Evaporator"),
      Text(
        extent=[46,-24; 76,-28],
        style(color=3, rgbcolor={0,0,255}),
        string="Cold supply"),
      Text(
        extent=[16,126; 58,114],
        style(color=3, rgbcolor={0,0,255}),
        string="Water expansion")),
                          Icon(
      Rectangle(extent=[-200,200; 200,-200],
                                        style(
          color=58,
          rgbcolor={0,127,0},
          pattern=2,
          thickness=2)),
      Polygon(points=[-180,190; -170,200; -42,200; -32,190; -32,30; -42,20;
            -170,20; -180,30; -180,190],
                              style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Polygon(points=[-32,100; -32,30; -42,20; -170,20; -180,30; -180,100; -132,
            100; -110,176; -42,176; -42,164; -98,164; -80,100; -32,100],
                                                             style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=30,
          rgbfillColor={215,215,215},
          fillPattern=1)),
                        Line(points=[-180,170; -106,170; -106,94; -106,48; -180,
            48],
          style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2,
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Line(points=[-118,178; -106,188; -92,178],
                                         style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2)),
      Polygon(points=[-180,-10; -170,0; -42,0; -32,-10; -32,-170; -42,-180;
            -170,-180; -180,-170; -180,-10],
                              style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Polygon(points=[-32,-100; -32,-170; -42,-180; -170,-180; -180,-170; -180,
            -100; -132,-100; -110,-24; -42,-24; -42,-36; -98,-36; -80,-100; -32,
            -100],                                           style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=30,
          rgbfillColor={215,215,215},
          fillPattern=1)),
                        Line(points=[-170,-30; -106,-30; -106,-106; -106,-152;
            -170,-152],
          style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2,
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Line(points=[-120,-12; -106,-22; -92,-12],
                                         style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2)),
      Rectangle(extent=[0,140; 160,40],      style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=52,
          rgbfillColor={213,255,170})),
                            Line(points=[24,50; 24,128; 82,84; 140,132; 140,50],
          style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2,
          fillColor=53,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Text(
        extent=[46,82; 114,40],
        style(color=0, rgbcolor={0,0,0}),
        string="Cond"),
      Rectangle(extent=[0,-40; 160,-160],    style(fillColor=54, rgbfillColor={
              72,143,0})),  Line(points=[20,-160; 20,-82; 80,-128; 140,-78; 140,
            -160],
          style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2,
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Text(
        extent=[38,-46; 120,-104],
        style(color=3, rgbcolor={0,0,255}),
        string="Evap"),
      Text(
        extent=[-104,68; -34,22],
        style(color=3, rgbcolor={0,0,255}),
        string="Des"),
      Text(
        extent=[-102,-130; -32,-176],
        style(color=3, rgbcolor={0,0,255}),
        string="Abs")),
    Coordsys(extent=[-200,-200; 200,200], scale=0.1),
    DymolaStoredErrors,
    Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.0</b></p>
</HTML>
", revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Benoît Bride</li>
</ul>
</html>
"));
  ThermoSysPro.WaterSteam.Connectors.FluidOutletI outletWaterSteamI 
    annotation (extent=[-200,160; -180,180]);
  ThermoSysPro.WaterSteam.Connectors.FluidInletI inletWaterSteamI 
    annotation (extent=[-200,40; -180,60]);
  ThermoSysPro.WaterSteam.Connectors.FluidOutletI ColdNeedOutlet 
    annotation (extent=[10,-180; 30,-160]);
  ThermoSysPro.WaterSteam.Connectors.FluidInletI ColdNeedInlet 
    annotation (extent=[130,-180; 150,-160]);
  DesorberWaterLiBr desorber(
    W(fixed=false, start=4.16e6),
    DPc=0.2,
    DTm(fixed=false, start=9.648),
    Pth=Pth,
    Ec(h(start=432e3, fixed=false)),
    Eff=DesEff) 
              annotation (extent=[-100,20; -80,40]);
  ThermoSysPro.WaterSolution.HeatExchangers.ExchangerEfficiency 
    solutionHeatExchanger(
    Ef(P(fixed=false, start=900)),
    Qf(fixed=false, start=13),
    Tsf(fixed=false, start=343.15),
    DPc=0.2,
    DPf=0.2,
    Hsf(fixed=false, start=102586),
    Xf(fixed=false, start=0.5633),
    Eff=ExchEff) 
    annotation (extent=[-80,-40; -60,-20],rotation=-90);
  ThermoSysPro.WaterSolution.PressureLosses.SingularPressureLoss solutionExp(C2(
       P(fixed=false, start=870)), K=10) 
    annotation (extent=[-120,-60; -100,-40],
                                           rotation=-90);
  WaterSolution.Machines.StaticCentrifugalPumpNom solutionPump(Qnom=Qnom, DPnom=
       DPnom) 
    annotation (extent=[-40,-80; -20,-60], rotation=90);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ ambientSource(
    P0=1e5,
    Q0=313,
    h0=100e3) annotation (extent=[60,-140; 40,-120]);
  AbsorberWaterLiBr absorber(
    DPf=0.2,
    Sc(T(fixed=false, start=290.98)),
    DPc(fixed=false, start=0.2)) 
    annotation (extent=[0,-120; -20,-100]);
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink ambientSink 
    annotation (extent=[40,80; 20,100],rotation=90);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss waterExp(K=2749.77) 
                                   annotation (extent=[20,120; 40,140]);
  ThermoSysPro.WaterSteam.HeatExchangers.StaticWaterWaterExchangerDTorWorEff 
    evaporator(EffEch=EvapEff) 
    annotation (extent=[60,-20; 80,0],rotation=-90);
  ThermoSysPro.WaterSolution.LoopBreakers.LoopBreakerQ loopBreakerQ 
    annotation (extent=[-40,-40; -20,-20],rotation=90);
  WaterSolution.BoundaryConditions.RefQ solutionMassFlowRate 
    annotation (extent=[-20,-10; -40,10],
                                        rotation=90);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante 
    solutionMassFlowRateValue(k=Qsol) 
                      annotation (extent=[6,-6; -6,6]);
  ThermoSysPro.WaterSteam.HeatExchangers.SimpleStaticCondenser condensor 
    annotation (extent=[20,60; 40,40], rotation=270);
equation 
  connect(desorber.Sf, solutionHeatExchanger.Ec) 
                                         annotation (points=[-89.8,21; -89.8,
        -24; -76,-24; -76,-24.2],
                     style(color=0, rgbcolor={0,0,0}));
  connect(solutionHeatExchanger.Sf, desorber.Ef) 
                                         annotation (points=[-69.8,-40; -70,-40;
        -70,-60; -50,-60; -50,36; -82.6,36], style(color=0, rgbcolor={0,0,0}));
  connect(ambientSource.C, absorber.Ef)      annotation (points=[40,-130; 6.4,
        -130; 6.4,-116.2; -2.6,-116.2],
                                  style(color=3, rgbcolor={0,0,255}));
  connect(solutionExp.C2, absorber.Ec)         annotation (points=[-110,-59;
        -110,-104; -17.4,-104],
                             style(color=0, rgbcolor={0,0,0}));
  connect(solutionPump.Ce, absorber.Sc)    annotation (points=[-30,-79; -30,
        -130; -10,-130; -10,-119],
                                style(color=0, rgbcolor={0,0,0}));
  connect(waterExp.C2, evaporator.Ef)       annotation (points=[40,130; 70,130;
        70,0],         style(color=3, rgbcolor={0,0,255}));
  connect(evaporator.Sf, absorber.Evap)   annotation (points=[70.1,-20; 70.1,
        -44; -10,-44; -10,-101],style(color=3, rgbcolor={0,0,255}));
  connect(desorber.Svap, condensor.Ec)   annotation (points=[-90,39.05; -90,44;
        20,44],             style(color=3, rgbcolor={0,0,255}));
  connect(condensor.Sc, waterExp.C1)       annotation (points=[20,56; -10,56;
        -10,130; 20,130],        style(color=3, rgbcolor={0,0,255}));
  connect(ambientSink.C, condensor.Sf) 
    annotation (points=[30,80; 30,60; 29.9,60]);
  connect(condensor.Ef, absorber.Sf) 
    annotation (points=[30,40; 30,-104; -2.8,-104]);
  connect(outletWaterSteamI, desorber.Sc)  annotation (points=[-190,170; -106,
        170; -106,36; -97.2,36],
                             style(color=1, rgbcolor={255,0,0}));
  connect(inletWaterSteamI, desorber.Ec)  annotation (points=[-190,50; -110,50;
        -110,23.8; -97.4,23.8]);
  connect(evaporator.Ec, ColdNeedInlet) 
    annotation (points=[74.1,-6; 160,-6; 160,-170; 140,-170]);
  connect(ColdNeedOutlet, evaporator.Sc)  annotation (points=[20,-170; 100,-170;
        100,-14; 74.1,-14],      style(color=1, rgbcolor={255,0,0}));
  connect(solutionHeatExchanger.Ef, solutionMassFlowRate.C2) 
                                           annotation (points=[-69.8,-20; -70,
        -20; -70,20; -30,20; -30,10],    style(
      color=0,
      rgbcolor={0,0,0},
      fillColor=44,
      rgbfillColor={255,170,170},
      fillPattern=1));
  connect(solutionMassFlowRate.C1, loopBreakerQ.Cs) 
                                                 annotation (points=[-30,-10;
        -30,-20], style(
      color=0,
      rgbcolor={0,0,0},
      fillColor=44,
      rgbfillColor={255,170,170},
      fillPattern=1));
  connect(solutionExp.C1, solutionHeatExchanger.Sc) annotation (points=[-110,
        -41; -110,-35.8; -76,-35.8], style(color=0, rgbcolor={0,0,0}));
  connect(loopBreakerQ.Ce, solutionPump.Cs) annotation (points=[-30,-40; -30,
        -50; -35,-50; -35,-61], style(color=0, rgbcolor={0,0,0}));
  connect(solutionMassFlowRate.IMassFlow, solutionMassFlowRateValue.y) 
    annotation (points=[-19,6.73556e-016; -12.5,6.73556e-016; -12.5,0; -6.6,0]);
end AbsorptionRefrigeratorSystem;
