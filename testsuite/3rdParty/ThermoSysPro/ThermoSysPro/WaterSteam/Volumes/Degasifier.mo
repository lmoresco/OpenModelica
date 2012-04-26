within ThermoSysPro.WaterSteam.Volumes;
model Degasifier 
  
  annotation (Diagram, Icon(
      Rectangle(extent=[-82,12; 82,-80], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=71,
          rgbfillColor={85,170,255})),
      Ellipse(extent=[-48,98; 48,20], style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=71,
          rgbfillColor={85,170,255})),
      Rectangle(extent=[20,26; 24,12], style(
          color=7,
          rgbcolor={255,255,255},
          fillColor=71,
          rgbfillColor={85,170,255})),
      Rectangle(extent=[-24,26; -20,12], style(
          color=7,
          rgbcolor={255,255,255},
          fillColor=71,
          rgbfillColor={85,170,255})),
      Line(points=[-90,80; -40,80; -40,80; -40,80], style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=61,
          rgbfillColor={0,255,128},
          fillPattern=1)),
      Line(points=[-92,40; -38,40], style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=61,
          rgbfillColor={0,255,128},
          fillPattern=1)),
      Line(points=[90,80; 40,80], style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=61,
          rgbfillColor={0,255,128},
          fillPattern=1)),
      Rectangle(extent=[-82,12; 82,-34], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=7,
          rgbfillColor={255,255,255}))),
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
    Baligh El Hefni</li>
</ul>
</html>
"));
  ThermoSysPro.WaterSteam.Volumes.DegasifierVolume dega1(
    P0=0.11283e7,
    P(start=0.11283e7),
    steady_state=true,
    h(start=700e3),
    Cs(h_vol(start=700e3))) 
                    annotation (extent=[-20,20; 20,60]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe DPEau(     D=1,
    continuous_flow_reversal=true,
    Q(start=1000),
    Pm(start=1e6),
    lambda=0.01,
    L=1) 
    annotation (extent=[-60,60; -40,80]);
  Connectors.FluidInletI sourceEau 
    annotation (extent=[-110,70; -90,90]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe DPvapeur(
    D=1,
    continuous_flow_reversal=true,
    Q(start=127.81, fixed=false),
    h(start=0.25623e7, fixed=false),
    Pm(start=1.100e6, fixed=false),
    lambda=0.01,
    L=1) 
    annotation (extent=[-60,20; -40,40]);
  Connectors.FluidInletI sourceVapeur 
    annotation (extent=[-110,30; -90,50]);
  ThermoSysPro.WaterSteam.Volumes.DynamicDrum ballon(
    Vertical=false,
    R=4.234,
    L=33,
    Cevap=0.09,
    P0=0.1155e7,
    Tp(start=300),
    steady_state=true,
    hv(start=700e3),
    P(start=0.101283e7),
    zl(start=8))    annotation (extent=[-30,-80; 30,-20]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe TubeVap(L=.1,
    D=1,
    continuous_flow_reversal=true,
    Q(fixed=false, start=0),
    lambda=0.01) 
    annotation (extent=[20,-8; 40,12],rotation=90);
  Connectors.FluidOutletI puitsEauFond   annotation (extent=[-90,-90; -110,-70]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe DPvapeur1(
    D=1,
    continuous_flow_reversal=true,
    Q(start=1200),
    h(start=700000),
    Pm(start=1.100e6),
    lambda=0.01,
    L=1) 
    annotation (extent=[-60,-80; -80,-60]);
  Connectors.FluidInletI sourceEauFond 
    annotation (extent=[90,-90; 110,-70]);
  Connectors.FluidInletI sourceSup 
    annotation (extent=[90,70; 110,90]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe DPEau1(    D=1,
    continuous_flow_reversal=true,
    Pm(start=1e6),
    lambda=0.01,
    L=1,
    Q(start=1)) 
    annotation (extent=[60,60; 40,80]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe DPEau2(    D=1,
    continuous_flow_reversal=true,
    Pm(start=1e6),
    lambda=0.01,
    L=1,
    Q(start=1)) 
    annotation (extent=[80,-80; 60,-60]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal yLevel 
    annotation (extent=[100,-9; 126,10]);
equation 
  connect(DPEau.C2, dega1.Ce2) annotation (points=[-40,70; -8,70; -8,52],
      style(color=3, rgbcolor={0,0,255}));
  connect(DPvapeur.C2, dega1.Ce1) annotation (points=[-40,30; -32.6,30; -32.6,
        40; -20,40], style(color=3, rgbcolor={0,0,255}));
  connect(TubeVap.C1,ballon. Cv) 
                               annotation (points=[30,-8; 30,-20]);
  connect(DPvapeur1.C1, ballon.Cd) annotation (points=[-60,-70; -40,-70; -40,
        -80; -30,-80]);
  connect(sourceEau, DPEau.C1) annotation (points=[-100,80; -80,80; -80,70; -60,
        70]);
  connect(DPvapeur1.C2,puitsEauFond)  annotation (points=[-80,-70; -86,-70; -86,
        -80; -100,-80],style(color=3, rgbcolor={0,0,255}));
  connect(sourceVapeur, DPvapeur.C1) annotation (points=[-100,40; -80,40; -80,
        30; -60,30]);
  connect(ballon.Cm, DPEau2.C2) annotation (points=[30,-80; 40,-80; 40,-70; 60,
        -70]);
  connect(DPEau2.C1, sourceEauFond) 
    annotation (points=[80,-70; 86,-70; 86,-80; 100,-80]);
  connect(dega1.Ce3, DPEau1.C2) annotation (points=[8,52; 8,70; 40,70]);
  connect(DPEau1.C1, sourceSup) annotation (points=[60,70; 80,70; 80,80; 100,80]);
  connect(dega1.Cs, ballon.Ce1) annotation (points=[-8,28; -8,20; -30,20; -30,
        -20], style(
      color=3,
      rgbcolor={0,0,255},
      gradient=3,
      fillColor=75,
      rgbfillColor={85,85,255}));
  connect(dega1.Ce4, TubeVap.C2) annotation (points=[8,28.4; 8,20; 30,20; 30,12],
      style(
      gradient=3,
      fillColor=75,
      rgbfillColor={85,85,255}));
  connect(ballon.yLevel, yLevel) 
    annotation (points=[33,-50; 80,-50; 80,0.5; 113,0.5]);
end Degasifier;
