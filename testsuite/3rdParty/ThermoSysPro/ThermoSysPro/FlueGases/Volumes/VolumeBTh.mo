within ThermoSysPro.FlueGases.Volumes;
model VolumeBTh 
  "Mixing flue gases volume with 2 inlets and 2 outlets and thermal input" 
  parameter Modelica.SIunits.Volume V=1 "Volume";
  parameter ThermoSysPro.Units.AbsolutePressure P0=1e5 
    "Initial fluid pressure (active if dynamic_mass_balance=true and steady_state=false)";
  parameter Modelica.SIunits.Temperature T0=400 
    "Initial fluid temperature (active if steady_state=false)";
  parameter Boolean dynamic_mass_balance=false 
    "true: dynamic mass balance equation - false: static mass balance equation";
  parameter Boolean dynamic_composition_balance=false 
    "true: dynamic fluid composition balance equation - false: static fluid composition balance equation";
  parameter Boolean steady_state=true 
    "true: start from steady state - false: start from (P0, h0)";
  parameter Modelica.SIunits.Density p_rho=0 "If > 0, fixed fluid density";
  
public 
  ThermoSysPro.Units.AbsoluteTemperature T( start=500, stateSelect = StateSelect.always) 
    "Fluid temperature";
  ThermoSysPro.Units.AbsolutePressure P(start=1.e5) "Fluid pressure";
  ThermoSysPro.Units.SpecificEnthalpy h(start=100000) "Fluid specific enthalpy";
  Modelica.SIunits.Density rho(start=1) "Fluid density";
  Modelica.SIunits.SpecificHeatCapacity cp(start=1000) 
    "Fluid spécific heat capacity";
  Real Xco2 "CO2 mass fraction";
  Real Xh2o "H20 mass fraction";
  Real Xo2 "O2 mass fraction";
  Real Xso2 "SO2 mass fraction";
  Real Xn2 "N2 mass fraction";
  Modelica.SIunits.MassFlowRate BQ 
    "Right hand side of the mass balance equation";
  Modelica.SIunits.Power BH "Right hand side of the energybalance equation";
  Modelica.SIunits.MassFlowRate BXco2 
    "Right hand side of the CO2 balance equation";
  Modelica.SIunits.MassFlowRate BXh2o 
    "Right hand side of the H2O balance equation";
  Modelica.SIunits.MassFlowRate BXo2 
    "Right hand side of the O2 balance equation";
  Modelica.SIunits.MassFlowRate BXso2 
    "Right hand side of the SO2 balance equation";
  ThermoSysPro.Units.SpecificEnthalpy he1(start=100000) 
    "Fluid specific enthalpy at inlet #1";
  ThermoSysPro.Units.SpecificEnthalpy he2(start=100000) 
    "Fluid specific enthalpy at inlet #2";
  ThermoSysPro.Units.SpecificEnthalpy hs1(start=100000) 
    "Fluid specific enthalpy at outlet #1";
  ThermoSysPro.Units.SpecificEnthalpy hs2(start=100000) 
    "Fluid specific enthalpy at outlet #2";
  
  Connectors.FlueGasesInlet Ce1 
    annotation (extent=[-110,-10; -90,10]);
  Connectors.FlueGasesOutlet Cs2 
    annotation (extent=[-10,-110; 10,-90]);
  Connectors.FlueGasesOutlet Cs1 
    annotation (extent=[-10,90; 10,110]);
  Thermal.Connectors.ThermalPort Cth annotation (extent=[-10,-10; 10,10]);
  Connectors.FlueGasesInlet Ce2 
    annotation (extent=[90,-10; 110,10]);
  
initial equation 
  if steady_state then
    if dynamic_mass_balance then
      der(P) = 0;
    end if;
    
    der(T) = 0;
  else
    if dynamic_mass_balance then
      P = P0;
    end if;
    
    T = T0;
  end if;
  
  if dynamic_composition_balance then
    der(Xco2) = 0;
    der(Xh2o) = 0;
    der(Xo2) = 0;
    der(Xso2) = 0;
  end if;
  
