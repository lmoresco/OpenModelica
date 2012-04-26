within ThermoSysPro.WaterSteam.PressureLosses;
model IdealSwitchValve "Ideal switch valve" 
  parameter Modelica.SIunits.MassFlowRate Qmin=1.e-6 
    "Mass flow when the valve is closed";
  parameter Boolean continuous_flow_reversal=false 
    "true: continuous flow reversal - false: discontinuous flow reversal";
  
protected 
  constant Real pi=Modelica.Constants.pi "pi";
  parameter Modelica.SIunits.MassFlowRate Qeps=1.e-3 
    "Small mass flow for continuous flow reversal";
  
public 
  Modelica.SIunits.MassFlowRate Q "Mass flow rate";
  ThermoSysPro.Units.DifferentialPressure deltaP 
    "Pressure difference between the inlet and the outlet";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Polygon(points=[-100, -100; 0, -60; -100, -20; -100, -100; -100, -100],
          style(fillColor=53, fillPattern=1)),
      Polygon(points=[0, -60; 100, -20; 100, -100; 0, -60; 0, -60], style(
            fillColor=53, fillPattern=1)),
      Line(points=[-40, 60; 40, 60], style(thickness=4)),
      Line(points=[0, 60; 0, -60]),
      Text(extent=[-104, 34; 88, -22], string="DP=0")),
    Icon(
      Polygon(points=[-100, -100; 0, -60; -100, -20; -100, -100; -100, -100],
          style(fillColor=53, fillPattern=1)),
      Polygon(points=[0, -60; 100, -20; 100, -100; 0, -60; 0, -60], style(
            fillColor=57, fillPattern=1)),
      Line(points=[-40, 60; 40, 60], style(thickness=4)),
      Line(points=[0, 60; 0, -60]),
      Text(extent=[-104, 34; 88, -22], string="DP=0")),
    Window(
      x=0.22,
      y=0.12,
      width=0.72,
      height=0.74),
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
</ul>
</html>
"));
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical Ouv 
    annotation (extent=[-10, 60; 10, 80], rotation=-90);
  Connectors.FluidInlet C1 
                          annotation (extent=[-110, -72; -90, -52]);
  Connectors.FluidOutlet C2 
                          annotation (extent=[90, -70; 110, -50]);
equation 
  
  C1.Q = C2.Q;
  C1.h = C2.h;
  
  Q = C1.Q;
  deltaP = C1.P - C2.P;
  
  /* Flow reversal */
  if continuous_flow_reversal then
    0 = noEvent(if (Q > Qeps) then C1.h - C1.h_vol else if (Q < -Qeps) then 
      C2.h - C2.h_vol else C1.h - 0.5*((C1.h_vol - C2.h_vol)*Modelica.Math.sin(pi
      *Q/2/Qeps) + C1.h_vol + C2.h_vol));
  else
    0 = if (Q > 0) then C1.h - C1.h_vol else C2.h - C2.h_vol;
  end if;
  
  if Ouv.signal then
    deltaP = 0;
  else
    Q - Qmin = 0;
  end if;
  
end IdealSwitchValve;
