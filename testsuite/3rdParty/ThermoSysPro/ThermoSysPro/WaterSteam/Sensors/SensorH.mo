within ThermoSysPro.WaterSteam.Sensors;
model SensorH "Specific enthalpy sensor" 
  parameter Boolean continuous_flow_reversal=false 
    "true : continuous flow reversal - false : discontinuous flow reversal";
  
protected 
  constant Real pi=Modelica.Constants.pi "pi";
  parameter Modelica.SIunits.MassFlowRate Qeps=1.e-3 
    "Minimum mass flow for continuous flow reversal";
  
public 
  Modelica.SIunits.MassFlowRate Q(start=500) "Mass flow rate";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Ellipse(extent=[-60,92; 60,-28], style(fillColor=2, rgbfillColor={0,255,0})),
      Line(points=[0,-28; 0,-80]),
      Line(points=[-98, -80; 102, -80]),
      Text(extent=[-60,60; 60,0], string="H")),
    Window(
      x=0.62,
      y=0.25,
      width=0.35,
      height=0.49),
    Diagram(
      Ellipse(extent=[-60,92; 60,-28], style(fillColor=2, rgbfillColor={0,255,0})),
      Line(points=[0,-28; 0,-80]),
      Line(points=[-98, -80; 102, -80]),
      Text(extent=[-60,60; 60,0],  string="H",
        style(fillColor=2, rgbfillColor={0,255,0}))),
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
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal Measure 
    annotation (extent=[-10,92; 10,112],    rotation=90);
  Connectors.FluidInlet C1 
                          annotation (extent=[-110, -90; -90, -70]);
  Connectors.FluidOutlet C2 
                          annotation (extent=[92, -90; 112, -70]);
equation 
  
  C1.P = C2.P;
  C1.h = C2.h;
  C1.Q = C2.Q;
  
  Q = C1.Q;
  
  /* Flow reversal */
  if continuous_flow_reversal then
    0 = noEvent(if (Q > Qeps) then C1.h - C1.h_vol else if (Q < -Qeps) then 
      C2.h - C2.h_vol else C1.h - 0.5*((C1.h_vol - C2.h_vol)*Modelica.Math.sin(pi
      *Q/2/Qeps) + C1.h_vol + C2.h_vol));
  else
    0 = if (Q > 0) then C1.h - C1.h_vol else C2.h - C2.h_vol;
  end if;
  
  /* Sensor signal */
  Measure.signal = C1.h;
end SensorH;
