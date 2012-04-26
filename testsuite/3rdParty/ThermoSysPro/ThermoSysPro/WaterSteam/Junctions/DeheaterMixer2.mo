within ThermoSysPro.WaterSteam.Junctions;
model DeheaterMixer2 
  parameter ThermoSysPro.Units.AbsoluteTemperature Tmax=700 
    "Maximum fluid temperature";
  parameter Integer mode=0 
    "IF97 region. 1:liquid - 2:steam - 4:saturation line - 0:automatic";
  
public 
  ThermoSysPro.Units.AbsolutePressure P(start=50e5) "Fluid pressure";
  ThermoSysPro.Units.SpecificEnthalpy h(start=10e5) "Fluid specific enthalpy";
  ThermoSysPro.Units.AbsoluteTemperature T(start=600) "Fluid temperature";
  ThermoSysPro.Units.SpecificEnthalpy hmax(start=10e5) 
    "Maximum fluid specific enthalpy";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(Polygon(points=[-100,80; -100,40; -20,40; -20,-100; 20,-100; 20,40;
            100,40; 100,80; -100,80], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)), Text(
        extent=[-16,72; 24,32],
        style(color=3, rgbcolor={0,0,255}),
        string="D")),
    Icon(Polygon(points=[-100,80; -100,40; -20,40; -20,-100; 20,-100; 20,40;
            100,40; 100,80; -100,80], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)), Text(
        extent=[-16,72; 24,32],
        style(color=3, rgbcolor={0,0,255}),
        string="D")),
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
"));
public 
  Connectors.FluidInlet Ce_mix 
    annotation (extent=[-9,-110; 11,-90]);
  Connectors.FluidOutlet Cs      annotation (extent=[90,50; 110,70]);
public 
  Connectors.FluidInlet Ce 
    annotation (extent=[-110,50; -90,70]);
public 
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph pro 
    annotation (extent=[-100, 82; -80, 102]);
equation 
  
  /* Fluid pressure */
  P = Ce.P;
  P = Ce_mix.P;
  P = Cs.P;
  
  /* Fluid specific enthalpy (singular if all flows = 0) */
  Ce.h_vol = h;
  Cs.h_vol = h;
  Ce_mix.h_vol = h;
  
  /* Mass balance equation */
  0 = Ce.Q + Ce_mix.Q - Cs.Q;
  
  /* Energy balance equation */
  0 = Ce.Q*Ce.h + Ce_mix.Q*Ce_mix.h - Cs.Q*Cs.h;
  
  /* The flow at the mixing inlet is such as to ensure T <= Tmax */
  if ((T <= Tmax) or (hmax < Ce_mix.h)) then
    Ce_mix.Q = 0;
  else
    h = hmax;
  end if;
  
  /* Fluid thermodynamic properties */
  pro = ThermoSysPro.Properties.Fluid.Ph(P, h, mode, 1);
  
  T = pro.T;
  
  hmax = ThermoSysPro.Properties.WaterSteam.IF97.SpecificEnthalpy_PT(P, Tmax, mode);
  
end DeheaterMixer2;
