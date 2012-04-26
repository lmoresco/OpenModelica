within ThermoSysPro.ElectroMechanics.Machines;
model SynchronousMotor "Synchronous electrical motor" 
  parameter ThermoSysPro.Units.RotationVelocity Vrot=1400. 
    "Nominal rotational speed";
  parameter ThermoSysPro.Units.RotationVelocity Vrot0=0 
    "Initial rotational speed (active if steady_state_mech=true)";
  parameter Modelica.SIunits.Voltage Ualim=380. "Voltage";
  parameter Real D=10.0 "Damping coefficient (mechanical losses) (n.u.)";
  parameter Modelica.SIunits.Inductance Lm=1. "Motor nductance";
  parameter Modelica.SIunits.Resistance Rm=0.00001 "Motor resistance";
  parameter Real Ki=1. "Proportionnality coef. between Cm and Im (N.m/A)";
  parameter Modelica.SIunits.MomentOfInertia J=4. "Motor moment of inertia";
  parameter Boolean steady_state_mech=true 
    "true: start from steady state - false : start from Vrot0";
  parameter Boolean mech_coupling=true "Use mechanical coupling component";
  
protected 
  constant Real pi=Modelica.Constants.pi "pi";
  parameter Real Km=30*Ualim/(pi*Vrot) 
    "Voltage in rotor under stationary state";
  
public 
  Modelica.SIunits.AngularVelocity w "Angular speed";
  Modelica.SIunits.Torque Cm "Motor torque";
  Modelica.SIunits.Torque Ctr "Mechanical torque";
  Modelica.SIunits.Current Im "Current";
  Modelica.SIunits.Voltage Um "Voltage";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Rectangle(extent=[-60, 32; 62, -34], style(fillColor=69, rgbfillColor={0,
              128,255})),
      Rectangle(extent=[-60, -4; 62, 0], style(
          gradient=3,
          fillColor=1,
          fillPattern=1)),
      Rectangle(extent=[-60, 16; 62, 20], style(
          gradient=3,
          fillColor=1,
          fillPattern=1)),
      Rectangle(extent=[-60, -22; 62, -18], style(
          gradient=3,
          fillColor=1,
          fillPattern=1)),
      Rectangle(extent=[62, 12; 92, -12], style(fillColor=69, rgbfillColor={0,
              128,255})),
      Rectangle(extent=[-90, 12; -60, -12], style(fillColor=69, rgbfillColor={0,
              128,255})),
      Line(points=[92, -22; 90, -26; 88, -28; 84, -30; 80, -30; 76, -28; 72,
            -22; 70, -14; 70, -6; 70, 16; 72, 22; 74, 26; 76, 28; 80, 30; 82,
            30; 86, 28; 88, 26; 90, 22; 90, 28; 86, 24; 90, 22]),
      Rectangle(extent=[-60, 30; 62, 34], style(
          gradient=3,
          fillColor=1,
          fillPattern=1)),
      Rectangle(extent=[-60, -36; 62, -32], style(
          gradient=3,
          fillColor=1,
          fillPattern=1))),
    Icon(
      Rectangle(extent=[-60, 32; 62, -34], style(fillColor=69, rgbfillColor={0,
              128,255})),
      Rectangle(extent=[-60, -4; 62, 0], style(
          gradient=3,
          fillColor=1,
          fillPattern=1)),
      Rectangle(extent=[-60, 16; 62, 20], style(
          gradient=3,
          fillColor=1,
          fillPattern=1)),
      Rectangle(extent=[-60, -22; 62, -18], style(
          gradient=3,
          fillColor=1,
          fillPattern=1)),
      Rectangle(extent=[62,12; 92,-12], style(fillColor=69, rgbfillColor={0,128,
              255})),
      Rectangle(extent=[-90, 12; -60, -12], style(fillColor=69, rgbfillColor={0,
              128,255})),
      Line(points=[92, -22; 90, -26; 88, -28; 84, -30; 80, -30; 76, -28; 72,
            -22; 70, -14; 70, -6; 70, 16; 72, 22; 74, 26; 76, 28; 80, 30; 82,
            30; 86, 28; 88, 26; 90, 22; 90, 28; 86, 24; 90, 22]),
      Rectangle(extent=[-60, 30; 62, 34], style(
          gradient=3,
          fillColor=1,
          fillPattern=1)),
      Rectangle(extent=[-60, -36; 62, -32], style(
          gradient=3,
          fillColor=1,
          fillPattern=1))),
    Window(
      x=0.07,
      y=0.04,
      width=0.79,
      height=0.78),
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
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical marche 
    annotation (extent=[-10, 34; 10, 54], rotation=-90);
  ThermoSysPro.ElectroMechanics.Connectors.MechanichalTorque C 
                                 annotation (extent=[92, -10; 112, 10]);
initial equation 
  if steady_state_mech then
    if mech_coupling then
      der(w) = 0;
    end if;
    der(Im) = 0;
  else
    if mech_coupling then
      w = (pi/30)*Vrot0;
    end if;
    Im = 0;
  end if;
  
equation 
  C.w = w;
  C.Ctr = Ctr;
  
  J*der(w) = Cm - D*w - Ctr;
  Lm*der(Im) = Um - Km*w - Rm*Im;
  
  Um = if marche.signal then Ualim else 0;
  Cm = Ki*Im;
  
end SynchronousMotor;
