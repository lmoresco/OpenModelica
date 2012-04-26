within ThermoSysPro.WaterSolution.PressureLosses;
model SingularPressureLoss "Singular pressure loss" 
  parameter Real K=10 "Friction pressure loss coefficient";
  parameter Modelica.SIunits.Density rho=1000 "Fluid density";
  
protected 
  parameter Real eps=1.e-3 "Small number for pressure loss equation";
  
public 
  ThermoSysPro.Units.DifferentialPressure deltaPf(start=1.e2) 
    "Friction pressure loss";
  Modelica.SIunits.MassFlowRate Q(start=500) "Mass flow";
  ThermoSysPro.Units.AbsoluteTemperature T(start=290) "Fluid temperature";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(Polygon(points=[-60,40; -40,18; -20,10; 0,8; 20,10; 40,18; 60,40;
            -60,40], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=44,
          rgbfillColor={255,170,170})), Polygon(points=[-60,-40; -40,-20; -20,
            -12; 0,-10; 20,-12; 40,-20; 60,-40; -60,-40], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=44,
          rgbfillColor={255,170,170}))),
    Icon(Polygon(points=[-60,40; -40,18; -20,10; 0,8; 20,10; 40,18; 60,40; -60,
            40], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=44,
          rgbfillColor={255,170,170})), Polygon(points=[-60,-40; -40,-20; -20,
            -12; 0,-10; 20,-12; 40,-20; 60,-40; -60,-40], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=44,
          rgbfillColor={255,170,170}))),
    Window(
      x=0.09,
      y=0.2,
      width=0.66,
      height=0.69),
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
<li>
    Daniel Bouskela</li>
</html>
"));
  ThermoSysPro.WaterSolution.Connectors.WaterSolutionInlet C1 
    annotation (extent=[-100,-10; -80,10]);
  ThermoSysPro.WaterSolution.Connectors.WaterSolutionOutlet C2 
    annotation (extent=[80,-10; 100,10]);
equation 
  
  C1.P - C2.P = deltaPf;
  C1.T = C2.T;
  C1.Q = C2.Q;
  
  C2.Xh2o = C1.Xh2o;
  
  Q = C1.Q;
  T = C1.T;
  
  /* Pressure loss */
  deltaPf = K*ThermoSysPro.Functions.ThermoSquare(Q, eps)/rho;
  
end SingularPressureLoss;
