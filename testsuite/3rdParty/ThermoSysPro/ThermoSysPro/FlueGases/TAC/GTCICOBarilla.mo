within ThermoSysPro.FlueGases.TAC;
model GTCICOBarilla "Combustion turbine for CICO and Barilla plants" 
  
  parameter Real comp_tau_n=11.5 "Nominal compression nominal rate";
  parameter Real comp_eff_n=0.79257 "Compressor nominal efficiency";
  parameter Real exp_tau_n=0.079255386 "Turbine nominal expansion rate";
  parameter Real exp_eff_n=.881225 "Turbine nominal efficiency";
  parameter Real TurbQred=0.00449194 "Turbine reduced mass flow rate";
  parameter Modelica.SIunits.Power Wpth=50000 
    "Combustion chamber thermal losses";
  
  annotation (Diagram, Icon(
         Polygon(points=[-100,72; -100,-70; -20,-20; -20,20; -100,72],
                                                                    style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=55,
          rgbfillColor={170,255,85})),
      Rectangle(extent=[-20,20; 20,-20], style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=83,
          rgbfillColor={255,170,255})),
         Polygon(points=[20,20; 20,-20; 100,-70; 100,70; 20,20],
                                                               style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=59,
          rgbfillColor={85,255,85})),
      Rectangle(extent=[-20,-60; 20,-100],style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Line(points=[-96,-80; -20,-80; -10,-68; 10,-94; 20,-80; 96,-80], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=83,
          rgbfillColor={255,170,255},
          fillPattern=1)),
      Line(points=[-60,96; -60,60; -10,60; -10,20], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=0,
          rgbfillColor={0,0,0},
          fillPattern=1)),
      Text(
        extent=[-12,-72; 12,-88],
        style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2,
          arrow=1,
          fillColor=0,
          rgbfillColor={0,0,0},
          fillPattern=1),
        string="KB"),
      Line(points=[-20,-20; -20,-60], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Line(points=[20,-20; 20,-60], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Line(points=[60,96; 60,60; 8,60; 8,20], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=3,
          rgbfillColor={0,0,255},
          fillPattern=1))),
    Coordsys(extent=[-100,-100; 100,100], scale=0.1),
    Documentation(revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Baligh El Hefni</li>
</html>
", info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.0</b></p>
</HTML>
"));
  BoundaryConditions.AirHumidity xAIR 
                    annotation (extent=[-94,20; -74,40], rotation=270);
  ThermoSysPro.FlueGases.Machines.Compressor Compresseur(
    tau_n=comp_tau_n,
    is_eff_n=comp_eff_n,
    tau(start=12.92),
    Ps(start=12.92e5, fixed=false),
    Te(start=660.36))                      annotation (extent=[-80,-10; -60,10], style(
        color=1, rgbcolor={255,0,0}));
  Junctions.Splitter2 separateur_Fumees 
    annotation (extent=[-40,-10; -20,10]);
  ThermoSysPro.Combustion.CombustionChambers.GTCombustionChamber 
    chambreCombustionTAC(
    Acham=1,
    eta_comb=1,
    Pea(start=11e5),
    Qsf(start=150),
    Qea(start=151),
    Psf(start=12.6616e5),
    Tsf(start=1350),
    XsfH2O(start=4.59e-2),
    XsfO2(start=1.56e-1),
    XsfSO2(start=5.55e-10),
    exc(start=3.35728),
    Wpth=Wpth)         annotation (extent=[-10,40; 10,60]);
  Junctions.Mixer2 melangeur2_fumees2_1 
    annotation (extent=[20,-10; 40,10]);
  ThermoSysPro.FlueGases.PressureLosses.InvSingularPressureLoss tub_fumees 
                                             annotation (extent=[16,-40; 36,-20],
      rotation=90);
  ThermoSysPro.FlueGases.Machines.CombustionTurbine TurbineAgaz(
                    Q(start=160),
    Wmech(start=42.3e6),
    Ps(start=1.003e5),
    Ts(start=800.16),
    Qred=TurbQred,
    is_eff_n=exp_eff_n,
    tau_n=exp_tau_n)               annotation (extent=[60,-10; 80,10]);
  ThermoSysPro.MultiFluids.HeatExchangers.StaticExchangerWaterSteamFlueGases 
    KettleBoiler(
    Kdpe=1,
    W(start=1e6),
    Hse(start=2000e3),
    Kdpf=1000,
    EffEch=0.9,
    Tse(start=435),
    Hee(start=4.71e5),
    Qe(start=0.52)) 
    annotation (extent=[10,-60; -10,-40], rotation=-90);
  Connectors.FlueGasesInletI Entree_air 
    annotation (extent=[-104,-4; -96,4]);
  Connectors.FlueGasesOutletI Sortie_fumees 
    annotation (extent=[96,-4; 104,4]);
  ThermoSysPro.WaterSteam.Connectors.FluidInletI Entree_KB 
    annotation (extent=[-104,-84; -96,-76]);
  ThermoSysPro.WaterSteam.Connectors.FluidOutletI Sortie_KB 
    annotation (extent=[96,-84; 104,-76]);
  ThermoSysPro.WaterSteam.Connectors.FluidInletI Entree_eau_combustion 
    annotation (extent=[-64,96; -56,104]);
  ThermoSysPro.Combustion.Connectors.FuelInletI Entree_combustible 
    annotation (extent=[56,96; 64,104]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal Huminide 
    annotation (extent=[-108,56; -100,64]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal PuissanceMeca 
    annotation (extent=[100,-44; 108,-36],   rotation=0);
  InstrumentationAndControl.Blocks.Sources.Constante constante(k=0.90) 
    annotation (extent=[-50,10; -40,20]);
equation 
  connect(xAIR.C1, Entree_air) annotation (points=[-84,40; -100,40; -100,0],
      style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=1,
      rgbfillColor={255,0,0},
      fillPattern=8));
  connect(Huminide, xAIR.humidity) annotation (points=[-104,60; -56,60; -56,30;
        -73,30], style(
      fillColor=1,
      rgbfillColor={255,0,0},
      fillPattern=8));
  connect(tub_fumees.C2, melangeur2_fumees2_1.Ce2) annotation (points=[26,-20;
        26,-10],                 style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(constante.y, separateur_Fumees.Ialpha1) 
    annotation (points=[-39.5,15; -34,15; -34,6; -29,6]);
  connect(Entree_KB, KettleBoiler.Cws1) annotation (points=[-100,-80; -40,-80;
        -40,-30; 6.12303e-016,-30; 6.12303e-016,-40], style(
      fillColor=71,
      rgbfillColor={85,170,255},
      fillPattern=8));
  connect(KettleBoiler.Cws2, Sortie_KB) annotation (points=[-6.12303e-016,-60;
        0,-60; 0,-80; 100,-80], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=71,
      rgbfillColor={85,170,255},
      fillPattern=8));
  connect(KettleBoiler.Cfg1, separateur_Fumees.Cs2) annotation (points=[-9,-50;
        -26,-50; -26,-10], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=71,
      rgbfillColor={85,170,255},
      fillPattern=8));
  connect(KettleBoiler.Cfg2, tub_fumees.C1) annotation (points=[9,-49.95; 26,
        -49.95; 26,-40], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=71,
      rgbfillColor={85,170,255},
      fillPattern=8));
  connect(melangeur2_fumees2_1.Cs, TurbineAgaz.Ce) annotation (points=[40,0; 60,
        0], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=8));
  connect(TurbineAgaz.Cs, Sortie_fumees) annotation (points=[80,0; 100,0],
      style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=8));
  connect(TurbineAgaz.MechPower, PuissanceMeca) annotation (points=[81,-9; 90,
        -9; 90,-40; 104,-40], style(
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=8));
  connect(Compresseur.Ce, xAIR.C2) annotation (points=[-77.5,0; -84,0; -84,20],
      style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(separateur_Fumees.Ce, Compresseur.Cs) annotation (points=[-40,0;
        -62.5,0], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(Compresseur.Power, TurbineAgaz.CompressorPower) 
    annotation (points=[-62.5,-3; -60,-3; -60,-20; 56,-20; 56,-4; 59,-4]);
  connect(separateur_Fumees.Cs1, chambreCombustionTAC.Ca) annotation (points=[
        -26,10; -26,50; -9,50], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(chambreCombustionTAC.Cfg, melangeur2_fumees2_1.Ce1) annotation (
      points=[9,50; 26,50; 26,10], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(chambreCombustionTAC.Cfuel, Entree_combustible) annotation (points=[0,
        41; 0,20; 60,20; 60,100], style(color=0, rgbcolor={0,0,0}));
  connect(Entree_eau_combustion, chambreCombustionTAC.Cws) 
    annotation (points=[-60,100; -60,80; -6,80; -6,59]);
end GTCICOBarilla;
