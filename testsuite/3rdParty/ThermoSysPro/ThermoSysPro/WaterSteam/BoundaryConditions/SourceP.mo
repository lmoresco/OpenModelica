within ThermoSysPro.WaterSteam.BoundaryConditions;
model SourceP "Water/steam source with fixed pressure" 
  parameter ThermoSysPro.Units.AbsolutePressure P0=300000 "Source pressure";
  parameter ThermoSysPro.Units.AbsoluteTemperature T0=290 
    "Source temperature (active if option_temperature=1)";
  parameter ThermoSysPro.Units.SpecificEnthalpy h0=100000 
    "Source specific enthalpy (active if option_temperature=2)";
  parameter Integer option_temperature=1 
    "1:temperature fixed - 2:specific enthalpy fixed";
  parameter Integer mode=1 
    "IF97 region. 1:liquid - 2:steam - 4:saturation line - 0:automatic";
  
public 
  ThermoSysPro.Units.AbsolutePressure P "Fluid pressure";
  Modelica.SIunits.MassFlowRate Q "Mass flow rate";
  ThermoSysPro.Units.AbsoluteTemperature T "Fluid temperature";
  ThermoSysPro.Units.SpecificEnthalpy h "Fluid enthalpy";
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph pro 
    "Propriétés de l'eau" 
    annotation (extent=[-100, 80; -80, 100]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Line(points=[40, 0; 90, 0; 72, 10]),
      Line(points=[90, 0; 72, -10]),
      Text(extent=[-58, 30; -40, 10], string="P"),
      Text(extent=[-40,-40; -10,-60], string="h / T"),
      Rectangle(extent=[-40, 40; 40, -40], style(fillColor=53)),
      Text(extent=[-94,28; 98,-28], string="P")),
    Icon(
      Line(points=[40, 0; 90, 0; 72, 10]),
      Rectangle(extent=[-40, 40; 40, -40], style(fillColor=53)),
      Line(points=[90, 0; 72, -10]),
      Text(extent=[-94,28; 98,-28], string="P"),
      Text(extent=[-58, 30; -40, 10], string="P"),
      Text(extent=[-40,-40; -10,-60], string="h / T")),
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
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
    Daniel Bouskela</li>
<li>
    Baligh El Hefni</li>
</ul>
</html>
"));
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal IPressure 
    annotation (extent=[-60, -10; -40, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal ISpecificEnthalpy 
    annotation (extent=[-10, -40; 10, -60], rotation=-90);
  Connectors.FluidOutlet C      annotation (extent=[90, -10; 110, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal ITemperature 
    annotation (extent=[-10,40; 10,60],     rotation=-90);
equation 
  
  C.P = P;
  C.Q = Q;
  C.h_vol = h;
  
  if (cardinality(IPressure) == 0) then
    IPressure.signal = P0;
  end if;
  
  P = IPressure.signal;
  
  if (cardinality(ITemperature) == 0) then
      ITemperature.signal = T0;
  end if;
  
  if (cardinality(ISpecificEnthalpy) == 0) then
      ISpecificEnthalpy.signal = h0;
  end if;
  
  if (option_temperature == 1) then
    T = ITemperature.signal;
    h = ThermoSysPro.Properties.WaterSteam.IF97.SpecificEnthalpy_PT(P, T, 0);
  elseif (option_temperature == 2) then
    h = ISpecificEnthalpy.signal;
    T = pro.T;
  else
    assert(false, "SourcePressureWaterSteam: incorrect option");
  end if;
  
  pro = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(P, h, mode);
  
end SourceP;
