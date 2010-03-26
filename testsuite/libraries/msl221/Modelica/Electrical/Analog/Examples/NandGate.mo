within Modelica.Electrical.Analog.Examples;
encapsulated model NandGate "CMOS NAND Gate (see Tietze/Schenk, page 157)"
  import Modelica.Electrical.Analog.Basic;
  import Modelica.Electrical.Analog.Sources;
  import Modelica.Electrical.Analog.Examples.Utilities;
  import Modelica.Icons;
  extends Icons.Example;
  annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=1e-07), Documentation(info="<html>
<p>
The nand gate is a basic CMOS building block. It consists of four CMOS transistors.
The output voltage Nand.y.v is low if and only if the two input voltages at Nand.x1.v and Nand.x2.v
are both high. In this way the nand functionality is realized.
<p>
The simulation end time should be set to 1e-7. Please plot the input voltages Nand.x1.v,
d Nand.x2.v, and the output voltage Nand.y.v.
<p>
<dl>
<dt>
<b>Reference:</b>
<dd>
Tietze, U.; Schenk, Ch.: Halbleiter-Schaltungstechnik. Springer-Verlag Berlin Heidelberg NewYork 1980, p. 157
<p>
</dd>
</dl>
</HTML>
", revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
<dd>
<a href=\"http://people.eas.iis.fhg.de/Christoph.Clauss/\">Christoph Clau&szlig;</a>
    &lt;<a href=\"mailto:clauss@eas.iis.fhg.de\">clauss@eas.iis.fhg.de</a>&gt;<br>
    <a href=\"http://people.eas.iis.fhg.de/Andre.Schneider/\">Andr&eacute; Schneider</a>
    &lt;<a href=\"mailto:schneider@eas.iis.fhg.de\">schneider@eas.iis.fhg.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden<br>
<p>
<dt>
<b>Copyright:</b>
<dd>
Copyright &copy; 1998-2006, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i><br>
<p>
</dl>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  Basic.Ground Gnd1 annotation(Placement(visible=true, transformation(origin={50,48}, extent={{-5,-5},{5,5}}, rotation=0)));
  Basic.Ground Gnd4 annotation(Placement(visible=true, transformation(origin={-70,0}, extent={{-5,-5},{5,5}}, rotation=0)));
  Basic.Ground Gnd5 annotation(Placement(visible=true, transformation(origin={-70,-50}, extent={{-5,-5},{5,5}}, rotation=0)));
  Utilities.Nand Nand annotation(Placement(visible=true, transformation(origin={0,5}, extent={{-40,-50},{40,50}}, rotation=0)));
  Sources.TrapezoidVoltage VIN1(V=3.5, startTime=2e-08, rising=1e-09, width=1.9e-08, falling=1e-09, period=4e-08) annotation(Placement(visible=true, transformation(origin={-70,20}, extent={{-10,-10},{10,10}}, rotation=630)));
  Sources.TrapezoidVoltage VIN2(V=3.5, startTime=1e-08, rising=1e-09, width=1.9e-08, falling=1e-09, period=4e-08) annotation(Placement(visible=true, transformation(origin={-70,-30}, extent={{-10,-10},{10,10}}, rotation=630)));
  Sources.RampVoltage VDD(V=5, duration=1e-09) annotation(Placement(visible=true, transformation(origin={50,70}, extent={{-10,-10},{10,10}}, rotation=630)));
equation 
  connect(VIN1.n,Gnd4.p) annotation(Line(visible=true, points={{-70.0,10.0},{-70.0,5.0}}, color={0,0,255}));
  connect(VIN1.p,Nand.x1) annotation(Line(visible=true, points={{-70.0,30.0},{-40.0,30.0}}, color={0,0,255}));
  connect(VIN2.n,Gnd5.p) annotation(Line(visible=true, points={{-70.0,-40.0},{-70.0,-45.0}}, color={0,0,255}));
  connect(VIN2.p,Nand.x2) annotation(Line(visible=true, points={{-70.0,-20.0},{-40.0,-20.0}}, color={0,0,255}));
  connect(VDD.n,Gnd1.p) annotation(Line(visible=true, points={{50.0,60.0},{50.0,53.0}}, color={0,0,255}));
  connect(Nand.Vdd,VDD.p) annotation(Line(visible=true, points={{0.0,55.0},{0.0,90.0},{50.0,90.0},{50.0,80.0}}, color={0,0,255}));
end NandGate;
