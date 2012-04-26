within ThermoSysPro.WaterSteam;
package Connectors "Connectors" 
  connector FluidInlet "Water/steam inlet fluid connector" 
    ThermoSysPro.Units.AbsolutePressure P(start=1.e5) 
      "Fluid pressure in the control volume";
    ThermoSysPro.Units.SpecificEnthalpy h_vol(start=1.e5) 
      "Fluid specific enthalpy in the control volume";
    Modelica.SIunits.MassFlowRate Q(start=500) 
      "Mass flow rate of the fluid crossing the boundary of the control volume";
    ThermoSysPro.Units.SpecificEnthalpy h(start=1.e5) 
      "Specific enthalpy of the fluid crossing the boundary of the control volume";
    
    input Boolean a=true 
      "Pseudo-variable for the verification of the connection orientation";
    output Boolean b 
      "Pseudo-variable for the verification of the connection orientation";
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Icon(Rectangle(extent=[-100, 100; 100, -100], style(fillColor=73))),
      Window(
        x=0.27,
        y=0.33,
        width=0.6,
        height=0.6),
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
  end FluidInlet;
  
  connector FluidInletI "Internal water/steam inlet fluid connector" 
    ThermoSysPro.Units.AbsolutePressure P(start=1.e5) 
      "Fluid pressure in the control volume";
    ThermoSysPro.Units.SpecificEnthalpy h_vol(start=1.e5) 
      "Fluid specific enthalpy in the control volume";
    Modelica.SIunits.MassFlowRate Q(start=500) 
      "Mass flow rate of the fluid crossing the boundary of the control volume";
    ThermoSysPro.Units.SpecificEnthalpy h(start=1.e5) 
      "Specific enthalpy of the fluid crossing the boundary of the control volume";
    
    input Boolean a 
      "Pseudo-variable for the verification of the connection orientation";
    output Boolean b 
      "Pseudo-variable for the verification of the connection orientation";
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(Rectangle(extent=[-100, 100; 100, -100], style(fillColor=7,
                fillPattern=10))),
        Window(
          x=0.27,
          y=0.17,
          width=0.6,
          height=0.6),
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
  end FluidInletI;
  
  connector FluidOutlet "Water/steam outlet fluid connector" 
    ThermoSysPro.Units.AbsolutePressure P(start=1.e5) 
      "Fluid pressure in the control volume";
    ThermoSysPro.Units.SpecificEnthalpy h_vol(start=1.e5) 
      "Fluid specific enthalpy in the control volume";
    Modelica.SIunits.MassFlowRate Q(start=500) 
      "Mass flow rate of the fluid crossing the boundary of the control volume";
    ThermoSysPro.Units.SpecificEnthalpy h(start=1.e5) 
      "Specific enthalpy of the fluid crossing the boundary of the control volume";
    
    output Boolean a 
      "Pseudo-variable for the verification of the connection orientation";
    input Boolean b=true 
      "Pseudo-variable for the verification of the connection orientation";
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Icon(Rectangle(extent=[-100, 100; 100, -100], style(color=73, fillColor=
                41))),
      Window(
        x=0.26,
        y=0.39,
        width=0.6,
        height=0.6),
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
  end FluidOutlet;
  
  connector FluidOutletI "Internal water/steam outlet fluid connector" 
    ThermoSysPro.Units.AbsolutePressure P(start=1.e5) 
      "Fluid pressure in the control volume";
    ThermoSysPro.Units.SpecificEnthalpy h_vol(start=1.e5) 
      "Fluid specific enthalpy in the control volume";
    Modelica.SIunits.MassFlowRate Q(start=500) 
      "Mass flow rate of the fluid crossing the boundary of the control volume";
    ThermoSysPro.Units.SpecificEnthalpy h(start=1.e5) 
      "Specific enthalpy of the fluid crossing the boundary of the control volume";
    
    output Boolean a 
      "Pseudo-variable for the verification of the connection orientation";
    input Boolean b 
      "Pseudo-variable for the verification of the connection orientation";
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(Rectangle(extent=[-100, 100; 100, -100], style(
              color=41,
              fillColor=7,
              fillPattern=10))),
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
</ul>
</html>
"));
  end FluidOutletI;
end Connectors;
