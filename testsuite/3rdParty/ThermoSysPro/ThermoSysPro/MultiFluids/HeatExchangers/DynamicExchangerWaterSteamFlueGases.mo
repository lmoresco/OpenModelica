within ThermoSysPro.MultiFluids.HeatExchangers;
model DynamicExchangerWaterSteamFlueGases 
  "Dynamic exchanger water/steam - flue gases " 
  
  parameter Modelica.SIunits.Length L=1 "Exchanger length";
  parameter Modelica.SIunits.Position z1=0 "Exchanger inlet altitude";
  parameter Modelica.SIunits.Position z2=0 "Exchanger outlet altitude";
  parameter Integer Ns=1 "Numver of segments";
  parameter Modelica.SIunits.Diameter Dint=0.1 "Pipe internal diameter";
  parameter Integer Ntubes=1 "Number of pipes in parallel";
  
  ThermoSysPro.FlueGases.HeatExchangers.StaticWallFlueGasesExchanger 
    ExchangerFlueGasesMetal(
    Dext=0.022,
    Ns=Ns,
    NbTub=Ntubes,
    L=L) 
    annotation (extent=[-10,30; 10,10]);
  ThermoSysPro.Thermal.HeatTransfer.HeatExchangerWall ExchangerWall(
    L=L,
    D=Dint,
    Ns=Ns,
    ntubes=Ntubes)                       annotation (extent=[-10,-10; 10,10]);
  ThermoSysPro.WaterSteam.HeatExchangers.DynamicTwoPhaseFlowPipe 
    TwoPhaseFlowPipe(
    L=L,
    D=Dint,
    ntubes=Ntubes,
    Ns=Ns,
    z1=z1,
    z2=z2) 
    annotation (extent=[-10,-30; 10,-10]);
  ThermoSysPro.FlueGases.Connectors.FlueGasesInletI Cfg1 
    annotation (extent=[-10,40; 10,60]);
  annotation (Diagram, Icon(
      Rectangle(extent=[-100,50; 100,-50], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=71,
          rgbfillColor={85,170,255},
          fillPattern=8)),
      Rectangle(extent=[-100,20; 100,-20],   style(gradient=2, fillColor=45)),
      Rectangle(extent=[-100,30; 100,-30],   style(color=0, fillColor=8)),
      Rectangle(extent=[-100,20; 100,-20], style(fillColor=71, rgbfillColor={85,
              170,255})),
      Line(points=[-60,50; -60,-50]),
      Line(points=[-20,50; -20,-50]),
      Line(points=[20,50; 20,-50]),
      Line(points=[60,50; 60,-50])),
    Documentation(revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Guillaume Larrignon</li>
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
  ThermoSysPro.FlueGases.Connectors.FlueGasesOutletI Cfg2 
    annotation (extent=[-10,-60; 10,-40]);
  ThermoSysPro.WaterSteam.Connectors.FluidInletI Cws1 
    annotation (extent=[-110,-10; -90,10]);
  ThermoSysPro.WaterSteam.Connectors.FluidOutletI Cws2 
    annotation (extent=[90,-10; 110,10]);
equation 
  connect(Cws2, TwoPhaseFlowPipe.C2) 
                                   annotation (points=[100,0; 40,0; 40,-20; 10,
        -20],    style(color=1, rgbcolor={255,0,0}));
  connect(Cws1, TwoPhaseFlowPipe.C1) 
    annotation (points=[-100,0; -20,0; -20,-20; -10,-20]);
  connect(Cfg1, ExchangerFlueGasesMetal.C1) annotation (points=[0,50; -20,50;
        -20,20; -10,20], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=8));
  connect(ExchangerFlueGasesMetal.C2, Cfg2) annotation (points=[10,20; 20,20;
        20,-50; 0,-50], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=8));
  connect(ExchangerWall.WT1, TwoPhaseFlowPipe.CTh) 
    annotation (points=[0,-2; 0,-17], style(color=46, rgbcolor={191,95,0}));
  connect(ExchangerFlueGasesMetal.CTh, ExchangerWall.WT2) 
    annotation (points=[0,17; 0,2], style(color=46, rgbcolor={191,95,0}));
end DynamicExchangerWaterSteamFlueGases;