equation 
  assert(V > 0, "Volume non-positive");
  
  /* Unconnected connectors */
  if (cardinality(Ce1) == 0) then
    Ce1.Q = 0;
    Ce1.T = 400;
    Ce1.Xco2 = 0.20;
    Ce1.Xh2o = 0.05;
    Ce1.Xo2 = 0.25;
    Ce1.Xso2 = 0;
    Ce1.b = true;
  end if;
  
  if (cardinality(Ce2) == 0) then
    Ce2.Q = 0;
    Ce2.T = 400;
    Ce2.Xco2 = 0.20;
    Ce2.Xh2o = 0.05;
    Ce2.Xo2 = 0.25;
    Ce2.Xso2 = 0;
    Ce2.b = true;
  end if;
  
  if (cardinality(Cs1) == 0) then
    Cs1.Q = 0;
    Cs1.a = true;
  end if;
  
  if (cardinality(Cs2) == 0) then
    Cs2.Q = 0;
    Cs2.a = true;
  end if;
  
  /* Mass balance equation */
  BQ = Ce1.Q + Ce2.Q - Cs1.Q - Cs2.Q;
  
  if dynamic_mass_balance then
    V*(ThermoSysPro.Properties.FlueGases.FlueGases_drhodp(P, T, Xco2, Xh2o, Xo2, Xso2)*der(P)
     + ThermoSysPro.Properties.FlueGases.FlueGases_drhodh(P, T, Xco2, Xh2o, Xo2, Xso2)*cp*der(T)) = BQ;
  else
    0 = BQ;
  end if;
  
  P = Ce1.P;
  P = Ce2.P;
  P = Cs1.P;
  P = Cs2.P;
  
  /* Energy balance equation */
  BH = Ce1.Q*he1 + Ce2.Q*he2 - Cs1.Q*hs1 - Cs2.Q*hs2 + Cth.W;
  
  if dynamic_mass_balance then
    V*((h*ThermoSysPro.Properties.FlueGases.FlueGases_drhodp(P, T, Xco2, Xh2o, Xo2, Xso2) - 1)*der(P)
     + (h*ThermoSysPro.Properties.FlueGases.FlueGases_drhodh(P, T, Xco2, Xh2o, Xo2, Xso2) + rho)*cp*der(T)) = BH;
  else
    V*rho*cp*der(T) = BH;
  end if;
  
  Cs1.T = T;
  Cs2.T = T;
  Cth.T = T;
  
  /* Fluid composition balance equations */
  BXco2 = Ce1.Xco2*Ce1.Q + Ce2.Xco2*Ce2.Q - Cs1.Xco2*Cs1.Q - Cs2.Xco2*Cs2.Q;
  BXh2o = Ce1.Xh2o*Ce1.Q + Ce2.Xh2o*Ce2.Q - Cs1.Xh2o*Cs1.Q - Cs2.Xh2o*Cs2.Q;
  BXo2 = Ce1.Xo2*Ce1.Q + Ce2.Xo2*Ce2.Q - Cs1.Xo2*Cs1.Q - Cs2.Xo2*Cs2.Q;
  BXso2 = Ce1.Xso2*Ce1.Q + Ce2.Xso2*Ce2.Q - Cs1.Xso2*Cs1.Q - Cs2.Xso2*Cs2.Q;
  
  if dynamic_composition_balance then
    V*rho*der(Xco2) + Xco2*BQ = BXco2;
    V*rho*der(Xh2o) + Xh2o*BQ = BXh2o;
    V*rho*der(Xo2) + Xo2*BQ = BXo2;
    V*rho*der(Xso2) + Xso2*BQ = BXso2;
  else
    Xco2*BQ = BXco2;
    Xh2o*BQ = BXh2o;
    Xo2*BQ = BXo2;
    Xso2*BQ = BXso2;
  end if;
  
  Xn2 = 1 - Xco2 - Xh2o - Xo2 - Xso2;
  
  Cs1.Xco2 = Xco2;
  Cs1.Xh2o = Xh2o;
  Cs1.Xo2 = Xo2;
  Cs1.Xso2 = Xso2;
  
  Cs2.Xco2 = Xco2;
  Cs2.Xh2o = Xh2o;
  Cs2.Xo2 = Xo2;
  Cs2.Xso2 = Xso2;
  
  /* Fluid thermodynamic properties */
  he1 = ThermoSysPro.Properties.FlueGases.FlueGases_h(P, Ce1.T, Ce1.Xco2, Ce1.Xh2o, Ce1.Xo2, Ce1.Xso2);
  he2 = ThermoSysPro.Properties.FlueGases.FlueGases_h(P, Ce2.T, Ce2.Xco2, Ce2.Xh2o, Ce2.Xo2, Ce2.Xso2);
  hs1 = ThermoSysPro.Properties.FlueGases.FlueGases_h(P, Cs1.T, Cs1.Xco2, Cs1.Xh2o, Cs1.Xo2, Cs1.Xso2);
  hs2 = ThermoSysPro.Properties.FlueGases.FlueGases_h(P, Cs2.T, Cs2.Xco2, Cs2.Xh2o, Cs2.Xo2, Cs2.Xso2);
  
  h = ThermoSysPro.Properties.FlueGases.FlueGases_h(P, T, Xco2, Xh2o, Xo2, Xso2);
  
  cp = ThermoSysPro.Properties.FlueGases.FlueGases_cp(P, T, Xco2, Xh2o, Xo2, Xso2);
  
  if (p_rho > 0) then
    rho = p_rho;
  else
    rho = ThermoSysPro.Properties.FlueGases.FlueGases_rho(P, T, Xco2, Xh2o, Xo2, Xso2);
  end if;
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Ellipse(extent=[-60,60; 60,-60], style(
          fillColor=71,
          rgbfillColor={85,170,255},
          fillPattern=8)),
      Line(points=[-60,0; -90,0], style(color=3, rgbcolor={0,0,255})),
      Line(points=[60,0; 90,0], style(color=3, rgbcolor={0,0,255})),
      Line(points=[0,90; 0,60], style(color=3, rgbcolor={0,0,255})),
      Line(points=[0,-60; 0,-92], style(color=3, rgbcolor={0,0,255}))),
    Icon(
      Ellipse(extent=[-60,60; 60,-60], style(
          fillColor=71,
          rgbfillColor={85,170,255},
          fillPattern=8)),
      Line(points=[-60,0; -90,0], style(color=3, rgbcolor={0,0,255})),
      Line(points=[60,0; 90,0], style(color=3, rgbcolor={0,0,255})),
      Line(points=[0,90; 0,60], style(color=3, rgbcolor={0,0,255})),
      Line(points=[0,-60; 0,-92], style(color=3, rgbcolor={0,0,255}))),
    Window(
      x=0.16,
      y=0.27,
      width=0.66,
      height=0.69),
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
end VolumeBTh;
