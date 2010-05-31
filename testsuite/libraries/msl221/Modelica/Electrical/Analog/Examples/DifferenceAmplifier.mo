within Modelica.Electrical.Analog.Examples;
encapsulated model DifferenceAmplifier "Simple NPN transistor amplifier circuit"
  import Modelica.Electrical.Analog.Basic;
  import Modelica.Electrical.Analog.Sources;
  import Modelica.Electrical.Analog.Examples.Utilities;
  import Modelica.Icons;
  extends Icons.Example;
  annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=1e-08), Documentation(info="<html>
<p>
It is a simple NPN transistor amplifier circuit. The voltage difference between R1.p and R3.n is amplified. The output signal is the voltage between R2.n and R4.n. In this example the voltage at V1 is amplified because R3.n is grounded.
<p>
The simulation end time should be set to 1e- 8. Please plot the input voltage V1.v, and the output voltages R2.n.v, and R4.n.v.
<p>
<dl>
<dt>
<b>Reference:</b>
<dd>
Tietze, U.; Schenk, Ch.: Halbleiter-Schaltungstechnik. Springer-Verlag Berlin Heidelberg NewYork 1980, p. 59
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
  Basic.Resistor R1(R=0.0001) annotation(Placement(visible=true, transformation(origin={-80,-10}, extent={{-10,-10},{10,10}}, rotation=0)));
  Basic.Resistor R3(R=0.0001) annotation(Placement(visible=true, transformation(origin={80,-10}, extent={{-10,-10},{10,10}}, rotation=0)));
  Basic.Capacitor C4(C=1e-10) annotation(Placement(visible=true, transformation(origin={20,-4}, extent={{-10,-10},{10,10}}, rotation=0)));
  Basic.Capacitor C2(C=1e-10) annotation(Placement(visible=true, transformation(origin={-20,-4}, extent={{-10,-10},{10,10}}, rotation=0)));
  Basic.Ground Gnd1 annotation(Placement(visible=true, transformation(origin={-90,-75}, extent={{-5,-5},{5,5}}, rotation=0)));
  Basic.Ground Gnd9 annotation(Placement(visible=true, transformation(origin={80,25}, extent={{-5,-5},{5,5}}, rotation=0)));
  Basic.Ground Gnd3 annotation(Placement(visible=true, transformation(origin={-10,-15}, extent={{-5,-5},{5,5}}, rotation=0)));
  Basic.Ground Gnd2 annotation(Placement(visible=true, transformation(origin={-60,-75}, extent={{-5,-5},{5,5}}, rotation=0)));
  Basic.Ground Gnd6 annotation(Placement(visible=true, transformation(origin={10,-15}, extent={{-5,-5},{5,5}}, rotation=0)));
  Basic.Ground Gnd7 annotation(Placement(visible=true, transformation(origin={-10,-75}, extent={{-5,-5},{5,5}}, rotation=0)));
  Basic.Ground Gnd8 annotation(Placement(visible=true, transformation(origin={10,-75}, extent={{-5,-5},{5,5}}, rotation=0)));
  Basic.Ground Gnd5 annotation(Placement(visible=true, transformation(origin={60,-75}, extent={{-5,-5},{5,5}}, rotation=0)));
  Basic.Ground Gnd4 annotation(Placement(visible=true, transformation(origin={90,-45}, extent={{-5,-5},{5,5}}, rotation=0)));
  Utilities.Transistor Transistor1 annotation(Placement(visible=true, transformation(origin={-50,-10}, extent={{-10,-10},{10,10}}, rotation=0)));
  Utilities.Transistor Transistor2 annotation(Placement(visible=true, transformation(origin={50,-10}, extent={{10,-10},{-10,10}}, rotation=0)));
  Sources.RampCurrent I1(I=0.16, duration=1e-09) annotation(Placement(visible=true, transformation(origin={-10,-50}, extent={{-10,-10},{10,10}}, rotation=630)));
  Sources.ExpSineVoltage V1(V=0.2, freqHz=200000000.0, damping=10000000.0) annotation(Placement(visible=true, transformation(origin={-90,-50}, extent={{-10,-10},{10,10}}, rotation=2790)));
  Sources.RampVoltage V2(V=15, duration=1e-09) annotation(Placement(visible=true, transformation(origin={80,50}, extent={{-10,-10},{10,10}}, rotation=630)));
  Basic.Resistor R2(R=100) annotation(Placement(visible=true, transformation(origin={-40,30}, extent={{-10,-10},{10,10}}, rotation=630)));
  Basic.Resistor R4(R=100) annotation(Placement(visible=true, transformation(origin={40,30}, extent={{-10,-10},{10,10}}, rotation=630)));
  Basic.Capacitor C5(C=1e-10) annotation(Placement(visible=true, transformation(origin={10,-50}, extent={{-10,-10},{10,10}}, rotation=630)));
  Basic.Capacitor C3(C=1e-10) annotation(Placement(visible=true, transformation(origin={60,-50}, extent={{-10,-10},{10,10}}, rotation=630)));
  Basic.Capacitor C1(C=1e-10) annotation(Placement(visible=true, transformation(origin={-60,-50}, extent={{-10,-10},{10,10}}, rotation=630)));
equation 
  connect(C4.n,Transistor2.c) annotation(Line(visible=true, points={{30.0,-4.0},{40.0,-4.0}}, color={0,0,255}));
  connect(Transistor2.b,R3.p) annotation(Line(visible=true, points={{60.0,-10.0},{70.0,-10.0}}, color={0,0,255}));
  connect(Transistor1.c,C2.p) annotation(Line(visible=true, points={{-40.0,-4.0},{-30.0,-4.0}}, color={0,0,255}));
  connect(R1.n,Transistor1.b) annotation(Line(visible=true, points={{-70.0,-10.0},{-60.0,-10.0}}, color={0,0,255}));
  connect(C4.p,Gnd6.p) annotation(Line(visible=true, points={{10.0,-4.0},{10.0,-10.0}}, color={0,0,255}));
  connect(C2.n,Gnd3.p) annotation(Line(visible=true, points={{-10.0,-4.0},{-10.0,-10.0}}, color={0,0,255}));
  connect(R3.n,Gnd4.p) annotation(Line(visible=true, points={{90.0,-10.0},{90.0,-40.0}}, color={0,0,255}));
  connect(I1.n,Gnd7.p) annotation(Line(visible=true, points={{-10.0,-60.0},{-10.0,-70.0}}, color={0,0,255}));
  connect(Transistor1.e,I1.p) annotation(Line(visible=true, points={{-40.0,-16.0},{-30.0,-16.0},{-30.0,-40.0},{-10.0,-40.0}}, color={0,0,255}));
  connect(V1.n,Gnd1.p) annotation(Line(visible=true, points={{-90.0,-60.0},{-90.0,-70.0}}, color={0,0,255}));
  connect(R1.p,V1.p) annotation(Line(visible=true, points={{-90.0,-10.0},{-90.0,-40.0}}, color={0,0,255}));
  connect(V2.n,Gnd9.p) annotation(Line(visible=true, points={{80.0,40.0},{80.0,30.0}}, color={0,0,255}));
  connect(R2.p,V2.p) annotation(Line(visible=true, points={{-40.0,40.0},{-40.0,70.0},{80.0,70.0},{80.0,60.0}}, color={0,0,255}));
  connect(R2.n,Transistor1.c) annotation(Line(visible=true, points={{-40.0,20.0},{-40.0,-4.0}}, color={0,0,255}));
  connect(R4.p,V2.p) annotation(Line(visible=true, points={{40.0,40.0},{40.0,70.0},{80.0,70.0},{80.0,60.0}}, color={0,0,255}));
  connect(R4.n,Transistor2.c) annotation(Line(visible=true, points={{40.0,20.0},{40.0,-4.0}}, color={0,0,255}));
  connect(C5.n,Gnd8.p) annotation(Line(visible=true, points={{10.0,-60.0},{10.0,-70.0}}, color={0,0,255}));
  connect(I1.p,C5.p) annotation(Line(visible=true, points={{-10.0,-40.0},{10.0,-40.0}}, color={0,0,255}));
  connect(C5.p,Transistor2.e) annotation(Line(visible=true, points={{10.0,-40.0},{30.0,-40.0},{30.0,-16.0},{40.0,-16.0}}, color={0,0,255}));
  connect(C3.n,Gnd5.p) annotation(Line(visible=true, points={{60.0,-60.0},{60.0,-70.0}}, color={0,0,255}));
  connect(Transistor2.b,C3.p) annotation(Line(visible=true, points={{60.0,-10.0},{60.0,-40.0}}, color={0,0,255}));
  connect(C1.n,Gnd2.p) annotation(Line(visible=true, points={{-60.0,-60.0},{-60.0,-70.0}}, color={0,0,255}));
  connect(Transistor1.b,C1.p) annotation(Line(visible=true, points={{-60.0,-10.0},{-60.0,-40.0}}, color={0,0,255}));
end DifferenceAmplifier;
