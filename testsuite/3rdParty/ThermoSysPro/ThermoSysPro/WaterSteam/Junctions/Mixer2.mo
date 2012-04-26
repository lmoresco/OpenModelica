within ThermoSysPro.WaterSteam.Junctions;
model Mixer2 "Mixer with two inlets" 
  parameter Integer fluid=1 "1: water/steam - 2: C3H3F5";
  parameter Integer mode=0 
    "IF97 region. 1:liquid - 2:steam - 4:saturation line - 0:automatic";
  
public 
  Real alpha1 "Extraction coefficient for inlet 1 (<=1)";
  ThermoSysPro.Units.AbsolutePressure P(start=10e5) "Fluid pressure";
  ThermoSysPro.Units.SpecificEnthalpy h(start=10e5) "Fluid specific enthalpy";
  ThermoSysPro.Units.AbsoluteTemperature T "Fluid temperature";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(Polygon(points=[-60,-100; -20,-100; -20,-20; 100,-20; 100,20; -20,
            20; -20,100; -60,100; -60,-100],
                                      style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0})),                               Text(extent=[-60,80;
            -20,40],          string="1"),                          Text(extent=[-60,-40;
            -20,-80], string="2")),
    Icon(   Polygon(points=[-60,-100; -20,-100; -20,-20; 100,-20; 100,20; -20,
            20; -20,100; -60,100; -60,-100],
                                      style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0})),                               Text(extent=[-60,80;
            -20,40],          string="1"),                          Text(extent=[-60,-40;
            -20,-80], string="2")),
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
  Connectors.FluidInlet Ce2 
    annotation (extent=[-50,-110; -30,-90]);
  Connectors.FluidOutlet Cs                annotation (extent=[90,-10; 110,10]);
public 
  Connectors.FluidInlet Ce1 
    annotation (extent=[-50,90; -30,110]);
  InstrumentationAndControl.Connectors.InputReal Ialpha1 
    "Extraction coefficient for inlet 1 (<=1)" 
    annotation (extent=[-80,50; -60,70]);
  InstrumentationAndControl.Connectors.OutputReal Oalpha1 
    annotation (extent=[-20,50; 0,70]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph pro 
    "Propriétés de l'eau" 
    annotation (extent=[-100,80; -80,100]);
equation 
  
  if (cardinality(Ialpha1) == 0) then
    Ialpha1.signal = 1;
  end if;
  
  /* Fluid pressure */
  P = Ce1.P;
  P = Ce2.P;
  P = Cs.P;
  
  /* Fluid specific enthalpy (singular if all flows = 0) */
  Ce1.h_vol = h;
  Ce2.h_vol = h;
  Cs.h_vol = h;
  
  /* Mass balance equation */
  0 = Ce1.Q + Ce2.Q - Cs.Q;
  
  /* Energy balance equation */
  0 = Ce1.Q*Ce1.h + Ce2.Q*Ce2.h - Cs.Q*Cs.h;
  
  /* Mass flow at outlet 1 */
  if (cardinality(Ialpha1) <> 0) then
    Ce1.Q = Ialpha1.signal*Cs.Q;
  end if;
  
  alpha1 =  Ce1.Q/Cs.Q;
  Oalpha1.signal = alpha1;
  
  /* Fluid thermodynamic properties */
  pro = ThermoSysPro.Properties.Fluid.Ph(P, h, mode, fluid);
  
  T = pro.T;
  
end Mixer2;
