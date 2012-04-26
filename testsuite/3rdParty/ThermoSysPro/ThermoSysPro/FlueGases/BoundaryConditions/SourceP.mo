within ThermoSysPro.FlueGases.BoundaryConditions;
model SourceP "Flue gas source with fixed pressure" 
  parameter ThermoSysPro.Units.AbsolutePressure P0=200000 "Source pressure";
  parameter ThermoSysPro.Units.AbsoluteTemperature T0=400 "Source temperature";
  parameter Real Xco2=0.10 "CO2 mass fraction";
  parameter Real Xh2o=0.05 "H2O mass fraction";
  parameter Real Xo2=0.22 "O2 mass fraction";
  parameter Real Xso2=0.00 "SO2 mass fraction";
  
public 
  ThermoSysPro.Units.AbsolutePressure P "Fluid pressure";
  Modelica.SIunits.MassFlowRate Q "Mass flow";
  ThermoSysPro.Units.AbsoluteTemperature T "Fluid temperature";
  Real Xn2 "N2 mas fraction";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Line(points=[40,0; 90,0; 72,10]),
      Line(points=[90,0; 72,-10]),
      Rectangle(extent=[-40,40; 40,-40], style(
          fillColor=53,
          rgbfillColor={127,255,0},
          fillPattern=8)),
      Text(extent=[-94,28; 98,-28], string="P",
        style(fillPattern=8)),
      Text(
        extent=[-64,26; -40,6],
        style(color=3, rgbcolor={0,0,255}),
        string="P"),
      Text(
        extent=[-40,-40; -2,-60],
        style(color=3, rgbcolor={0,0,255}),
        string="T")),
    Icon(
      Line(points=[40,0; 90,0; 72,10]),
      Line(points=[90,0; 72,-10]),
      Rectangle(extent=[-40,40; 40,-40], style(
          fillColor=53,
          rgbfillColor={127,255,0},
          fillPattern=8)),
      Text(extent=[-92,30; 100,-26],string="P",
        style(fillPattern=8)),
      Text(
        extent=[-64,26; -40,6],
        style(color=3, rgbcolor={0,0,255}),
        string="P"),
      Text(
        extent=[-40,-40; -2,-60],
        style(color=3, rgbcolor={0,0,255}),
        string="T")),
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
    Baligh El Hefni</li>
</ul>
</html>
"));
public 
  ThermoSysPro.FlueGases.Connectors.FlueGasesOutlet C 
    annotation (extent=[90, -10; 110, 10]);
public 
  InstrumentationAndControl.Connectors.InputReal ITemperature 
    annotation (extent=[-10,-40; 10,-60], rotation=-90);
  InstrumentationAndControl.Connectors.InputReal IPressure 
    annotation (extent=[-60,-10; -40,10]);
equation 
  
  C.P = P;
  C.Q = Q;
  C.T = T;
  
  /* Flue gas composition */
  C.Xco2 = Xco2;
  C.Xh2o = Xh2o;
  C.Xo2 = Xo2;
  C.Xso2 = Xso2;
  
  Xn2 = 1 - Xco2 - Xh2o - Xo2 - Xso2;
  
  /* Pressure */
  if (cardinality(IPressure) == 0) then
    IPressure.signal = P0;
  end if;
  
  P = IPressure.signal;
  
  /* Temperature */
  if (cardinality(ITemperature) == 0) then
    ITemperature.signal = T0;
  end if;
  
  T = ITemperature.signal;
  
end SourceP;
