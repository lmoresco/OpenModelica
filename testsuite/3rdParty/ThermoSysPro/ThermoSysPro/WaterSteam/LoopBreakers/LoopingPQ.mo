within ThermoSysPro.WaterSteam.LoopBreakers;
model LoopingPQ 
  
  parameter ThermoSysPro.Units.AbsolutePressure P=1e5 
    "Pression imposée en sortie";
  parameter Modelica.SIunits.MassFlowRate Q=1.0 "Débit imposé";
  
  annotation (Diagram,    Icon(Rectangle(extent=[-100,30; 100,-30], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=0,
          rgbfillColor={0,0,0}))),
    Coordsys(extent=[-100,-100; 100,100],
                                      scale=0.01),
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
    Bruno Péchiné</li>
</ul>
</html>
"));
  ThermoSysPro.WaterSteam.Connectors.FluidInletI C1 
    annotation (extent=[-110,-10; -90,10]);
  ThermoSysPro.WaterSteam.Connectors.FluidOutletI C2 
    annotation (extent=[90,-10; 110,10]);
  ThermoSysPro.WaterSteam.LoopBreakers.LoopBreakerQ qLoopBreaker 
    annotation (extent=[-80,-10; -60,10]);
  ThermoSysPro.WaterSteam.PressureLosses.InvSingularPressureLoss 
    pressureCloserWaterSteam 
    annotation (extent=[20,-10; 40,10]);
  ThermoSysPro.WaterSteam.BoundaryConditions.RefP pressureReference 
    annotation (extent=[60,-10; 80,10]);
  ThermoSysPro.WaterSteam.BoundaryConditions.RefQ massFlowSetWaterSteam 
    annotation (extent=[-40,-10; -20,10]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Debit(
                                            k=Q) 
    annotation (extent=[-80,30; -60,50]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Pression(
                                               k=P) 
    annotation (extent=[20,30; 40,50]);
equation 
  connect(Debit.y, massFlowSetWaterSteam.IMassFlow) 
    annotation (points=[-59,40; -30,40; -30,11]);
  connect(Pression.y, pressureReference.IPressure) 
    annotation (points=[41,40; 70,40; 70,11]);
  connect(C1, qLoopBreaker.C1) annotation (points=[-100,0; -80,0]);
  connect(qLoopBreaker.C2, massFlowSetWaterSteam.C1) 
    annotation (points=[-60,0; -40,0], style(color=3, rgbcolor={0,0,255}));
  connect(massFlowSetWaterSteam.C2, pressureCloserWaterSteam.C1) 
    annotation (points=[-20,0; 20,0], style(color=3, rgbcolor={0,0,255}));
  connect(pressureCloserWaterSteam.C2, pressureReference.C1) 
    annotation (points=[40,0; 60,0], style(color=3, rgbcolor={0,0,255}));
  connect(pressureReference.C2, C2) 
    annotation (points=[80,0; 100,0], style(color=3, rgbcolor={0,0,255}));
end LoopingPQ;
