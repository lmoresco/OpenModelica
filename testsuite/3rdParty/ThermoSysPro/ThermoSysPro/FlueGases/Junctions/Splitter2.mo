within ThermoSysPro.FlueGases.Junctions;
model Splitter2 "Flue gases splitter with two outlets" 
  
public 
  Real alpha1 "Extraction coefficient for outlet 1 (<=1)";
  ThermoSysPro.Units.AbsolutePressure P(start=10e5) "Fluid pressure";
  ThermoSysPro.Units.SpecificEnthalpy h(start=10e5) "Fluid specific enthalpy";
  ThermoSysPro.Units.AbsoluteTemperature T "Fluid temperature";
  Real Xco2 "CO2 mass fraction";
  Real Xh2o "H20 mass fraction";
  Real Xo2 "O2 mass fraction";
  Real Xso2 "SO2 mass fraction";
  Real Xn2 "N2 mass fraction";
  ThermoSysPro.Units.SpecificEnthalpy he(start=100000) 
    "Fluid specific enthalpy at the inlet";
  ThermoSysPro.Units.SpecificEnthalpy hs1(start=100000) 
    "Fluid specific enthalpy at outlet #1";
  ThermoSysPro.Units.SpecificEnthalpy hs2(start=100000) 
    "Fluid specific enthalpy at outlet #2";
  
public 
  Connectors.FlueGasesInlet Ce 
    annotation (extent=[-110, -10; -90, 10]);
  Connectors.FlueGasesOutlet Cs1 
    annotation (extent=[30,90; 50,110]);
  Connectors.FlueGasesOutlet Cs2 
    annotation (extent=[30,-110; 50,-90]);
  InstrumentationAndControl.Connectors.InputReal Ialpha1 
    "Extraction coefficient for outlet 1 (<=1)" 
    annotation (extent=[0,50; 20,70]);
  InstrumentationAndControl.Connectors.OutputReal Oalpha1 
    annotation (extent=[60,50; 80,70]);
equation 
  
  if (cardinality(Ialpha1) == 0) then
    Ialpha1.signal = 1;
  end if;
  
  /* Fluid pressure */
  P = Ce.P;
  P = Cs1.P;
  P = Cs2.P;
  
  /* Fluid temperature (singular if all flows = 0) */
  Cs1.T = T;
  Cs2.T = T;
  
  /* Fluid composition */
  Cs1.Xco2 = Xco2;
  Cs1.Xh2o = Xh2o;
  Cs1.Xo2 = Xo2;
  Cs1.Xso2 = Xso2;
  
  Cs2.Xco2 = Xco2;
  Cs2.Xh2o = Xh2o;
  Cs2.Xo2 = Xo2;
  Cs2.Xso2 = Xso2;
  
  Xn2 = 1 - Xco2 - Xh2o - Xo2 - Xso2;
  
  /* Mass balance equation */
  0 = Ce.Q - Cs1.Q - Cs2.Q;
  
  /* Energy balance equation */
  0 = Ce.Q*he - Cs1.Q*hs1 - Cs2.Q*hs2;
  
  /* Fluid composition balance equations */
  0 = Ce.Xco2*Ce.Q - Cs1.Xco2*Cs1.Q - Cs2.Xco2*Cs2.Q;
  0 = Ce.Xh2o*Ce.Q - Cs1.Xh2o*Cs1.Q - Cs2.Xh2o*Cs2.Q;
  0 = Ce.Xo2*Ce.Q - Cs1.Xo2*Cs1.Q - Cs2.Xo2*Cs2.Q;
  0 = Ce.Xso2*Ce.Q - Cs1.Xso2*Cs1.Q - Cs2.Xso2*Cs2.Q;
  
  /* Mass flow at outlet 1 */
  if (cardinality(Ialpha1) <> 0) then
    Cs1.Q = Ialpha1.signal*Ce.Q;
  end if;
  
  alpha1 = Cs1.Q/Ce.Q;
  Oalpha1.signal = alpha1;
  
  /* Fluid thermodynamic properties */
  he = ThermoSysPro.Properties.FlueGases.FlueGases_h(P, Ce.T, Ce.Xco2, Ce.Xh2o, Ce.Xo2, Ce.Xso2);
  hs1 = ThermoSysPro.Properties.FlueGases.FlueGases_h(P, Cs1.T, Cs1.Xco2, Cs1.Xh2o, Cs1.Xo2, Cs1.Xso2);
  hs2 = ThermoSysPro.Properties.FlueGases.FlueGases_h(P, Cs2.T, Cs2.Xco2, Cs2.Xh2o, Cs2.Xo2, Cs2.Xso2);
  
  h = ThermoSysPro.Properties.FlueGases.FlueGases_h(P, T, Xco2, Xh2o, Xo2, Xso2);
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
         Polygon(points=[60,100; 60,-100; 20,-100; 20,-20; -100,-20; -100,20;
            20,20; 20,100; 60,100], style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=8)),                                          Text(extent=[20,80;
            60,40],           string="1"),                          Text(extent=[20,-40;
            60,-80],  string="2")),
    Icon(Polygon(points=[60,100; 60,-100; 20,-100; 20,-20; -100,-20; -100,20;
            20,20; 20,100; 60,100], style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=8)),                                          Text(extent=[20,80;
            60,40],           string="1"),                          Text(extent=[20,-40;
            60,-80],  string="2")),
    Window(
      x=0.33,
      y=0.09,
      width=0.71,
      height=0.88),
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
<li>
    Daniel Bouskela</li>
</ul>
</html>
"), DymolaStoredErrors);
end Splitter2;
