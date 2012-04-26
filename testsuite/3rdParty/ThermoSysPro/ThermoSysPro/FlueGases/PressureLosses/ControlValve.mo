within ThermoSysPro.FlueGases.PressureLosses;
model ControlValve "Control valve" 
  parameter ThermoSysPro.Units.Cv Cvmax=5000 
    "Maximum CV (active if mode_caract=0)";
  parameter Real caract[:, 2]=[0, 0; 1, Cvmax] 
    "Position vs. Cv characteristics (active if mode_caract=1)";
  parameter Integer mode_caract=0 
    "0:linear characteristics - 1:characteristics is given by caract[]";
  parameter Modelica.SIunits.Density p_rho=0 "If > 0, fixed fluid density";
  
protected 
  parameter Real eps=1.e-3 "Small number for pressure loss equation";
  
public 
  ThermoSysPro.Units.Cv Cv(start=100) "Cv";
  Modelica.SIunits.MassFlowRate Q(start=100) "Mass flow";
  ThermoSysPro.Units.DifferentialPressure deltaP(start=10) 
    "Singular pressure loss";
  Modelica.SIunits.Density rho(start=1) "Fluid density";
  ThermoSysPro.Units.AbsoluteTemperature T(start=300) "Fluid temperature";
  ThermoSysPro.Units.AbsolutePressure P(start=1.e5) "Fluid average pressure";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Polygon(points=[40, 40; -40, 40; -40, 56; -38, 74; -32, 84; -20, 94; 0,
            100; 20, 94; 32, 84; 38, 72; 40, 54; 40, 40], style(
          gradient=1,
          fillColor=53,
          rgbfillColor={128,255,0},
          fillPattern=8)),
      Polygon(points=[0, -60; 40, 40; -40, 40; 0, -60], style(
          fillColor=53,
          rgbfillColor={128,255,0},
          fillPattern=8)),
      Polygon(points=[-100, -100; 0, -60; -100, -20; -100, -102; -100, -100], style(
          fillColor=53,
          rgbfillColor={128,255,0},
          fillPattern=8)),
      Polygon(points=[0, -60; 100, -20; 100, -102; 0, -60; 0, -60], style(
          fillColor=53,
          rgbfillColor={128,255,0},
          fillPattern=8))),
    Diagram(
      Polygon(points=[-100, -100; 0, -60; -100, -20; -100, -102; -100, -100], style(
          fillColor=53,
          rgbfillColor={128,255,0},
          fillPattern=8)),
      Polygon(points=[0,-60; 100,-20; 100,-102; 0,-60; 0,-60], style(
          fillColor=53,
          rgbfillColor={128,255,0},
          fillPattern=8)),
      Polygon(points=[0, -60; 40, 40; -40, 40; 0, -60], style(
          fillColor=53,
          rgbfillColor={128,255,0},
          fillPattern=8)),
      Polygon(points=[40, 40; -40, 40; -40, 56; -38, 74; -32, 84; -20, 94; 0,
            100; 20, 94; 32, 84; 38, 72; 40, 54; 40, 40], style(
          fillColor=53,
          rgbfillColor={128,255,0},
          fillPattern=8))),
    Window(
      x=0.07,
      y=0.13,
      width=0.8,
      height=0.77),
    Documentation(info="<html>
<p><h4>Copyright &copy; EDF 2002 - 2012</h4></p>
<p><b>ThermoSysPro Version 3.0</b> </p>
</html>",
   revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Daniel Bouskela</li>
<li>
    Baligh El Hefni</li>
</ul>
</html>
"));
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal Ouv 
    annotation(extent=[-10, 100; 10, 120], rotation=-90);
  Connectors.FlueGasesInlet C1 
                          annotation(extent=[-110, -70; -90, -50]);
  Connectors.FlueGasesOutlet C2 
                          annotation(extent=[90,-70; 110,-50]);
equation 
  
  C1.T = C2.T; // Because the behaviour of the flue gas is close to an ideal gas
  C1.Q = C2.Q;
  Q = C1.Q;
  deltaP = C1.P - C2.P;
  
  C2.Xco2 = C1.Xco2;
  C2.Xh2o = C1.Xh2o;
  C2.Xo2  = C1.Xo2;
  C2.Xso2 = C1.Xso2;
  
  /* Pressure loss */
  deltaP*Cv*abs(Cv) = 1.733e12*ThermoSysPro.Functions.ThermoSquare(Q, eps)/rho^2;
  
  /* Cv as a function of the valve position */
  if (mode_caract == 0) then
    Cv = Ouv.signal*Cvmax;
  elseif (mode_caract == 1) then
    Cv = ThermoSysPro.Functions.LinearInterpolation(caract[:, 1], caract[:, 2], Ouv.signal);
  else
    assert(false, "VanneReglante : mode de calcul du Cv incorrect");
  end if;
  
  /* Fluid thermodynamic properties */
  P = (C1.P + C2.P)/2;
  T = C1.T;
  
  if (p_rho > 0) then
    rho = p_rho;
  else
    rho = ThermoSysPro.Properties.FlueGases.FlueGases_rho(P, T, C2.Xco2, C2.Xh2o, C2.Xo2, C2.Xso2);
  end if;
  
end ControlValve;
