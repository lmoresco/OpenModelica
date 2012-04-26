within ThermoSysPro.ElectroMechanics.BoundaryConditions;
model SourceMechanicalPower "Mechanical power source" 
  parameter Modelica.SIunits.Power W0=150000;
  
  annotation (Diagram(
      Rectangle(extent=[-40,40; 40,-40], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0})),
      Text(
        extent=[-20,20; 20,-20],
        style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1),
        string="W"),
      Line(points=[40,0; 100,0], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Line(points=[100,0; 80,-20], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Line(points=[100,0; 80,20], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1))), Icon(
      Rectangle(extent=[-40,40; 40,-40], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0})),
      Text(
        extent=[-20,20; 20,-20],
        style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1),
        string="W"),
      Line(points=[40,0; 100,0], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Line(points=[100,0; 80,-20], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Line(points=[100,0; 80,20], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1))),
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
  ThermoSysPro.ElectroMechanics.Connectors.MechanichalTorque M 
    annotation(extent=[120,-10; 100,10],    rotation=180);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal IPower 
    annotation (extent=[-60,-10; -40,10]);
equation 
  
  if (cardinality(IPower) == 0) then
    IPower.signal = W0;
  end if;
  
  M.Ctr*abs(M.w) = IPower.signal;
  
end SourceMechanicalPower;
