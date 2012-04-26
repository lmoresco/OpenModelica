within ThermoSysPro.WaterSteam.PressureLosses;
model ThreeWayValve "Three way valve" 
  parameter ThermoSysPro.Units.Cv Cvmax1=8005.42 "Valve 1 max CV";
  parameter ThermoSysPro.Units.Cv Cvmax2=8005.42 "Valve 2 max CV";
  parameter Real caract1[:, 2]=[0, 0; 1, Cvmax1] 
    "Valve 1 - Position vs. Cv characteristics (active if mode_caract1=true)";
  parameter Real caract2[:, 2]=[0, 0; 1, Cvmax2] 
    "Valve 2 - Position vs. Cv characteristics (active if mode_caract2=true)";
  parameter Integer mode_caract1=0 
    "Valve 1 - 0:linear characteristics - 1:characteristics is given by caract1[]";
  parameter Integer mode_caract2=0 
    "Valve 2 - 0:linear characteristics - 1:characteristics is given by caract2[]";
  parameter Modelica.SIunits.Volume V=1 "Three way valve volume";
  parameter Boolean continuous_flow_reversal=false 
    "true: continuous flow reversal - false: discontinuous flow reversal";
  parameter Integer fluid=1 "1: water/steam - 2: C3H3F5";
  parameter Modelica.SIunits.Density p_rho=0 "If > 0, fixed fluid density";
  parameter Integer mode=0 
    "IF97 region. 1:liquid - 2:steam - 4:saturation line - 0:automatic";
  annotation(structurallyIncomplete, Documentation(info="<html>
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
"), Diagram(Text(extent=[-46,-30; -12,-52], string="Valve 1"),
            Text(extent=[36,-6; 70,-28], string="Valve 2")));
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Polygon(points=[-100, 0; -100, -80; 100, 0; 100, -80; -100, 0], style(
            fillColor=53)),
      Polygon(points=[-20, -100; 0, -40; 20, -100; -20, -100], style(fillColor=
              53)),
      Polygon(points=[40, 40; -40, 40; -40, 56; -38, 74; -32, 84; -20, 94; 0,
            100; 20, 94; 32, 84; 38, 72; 40, 54; 40, 40], style(fillColor=53,
            fillPattern=1)),
      Polygon(points=[0, -40; 40, 40; -40, 40; 0, -40], style(fillColor=53,
            fillPattern=1))),
    Window(
      x=0.09,
      y=0.11,
      width=0.7,
      height=0.66),
    Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2003</b></p>
</HTML>
<html>
<p><b>Version 1.4</b></p>
</HTML>
"), Diagram(Text(extent=[34, -4; 68, -26], string="Valve 2")));
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal Ouv 
    annotation (extent=[-10, 100; 10, 120], rotation=-90);
  Connectors.FluidInletI C1 
    annotation (extent=[-110, -50; -90, -30], layer="icon");
  Connectors.FluidOutletI C2 
    annotation (extent=[90, -50; 110, -30], layer="icon");
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Valve1(
    Cvmax=Cvmax1,
    caract=caract1,
    mode_caract=mode_caract1,
    p_rho=p_rho,
    mode=mode,
    continuous_flow_reversal=continuous_flow_reversal,
    fluid=fluid) 
               annotation (extent=[16, -30; -4, -50], rotation=90);
  Connectors.FluidOutletI C3         annotation (extent=[-10, -110; 10, -90]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Valve2(
    Cvmax=Cvmax2,
    caract=caract2,
    mode_caract=mode_caract2,
    p_rho=p_rho,
    mode=mode,
    continuous_flow_reversal=continuous_flow_reversal,
    fluid=fluid) 
               annotation (extent=[40, -4; 60, 16]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Constante1 
                                         annotation (extent=[-80,60; -60,80]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Math.Add Add1(
                              k2=-1) annotation (extent=[-40, 40; -20, 60]);
  ThermoSysPro.WaterSteam.Volumes.VolumeA VolumeA1(
    V=V,
    p_rho=p_rho,
    mode=mode) annotation (extent=[-10, -10; 10, 10]);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss PerteDP1(K=0, continuous_flow_reversal=
        continuous_flow_reversal,
    fluid=fluid) 
    annotation (extent=[-60, -10; -40, 10]);
equation 
  connect(Ouv, Valve2.Ouv) 
    annotation (points=[0,110; 0,60; 50,60; 50,17]);
  connect(Constante1.y, Add1.u1) 
    annotation (points=[-59,70; -50,70; -50,56; -41,56],     style(color=3));
  connect(Ouv, Add1.u2) 
    annotation (points=[0,110; 0,90; -90,90; -90,44; -41,44]);
  connect(Add1.y, Valve1.Ouv) 
    annotation (points=[-19, 50; 20, 50; 20, -40; 17, -40], style(color=3));
  connect(VolumeA1.Cs1, Valve2.C1) 
    annotation (points=[10, 0; 40, 0], style(color=3));
  connect(VolumeA1.Cs2, Valve1.C1) 
    annotation (points=[0,-10; 0,-30; 8.88178e-016,-30],
                                         style(color=3));
  connect(Valve1.C2, C3) 
    annotation (points=[-8.88178e-016,-50; -8.88178e-016,-78; 0,-78; 0,-100],
                                         style(color=3));
  connect(PerteDP1.C2, VolumeA1.Ce1) 
    annotation (points=[-40, 0; -10, 0], style(color=3));
  connect(Valve2.C2, C2) 
    annotation (points=[60,0; 80,0; 80,-40; 100,-40],     style(color=3));
  connect(PerteDP1.C1, C1) 
    annotation (points=[-60,0; -80,0; -80,-40; -100,-40],    style(color=3));
end ThreeWayValve;
