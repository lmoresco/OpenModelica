within ThermoSysPro.WaterSteam.Machines;
model Compressor "Heat pump compressor " 
  parameter Real pi=10.0 "Compression factor (Ps/Pe)";
  parameter Real eta=0.85 "Isentropic efficiency";
  parameter Modelica.SIunits.Power W_fric=0.0 
    "Power losses due to hydrodynamic friction (percent)";
  
public 
  Modelica.SIunits.Power W "Mechanical power delivered to the compressor";
  Modelica.SIunits.MassFlowRate Q "Mass flow rate";
  ThermoSysPro.Units.SpecificEnthalpy His 
    "Fluid specific enthalpy after isentropic compression";
  ThermoSysPro.Units.AbsolutePressure Pe(start=10e5) "Inlet pressure";
  ThermoSysPro.Units.AbsolutePressure Ps(start=10e5) "Outlet pressure";
  ThermoSysPro.Units.AbsoluteTemperature Te "Inlet temperature";
  ThermoSysPro.Units.AbsoluteTemperature Ts "Outlet temperature";
  Real xm(start=1.0) "Average vapor mass fraction";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Ellipse(extent=[-100,100; 100,-100], style(fillColor=53, rgbfillColor={
              128,255,0})), Line(points=[-60,80; 60,20; 60,-20; -60,-80], style(
            color=3, rgbcolor={0,0,255}))),
    Icon(
      Ellipse(extent=[-100,100; 100,-100], style(fillColor=53, rgbfillColor={
              128,255,0})), Line(points=[-60,80; 60,20; 60,-20; -60,-80], style(
            color=3, rgbcolor={0,0,255}))),
    Window(
      x=0.17,
      y=0.1,
      width=0.76,
      height=0.76),
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
</ul>
</html>
"));
  Connectors.FluidInlet C1 
    annotation (extent=[-110,-10; -90,10]);
  Connectors.FluidOutlet C2                annotation (extent=[90,-10; 110,10]);
public 
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph proe 
    annotation (extent=[-100,80; -80,100]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph pros 
    annotation (extent=[80,80; 100,100]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ps props 
    annotation (extent=[-100,-100; -80,-80]);
equation 
  
  C1.Q = C2.Q;
  
  Pe = C1.P;
  Ps = C2.P;
  
  Q = C1.Q;
  
  /* No flow reversal */
  0 = C1.h - C1.h_vol;
  
  /* Mechnical power delivered to the compressor */
  W = Q*(C2.h - C1.h) / (1 - W_fric/100);
  
  /* Compression factor */
  pi = Ps/Pe;
  
  /* Average vapor mass fraction */
  xm = (proe.x + pros.x)/2.0;
  
  /* Compression efficiency */
  His - C1.h = xm*eta*(C2.h - C1.h);
  
  /* Fluid thermodynamic properties before the compression */
  proe = ThermoSysPro.Properties.Fluid.Ph(Pe, C1.h, 0, 2);
  Te = proe.T;
  
  /* Fluid thermodynamic properties after the compression */
  pros = ThermoSysPro.Properties.Fluid.Ph(Ps, C2.h, 0, 2);
  Ts = pros.T;
  
  /* Fluid thermodynamic properties after the identropic compression */
  props = ThermoSysPro.Properties.Fluid.Ps(Ps, proe.s, 0, 2);
  His = props.h;
  
end Compressor;
