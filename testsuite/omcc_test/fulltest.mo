// name    :fulltest.mo
//keywords :This test the modelica package electrical which includes the modelica keywords, conditional statements,guard statments,assert statements etc.. and mostly includes all of the modelica grammar
//status :  correct

package Analog "Library for analog electrical models"
  import SI = Modelica.SIunits;
  extends Modelica.Icons.Library2;
  annotation(__Dymola_classOrder = {"Examples","*"}, Documentation(info = "<html>
<p>
This package contains packages for analog electrical components:
<ul>
<li>Basic: basic components (resistor, capacitor, conductor, inductor, transformer, gyrator)</li>
<li>Semiconductors: semiconductor devices (diode, bipolar and MOS transistors)</li>
<li>Lines: transmission lines (lossy and lossless)</li>
<li>Ideal: ideal elements (switches, diode, transformer, idle, short, ...)</li>
<li>Sources: time-dependend and controlled voltage and current sources</li>
<li>Sensors: sensors to measure potential, voltage, and current</li>
</ul>
</p>
<dl>
<dt>
<b>Main Authors:</b></dt>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden</dd>
</dl>


<p>
Copyright &copy; 1998-2009, Modelica Association and Fraunhofer-Gesellschaft.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b>
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense2\">here</a>.</i>
</p><br>
</HTML>
"));
  package Examples "Examples that demonstrate the usage of the Analog electrical components"
    extends Modelica.Icons.Library2;
    annotation(Documentation(info = "<html>
<p>
This package contains examples that demonstrate the usage of the
components of the Electrical.Analog library.
</p>

</HTML>
", revisions = "<html>
<dl>
<dt>
<b>Main Authors:</b>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
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
</html>"));
    package Utilities "Utility components used by package Examples"
      extends Modelica.Icons.Library2;
      annotation(Documentation(info = "<html>
<p>
This package contains utility components used by package Examples.
</p>

</HTML>
", revisions = "<html>
<dl>
<dt>
<b>Main Authors:</b>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
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
</html>"));
      model Nand "CMOS NAND Gate (see Tietze/Schenk, page 157)"
        Semiconductors.PMOS TP1(W = 6.5e-006, L = 3.1e-006, Beta = 1.05e-005, Vt = -1, K2 = 0.41, K5 = 0.8385, dW = -2.5e-006, dL = -2.1e-006) annotation(Placement(transformation(extent = {{10,60},{30,80}}, rotation = 0)));
        Semiconductors.PMOS TP2(W = 6.5e-006, L = 3.1e-006, Beta = 1.05e-005, Vt = -1, K2 = 0.41, K5 = 0.8385, dW = -2.5e-006, dL = -2.1e-006) annotation(Placement(transformation(extent = {{-40,45},{-20,65}}, rotation = 0)));
        Semiconductors.NMOS TN1(W = 6.5e-006, L = 3.1e-006, Beta = 4.1e-005, Vt = 0.8, K2 = 1.144, K5 = 0.7311, dW = -2.5e-006, dL = -1.5e-006) annotation(Placement(transformation(extent = {{10,15},{30,35}}, rotation = 0)));
        Semiconductors.NMOS TN2(W = 6.5e-006, L = 3.1e-006, Beta = 4.1e-005, Vt = 0.8, K2 = 1.144, K5 = 0.7311, dW = -2.5e-006, dL = -1.5e-006) annotation(Placement(transformation(extent = {{10,-25},{30,-5}}, rotation = 0)));
        Basic.Capacitor C4(C = 4e-014) annotation(Placement(transformation(origin = {60,30}, extent = {{-10,-10},{10,10}}, rotation = 270)));
        Basic.Capacitor C7(C = 4e-014) annotation(Placement(transformation(origin = {55,-50}, extent = {{-10,-10},{10,10}}, rotation = 270)));
        Basic.Ground Gnd annotation(Placement(transformation(extent = {{40,-25},{50,-15}}, rotation = 0)));
        Basic.Ground Gnd2 annotation(Placement(transformation(extent = {{55,0},{65,10}}, rotation = 0)));
        Basic.Ground Gnd3 annotation(Placement(transformation(extent = {{50,-80},{60,-70}}, rotation = 0)));
        Basic.Ground Gnd6 annotation(Placement(transformation(extent = {{-15,30},{-5,40}}, rotation = 0)));
        Basic.Ground Gnd7 annotation(Placement(transformation(extent = {{40,15},{50,25}}, rotation = 0)));
        Basic.Ground Gnd8 annotation(Placement(transformation(extent = {{40,60},{50,70}}, rotation = 0)));
        Interfaces.Pin x1 annotation(Placement(transformation(extent = {{-110,40},{-90,60}}, rotation = 0)));
        Interfaces.Pin x2 annotation(Placement(transformation(extent = {{-110,-60},{-90,-40}}, rotation = 0)));
        Interfaces.Pin Vdd annotation(Placement(transformation(extent = {{-10,90},{10,110}}, rotation = 0)));
        Interfaces.Pin y annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      equation
        connect(TN1.S,TN2.D) annotation(Line(points = {{30,20},{30,-10}}));
        connect(TN2.B,Gnd.p) annotation(Line(points = {{30,-15},{38,-15},{38,-15},{45,-15}}));
        connect(TN2.D,C7.p) annotation(Line(points = {{30,-10},{55,-10},{55,-40}}));
        connect(TN2.S,Gnd.p) annotation(Line(points = {{30,-20},{38,-20},{38,-15},{45,-15}}));
        connect(TP1.S,TN1.D) annotation(Line(points = {{30,65},{30,30}}));
        connect(TP1.G,TN1.G) annotation(Line(points = {{10,65},{10,20}}));
        connect(C4.n,Gnd2.p) annotation(Line(points = {{60,20},{60,10}}));
        connect(C7.n,Gnd3.p) annotation(Line(points = {{55,-60},{55,-70}}));
        connect(TP2.B,Gnd6.p) annotation(Line(points = {{-20,55},{-10,55},{-10,40}}));
        connect(TN1.B,Gnd7.p) annotation(Line(points = {{30,25},{45,25}}));
        connect(TP1.B,Gnd8.p) annotation(Line(points = {{30,70},{45,70}}));
        connect(TP2.G,x1) annotation(Line(points = {{-40,50},{-100,50}}));
        connect(TP2.G,TN2.G) annotation(Line(points = {{-40,50},{-40,-20},{10,-20}}));
        connect(TN1.G,x2) annotation(Line(points = {{10,20},{-70,20},{-70,-50},{-100,-50}}));
        connect(TP2.S,TN1.D) annotation(Line(points = {{-20,50},{30,50},{30,30}}));
        connect(TN1.D,C4.p) annotation(Line(points = {{30,30},{30,50},{60,50},{60,40}}));
        connect(Vdd,TP1.D) annotation(Line(points = {{0,100},{0,80},{30,80},{30,75}}));
        connect(TP2.D,Vdd) annotation(Line(points = {{-20,60},{-20,80},{0,80},{0,100}}));
        connect(C4.p,y) annotation(Line(points = {{60,40},{60,50},{80,50},{80,0},{100,0}}));
        annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-50,70},{50,-70}}, lineColor = {0,0,0}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Ellipse(extent = {{50,5},{60,-5}}, lineColor = {0,0,0}, pattern = LinePattern.None),Text(extent = {{-16,50},{14,20}}, lineColor = {0,0,0}, textString = "&"),Line(points = {{60,0},{100,0}}, color = {0,0,255}),Line(points = {{0,70},{0,100}}, color = {0,0,255}),Line(points = {{-50,50},{-100,50}}, color = {0,0,255}),Line(points = {{-50,-50},{-100,-50}}, color = {0,0,255}),Ellipse(extent = {{50,5},{60,-5}}, lineColor = {0,0,0}),Text(extent = {{-100,34},{-90,24}}, textString = "x1", lineColor = {0,0,255}),Text(extent = {{-100,-65},{-90,-75}}, textString = "x2", lineColor = {0,0,255}),Text(extent = {{90,-15},{100,-25}}, textString = "y", lineColor = {0,0,255})}), Documentation(info = "<html>
<p>
The nand gate is a basic CMOS building block. It consists of four CMOS transistors.
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
", revisions = "<html>
<dl>
<dt>
<b>Main Authors:</b>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
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
</html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Text(extent = {{-94,93},{-44,70}}, lineColor = {0,0,255}, textString = "NAND")}));
      end Nand;
      model NonlinearResistor "Chua's resistor"
        extends Interfaces.OnePort;
        parameter SI.Conductance Ga "conductance in inner voltage range";
        parameter SI.Conductance Gb "conductance in outer voltage range";
        parameter SI.Voltage Ve "inner voltage range limit";
      equation
        i = if v < -Ve then Gb * (v + Ve) - Ga * Ve else if v > Ve then Gb * (v - Ve) + Ga * Ve else Ga * v;
        annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-70,30},{70,-30}}, lineColor = {0,0,255}),Line(points = {{-90,0},{-70,0}}, color = {0,0,255}),Line(points = {{70,0},{90,0}}, color = {0,0,255}),Line(points = {{-50,-60},{50,60}}, color = {0,0,255}),Polygon(points = {{50,60},{38,52},{44,46},{50,60}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-70,30},{70,-30}}, lineColor = {0,0,255}),Line(points = {{-90,0},{-70,0}}, color = {0,0,255}),Line(points = {{70,0},{90,0}}, color = {0,0,255}),Line(points = {{-50,-60},{50,60}}, color = {0,0,255}),Polygon(points = {{50,60},{38,52},{44,46},{50,60}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Text(extent = {{-100,100},{100,70}}, textString = "%name", lineColor = {0,0,255})}), Documentation(info = "<html>

</html>"));
      end NonlinearResistor;
      model RealSwitch "ideal switch with resistance"
        Ideal.ControlledIdealCommutingSwitch S(level = 2.5) annotation(Placement(transformation(extent = {{11.3333,-46},{58,0.6667}}, rotation = 0)));
        Basic.Resistor R(R = 0.01) annotation(Placement(transformation(extent = {{-66,-48},{-19.3333,-1.3333}}, rotation = 0)));
        Interfaces.Pin p annotation(Placement(transformation(extent = {{-110,-34},{-90,-14}}, rotation = 0)));
        Interfaces.Pin n1 annotation(Placement(transformation(extent = {{90,-14},{110,6}}, rotation = 0)));
        Interfaces.Pin n2 annotation(Placement(transformation(extent = {{90,-60},{110,-40}}, rotation = 0)));
        Interfaces.Pin control annotation(Placement(transformation(extent = {{24,26},{44,46}}, rotation = 0)));
      equation
        connect(p,R.p) annotation(Line(points = {{-100,-24},{-66,-24.6667}}));
        connect(R.n,S.p) annotation(Line(points = {{-19.3333,-24.6667},{11.3333,-22.6667}}));
        connect(n1,S.n1) annotation(Line(points = {{100,-4},{58,-11}}));
        connect(n2,S.n2) annotation(Line(points = {{100,-50},{58,-22.6667}}));
        connect(control,S.control) annotation(Line(points = {{34,36},{34.6666,0.6667}}));
        annotation(Documentation(info = "<html>

</html>"), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-90,86},{28,70}}, lineColor = {0,0,255}, textString = "Real Switch")}));
      end RealSwitch;
      model Transistor "transistor with resistance an capacitance"
        Basic.Resistor rtb(R = 0.05) annotation(Placement(transformation(extent = {{-80,-10},{-60,10}}, rotation = 0)));
        Basic.Resistor rtc(R = 0.1) annotation(Placement(transformation(extent = {{40,0},{60,20}}, rotation = 0)));
        Basic.Capacitor ct(C = 1e-010) annotation(Placement(transformation(origin = {-40,-30}, extent = {{-10,-10},{10,10}}, rotation = 270)));
        Semiconductors.NPN Tr(Bf = 50, Br = 0.1, Is = 1e-016, Vak = 0.02, Tauf = 1.2e-010, Taur = 5e-009, Ccs = 1e-012, Cje = 4e-013, Cjc = 5e-013, Phie = 0.8, Me = 0.4, Phic = 0.8, Mc = 0.333, Gbc = 1e-015, Gbe = 1e-015, Vt = 0.02585) annotation(Placement(transformation(extent = {{-20,-20},{20,20}}, rotation = 0)));
        Basic.Ground Ground1 annotation(Placement(transformation(extent = {{-50,-80},{-30,-60}}, rotation = 0)));
        Interfaces.Pin c annotation(Placement(transformation(extent = {{90,50},{110,70}}, rotation = 0)));
        Interfaces.Pin b annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
        Interfaces.Pin e annotation(Placement(transformation(extent = {{90,-70},{110,-50}}, rotation = 0)));
      equation
        connect(rtb.n,Tr.B) annotation(Line(points = {{-60,0},{-20,0}}));
        connect(rtb.n,ct.p) annotation(Line(points = {{-60,0},{-40,0},{-40,-20}}));
        connect(ct.n,Ground1.p) annotation(Line(points = {{-40,-40},{-40,-60}}));
        connect(Tr.C,rtc.p) annotation(Line(points = {{20,10},{40,10}}));
        connect(rtc.n,c) annotation(Line(points = {{60,10},{80,10},{80,60},{100,60}}));
        connect(b,rtb.p) annotation(Line(points = {{-100,0},{-80,0}}));
        connect(Tr.E,e) annotation(Line(points = {{20,-10},{80,-10},{80,-60},{100,-60}}));
        annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Rectangle(extent = {{-80,80},{80,-80}}, lineColor = {0,0,255}),Line(points = {{80,60},{100,60}}, color = {0,0,255}),Line(points = {{80,-60},{100,-60}}, color = {0,0,255}),Line(points = {{-100,0},{-80,0}}, color = {0,0,255}),Line(points = {{-60,0},{-10,0}}, color = {0,0,255}),Line(points = {{-10,40},{-10,-40}}, color = {0,0,255}),Line(points = {{60,60},{40,60},{-10,10}}, color = {0,0,255}),Line(points = {{-10,-10},{40,-60},{60,-60}}, color = {0,0,255})}), Documentation(info = "<html>

</html>"), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-76,82},{-2,54}}, lineColor = {0,0,255}, textString = "Transistor")}));
      end Transistor;
    end Utilities;
    model AmplifierWithOpAmpDetailed "Simple Amplifier circuit which uses OpAmpDetailed"
      Modelica.Electrical.Analog.Basic.OpAmpDetailed opAmp annotation(Placement(transformation(extent = {{-26,-4},{2,24}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor(R = 10000) annotation(Placement(transformation(extent = {{-74,8},{-56,26}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 20000) annotation(Placement(transformation(extent = {{-22,46},{-4,64}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor2(R = 10000) annotation(Placement(transformation(extent = {{-9,-9},{9,9}}, rotation = 270, origin = {21,-23})));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V = 12, freqHz = 1000) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-80,-28})));
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent = {{-20,-70},{0,-50}})));
      Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 15) annotation(Placement(transformation(extent = {{48,10},{68,30}})));
      Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(V = -15) annotation(Placement(transformation(extent = {{48,-10},{68,10}})));
    equation
      connect(resistor.n,opAmp.m) annotation(Line(points = {{-56,17},{-34,17},{-34,17.07},{-26.07,17.07}}, color = {0,0,255}, smooth = Smooth.None));
      connect(resistor1.n,resistor2.p) annotation(Line(points = {{-4,55},{10,55},{10,54},{22,54},{22,-14},{21,-14}}, color = {0,0,255}, smooth = Smooth.None));
      connect(resistor.p,sineVoltage.p) annotation(Line(points = {{-74,17},{-80,17},{-80,-18}}, color = {0,0,255}, smooth = Smooth.None));
      connect(resistor1.p,opAmp.m) annotation(Line(points = {{-22,55},{-26.07,55},{-26.07,17.07}}, color = {0,0,255}, smooth = Smooth.None));
      connect(sineVoltage.n,ground.p) annotation(Line(points = {{-80,-38},{-10,-38},{-10,-50}}, color = {0,0,255}, smooth = Smooth.None));
      connect(opAmp.p,ground.p) annotation(Line(points = {{-26.07,2.93},{-26.07,-20},{-10,-20},{-10,-50}}, color = {0,0,255}, smooth = Smooth.None));
      connect(resistor2.n,ground.p) annotation(Line(points = {{21,-32},{20,-32},{20,-40},{-10,-40},{-10,-50}}, color = {0,0,255}, smooth = Smooth.None));
      connect(opAmp.p_supply,constantVoltage.p) annotation(Line(points = {{-11.93,20.29},{18.035,20.29},{18.035,20},{48,20}}, color = {0,0,255}, smooth = Smooth.None));
      connect(opAmp.m_supply,constantVoltage1.p) annotation(Line(points = {{-12,-0.36},{18,-0.36},{18,0},{48,0}}, color = {0,0,255}, smooth = Smooth.None));
      connect(constantVoltage.n,constantVoltage1.n) annotation(Line(points = {{68,20},{80,20},{80,0},{68,0}}, color = {0,0,255}, smooth = Smooth.None));
      connect(constantVoltage1.n,ground.p) annotation(Line(points = {{68,0},{80,0},{80,-46},{-10,-46},{-10,-50}}, color = {0,0,255}, smooth = Smooth.None));
      connect(opAmp.outp,resistor2.p) annotation(Line(points = {{2,10},{21,10},{21,-14}}, color = {0,0,255}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics), experiment(StopTime = 0.003, NumberOfIntervals = 2500, Tolerance = 2e-007), Documentation(revisions = "<html>
<ul>
<li><i>  </i>
       </li>
<li><i>Juni 17, 2009   </i>
       by Susann Wolf<br> realized<br>
       </li>
</ul>
</html>", info = "<html>
<p>
With the test circuit AmplifierWithOpAmpDetailed a time domain analysis of the example arrangement with a sinusoidal input voltage (12 V amplitude, frequency 1 kHz) using the operational amplifier model OpAmpDetailed is carried out. The working voltages are 15 V and -15 V.
</p>

</HTML>"), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Rectangle(extent = {{-100,-98},{80,52}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Polygon(points = {{-100,52},{-80,72},{100,72},{80,52},{-100,52}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Polygon(points = {{100,72},{100,-78},{80,-98},{80,52},{100,72}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Text(extent = {{-96,5},{77,-47}}, lineColor = {0,0,255}, textString = "Example"),Text(extent = {{-120,134},{120,75}}, lineColor = {255,0,0}, textString = "%name")}));
    end AmplifierWithOpAmpDetailed;
    model CauerLowPassAnalog "Cauer low pass filter with analog components"
      parameter Modelica.SIunits.Inductance l1 = 1.304 "filter coefficient I1";
      parameter Modelica.SIunits.Inductance l2 = 0.8586 "filter coefficient I2";
      parameter Modelica.SIunits.Capacitance c1 = 1.072 "filter coefficient c1";
      parameter Modelica.SIunits.Capacitance c2 = 1 / (1.704992 ^ 2 * l1) "filter coefficient c2";
      parameter Modelica.SIunits.Capacitance c3 = 1.682 "filter coefficient c3";
      parameter Modelica.SIunits.Capacitance c4 = 1 / (1.179945 ^ 2 * l2) "filter coefficient c4";
      parameter Modelica.SIunits.Capacitance c5 = 0.7262 "filter coefficient c5";
      Modelica.Electrical.Analog.Basic.Ground G annotation(Placement(transformation(extent = {{-10,-90},{10,-70}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C1(C = c1) annotation(Placement(transformation(origin = {-60,-20}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Capacitor C2(C = c2) annotation(Placement(transformation(extent = {{-40,20},{-20,40}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C3(C = c3) annotation(Placement(transformation(origin = {0,-20}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Capacitor C4(C = c4) annotation(Placement(transformation(extent = {{20,20},{40,40}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C5(C = c5) annotation(Placement(transformation(origin = {60,-20}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Inductor L1(L = l1) annotation(Placement(transformation(extent = {{-40,60},{-20,80}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor L2(L = l2) annotation(Placement(transformation(extent = {{20,60},{40,80}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R1 annotation(Placement(transformation(extent = {{-100,20},{-80,40}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R2 annotation(Placement(transformation(origin = {100,-20}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Sources.StepVoltage V(startTime = 1, offset = 0) annotation(Placement(transformation(origin = {-100,-10}, extent = {{-10,-10},{10,10}}, rotation = 270)));
    equation
      connect(R1.n,C1.p) annotation(Line(points = {{-80,30},{-60,30},{-60,-10}}, color = {0,0,255}));
      connect(C1.n,G.p) annotation(Line(points = {{-60,-30},{-60,-50},{0,-50},{0,-70}}, color = {0,0,255}));
      connect(R1.n,C2.p) annotation(Line(points = {{-80,30},{-40,30}}, color = {0,0,255}));
      connect(L1.p,C2.p) annotation(Line(points = {{-40,70},{-40,30}}, color = {0,0,255}));
      connect(L1.p,C1.p) annotation(Line(points = {{-40,70},{-40,30},{-60,30},{-60,-10}}, color = {0,0,255}));
      connect(L1.n,C2.n) annotation(Line(points = {{-20,70},{-20,30}}, color = {0,0,255}));
      connect(C2.n,C3.p) annotation(Line(points = {{-20,30},{1.83697e-015,30},{1.83697e-015,-10}}, color = {0,0,255}));
      connect(C2.n,C4.p) annotation(Line(points = {{-20,30},{20,30}}, color = {0,0,255}));
      connect(L1.n,C3.p) annotation(Line(points = {{-20,70},{-20,30},{1.83697e-015,30},{1.83697e-015,-10}}, color = {0,0,255}));
      connect(L1.n,C4.p) annotation(Line(points = {{-20,70},{-20,30},{20,30}}, color = {0,0,255}));
      connect(L2.p,C4.p) annotation(Line(points = {{20,70},{20,30}}, color = {0,0,255}));
      connect(C2.n,L2.p) annotation(Line(points = {{-20,30},{20,30},{20,70}}, color = {0,0,255}));
      connect(C3.p,L2.p) annotation(Line(points = {{1.83697e-015,-10},{0,-10},{0,30},{20,30},{20,70}}, color = {0,0,255}));
      connect(L2.n,C4.n) annotation(Line(points = {{40,70},{40,30}}, color = {0,0,255}));
      connect(L2.n,C5.p) annotation(Line(points = {{40,70},{40,30},{60,30},{60,-10}}, color = {0,0,255}));
      connect(L2.n,R2.p) annotation(Line(points = {{40,70},{40,30},{100,30},{100,-10}}, color = {0,0,255}));
      connect(R2.n,G.p) annotation(Line(points = {{100,-30},{100,-50},{0,-50},{0,-70}}, color = {0,0,255}));
      connect(C4.n,C5.p) annotation(Line(points = {{40,30},{60,30},{60,-10}}, color = {0,0,255}));
      connect(C4.n,R2.p) annotation(Line(points = {{40,30},{100,30},{100,-10}}, color = {0,0,255}));
      connect(C3.n,G.p) annotation(Line(points = {{-1.83697e-015,-30},{0,-30},{0,-70}}, color = {0,0,255}));
      connect(C5.n,G.p) annotation(Line(points = {{60,-30},{60,-50},{0,-50},{0,-70}}, color = {0,0,255}));
      connect(C1.n,C3.n) annotation(Line(points = {{-60,-30},{-60,-50},{0,-50},{0,-30},{-1.83697e-015,-30}}, color = {0,0,255}));
      connect(C1.n,C5.n) annotation(Line(points = {{-60,-30},{-60,-50},{60,-50},{60,-30}}, color = {0,0,255}));
      connect(R2.n,C5.n) annotation(Line(points = {{100,-30},{100,-50},{60,-50},{60,-30}}, color = {0,0,255}));
      connect(R2.n,C3.n) annotation(Line(points = {{100,-30},{100,-50},{0,-50},{0,-30},{-1.83697e-015,-30}}, color = {0,0,255}));
      connect(R2.n,C1.n) annotation(Line(points = {{100,-30},{100,-50},{-60,-50},{-60,-30}}, color = {0,0,255}));
      connect(C5.p,R2.p) annotation(Line(points = {{60,-10},{60,30},{100,30},{100,-10}}, color = {0,0,255}));
      connect(R1.p,V.p) annotation(Line(points = {{-100,30},{-100,0}}, color = {0,0,255}));
      connect(V.n,G.p) annotation(Line(points = {{-100,-20},{-100,-70},{0,-70}}, color = {0,0,255}));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-200,-100},{200,100}}), graphics = {Rectangle(extent = {{-62,32},{-58,28}}, lineColor = {0,0,255}, fillColor = {85,85,255}, fillPattern = FillPattern.Solid),Rectangle(extent = {{-2,28},{2,32}}, lineColor = {0,0,255}, fillColor = {85,85,255}, fillPattern = FillPattern.Solid),Rectangle(extent = {{58,32},{62,28}}, lineColor = {0,0,255}, fillColor = {85,85,255}, fillPattern = FillPattern.Solid),Rectangle(extent = {{58,-48},{62,-52}}, lineColor = {0,0,255}, fillColor = {85,85,255}, fillPattern = FillPattern.Solid),Rectangle(extent = {{-2,-48},{2,-52}}, lineColor = {0,0,255}, fillColor = {85,85,255}, fillPattern = FillPattern.Solid),Rectangle(extent = {{-62,-48},{-58,-52}}, lineColor = {0,0,255}, fillColor = {85,85,255}, fillPattern = FillPattern.Solid),Text(extent = {{-110,116},{100,64}}, textString = "CauerLowPassAnalog", lineColor = {0,0,255})}), experiment(StopTime = 60), Documentation(revisions = "<html>
<ul>
<li><i>January 13, 2006</i>
       by Christoph Clauss<br>
       included into Modelica Standard Library</li>
<li><i>September 15, 2005</i>
       by Peter Trappe designed and by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</html>", info = "<html>

<p>
The example Cauer Filter is a low-pass-filter of the fifth order. It is realized
using an analog network. The voltage source V is the input voltage (step),
and the R2.p.v is the filter output voltage. The pulse response is calculated.
<p>
The simulation end time should be 60. Please plot both V.p.v (input voltage) and R2.p.v (output voltage).
<p>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-200,-100},{200,100}}), graphics = {Rectangle(extent = {{-80,-90},{100,60}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Polygon(points = {{-80,60},{-60,80},{120,80},{100,60},{-80,60}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Polygon(points = {{120,80},{120,-70},{100,-90},{100,60},{120,80}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Text(extent = {{-76,13},{97,-39}}, lineColor = {0,0,255}, textString = "Example"),Text(extent = {{-100,142},{140,83}}, lineColor = {255,0,0}, textString = "%name")}));
    end CauerLowPassAnalog;
    model CauerLowPassOPV "Cauer low pass filter with operational amplifiers"
      parameter Modelica.SIunits.Capacitance l1 = 1.304 "filter coefficient i1";
      parameter Modelica.SIunits.Capacitance l2 = 0.8586 "filter coefficient i2";
      parameter Modelica.SIunits.Capacitance c1 = 1.072 "filter coefficient c1";
      parameter Modelica.SIunits.Capacitance c2 = 1 / (1.704992 ^ 2 * l1) "filter coefficient c2";
      parameter Modelica.SIunits.Capacitance c3 = 1.682 "filter coefficient c3";
      parameter Modelica.SIunits.Capacitance c4 = 1 / (1.179945 ^ 2 * l2) "filter coefficient c4";
      parameter Modelica.SIunits.Capacitance c5 = 0.7262 "filter coefficient c5";
      Modelica.Electrical.Analog.Basic.Capacitor C1(C = c1 + c2) annotation(Placement(transformation(extent = {{-192,10},{-172,30}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C2(C = c2) annotation(Placement(transformation(extent = {{-240,-90},{-220,-70}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C3(C = l1) annotation(Placement(transformation(extent = {{-90,10},{-70,30}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C4(C = c4) annotation(Placement(transformation(extent = {{-30,30},{-10,50}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C5(C = c2) annotation(Placement(transformation(extent = {{-30,-120},{-10,-100}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R1 annotation(Placement(transformation(extent = {{-240,-50},{-220,-30}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R2 annotation(Placement(transformation(extent = {{-240,-10},{-220,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R3 annotation(Placement(transformation(extent = {{-193,50},{-173,70}}, rotation = 0)));
      Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op1 annotation(Placement(transformation(extent = {{-200,-70},{-160,-30}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground G annotation(Placement(transformation(extent = {{-188,-96},{-174,-80}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R4(R = -1) annotation(Placement(transformation(extent = {{-140,-60},{-120,-40}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R5(R = -1) annotation(Placement(transformation(extent = {{-140,-100},{-120,-80}}, rotation = 0)));
      Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op2 annotation(Placement(transformation(extent = {{-100,-70},{-60,-30}}, rotation = 0)));
      Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op3 annotation(Placement(transformation(extent = {{6,-70},{46,-30}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground G1 annotation(Placement(transformation(extent = {{-87,-96},{-73,-80}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R6 annotation(Placement(transformation(extent = {{-31,-10},{-11,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R7 annotation(Placement(transformation(extent = {{-31,-60},{-11,-40}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C6(C = c2 + c3 + c4) annotation(Placement(transformation(extent = {{9,10},{29,30}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R8(R = -1) annotation(Placement(transformation(extent = {{60,-10},{80,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R9(R = -1) annotation(Placement(transformation(extent = {{60,-60},{80,-40}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R10 annotation(Placement(transformation(extent = {{160,-60},{180,-40}}, rotation = 0)));
      Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op4 annotation(Placement(transformation(extent = {{100,-70},{140,-30}}, rotation = 0)));
      Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op5 annotation(Placement(transformation(extent = {{200,-70},{240,-30}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C7(C = l2) annotation(Placement(transformation(extent = {{110,10},{130,30}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C8(C = c4) annotation(Placement(transformation(extent = {{160,-150},{180,-130}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C9(C = c4 + c5) annotation(Placement(transformation(extent = {{208,-10},{228,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R11 annotation(Placement(transformation(extent = {{209,30},{229,50}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation(Placement(transformation(extent = {{-214,-42},{-210,-38}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation(Placement(transformation(extent = {{-214,-2},{-210,2}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n3 annotation(Placement(transformation(extent = {{-214,18},{-210,22}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n4 annotation(Placement(transformation(origin = {-160,20}, extent = {{2,2},{-2,-2}}, rotation = 180)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n5 annotation(Placement(transformation(extent = {{-114,-52},{-110,-48}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.PositivePin p1 annotation(Placement(transformation(extent = {{-154,-142},{-148,-138}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n6 annotation(Placement(transformation(extent = {{-62,18},{-58,22}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n7 annotation(Placement(transformation(extent = {{-6,-52},{-2,-48}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n8 annotation(Placement(transformation(extent = {{-6,-2},{-2,2}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.PositivePin p2 annotation(Placement(transformation(extent = {{-6,18},{-2,22}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.PositivePin out1 annotation(Placement(transformation(extent = {{44,-142},{48,-138}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.PositivePin p3 annotation(Placement(transformation(extent = {{58,58},{62,62}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n9 annotation(Placement(transformation(extent = {{86,-2},{90,2}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n10 annotation(Placement(transformation(extent = {{86,-52},{90,-48}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n11 annotation(Placement(transformation(extent = {{138,18},{142,22}}, rotation = 0)));
    public
      Modelica.Electrical.Analog.Basic.Ground G2 annotation(Placement(transformation(extent = {{12,-96},{26,-80}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n12 annotation(Placement(transformation(extent = {{238,38},{242,42}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n13 annotation(Placement(transformation(extent = {{238,-2},{242,2}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.PositivePin p4 annotation(Placement(transformation(extent = {{188,-2},{194,2}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n14 annotation(Placement(transformation(extent = {{188,-52},{194,-48}}, rotation = 0)));
    public
      Modelica.Electrical.Analog.Basic.Ground G3 annotation(Placement(transformation(extent = {{113,-96},{127,-80}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground G4 annotation(Placement(transformation(extent = {{213,-96},{227,-80}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.StepVoltage V(startTime = 1) annotation(Placement(transformation(origin = {-240,-170}, extent = {{-10,-10},{10,10}}, rotation = 90)));
      Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(transformation(extent = {{-246,-202},{-234,-190}}, rotation = 0)));
    equation
      connect(Op1.in_p,G.p) annotation(Line(points = {{-200,-60},{-200,-70},{-180,-70},{-180,-80},{-181,-80}}, color = {0,0,255}));
      connect(G1.p,Op2.in_p) annotation(Line(points = {{-80,-80},{-80,-70},{-100,-70},{-100,-60}}, color = {0,0,255}));
      connect(R1.n,n1) annotation(Line(points = {{-220,-40},{-212,-40}}, color = {0,0,255}));
      connect(n1,Op1.in_n) annotation(Line(points = {{-212,-40},{-200,-40}}, color = {0,0,255}));
      connect(C2.n,n1) annotation(Line(points = {{-220,-80},{-212,-80},{-212,-40}}, color = {0,0,255}));
      connect(R2.n,n2) annotation(Line(points = {{-220,0},{-212,0}}, color = {0,0,255}));
      connect(n1,n2) annotation(Line(points = {{-212,-40},{-212,0}}, color = {0,0,255}));
      connect(n2,n3) annotation(Line(points = {{-212,0},{-212,20}}, color = {0,0,255}));
      connect(n3,C1.p) annotation(Line(points = {{-212,20},{-192,20}}, color = {0,0,255}));
      connect(n3,R3.p) annotation(Line(points = {{-212,20},{-212,60},{-193,60}}, color = {0,0,255}));
      connect(C1.n,n4) annotation(Line(points = {{-172,20},{-160,20}}, color = {0,0,255}));
      connect(R3.n,n4) annotation(Line(points = {{-173,60},{-160,60},{-160,20}}, color = {0,0,255}));
      connect(n4,Op1.out) annotation(Line(points = {{-160,20},{-160,-50}}, color = {0,0,255}));
      connect(R4.p,Op1.out) annotation(Line(points = {{-140,-50},{-160,-50}}, color = {0,0,255}));
      connect(C5.p,Op1.out) annotation(Line(points = {{-30,-110},{-160,-110},{-160,-50}}, color = {0,0,255}));
      connect(R4.n,n5) annotation(Line(points = {{-120,-50},{-112,-50}}, color = {0,0,255}));
      connect(n5,Op2.in_n) annotation(Line(points = {{-112,-50},{-112,-40},{-100,-40}}, color = {0,0,255}));
      connect(C3.p,n5) annotation(Line(points = {{-90,20},{-112,20},{-112,-50}}, color = {0,0,255}));
      connect(R5.n,n5) annotation(Line(points = {{-120,-90},{-112,-90},{-112,-50}}, color = {0,0,255}));
      connect(R5.p,p1) annotation(Line(points = {{-140,-90},{-151,-90},{-151,-140}}, color = {0,0,255}));
      connect(C2.p,p1) annotation(Line(points = {{-240,-80},{-240,-140},{-151,-140}}, color = {0,0,255}));
      connect(C3.n,n6) annotation(Line(points = {{-70,20},{-60,20}}, color = {0,0,255}));
      connect(n6,Op2.out) annotation(Line(points = {{-60,20},{-60,-50}}, color = {0,0,255}));
      connect(R2.p,n6) annotation(Line(points = {{-240,0},{-240,80},{-60,80},{-60,20}}, color = {0,0,255}));
      connect(Op2.out,R7.p) annotation(Line(points = {{-60,-50},{-31,-50}}, color = {0,0,255}));
      connect(R7.n,n7) annotation(Line(points = {{-11,-50},{-4,-50}}, color = {0,0,255}));
      connect(n7,Op3.in_n) annotation(Line(points = {{-4,-50},{-4,-40},{6,-40}}, color = {0,0,255}));
      connect(C5.n,n7) annotation(Line(points = {{-10,-110},{-4,-110},{-4,-50}}, color = {0,0,255}));
      connect(R6.n,n8) annotation(Line(points = {{-11,0},{-4,0}}, color = {0,0,255}));
      connect(n7,n8) annotation(Line(points = {{-4,-50},{-4,0},{-4,0}}, color = {0,0,255}));
      connect(C6.p,p2) annotation(Line(points = {{9,20},{-4,20}}, color = {0,0,255}));
      connect(n8,p2) annotation(Line(points = {{-4,0},{-4,20}}, color = {0,0,255}));
      connect(C4.n,p2) annotation(Line(points = {{-10,40},{-4,40},{-4,20}}, color = {0,0,255}));
      connect(C6.n,Op3.out) annotation(Line(points = {{29,20},{46,20},{46,-50}}, color = {0,0,255}));
      connect(R9.p,Op3.out) annotation(Line(points = {{60,-50},{46,-50}}, color = {0,0,255}));
      connect(Op3.out,out1) annotation(Line(points = {{46,-50},{46,-140}}, color = {0,0,255}));
      connect(p1,out1) annotation(Line(points = {{-151,-140},{46,-140}}, color = {0,0,255}));
      connect(out1,C8.p) annotation(Line(points = {{46,-140},{160,-140}}, color = {0,0,255}));
      connect(C4.p,p3) annotation(Line(points = {{-30,40},{-40,40},{-40,60},{60,60}}, color = {0,0,255}));
      connect(p3,R8.p) annotation(Line(points = {{60,60},{60,0}}, color = {0,0,255}));
      connect(R8.n,n9) annotation(Line(points = {{80,0},{88,0}}, color = {0,0,255}));
      connect(n9,n10) annotation(Line(points = {{88,0},{88,-50}}, color = {0,0,255}));
      connect(R9.n,n10) annotation(Line(points = {{80,-50},{88,-50}}, color = {0,0,255}));
      connect(n10,Op4.in_n) annotation(Line(points = {{88,-50},{88,-40},{100,-40}}, color = {0,0,255}));
      connect(n9,C7.p) annotation(Line(points = {{88,0},{88,20},{110,20}}, color = {0,0,255}));
      connect(C7.n,n11) annotation(Line(points = {{130,20},{140,20}}, color = {0,0,255}));
      connect(R6.p,n11) annotation(Line(points = {{-31,0},{-48,0},{-48,80},{140,80},{140,20}}, color = {0,0,255}));
      connect(n11,Op4.out) annotation(Line(points = {{140,20},{140,-50}}, color = {0,0,255}));
      connect(Op4.out,R10.p) annotation(Line(points = {{140,-50},{160,-50}}, color = {0,0,255}));
      connect(G2.p,Op3.in_p) annotation(Line(points = {{19,-80},{6,-80},{6,-60}}, color = {0,0,255}));
      connect(R11.n,n12) annotation(Line(points = {{229,40},{240,40}}, color = {0,0,255}));
      connect(p3,n12) annotation(Line(points = {{60,60},{240,60},{240,40}}, color = {0,0,255}));
      connect(C9.n,n13) annotation(Line(points = {{228,0},{240,0}}, color = {0,0,255}));
      connect(n12,n13) annotation(Line(points = {{240,40},{240,0}}, color = {0,0,255}));
      connect(n13,Op5.out) annotation(Line(points = {{240,0},{240,-50}}, color = {0,0,255}));
      connect(C9.p,p4) annotation(Line(points = {{208,0},{191,0}}, color = {0,0,255}));
      connect(R11.p,p4) annotation(Line(points = {{209,40},{191,40},{191,0}}, color = {0,0,255}));
      connect(R10.n,n14) annotation(Line(points = {{180,-50},{191,-50}}, color = {0,0,255}));
      connect(p4,n14) annotation(Line(points = {{191,0},{191,-50}}, color = {0,0,255}));
      connect(Op5.in_n,n14) annotation(Line(points = {{200,-40},{191,-40},{191,-50}}, color = {0,0,255}));
      connect(C8.n,n14) annotation(Line(points = {{180,-140},{191,-140},{191,-50}}, color = {0,0,255}));
      connect(Op4.in_p,G3.p) annotation(Line(points = {{100,-60},{100,-80},{120,-80}}, color = {0,0,255}));
      connect(Op5.in_p,G4.p) annotation(Line(points = {{200,-60},{200,-80},{220,-80}}, color = {0,0,255}));
      connect(V.p,Ground1.p) annotation(Line(points = {{-240,-180},{-240,-190}}, color = {0,0,255}));
      connect(V.n,R1.p) annotation(Line(points = {{-240,-160},{-250,-160},{-250,-40},{-240,-40}}, color = {0,0,255}));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-250,-200},{250,200}}), graphics = {Text(extent = {{-130,172},{80,120}}, textString = "CauerLowPassOPV", lineColor = {0,0,255})}), experiment(StopTime = 60), Documentation(revisions = "<html>
<ul>
<li><i>January 13, 2006</i>
       by Christoph Clauss<br>
       included into Modelica Standard Library</li>
<li><i>September 15, 2005</i>
       by by Peter Trappe designed and by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</html>", info = "<html>
The example Cauer Filter is a low-pass-filter of the fifth order. It is realized
using an analog network with operational amplifiers. The voltage source V is the input voltage (step),
and the OP5.out.v is the filter output voltage. The pulse response is calculated.
<p>
This model is identical to the CauerLowPassAnalog example, but inverting. To get the same response
as that of the CauerLowPassAnalog example, a negative voltage step is used as input.
<p>
The simulation end time should be 60. Please plot both V.v (which is the inverted input voltage) and OP5.p.v (output voltage). Compare this result with the CauerLowPassAnalog result.
<p>
During translation some warnings are issued concerning resistor values (Value=-1 not in range[0,1.e+100]).
Do not worry about it. The negative values are o.k.
<p>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-250,-200},{250,200}}), graphics = {Rectangle(extent = {{-100,-80},{80,70}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Polygon(points = {{-100,70},{-80,90},{100,90},{80,70},{-100,70}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Polygon(points = {{100,90},{100,-60},{80,-80},{80,70},{100,90}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Text(extent = {{-96,23},{77,-29}}, lineColor = {0,0,255}, textString = "Example"),Text(extent = {{-120,152},{120,93}}, lineColor = {255,0,0}, textString = "%name")}));
    end CauerLowPassOPV;
    model CauerLowPassSC "Cauer low-pass filter with operational amplifiers and switched capacitors"
      model Rn "negative resistance"
        parameter Modelica.SIunits.Time clock = 1 "clock";
        parameter Modelica.SIunits.Resistance R(min = Modelica.Constants.eps) = 1 "Resistance";
        Modelica.Blocks.Sources.BooleanPulse BooleanPulse1(period = clock) annotation(Placement(transformation(extent = {{-10,50},{10,70}}, rotation = 0)));
        Modelica.Electrical.Analog.Basic.Capacitor Capacitor1(C = clock / R) annotation(Placement(transformation(extent = {{-20,-20},{20,20}}, rotation = 0)));
        Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch IdealCommutingSwitch1 annotation(Placement(transformation(origin = {-50,0}, extent = {{-10,-10},{10,10}}, rotation = 180)));
        Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch IdealCommutingSwitch2 annotation(Placement(transformation(extent = {{40,-10},{60,10}}, rotation = 0)));
        Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(transformation(extent = {{-66,-32},{-54,-20}}, rotation = 0)));
        Modelica.Electrical.Analog.Basic.Ground Ground2 annotation(Placement(transformation(extent = {{54,-32},{66,-20}}, rotation = 0)));
        Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation(Placement(transformation(extent = {{-112,-10},{-92,10}}, rotation = 0)));
        Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation(Placement(transformation(extent = {{90,-8},{110,12}}, rotation = 0)));
      equation
        connect(IdealCommutingSwitch1.p,Capacitor1.p) annotation(Line(points = {{-40,-1.22465e-015},{-42,-1.22465e-015},{-44,0},{-20,0}}, color = {0,0,255}));
        connect(Capacitor1.n,IdealCommutingSwitch2.p) annotation(Line(points = {{20,0},{40,0}}, color = {0,0,255}));
        connect(IdealCommutingSwitch2.control,BooleanPulse1.y) annotation(Line(points = {{50,8},{50,30},{20,30},{20,60},{11,60}}, color = {255,0,255}));
        connect(IdealCommutingSwitch1.control,BooleanPulse1.y) annotation(Line(points = {{-50,-8},{-50,30},{20,30},{20,60},{11,60}}, color = {255,0,255}));
        connect(Ground2.p,IdealCommutingSwitch2.n2) annotation(Line(points = {{60,-20},{60,0}}, color = {0,0,255}));
        connect(IdealCommutingSwitch2.n1,n2) annotation(Line(points = {{60,5},{80,5},{80,2},{100,2}}, color = {0,0,255}));
        connect(n1,IdealCommutingSwitch1.n2) annotation(Line(points = {{-102,0},{-81,0},{-81,1.22465e-015},{-60,1.22465e-015}}, color = {0,0,255}));
        connect(Ground1.p,IdealCommutingSwitch1.n1) annotation(Line(points = {{-60,-20},{-60,-5}}, color = {0,0,255}));
        annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Bitmap(extent = {{-62,6},{-62,14}}, fileName = ""),Rectangle(extent = {{-80,32},{80,-30}}, pattern = LinePattern.None, lineColor = {0,0,255}),Text(extent = {{-30,-40},{30,-72}}, lineColor = {0,0,0}, textString = "R=%R"),Line(points = {{-74,0},{-80,0},{-60,0}}, color = {85,255,85}),Line(points = {{-80,-20},{-60,-20},{-60,-16},{-40,-8},{-4,-8}}, color = {85,255,85}),Line(points = {{80,0},{60,0}}, color = {85,255,85}),Line(points = {{-60,2},{-60,-4}}, color = {170,255,170}),Line(points = {{-4,2},{-4,-18}}, color = {85,255,85}),Line(points = {{4,2},{4,-18}}, color = {85,255,85}),Text(extent = {{-60,80},{60,40}}, lineColor = {0,0,255}, textString = "%name"),Line(points = {{-92,0},{-80,0}}, color = {85,85,255}),Line(points = {{90,0},{80,0},{80,0}}, color = {85,85,255}),Line(points = {{4,-8},{40,-8},{60,-4}}, color = {85,255,85}),Line(points = {{60,0},{60,-4}}, color = {85,255,85}),Line(points = {{60,-16},{60,-20},{80,-20}}, color = {85,255,85})}));
      end Rn;
      model Rp "positive resistance"
        parameter Modelica.SIunits.Time clock = 1 "clock";
        parameter Modelica.SIunits.Resistance R(min = Modelica.Constants.eps) = 1 "Resistance";
        Modelica.Blocks.Sources.BooleanPulse BooleanPulse1(period = clock) annotation(Placement(transformation(extent = {{-10,50},{10,70}}, rotation = 0)));
        Modelica.Electrical.Analog.Basic.Capacitor Capacitor1(C = clock / R) annotation(Placement(transformation(extent = {{-20,-20},{20,20}}, rotation = 0)));
        Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch IdealCommutingSwitch1 annotation(Placement(transformation(origin = {-50,0}, extent = {{-10,-10},{10,10}}, rotation = 180)));
        Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch IdealCommutingSwitch2 annotation(Placement(transformation(extent = {{40,-10},{60,10}}, rotation = 0)));
        Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(transformation(origin = {-59,46}, extent = {{-5,-6},{5,6}}, rotation = 180)));
        Modelica.Electrical.Analog.Basic.Ground Ground2 annotation(Placement(transformation(extent = {{56,-44},{66,-32}}, rotation = 0)));
        Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation(Placement(transformation(extent = {{-112,-10},{-92,10}}, rotation = 0)));
        Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation(Placement(transformation(extent = {{90,-8},{110,12}}, rotation = 0)));
      equation
        connect(IdealCommutingSwitch1.p,Capacitor1.p) annotation(Line(points = {{-40,-1.22465e-015},{-42,-1.22465e-015},{-44,0},{-20,0}}, color = {0,0,255}));
        connect(Capacitor1.n,IdealCommutingSwitch2.p) annotation(Line(points = {{20,0},{40,0}}, color = {0,0,255}));
        connect(IdealCommutingSwitch2.control,BooleanPulse1.y) annotation(Line(points = {{50,8},{50,30},{20,30},{20,60},{11,60}}, color = {255,0,255}));
        connect(IdealCommutingSwitch1.control,BooleanPulse1.y) annotation(Line(points = {{-50,-8},{-50,30},{20,30},{20,60},{11,60}}, color = {255,0,255}));
        connect(Ground1.p,IdealCommutingSwitch1.n2) annotation(Line(points = {{-59,40},{-60,40},{-60,1.22465e-015}}, color = {0,0,255}));
        connect(Ground2.p,IdealCommutingSwitch2.n2) annotation(Line(points = {{61,-32},{60,-32},{60,0}}, color = {0,0,255}));
        connect(IdealCommutingSwitch1.n1,n1) annotation(Line(points = {{-60,-5},{-99,-5},{-99,0},{-102,0}}, color = {0,0,255}));
        connect(IdealCommutingSwitch2.n1,n2) annotation(Line(points = {{60,5},{80,5},{80,2},{100,2}}, color = {0,0,255}));
        annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Bitmap(extent = {{-62,4},{-62,12}}, fileName = ""),Rectangle(extent = {{-80,30},{80,-32}}, pattern = LinePattern.None, lineColor = {0,0,255}),Line(points = {{-92,0},{-80,0}}, color = {85,85,255}),Line(points = {{80,0},{92,0}}, color = {85,85,255}),Text(extent = {{-40,-40},{32,-72}}, lineColor = {0,0,0}, textString = "R=%R"),Line(points = {{-74,0},{-80,0},{-60,0}}, color = {85,255,85}),Line(points = {{-80,-20},{-60,-20},{-60,-16},{-40,-10},{-4,-10}}, color = {85,255,85}),Line(points = {{4,-10},{40,-10},{60,-16},{60,-20},{80,-20}}, color = {85,255,85}),Line(points = {{80,0},{60,0}}, color = {85,255,85}),Line(points = {{60,0},{60,-4}}, color = {85,255,85}),Line(points = {{-60,0},{-60,-6}}, color = {170,255,170}),Line(points = {{-4,0},{-4,-20}}, color = {85,255,85}),Line(points = {{4,0},{4,-20}}, color = {85,255,85}),Text(extent = {{-60,80},{60,40}}, lineColor = {0,0,255}, textString = "%name")}));
      end Rp;
      parameter Modelica.SIunits.Capacitance l1 = 1.304 "filter coefficient i1";
      parameter Modelica.SIunits.Capacitance l2 = 0.8586 "filter coefficient i2";
      parameter Modelica.SIunits.Capacitance c1 = 1.072 "filter coefficient c1";
      parameter Modelica.SIunits.Capacitance c2 = 1 / (1.704992 ^ 2 * l1) "filter coefficient c2";
      parameter Modelica.SIunits.Capacitance c3 = 1.682 "filter coefficient c3";
      parameter Modelica.SIunits.Capacitance c4 = 1 / (1.179945 ^ 2 * l2) "filter coefficient c4";
      parameter Modelica.SIunits.Capacitance c5 = 0.7262 "filter coefficient c5";
      Modelica.Electrical.Analog.Basic.Capacitor C1(C = c1 + c2) annotation(Placement(transformation(extent = {{-193,30},{-173,50}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C2(C = c2) annotation(Placement(transformation(extent = {{-241,-70},{-221,-50}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C3(C = l1) annotation(Placement(transformation(extent = {{-91,30},{-71,50}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C4(C = c4) annotation(Placement(transformation(extent = {{-31,50},{-11,70}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C5(C = c2) annotation(Placement(transformation(extent = {{-31,-100},{-11,-80}}, rotation = 0)));
      Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op1 annotation(Placement(transformation(extent = {{-201,-50},{-161,-10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground G annotation(Placement(transformation(extent = {{-189,-76},{-175,-60}}, rotation = 0)));
      Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op2 annotation(Placement(transformation(extent = {{-101,-50},{-61,-10}}, rotation = 0)));
      Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op3 annotation(Placement(transformation(extent = {{5,-50},{45,-10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground G1 annotation(Placement(transformation(extent = {{-88,-76},{-74,-60}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C6(C = c2 + c3 + c4) annotation(Placement(transformation(extent = {{8,30},{28,50}}, rotation = 0)));
      Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op4 annotation(Placement(transformation(extent = {{99,-50},{139,-10}}, rotation = 0)));
      Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op5 annotation(Placement(transformation(extent = {{199,-50},{239,-10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C7(C = l2) annotation(Placement(transformation(extent = {{109,30},{129,50}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C8(C = c4) annotation(Placement(transformation(extent = {{159,-130},{179,-110}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C9(C = c4 + c5) annotation(Placement(transformation(extent = {{207,10},{227,30}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation(Placement(transformation(extent = {{-215,-22},{-211,-18}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation(Placement(transformation(extent = {{-215,18},{-211,22}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n3 annotation(Placement(transformation(extent = {{-215,38},{-211,42}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n4 annotation(Placement(transformation(origin = {-161,40}, extent = {{2,2},{-2,-2}}, rotation = 180)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n5 annotation(Placement(transformation(extent = {{-115,-32},{-111,-28}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.PositivePin p1 annotation(Placement(transformation(extent = {{-155,-122},{-149,-118}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n6 annotation(Placement(transformation(extent = {{-63,38},{-59,42}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n7 annotation(Placement(transformation(extent = {{-7,-32},{-3,-28}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n8 annotation(Placement(transformation(extent = {{-7,18},{-3,22}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.PositivePin p2 annotation(Placement(transformation(extent = {{-7,38},{-3,42}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.PositivePin out1 annotation(Placement(transformation(extent = {{43,-122},{47,-118}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.PositivePin p3 annotation(Placement(transformation(extent = {{57,78},{61,82}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n9 annotation(Placement(transformation(extent = {{85,18},{89,22}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n10 annotation(Placement(transformation(extent = {{85,-32},{89,-28}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n11 annotation(Placement(transformation(extent = {{137,38},{141,42}}, rotation = 0)));
    public
      Modelica.Electrical.Analog.Basic.Ground G2 annotation(Placement(transformation(extent = {{11,-76},{25,-60}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n12 annotation(Placement(transformation(extent = {{237,58},{241,62}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n13 annotation(Placement(transformation(extent = {{237,18},{241,22}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.PositivePin p4 annotation(Placement(transformation(extent = {{187,18},{193,22}}, rotation = 0)));
    protected
      Modelica.Electrical.Analog.Interfaces.NegativePin n14 annotation(Placement(transformation(extent = {{187,-32},{193,-28}}, rotation = 0)));
    public
      Modelica.Electrical.Analog.Basic.Ground G3 annotation(Placement(transformation(extent = {{112,-76},{126,-60}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground G4 annotation(Placement(transformation(extent = {{212,-76},{226,-60}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.StepVoltage V(startTime = 1) annotation(Placement(transformation(origin = {-241,-150}, extent = {{-10,-10},{10,10}}, rotation = 90)));
      Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(transformation(extent = {{-247,-182},{-235,-170}}, rotation = 0)));
      Rn R4(clock = 0.1) annotation(Placement(transformation(extent = {{-140,-40},{-120,-20}}, rotation = 0)));
      Rn R5(clock = 0.1) annotation(Placement(transformation(extent = {{-140,-80},{-120,-60}}, rotation = 0)));
      Rn R8(clock = 0.1) annotation(Placement(transformation(extent = {{60,10},{80,30}}, rotation = 0)));
      Rn R9(clock = 0.1) annotation(Placement(transformation(extent = {{60,-40},{80,-20}}, rotation = 0)));
      Rp R1(clock = 0.1) annotation(Placement(transformation(extent = {{-240,-30},{-220,-10}}, rotation = 0)));
      Rp R2(clock = 0.1) annotation(Placement(transformation(extent = {{-240,10},{-220,30}}, rotation = 0)));
      Rp R3(clock = 0.1) annotation(Placement(transformation(extent = {{-200,70},{-180,90}}, rotation = 0)));
      Rp Rp1(clock = 0.1) annotation(Placement(transformation(extent = {{-32,10},{-12,30}}, rotation = 0)));
      Rp R7(clock = 0.1) annotation(Placement(transformation(extent = {{-32,-40},{-12,-20}}, rotation = 0)));
      Rp R10(clock = 0.1) annotation(Placement(transformation(extent = {{160,-40},{180,-20}}, rotation = 0)));
      Rp R11(clock = 0.1) annotation(Placement(transformation(extent = {{208,50},{228,70}}, rotation = 0)));
    equation
      connect(Op1.in_p,G.p) annotation(Line(points = {{-201,-40},{-201,-50},{-181,-50},{-181,-60},{-182,-60}}, color = {0,0,255}));
      connect(G1.p,Op2.in_p) annotation(Line(points = {{-81,-60},{-81,-50},{-101,-50},{-101,-40}}, color = {0,0,255}));
      connect(n1,Op1.in_n) annotation(Line(points = {{-213,-20},{-201,-20}}, color = {0,0,255}));
      connect(C2.n,n1) annotation(Line(points = {{-221,-60},{-213,-60},{-213,-20}}, color = {0,0,255}));
      connect(n1,n2) annotation(Line(points = {{-213,-20},{-213,20}}, color = {0,0,255}));
      connect(n2,n3) annotation(Line(points = {{-213,20},{-213,40}}, color = {0,0,255}));
      connect(n3,C1.p) annotation(Line(points = {{-213,40},{-193,40}}, color = {0,0,255}));
      connect(C1.n,n4) annotation(Line(points = {{-173,40},{-161,40}}, color = {0,0,255}));
      connect(n4,Op1.out) annotation(Line(points = {{-161,40},{-161,-30}}, color = {0,0,255}));
      connect(C5.p,Op1.out) annotation(Line(points = {{-31,-90},{-161,-90},{-161,-30}}, color = {0,0,255}));
      connect(n5,Op2.in_n) annotation(Line(points = {{-113,-30},{-113,-20},{-101,-20}}, color = {0,0,255}));
      connect(C3.p,n5) annotation(Line(points = {{-91,40},{-113,40},{-113,-30}}, color = {0,0,255}));
      connect(C2.p,p1) annotation(Line(points = {{-241,-60},{-241,-120},{-152,-120}}, color = {0,0,255}));
      connect(C3.n,n6) annotation(Line(points = {{-71,40},{-61,40}}, color = {0,0,255}));
      connect(n6,Op2.out) annotation(Line(points = {{-61,40},{-61,-30}}, color = {0,0,255}));
      connect(n7,Op3.in_n) annotation(Line(points = {{-5,-30},{-5,-20},{5,-20}}, color = {0,0,255}));
      connect(C5.n,n7) annotation(Line(points = {{-11,-90},{-5,-90},{-5,-30}}, color = {0,0,255}));
      connect(n7,n8) annotation(Line(points = {{-5,-30},{-5,20}}, color = {0,0,255}));
      connect(C6.p,p2) annotation(Line(points = {{8,40},{-5,40}}, color = {0,0,255}));
      connect(n8,p2) annotation(Line(points = {{-5,20},{-5,40}}, color = {0,0,255}));
      connect(C4.n,p2) annotation(Line(points = {{-11,60},{-5,60},{-5,40}}, color = {0,0,255}));
      connect(C6.n,Op3.out) annotation(Line(points = {{28,40},{45,40},{45,-30}}, color = {0,0,255}));
      connect(Op3.out,out1) annotation(Line(points = {{45,-30},{45,-120}}, color = {0,0,255}));
      connect(p1,out1) annotation(Line(points = {{-152,-120},{45,-120}}, color = {0,0,255}));
      connect(out1,C8.p) annotation(Line(points = {{45,-120},{159,-120}}, color = {0,0,255}));
      connect(C4.p,p3) annotation(Line(points = {{-31,60},{-41,60},{-41,80},{59,80}}, color = {0,0,255}));
      connect(n9,n10) annotation(Line(points = {{87,20},{87,-30}}, color = {0,0,255}));
      connect(n10,Op4.in_n) annotation(Line(points = {{87,-30},{87,-20},{99,-20}}, color = {0,0,255}));
      connect(n9,C7.p) annotation(Line(points = {{87,20},{87,40},{109,40}}, color = {0,0,255}));
      connect(C7.n,n11) annotation(Line(points = {{129,40},{139,40}}, color = {0,0,255}));
      connect(n11,Op4.out) annotation(Line(points = {{139,40},{139,-30}}, color = {0,0,255}));
      connect(G2.p,Op3.in_p) annotation(Line(points = {{18,-60},{5,-60},{5,-40}}, color = {0,0,255}));
      connect(p3,n12) annotation(Line(points = {{59,80},{239,80},{239,60}}, color = {0,0,255}));
      connect(C9.n,n13) annotation(Line(points = {{227,20},{239,20}}, color = {0,0,255}));
      connect(n12,n13) annotation(Line(points = {{239,60},{239,20}}, color = {0,0,255}));
      connect(n13,Op5.out) annotation(Line(points = {{239,20},{239,-30}}, color = {0,0,255}));
      connect(C9.p,p4) annotation(Line(points = {{207,20},{190,20}}, color = {0,0,255}));
      connect(p4,n14) annotation(Line(points = {{190,20},{190,-30}}, color = {0,0,255}));
      connect(Op5.in_n,n14) annotation(Line(points = {{199,-20},{190,-20},{190,-30}}, color = {0,0,255}));
      connect(C8.n,n14) annotation(Line(points = {{179,-120},{190,-120},{190,-30}}, color = {0,0,255}));
      connect(Op4.in_p,G3.p) annotation(Line(points = {{99,-40},{99,-60},{119,-60}}, color = {0,0,255}));
      connect(Op5.in_p,G4.p) annotation(Line(points = {{199,-40},{199,-60},{219,-60}}, color = {0,0,255}));
      connect(V.p,Ground1.p) annotation(Line(points = {{-241,-160},{-241,-170}}, color = {0,0,255}));
      connect(R4.n2,n5) annotation(Line(points = {{-120,-29.8},{-116,-29.8},{-116,-30},{-113,-30}}, color = {0,0,255}));
      connect(Op1.out,R4.n1) annotation(Line(points = {{-161,-30},{-140.2,-30}}, color = {0,0,255}));
      connect(R5.n1,p1) annotation(Line(points = {{-140.2,-70},{-152,-70},{-152,-120}}, color = {0,0,255}));
      connect(R5.n2,n5) annotation(Line(points = {{-120,-69.8},{-116,-69.8},{-116,-70},{-113,-70},{-113,-30}}, color = {0,0,255}));
      connect(p3,R8.n1) annotation(Line(points = {{59,80},{59.8,80},{59.8,20}}, color = {0,0,255}));
      connect(R8.n2,n9) annotation(Line(points = {{80,20.2},{84,20.2},{84,20},{87,20}}, color = {0,0,255}));
      connect(Op3.out,R9.n1) annotation(Line(points = {{45,-30},{59.8,-30}}, color = {0,0,255}));
      connect(R9.n2,n10) annotation(Line(points = {{80,-29.8},{84,-29.8},{84,-30},{87,-30}}, color = {0,0,255}));
      connect(R1.n1,V.n) annotation(Line(points = {{-240.2,-20},{-250,-20},{-250,-130},{-241,-130},{-241,-140}}, color = {0,0,255}));
      connect(R1.n2,n1) annotation(Line(points = {{-220,-19.8},{-216,-19.8},{-216,-20},{-213,-20}}, color = {0,0,255}));
      connect(R2.n2,n2) annotation(Line(points = {{-220,20.2},{-218,20.2},{-218,20},{-213,20}}, color = {0,0,255}));
      connect(R2.n1,n6) annotation(Line(points = {{-240.2,20},{-240,20},{-240,100},{-61,100},{-61,40}}, color = {0,0,255}));
      connect(R3.n1,n3) annotation(Line(points = {{-200.2,80},{-213,80},{-213,40}}, color = {0,0,255}));
      connect(R3.n2,n4) annotation(Line(points = {{-180,80.2},{-170,80.2},{-170,80},{-161,80},{-161,40}}, color = {0,0,255}));
      connect(Rp1.n2,n8) annotation(Line(points = {{-12,20.2},{-8,20.2},{-8,20},{-5,20}}, color = {0,0,255}));
      connect(Rp1.n1,n11) annotation(Line(points = {{-32.2,20},{-52,20},{-52,100},{139,100},{139,40}}, color = {0,0,255}));
      connect(Op2.out,R7.n1) annotation(Line(points = {{-61,-30},{-32.2,-30}}, color = {0,0,255}));
      connect(R7.n2,n7) annotation(Line(points = {{-12,-29.8},{-8,-29.8},{-8,-30},{-5,-30}}, color = {0,0,255}));
      connect(R10.n1,Op4.out) annotation(Line(points = {{159.8,-30},{139,-30}}, color = {0,0,255}));
      connect(R10.n2,n14) annotation(Line(points = {{180,-29.8},{186,-29.8},{186,-30},{190,-30}}, color = {0,0,255}));
      connect(R11.n2,n12) annotation(Line(points = {{228,60.2},{234,60.2},{234,60},{239,60}}, color = {0,0,255}));
      connect(R11.n1,p4) annotation(Line(points = {{207.8,60},{190,60},{190,20}}, color = {0,0,255}));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-250,-200},{250,200}}), graphics = {Text(extent = {{-100,180},{94,140}}, textString = "CauerLowPassSC", lineColor = {0,0,255})}), experiment(StopTime = 60, NumberOfIntervals = 1500), Documentation(revisions = "<html>
<ul>
<li><i>January 13, 2006</i>
       by Christoph Clauss<br>
       included into Modelica Standard Library</li>
<li><i>September 15, 2005</i>
       by by Peter Trappe designed and by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</html>", info = "<html>
The example CauerLowPassSC is a low-pass-filter of the fifth order. It is realized
using an switched-capacitor network with operational amplifiers. The voltage source V is the input voltage (step),
and the OP5.out.v is the filter output voltage. The pulse response is calculated.
<p>
This model is identical to the CauerLowPassAnalog example, but inverting. To get the same response
as that of the CauerLowPassAnalog example, a negative voltage step is used as input.
<p>
This model is identical to the CauerLowPassOPV example. But the resistors are realized by
switched capacitors. There are two such resistors Rp (of value +1), and Rn (of value -1).
In this models the switching clock source is included. In a typical switched capacitor circuit
there would be a central clock source.
<p>
The simulation end time should be 60. Please plot both V.v (which is the inverted input voltage) and OP5.p.v (output voltage). Compare this result with the CauerLowPassAnalog result.
<p>
Due to the recharging of the capacitances after switching the performance of simulation is not as good as in the CauerLowPassOPV example.
<p>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-250,-200},{250,200}}), graphics = {Rectangle(extent = {{-100,-100},{80,50}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Polygon(points = {{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Polygon(points = {{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Text(extent = {{-96,3},{77,-49}}, lineColor = {0,0,255}, textString = "Example"),Text(extent = {{-120,132},{120,73}}, lineColor = {255,0,0}, textString = "%name")}));
    end CauerLowPassSC;
    model CharacteristicIdealDiodes "Characteristic of ideal diodes"
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Ideal.IdealDiode Ideal(Ron = 0, Goff = 0) annotation(Placement(transformation(extent = {{0,40},{20,60}}, rotation = 0)));
      Modelica.Electrical.Analog.Ideal.IdealDiode With_Ron_Goff(Ron = 0.1, Goff = 0.1) annotation(Placement(transformation(extent = {{0,0},{20,20}}, rotation = 0)));
      Modelica.Electrical.Analog.Ideal.IdealDiode With_Ron_Goff_Vknee(Ron = 0.2, Goff = 0.2, Vknee = 5) annotation(Placement(transformation(extent = {{0,-40},{20,-20}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage1(V = 10, offset = -9) annotation(Placement(transformation(origin = {-40,0}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(transformation(extent = {{-50,-80},{-30,-60}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R1(R = 0.001) annotation(Placement(transformation(extent = {{60,40},{80,60}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R2(R = 0.001) annotation(Placement(transformation(extent = {{60,0},{80,20}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R3(R = 0.001) annotation(Placement(transformation(extent = {{60,-40},{80,-20}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage2(V = 10, offset = 0) annotation(Placement(transformation(origin = {-60,40}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage3(V = 10, offset = 0) annotation(Placement(transformation(origin = {-20,-40}, extent = {{-10,-10},{10,10}}, rotation = 270)));
    equation
      connect(Ground1.p,SineVoltage1.n) annotation(Line(points = {{-40,-60},{-40,-10}}, color = {0,0,255}));
      connect(Ideal.n,R1.p) annotation(Line(points = {{20,50},{60,50}}, color = {0,0,255}));
      connect(With_Ron_Goff.n,R2.p) annotation(Line(points = {{20,10},{60,10}}, color = {0,0,255}));
      connect(With_Ron_Goff_Vknee.n,R3.p) annotation(Line(points = {{20,-30},{60,-30}}, color = {0,0,255}));
      connect(R1.n,R2.n) annotation(Line(points = {{80,50},{80,10}}, color = {0,0,255}));
      connect(R2.n,R3.n) annotation(Line(points = {{80,10},{80,-30}}, color = {0,0,255}));
      connect(R3.n,Ground1.p) annotation(Line(points = {{80,-30},{80,-60},{-40,-60}}, color = {0,0,255}));
      connect(SineVoltage2.p,Ideal.p) annotation(Line(points = {{-60,50},{0,50}}, color = {0,0,255}));
      connect(SineVoltage2.n,Ground1.p) annotation(Line(points = {{-60,30},{-60,-60},{-40,-60}}, color = {0,0,255}));
      connect(SineVoltage1.p,With_Ron_Goff.p) annotation(Line(points = {{-40,10},{0,10}}, color = {0,0,255}));
      connect(With_Ron_Goff_Vknee.p,SineVoltage3.p) annotation(Line(points = {{0,-30},{-20,-30}}, color = {0,0,255}));
      connect(SineVoltage3.n,Ground1.p) annotation(Line(points = {{-20,-50},{-20,-60},{-40,-60}}, color = {0,0,255}));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-88,102},{92,48}}, textString = "Characteristic Ideal Diodes", lineColor = {0,0,255})}), Documentation(info = "<HTML>
<P>
Three examples of ideal diodes are shown:<br><br>
the <b>totally ideal diode</b> (Ideal) with all parameters to be zero <br>
the <b>nearly ideal diode</b> with <i>Ron=0.1</i> and <i>Goff=0.1</i> <br>
the nearly ideal but <b>displaced diode</b> with <i>Vknee=5</i> and <i>Ron=0.1</i> and
<i>Goff=0.1</i> <br><br>
The resistance and conductance are chosen untypically high since the slopes should
be seen in the graphics.
</P>
<P>
Simulate until T=1 s.
</P>
<P>
Plot in separate windows:<br> <br>
Ideal.i versus Ideal.v <br>
With_Ron_Goff.i versus With_Ron_Goff.v<br>
With_Ron_Goff_Vknee.i versus With_Ron_Goff_Vknee.v<br>
</P>

</HTML>
", revisions = "<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"), Documentation(info = "<HTML>
<P>
Three examples of ideal diodes are shown:<br><br>
the <b>totally ideal diode</b> (Ideal) with all parameters to be zero <br>
the <b>nearly ideal diode</b> with <i>Ron=0.1</i> and <i>Goff=0.1</i> <br>
the nearly ideal but <b>displaced diode</b> with <i>Vknee=5</i> and <i>Ron=0.1</i> and
<i>Goff=0.1</i> <br><br>
The resistance and conductance are chosen untypically high since the slopes should
be seen in the graphics.
</P>
<P>
Simulate until T=1 s.
</P>
<P>
Plot in separate windows:<br> <br>
Ideal.i versus Ideal.v <br>
With_Ron_Goff.i versus With_Ron_Goff.v<br>
With_Ron_Goff_Vknee.i versus With_Ron_Goff_Vknee.v<br>
</P>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</HTML>
"), experiment(StopTime = 1));
    end CharacteristicIdealDiodes;
    model CharacteristicThyristors "Characteristic of ideal thyristors"
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Ideal.IdealThyristor IdealThyristor1(Vknee = 5) annotation(Placement(transformation(extent = {{-20,0},{0,20}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage1(V = 10, offset = 0) annotation(Placement(transformation(origin = {-40,-10}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(transformation(extent = {{-50,-60},{-30,-40}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R3(R = 0.001) annotation(Placement(transformation(extent = {{40,0},{60,20}}, rotation = 0)));
      Modelica.Blocks.Sources.BooleanStep BooleanStep1(startValue = false, startTime = 1.25) annotation(Placement(transformation(extent = {{-60,40},{-40,60}}, rotation = 0)));
      Modelica.Electrical.Analog.Ideal.IdealGTOThyristor IdealGTOThyristor1(Vknee = 0) annotation(Placement(transformation(extent = {{-20,-30},{0,-10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R1(R = 0.001) annotation(Placement(transformation(extent = {{40,-30},{60,-10}}, rotation = 0)));
    equation
      connect(IdealThyristor1.n,R3.p) annotation(Line(points = {{0,10},{40,10}}, color = {0,0,255}));
      connect(Ground1.p,SineVoltage1.n) annotation(Line(points = {{-40,-40},{-40,-20}}, color = {0,0,255}));
      connect(SineVoltage1.p,IdealThyristor1.p) annotation(Line(points = {{-40,0},{-40,10},{-20,10}}, color = {0,0,255}));
      connect(BooleanStep1.y,IdealThyristor1.fire) annotation(Line(points = {{-39,50},{-3,50},{-3,21}}, color = {255,0,255}));
      connect(IdealGTOThyristor1.n,R1.p) annotation(Line(points = {{0,-20},{40,-20}}, color = {0,0,255}));
      connect(R3.n,R1.n) annotation(Line(points = {{60,10},{60,-20}}, color = {0,0,255}));
      connect(R1.n,Ground1.p) annotation(Line(points = {{60,-20},{60,-40},{-40,-40}}, color = {0,0,255}));
      connect(IdealGTOThyristor1.p,IdealThyristor1.p) annotation(Line(points = {{-20,-20},{-20,10}}, color = {0,0,255}));
      connect(IdealGTOThyristor1.fire,IdealThyristor1.fire) annotation(Line(points = {{-3,-9},{-3,-2.5},{-2,-2.5},{-2,5},{-3,5},{-3,21}}, color = {255,0,255}));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-96,100},{98,60}}, textString = "Characteristic Thyristors", lineColor = {0,0,255})}), Documentation(info = "<HTML>
<P>
Two examples of thyristors are shown:<br><br>
the <b>ideal thyristor</b>  <br>
and the <b>ideal GTO thyristor</b>  with <i>Vknee=5</i>  <br><br>
</P>
<P>
Simulate until T=2 s.
</P>
<P>
Plot in separate windows:<br> <br>
IdealThyristor1.i and IdealGTOThyristor1.i <br>
IdealThyristor1.v and IdealGTOThyristor1.v <br>
</P>

</HTML>
", revisions = "<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"), Documentation(info = "<HTML>
<P>
Two examples of thyristors are shown:<br><br>
the <b>ideal thyristor</b>  <br>
and the <b>ideal GTO thyristor</b>  with <i>Vknee=5</i>  <br><br>
</P>
<P>
Simulate until T=2 s.
</P>
<P>
Plot in separate windows:<br> <br>
IdealThyristor1.i and IdealGTOThyristor1.i <br>
IdealThyristor1.v and IdealGTOThyristor1.v <br>
</P>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</HTML>
"), experiment(StopTime = 2));
    end CharacteristicThyristors;
    encapsulated model ChuaCircuit "Chua's circuit, ns, V, A"
      import Modelica.Electrical.Analog.Basic;
      import Modelica.Electrical.Analog.Examples.Utilities;
      import Modelica.Icons;
      extends Icons.Example;
      Basic.Inductor L(L = 18) annotation(Placement(transformation(origin = {-75,38}, extent = {{-25,-25},{25,25}}, rotation = 270)));
      Basic.Resistor Ro(R = 0.0125) annotation(Placement(transformation(origin = {-75,-17}, extent = {{-25,-25},{25,25}}, rotation = 270)));
      Basic.Conductor G(G = 0.565) annotation(Placement(transformation(extent = {{-25,38},{25,88}}, rotation = 0)));
      Basic.Capacitor C1(C = 10, v(start = 4)) annotation(Placement(transformation(origin = {25,3}, extent = {{-25,-25},{25,25}}, rotation = 270)));
      Basic.Capacitor C2(C = 100) annotation(Placement(transformation(origin = {-25,3}, extent = {{-25,-25},{25,25}}, rotation = 270)));
      Utilities.NonlinearResistor Nr(Ga(min = -1) = -0.757576, Gb(min = -1) = -0.409091, Ve = 1) annotation(Placement(transformation(origin = {75,3}, extent = {{-25,-25},{25,25}}, rotation = 270)));
      Basic.Ground Gnd annotation(Placement(transformation(extent = {{-25,-112},{25,-62}}, rotation = 0)));
    equation
      connect(L.p,G.p) annotation(Line(points = {{-75,63},{-25,63}}));
      connect(G.n,Nr.p) annotation(Line(points = {{25,63},{75,63},{75,28}}));
      connect(Nr.n,Gnd.p) annotation(Line(points = {{75,-22},{75,-62},{0,-62}}));
      connect(C1.p,G.n) annotation(Line(points = {{25,28},{25,45.5},{25,63}}));
      connect(L.n,Ro.p) annotation(Line(points = {{-75,13},{-75,8}}));
      connect(G.p,C2.p) annotation(Line(points = {{-25,63},{-26,46},{-26,28},{-25,28}}));
      connect(C1.n,Gnd.p) annotation(Line(points = {{25,-22},{25,-62},{0,-62}}));
      connect(C2.n,Gnd.p) annotation(Line(points = {{-25,-22},{-25,-62},{0,-62}}));
      connect(Ro.n,Gnd.p) annotation(Line(points = {{-75,-42},{-75,-62},{0,-62}}));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics), Documentation(info = "<html>
<p>
 Chua's circuit is the most simple nonlinear circuit which shows chaotic behaviour. The circuit consists of linear basic elements (capacitors, resistor, conductor, inductor), and one nonlinear element, which is called Chua's diode. The chaotic behaviour is simulated.
<p>
The simulation end time should be set to 5e4. To get the chaotic behaviour please plot C1.v. Choose C2.v as the independent variable .
<p>
<dl>
<dt>
<b>Reference:</b>
<dd>
Kennedy, M.P.: Three Steps to Chaos - Part I: Evolution. IEEE Transactions on CAS I 40 (1993)10, 640-656
</dd>
</dl>

</HTML>
", revisions = "<html>
<dt>
<b>Main Authors:</b>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
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
</html>"), experiment(StopTime = 1), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-98,104},{-32,72}}, lineColor = {0,0,255}, textString = "Chua Circuit")}));
    end ChuaCircuit;
    model CompareTransformers
      extends Modelica.Icons.Example;
      constant Modelica.SIunits.Angle pi = Modelica.Constants.pi;
      parameter Modelica.SIunits.Voltage Vdc = 0.1 "DC offset of voltage source";
      parameter Modelica.SIunits.Voltage Vpeak = 0.1 "peak voltage of voltage source";
      parameter Modelica.SIunits.Frequency f = 10 "frequency of voltage source";
      parameter Modelica.SIunits.Angle phi0 = pi / 2 "phase of voltage source";
      parameter Real n = 2 "turns ratio primary:secondary voltage";
      parameter Modelica.SIunits.Resistance R1 = 0.01 "primary resistance w.r.t. primary side";
      parameter Modelica.SIunits.Inductance L1sigma = 0.05 / (2 * pi * f) "primary leakage inductance w.r.t. primary side";
      parameter Modelica.SIunits.Inductance Lm1 = 10.0 / (2 * pi * f) "magnetizing inductance w.r.t. primary side";
      parameter Modelica.SIunits.Inductance L2sigma = 0.05 / (2 * pi * f) / n ^ 2 "secondary leakage inductance w.r.t. secondary side";
      parameter Modelica.SIunits.Resistance R2 = 0.01 / n ^ 2 "secondary resistance w.r.t. secondary side";
      parameter Modelica.SIunits.Resistance RL = 1 / n ^ 2 "load resistance";
      final parameter Modelica.SIunits.Inductance L1 = L1sigma + M * n "primary no-load inductance";
      final parameter Modelica.SIunits.Inductance L2 = L2sigma + M / n "secondary no-load inductance";
      final parameter Modelica.SIunits.Inductance M = Lm1 / n "mutual inductance";
      output Modelica.SIunits.Voltage v1B = resistor11.n.v "primary voltage, basic transformer";
      output Modelica.SIunits.Current i1B = resistor11.i "primary current, basic transformer";
      output Modelica.SIunits.Voltage v2B = resistor12.p.v "secondary voltage, basic transformer";
      output Modelica.SIunits.Current i2B = resistor12.i "secondary current, basic transformer";
      output Modelica.SIunits.Voltage v1I = resistor21.n.v "primary voltage, basic transformer";
      output Modelica.SIunits.Current i1I = resistor21.i "primary current, basic transformer";
      output Modelica.SIunits.Voltage v2I = resistor22.p.v "secondary voltage, basic transformer";
      output Modelica.SIunits.Current i2I = resistor22.i "secondary current, basic transformer";
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage1(V = Vpeak, phase = phi0, freqHz = f, offset = Vdc) annotation(Placement(transformation(origin = {-80,40}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Ground ground11 annotation(Placement(transformation(extent = {{-90,0},{-70,20}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor resistor11(R = R1) annotation(Placement(transformation(extent = {{-80,50},{-60,70}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor resistor12(R = R2) annotation(Placement(transformation(extent = {{60,50},{80,70}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor load1(R = RL) annotation(Placement(transformation(origin = {80,40}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Ground ground12 annotation(Placement(transformation(extent = {{70,0},{90,20}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage2(V = Vpeak, phase = phi0, freqHz = f, offset = Vdc) annotation(Placement(transformation(origin = {-80,-50}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Ground ground21 annotation(Placement(transformation(extent = {{-90,-90},{-70,-70}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor resistor21(R = R1) annotation(Placement(transformation(extent = {{-80,-40},{-60,-20}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor inductor21(L = L1sigma) annotation(Placement(transformation(extent = {{-50,-40},{-30,-20}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor inductor22(L = L2sigma) annotation(Placement(transformation(extent = {{30,-40},{50,-20}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor resistor22(R = R2) annotation(Placement(transformation(extent = {{60,-40},{80,-20}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor load2(R = RL) annotation(Placement(transformation(origin = {80,-50}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Ground ground22 annotation(Placement(transformation(extent = {{70,-90},{90,-70}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Transformer basicTransformer(L1 = L1, L2 = L2, M = M) annotation(Placement(transformation(extent = {{-10,40},{10,60}}, rotation = 0)));
      Modelica.Electrical.Analog.Ideal.IdealTransformer idealTransformer(n = n, Lm1 = Lm1, considerMagnetization = false) annotation(Placement(transformation(extent = {{-10,-50},{10,-30}}, rotation = 0)));
    equation
      connect(sineVoltage1.n,ground11.p) annotation(Line(points = {{-80,30},{-80,20}}, color = {0,0,255}));
      connect(sineVoltage1.p,resistor11.p) annotation(Line(points = {{-80,50},{-80,60}}, color = {0,0,255}));
      connect(load1.n,ground12.p) annotation(Line(points = {{80,30},{80,20}}, color = {0,0,255}));
      connect(resistor12.n,load1.p) annotation(Line(points = {{80,60},{80,50}}, color = {0,0,255}));
      connect(sineVoltage2.n,ground21.p) annotation(Line(points = {{-80,-60},{-80,-70}}, color = {0,0,255}));
      connect(sineVoltage2.p,resistor21.p) annotation(Line(points = {{-80,-40},{-80,-30}}, color = {0,0,255}));
      connect(resistor21.n,inductor21.p) annotation(Line(points = {{-60,-30},{-50,-30}}, color = {0,0,255}));
      connect(inductor22.n,resistor22.p) annotation(Line(points = {{50,-30},{60,-30}}, color = {0,0,255}));
      connect(load2.n,ground22.p) annotation(Line(points = {{80,-60},{80,-70}}, color = {0,0,255}));
      connect(resistor22.n,load2.p) annotation(Line(points = {{80,-30},{80,-40}}, color = {0,0,255}));
      connect(ground11.p,basicTransformer.n1) annotation(Line(points = {{-80,20},{-10,20},{-10,45}}, color = {0,0,255}));
      connect(basicTransformer.n2,ground12.p) annotation(Line(points = {{10,45},{10,20},{80,20}}, color = {0,0,255}));
      connect(basicTransformer.p1,resistor11.n) annotation(Line(points = {{-10,55},{-10,60},{-60,60}}, color = {0,0,255}));
      connect(basicTransformer.p2,resistor12.p) annotation(Line(points = {{10,55},{10,60},{60,60}}, color = {0,0,255}));
      connect(ground21.p,idealTransformer.n1) annotation(Line(points = {{-80,-70},{-10,-70},{-10,-45}}, color = {0,0,255}));
      connect(ground22.p,idealTransformer.n2) annotation(Line(points = {{80,-70},{10,-70},{10,-45}}, color = {0,0,255}));
      connect(idealTransformer.p1,inductor21.n) annotation(Line(points = {{-10,-35},{-10,-30},{-30,-30}}, color = {0,0,255}));
      connect(idealTransformer.p2,inductor22.p) annotation(Line(points = {{10,-35},{10,-30},{30,-30}}, color = {0,0,255}));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-60,-80},{60,-100}}, lineColor = {0,0,255}, textString = "try considerMagnetization=false/true"),Text(extent = {{-60,20},{60,0}}, lineColor = {0,0,255}, textString = "Basic.Transformer (mutual inductance)")}), experiment(StopTime = 50, Interval = 0.001), Documentation(revisions = "<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 2009   </i>
       by Anton Haumer<br> initially implemented<br>
       </li>
</ul>
</html>", info = "<html>
<p>
This example is o demonstrate the behaviour of transformer models. The Basic.Transformer, which consists of mutual coupled inductors,<br>
is compared with the ideal transformer model. If the ideal model is used with considerMagnetization=true eakage inductances are taken <br>
into account, otherwise not.
</p>
<p>
The example is constructed in such a way that the ideal transformer circuit with considerMagnetization=true shows the same behaviour as the basic transformer.
</p>

Simulate until T=50 s with both considerMagnetization=false and <br>
considerMagnetization=true of the ideal transformer.<br>
Plot in separate windows for comparison:<br> <br>
basicTransformer.p1.v and idealTransformer.p1.v <br>
basicTransformer.p1.i and idealTransformer.p1.i <br>
basicTransformer.p2.v and idealTransformer.p2.v <br>
basicTransformer.p2.i and idealTransformer.p2.i <br>

</P>


</html>"));
    end CompareTransformers;
    model ControlledSwitchWithArc
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(extent = {{20,-20},{40,0}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(V = 50) annotation(Placement(transformation(origin = {-20,20}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Inductor inductor1(L = 0.1) annotation(Placement(transformation(extent = {{40,30},{60,50}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor resistor1 annotation(Placement(transformation(origin = {80,20}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Ideal.ControlledIdealClosingSwitch switch1 annotation(Placement(transformation(extent = {{0,30},{20,50}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground ground2 annotation(Placement(transformation(extent = {{20,-100},{40,-80}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage2(V = 50) annotation(Placement(transformation(origin = {-20,-60}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Inductor inductor2(L = 0.1) annotation(Placement(transformation(extent = {{40,-50},{60,-30}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor resistor2 annotation(Placement(transformation(origin = {80,-60}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Ideal.ControlledCloserWithArc switch2 annotation(Placement(transformation(extent = {{0,-50},{20,-30}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V = 1, freqHz = 1) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-70,-10})));
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent = {{-80,-60},{-60,-40}})));
    equation
      connect(inductor1.n,resistor1.p) annotation(Line(points = {{60,40},{80,40},{80,30}}, color = {0,0,255}));
      connect(resistor1.n,ground1.p) annotation(Line(points = {{80,10},{80,0},{30,0}}, color = {0,0,255}));
      connect(constantVoltage1.n,ground1.p) annotation(Line(points = {{-20,10},{-20,0},{30,0}}, color = {0,0,255}));
      connect(switch1.n,inductor1.p) annotation(Line(points = {{20,40},{40,40}}, color = {0,0,255}));
      connect(constantVoltage1.p,switch1.p) annotation(Line(points = {{-20,30},{-20,40},{0,40}}, color = {0,0,255}));
      connect(inductor2.n,resistor2.p) annotation(Line(points = {{60,-40},{80,-40},{80,-50}}, color = {0,0,255}));
      connect(resistor2.n,ground2.p) annotation(Line(points = {{80,-70},{80,-80},{30,-80}}, color = {0,0,255}));
      connect(constantVoltage2.n,ground2.p) annotation(Line(points = {{-20,-70},{-20,-80},{30,-80}}, color = {0,0,255}));
      connect(switch2.n,inductor2.p) annotation(Line(points = {{20,-40},{40,-40}}, color = {0,0,255}));
      connect(constantVoltage2.p,switch2.p) annotation(Line(points = {{-20,-50},{-20,-40},{0,-40}}, color = {0,0,255}));
      connect(sineVoltage.p,switch1.control) annotation(Line(points = {{-70,0},{-40,0},{-40,50},{10,50}}, color = {0,0,255}, smooth = Smooth.None));
      connect(sineVoltage.p,switch2.control) annotation(Line(points = {{-70,0},{-40,0},{-40,-30},{10,-30}}, color = {0,0,255}, smooth = Smooth.None));
      connect(sineVoltage.n,ground.p) annotation(Line(points = {{-70,-20},{-70,-40}}, color = {0,0,255}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-100,80},{100,60}}, lineColor = {0,0,255}, textString = "Compare voltage and current of inductor1 and inductor2")}), experiment(StopTime = 6, Interval = 0.00025, Tolerance = 1e-006), Documentation(info = "<html>
<P>
This example is to compare the behaviour of switch models with
and without an electric arc taking into consideration.<br><br>

</P>
<P>
Simulate until T=2 s.
</P>
<P>
Plot in one windows:<br> <br>
switch1.i and switch2.i <br><br>

The difference in the closing area shows that the simple arc model avoids
the suddenly switching.

</P>
</html>", revisions = "<html>
<ul>
<li><i>May, 2009   </i>
       by Anton Haumer<br> initially realized<br>
       </li>
</ul>
</html>"));
    end ControlledSwitchWithArc;
    encapsulated model DifferenceAmplifier "Simple NPN transistor amplifier circuit"
      import Modelica.Electrical.Analog.Basic;
      import Modelica.Electrical.Analog.Sources;
      import Modelica.Electrical.Analog.Examples.Utilities;
      import Modelica.Icons;
      extends Icons.Example;
      Sources.ExpSineVoltage V1(V = 0.2, freqHz = 200000000.0, damping = 10000000.0) annotation(Placement(transformation(origin = {-90,-50}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Sources.RampVoltage V2(V = 15, duration = 1e-009) annotation(Placement(transformation(origin = {80,50}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Sources.RampCurrent I1(I = 0.16, duration = 1e-009) annotation(Placement(transformation(origin = {-10,-50}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Basic.Resistor R1(R = 0.0001) annotation(Placement(transformation(extent = {{-90,-20},{-70,0}}, rotation = 0)));
      Basic.Resistor R2(R = 100) annotation(Placement(transformation(origin = {-40,30}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Basic.Resistor R3(R = 0.0001) annotation(Placement(transformation(extent = {{70,-20},{90,0}}, rotation = 0)));
      Basic.Resistor R4(R = 100) annotation(Placement(transformation(origin = {40,30}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Basic.Capacitor C1(C = 1e-010) annotation(Placement(transformation(origin = {-60,-50}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Basic.Capacitor C4(C = 1e-010) annotation(Placement(transformation(extent = {{10,-14},{30,6}}, rotation = 0)));
      Basic.Capacitor C5(C = 1e-010) annotation(Placement(transformation(origin = {10,-50}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Basic.Capacitor C2(C = 1e-010) annotation(Placement(transformation(extent = {{-30,-14},{-10,6}}, rotation = 0)));
      Basic.Capacitor C3(C = 1e-010) annotation(Placement(transformation(origin = {60,-50}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Basic.Ground Gnd1 annotation(Placement(transformation(extent = {{-95,-80},{-85,-70}}, rotation = 0)));
      Basic.Ground Gnd9 annotation(Placement(transformation(extent = {{75,20},{85,30}}, rotation = 0)));
      Basic.Ground Gnd3 annotation(Placement(transformation(extent = {{-15,-20},{-5,-10}}, rotation = 0)));
      Basic.Ground Gnd2 annotation(Placement(transformation(extent = {{-65,-80},{-55,-70}}, rotation = 0)));
      Basic.Ground Gnd6 annotation(Placement(transformation(extent = {{5,-20},{15,-10}}, rotation = 0)));
      Basic.Ground Gnd7 annotation(Placement(transformation(extent = {{-15,-80},{-5,-70}}, rotation = 0)));
      Basic.Ground Gnd8 annotation(Placement(transformation(extent = {{5,-80},{15,-70}}, rotation = 0)));
      Basic.Ground Gnd5 annotation(Placement(transformation(extent = {{55,-80},{65,-70}}, rotation = 0)));
      Basic.Ground Gnd4 annotation(Placement(transformation(extent = {{85,-50},{95,-40}}, rotation = 0)));
      Utilities.Transistor Transistor1 annotation(Placement(transformation(extent = {{-60,-20},{-40,0}}, rotation = 0)));
      Utilities.Transistor Transistor2 annotation(Placement(transformation(extent = {{60,-20},{40,0}}, rotation = 0)));
    equation
      connect(V1.n,Gnd1.p) annotation(Line(points = {{-90,-60},{-90,-70}}));
      connect(C1.n,Gnd2.p) annotation(Line(points = {{-60,-60},{-60,-70}}));
      connect(I1.n,Gnd7.p) annotation(Line(points = {{-10,-60},{-10,-65},{-10,-65},{-10,-70}}));
      connect(C5.n,Gnd8.p) annotation(Line(points = {{10,-60},{10,-70}}));
      connect(C3.n,Gnd5.p) annotation(Line(points = {{60,-60},{60,-70}}));
      connect(R3.n,Gnd4.p) annotation(Line(points = {{90,-10},{90,-40}}));
      connect(C2.n,Gnd3.p) annotation(Line(points = {{-10,-4},{-10,-10}}));
      connect(C4.p,Gnd6.p) annotation(Line(points = {{10,-4},{10,-10}}));
      connect(I1.p,C5.p) annotation(Line(points = {{-10,-40},{10,-40}}));
      connect(R1.p,V1.p) annotation(Line(points = {{-90,-10},{-90,-40}}));
      connect(R2.p,V2.p) annotation(Line(points = {{-40,40},{-40,70},{80,70},{80,60}}));
      connect(R4.p,V2.p) annotation(Line(points = {{40,40},{40,70},{80,70},{80,60}}));
      connect(V2.n,Gnd9.p) annotation(Line(points = {{80,40},{80,30}}));
      connect(R1.n,Transistor1.b) annotation(Line(points = {{-70,-10},{-60,-10}}));
      connect(Transistor1.b,C1.p) annotation(Line(points = {{-60,-10},{-60,-40}}));
      connect(Transistor1.c,C2.p) annotation(Line(points = {{-40,-4},{-30,-4}}));
      connect(R2.n,Transistor1.c) annotation(Line(points = {{-40,20},{-40,-4}}));
      connect(Transistor1.e,I1.p) annotation(Line(points = {{-40,-16},{-30,-16},{-30,-40},{-10,-40}}));
      connect(Transistor2.b,R3.p) annotation(Line(points = {{60,-10},{70,-10}}));
      connect(Transistor2.b,C3.p) annotation(Line(points = {{60,-10},{60,-40}}));
      connect(C4.n,Transistor2.c) annotation(Line(points = {{30,-4},{40,-4}}));
      connect(R4.n,Transistor2.c) annotation(Line(points = {{40,20},{40,-4}}));
      connect(C5.p,Transistor2.e) annotation(Line(points = {{10,-40},{30,-40},{30,-16},{40,-16}}));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics), Documentation(info = "<html>
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
", revisions = "<html>
<dl>
<dt>
<b>Main Authors:</b>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
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
</html>"), experiment(StopTime = 1), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-98,106},{22,60}}, lineColor = {0,0,255}, textString = "Difference Amplifier")}));
    end DifferenceAmplifier;
    model HeatingMOSInverter "Heating MOS Inverter"
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Ground G annotation(Placement(transformation(extent = {{-80,-40},{-60,-20}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage Sin(V = 5) annotation(Placement(transformation(origin = {-70,0}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Capacitor Capacitor1(C = 1e-005) annotation(Placement(transformation(origin = {30,10}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Thermal.HeatTransfer.Components.HeatCapacitor HeatCapacitor1(C = 0.01) annotation(Placement(transformation(origin = {70,-60}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor TC1(G = 0.01) annotation(Placement(transformation(extent = {{0,-50},{20,-30}}, rotation = 0)));
      Semiconductors.HeatingPMOS H_PMOS(useHeatPort = true) annotation(Placement(transformation(extent = {{-40,40},{-20,60}}, rotation = 0)));
      Semiconductors.HeatingNMOS H_NMOS(useHeatPort = true) annotation(Placement(transformation(extent = {{-40,0},{-20,20}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.RampVoltage V(V = 5, duration = 0.01) annotation(Placement(transformation(origin = {50,50}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor TC2(G = 0.01) annotation(Placement(transformation(extent = {{0,-90},{20,-70}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Sources.FixedTemperature FixedTemperature1(T = 300) annotation(Placement(transformation(origin = {90,-30}, extent = {{-10,-10},{10,10}}, rotation = 180)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor TC3(G = 0.01) annotation(Placement(transformation(extent = {{50,-40},{70,-20}}, rotation = 0)));
    equation
      connect(Sin.n,G.p) annotation(Line(points = {{-70,-10},{-70,-20}}, color = {0,0,255}));
      connect(Capacitor1.n,G.p) annotation(Line(points = {{30,0},{30,-20},{-70,-20}}, color = {0,0,255}));
      connect(H_NMOS.G,H_PMOS.G) annotation(Line(points = {{-40,5},{-40,45}}, color = {0,0,255}));
      connect(H_NMOS.G,Sin.p) annotation(Line(points = {{-40,5},{-40,10},{-70,10}}, color = {0,0,255}));
      connect(H_PMOS.S,H_NMOS.D) annotation(Line(points = {{-20,45},{-20,15}}, color = {0,0,255}));
      connect(H_NMOS.D,Capacitor1.p) annotation(Line(points = {{-20,15},{-20,20},{30,20}}, color = {0,0,255}));
      connect(H_NMOS.B,H_NMOS.S) annotation(Line(points = {{-20,10},{-20,5}}, color = {0,0,255}));
      connect(H_NMOS.S,G.p) annotation(Line(points = {{-20,5},{-20,-20},{-70,-20}}, color = {0,0,255}));
      connect(H_PMOS.B,H_PMOS.D) annotation(Line(points = {{-20,50},{-20,55}}, color = {0,0,255}));
      connect(V.p,H_PMOS.D) annotation(Line(points = {{50,60},{-20,60},{-20,55}}, color = {0,0,255}));
      connect(V.n,G.p) annotation(Line(points = {{50,40},{50,-20},{-70,-20}}, color = {0,0,255}));
      connect(TC1.port_b,HeatCapacitor1.port) annotation(Line(points = {{20,-40},{40,-40},{40,-60},{60,-60}}, color = {191,0,0}));
      connect(TC2.port_b,HeatCapacitor1.port) annotation(Line(points = {{20,-80},{40,-80},{40,-60},{60,-60}}, color = {191,0,0}));
      connect(TC1.port_a,H_PMOS.heatPort) annotation(Line(points = {{0,-40},{-10,-40},{-10,40},{-30,40}}, color = {191,0,0}));
      connect(TC2.port_a,H_NMOS.heatPort) annotation(Line(points = {{0,-80},{-30,-80},{-30,0}}, color = {191,0,0}));
      connect(TC3.port_b,FixedTemperature1.port) annotation(Line(points = {{70,-30},{80,-30}}, color = {191,0,0}));
      connect(TC3.port_a,HeatCapacitor1.port) annotation(Line(points = {{50,-30},{40,-30},{40,-60},{60,-60}}, color = {191,0,0}));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-100,100},{-6,72}}, textString = "Heating MOS Inverter", lineColor = {0,0,255})}), Documentation(info = "<HTML>
<P>
The heating MOS inverter shows a heat flow always if a transistor is leading.
</P>
<P>
Simulate until T=5 s.
</P>
<P>
Plot in separate windows:<br> <br>
Sin.p.v  and  Capacitor1.p.v <br>
HeatCapacitor1.port.T and H_PMOS.heatPort.T and H_NMOS.heatPort.T<br>
H_PMOS.heatPort.Q_flow and H_NMOS.heatPort.Q_flow<br>
</P>

</HTML>
", revisions = "<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 6, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"), Documentation(info = "<HTML>
<P>
The heating MOS inverter shows a heat flow always if a transistor is leading.
</P>
<P>
Simulate until T=5 s.
</P>
<P>
Plot in separate windows:<br> <br>
Sin.p.v  and  Capacitor1.p.v <br>
HeatCapacitor1.port.T and H_PMOS.heatPort.T and H_NMOS.heatPort.T<br>
H_PMOS.heatPort.Q_flow and H_NMOS.heatPort.Q_flow<br>
</P>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 6, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</HTML>
"), experiment(StopTime = 5));
    end HeatingMOSInverter;
    model HeatingNPN_OrGate "Heating NPN Or Gate"
      extends Modelica.Icons.Example;
      constant Modelica.SIunits.Capacitance CapVal = 0;
      constant Modelica.SIunits.Time tauVal = 0;
      Modelica.Thermal.HeatTransfer.Components.HeatCapacitor HeatCapacitor1(C = 0.1) annotation(Placement(transformation(origin = {76,-84}, extent = {{-10,-10},{10,10}}, rotation = 180)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor TC1(G = 0.01) annotation(Placement(transformation(origin = {90,-50}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor TC2(G = 0.01) annotation(Placement(transformation(origin = {60,-50}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Sources.RampVoltage V(V = 6, duration = 5) annotation(Placement(transformation(origin = {90,38}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Sources.TrapezoidVoltage V1(V = 6, startTime = 55, rising = 5, width = 15, falling = 5, period = 50, nperiod = 10) annotation(Placement(transformation(origin = {-90,18}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Sources.TrapezoidVoltage V2(V = 6, startTime = 65, rising = 5, width = 15, falling = 5, period = 50, nperiod = 10) annotation(Placement(transformation(origin = {-50,-42}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Resistor R1(R = 1800) annotation(Placement(transformation(extent = {{-90,48},{-70,68}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R2(R = 1800) annotation(Placement(transformation(extent = {{-36,-22},{-16,-2}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor RI(R = 40) annotation(Placement(transformation(extent = {{60,58},{80,78}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground Gnd annotation(Placement(transformation(extent = {{80,0},{100,20}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground Gnd1 annotation(Placement(transformation(extent = {{-100,-22},{-80,-2}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground Gnd2 annotation(Placement(transformation(extent = {{-60,-82},{-40,-62}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground Gnd3 annotation(Placement(transformation(extent = {{-10,16},{10,36}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground Gnd4 annotation(Placement(transformation(extent = {{30,-52},{50,-32}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Capacitor C1(C = CapVal) annotation(Placement(transformation(origin = {-70,38}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Capacitor C2(C = CapVal) annotation(Placement(transformation(origin = {60,42}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Capacitor C3(C = CapVal) annotation(Placement(transformation(origin = {-16,-40}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Ground Gnd5 annotation(Placement(transformation(extent = {{-26,-76},{-6,-56}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground Gnd6 annotation(Placement(transformation(extent = {{50,6},{70,26}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground Gnd7 annotation(Placement(transformation(extent = {{-80,2},{-60,22}}, rotation = 0)));
      Semiconductors.HeatingNPN T1(Bf = 100, Br = 1, Is = 1e-014, Vak = 0, Tauf = tauVal, Taur = tauVal, Ccs = CapVal, Cje = CapVal, Cjc = CapVal, Phie = 1, Me = 0.5, Phic = 1, Mc = 0.5, Gbc = 1e-012, Gbe = 1e-012, EMax = 40, vt_t(start = 0.01, fixed = false), useHeatPort = true) annotation(Placement(transformation(extent = {{-20,48},{0,68}}, rotation = 0)));
      Semiconductors.HeatingNPN T2(Bf = 100, Br = 1, Is = 1e-014, Vak = 0, Tauf = tauVal, Taur = tauVal, Ccs = CapVal, Cje = CapVal, Cjc = CapVal, Phie = 1, Me = 0.5, Phic = 1, Mc = 0.5, Gbc = 1e-012, Gbe = 1e-012, EMax = 40, vt_t(start = 0.01, fixed = false), useHeatPort = true) annotation(Placement(transformation(extent = {{20,-22},{40,-2}}, rotation = 0)));
    equation
      connect(Gnd1.p,V1.n) annotation(Line(points = {{-90,-2},{-90,8}}));
      connect(V1.p,R1.p) annotation(Line(points = {{-90,28},{-90,58}}));
      connect(RI.n,V.p) annotation(Line(points = {{80,68},{90,68},{90,48}}));
      connect(Gnd.p,V.n) annotation(Line(points = {{90,20},{90,28}}));
      connect(V2.p,R2.p) annotation(Line(points = {{-50,-32},{-50,-12},{-36,-12}}));
      connect(Gnd2.p,V2.n) annotation(Line(points = {{-50,-62},{-50,-52}}));
      connect(Gnd7.p,C1.n) annotation(Line(points = {{-70,22},{-70,28}}));
      connect(C2.p,RI.p) annotation(Line(points = {{60,52},{60,68}}));
      connect(Gnd6.p,C2.n) annotation(Line(points = {{60,26},{60,32}}));
      connect(C3.p,R2.n) annotation(Line(points = {{-16,-30},{-16,-21},{-16,-21},{-16,-12}}));
      connect(C1.p,R1.n) annotation(Line(points = {{-70,48},{-70,58}}));
      connect(Gnd5.p,C3.n) annotation(Line(points = {{-16,-56},{-16,-53},{-16,-50},{-16,-50}}));
      connect(T1.B,R1.n) annotation(Line(points = {{-20,58},{-70,58}}, color = {0,0,255}));
      connect(T1.E,Gnd3.p) annotation(Line(points = {{0,53},{0,36}}, color = {0,0,255}));
      connect(RI.p,T1.C) annotation(Line(points = {{60,68},{30,68},{30,63},{0,63}}, color = {0,0,255}));
      connect(T2.B,R2.n) annotation(Line(points = {{20,-12},{-16,-12}}, color = {0,0,255}));
      connect(T2.E,Gnd4.p) annotation(Line(points = {{40,-17},{40,-32}}, color = {0,0,255}));
      connect(T2.C,RI.p) annotation(Line(points = {{40,-7},{40,68},{60,68}}, color = {0,0,255}));
      connect(TC1.port_b,HeatCapacitor1.port) annotation(Line(points = {{90,-60},{84,-60},{84,-74},{76,-74}}, color = {191,0,0}));
      connect(TC2.port_b,HeatCapacitor1.port) annotation(Line(points = {{60,-60},{68,-60},{68,-74},{76,-74}}, color = {191,0,0}));
      connect(TC2.port_a,T2.heatPort) annotation(Line(points = {{60,-40},{60,-22},{30,-22}}, color = {191,0,0}));
      connect(TC1.port_a,T1.heatPort) annotation(Line(points = {{90,-40},{90,2},{-10,2},{-10,48}}, color = {191,0,0}));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-100,100},{-6,72}}, textString = "Heating \"NPN or\" Gate", lineColor = {0,0,255})}), Documentation(info = "<HTML>
<P>
The heating \"NPN or\" gate shows a heat flow always if a transistor is leading.
</P>
<P>
Simulate until T=200 s.
</P>
<P>
Plot in separate windows:<br> <br>
V1.v and V2.v and C2.v <br>
HeatCapacitor1.port.T and T1.heatPort.T and T2.heatPort.T<br>
T1.heatPort.Q_flow and T2.heatPort.Q_flow<br>
</P>

</HTML>
", revisions = "<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 6, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"), Documentation(info = "<HTML>
<P>
The heating NPN nand gate shows a heat flow always if a transistor is leading.
</P>
<P>
Simulate until T=200 s.
</P>
<P>
Plot in separate windows:<br> <br>
V1.v and V2.v and C2.v <br>
HeatCapacitor1.port.T and T1.heatPort.T and T2.heatPort.T<br>
T1.heatPort.Q_flow and T2.heatPort.Q_flow<br>
</P>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 6, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</HTML>
"), experiment(StopTime = 200));
    end HeatingNPN_OrGate;
    model HeatingRectifier "Heating rectifier"
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Semiconductors.HeatingDiode HeatingDiode1(useHeatPort = true) annotation(Placement(transformation(extent = {{-20,40},{0,60}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground G annotation(Placement(transformation(extent = {{-80,0},{-60,20}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage1(V = 1, freqHz = 1) annotation(Placement(transformation(origin = {-70,40}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Capacitor Capacitor1(C = 1) annotation(Placement(transformation(extent = {{20,40},{40,60}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Components.HeatCapacitor HeatCapacitor1(C = 1) annotation(Placement(transformation(origin = {-10,-50}, extent = {{-10,-10},{10,10}}, rotation = 180)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor ThermalConductor1(G = 10) annotation(Placement(transformation(origin = {-10,-10}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Resistor R(R = 1) annotation(Placement(transformation(extent = {{20,70},{40,90}}, rotation = 0)));
    equation
      connect(SineVoltage1.p,HeatingDiode1.p) annotation(Line(points = {{-70,50},{-20,50}}, color = {0,0,255}));
      connect(SineVoltage1.n,G.p) annotation(Line(points = {{-70,30},{-70,20}}, color = {0,0,255}));
      connect(Capacitor1.n,G.p) annotation(Line(points = {{40,50},{40,20},{-70,20}}, color = {0,0,255}));
      connect(HeatingDiode1.n,Capacitor1.p) annotation(Line(points = {{0,50},{20,50}}, color = {0,0,255}));
      connect(HeatingDiode1.heatPort,ThermalConductor1.port_a) annotation(Line(points = {{-10,40},{-10,20},{-10,0},{-10,0}}, color = {191,0,0}));
      connect(ThermalConductor1.port_b,HeatCapacitor1.port) annotation(Line(points = {{-10,-20},{-10,-25.75},{-10,-40},{-10,-40}}, color = {191,0,0}));
      connect(R.p,Capacitor1.p) annotation(Line(points = {{20,80},{20,50}}, color = {0,0,255}));
      connect(R.n,Capacitor1.n) annotation(Line(points = {{40,80},{40,50}}, color = {0,0,255}));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-94,102},{0,74}}, textString = "HeatingRectifier", lineColor = {0,0,255})}), Documentation(info = "<HTML>
<P>
The heating rectifier shows a heat flow always if the electrical capacitor is loaded.
</P>
<P>
Simulate until T=5 s.
</P>
<P>
Plot in separate windows:<br> <br>
SineVoltage1.v  and  Capacitor1.p.v <br>
HeatCapacitor1.port.T and HeatingDiode1.heatPort.T<br>
HeatingDiode1.heatPort.Q_flow<br>
</P>

</HTML>
", revisions = "<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 6, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"), Documentation(info = "<HTML>
<P>
The heating rectifier shows a heat flow always if the electrical capacitor is loaded.
</P>
<P>
Simulate until T=5 s.
</P>
<P>
Plot in separate windows:<br> <br>
SineVoltage1.v  and  Capacitor1.p.v <br>
HeatCapacitor1.port.T and HeatingDiode1.heatPort.T<br>
HeatingDiode1.heatPort.Q_flow<br>
</P>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 6, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</HTML>
"), experiment(StopTime = 5));
    end HeatingRectifier;
    model HeatingResistor "Heating resistor"
      extends Modelica.Icons.Example;
      Basic.HeatingResistor heatingResistor(R_ref = 100, alpha = 0.001, T_ref = 293.15) annotation(Placement(transformation(extent = {{-10,10},{10,-10}}, rotation = -90, origin = {-32,34})));
      Modelica.Electrical.Analog.Basic.Ground G annotation(Placement(transformation(extent = {{-80,0},{-60,20}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage1(V = 220, freqHz = 1) annotation(Placement(transformation(origin = {-70,40}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = 50) annotation(Placement(transformation(origin = {4,34}, extent = {{-10,-10},{10,10}}, rotation = 0)));
      Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T = 20) annotation(Placement(transformation(extent = {{52,24},{32,44}})));
    equation
      connect(SineVoltage1.n,G.p) annotation(Line(points = {{-70,30},{-70,20}}, color = {0,0,255}));
      connect(heatingResistor.heatPort,thermalConductor.port_a) annotation(Line(points = {{-22,34},{-6,34}}, color = {191,0,0}));
      connect(SineVoltage1.p,heatingResistor.p) annotation(Line(points = {{-70,50},{-32,50},{-32,44}}, color = {0,0,255}, smooth = Smooth.None));
      connect(G.p,heatingResistor.n) annotation(Line(points = {{-70,20},{-32,20},{-32,24}}, color = {0,0,255}, smooth = Smooth.None));
      connect(thermalConductor.port_b,fixedTemperature.port) annotation(Line(points = {{14,34},{32,34}}, color = {191,0,0}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-94,102},{0,74}}, textString = "HeatingRectifier", lineColor = {0,0,255})}), Documentation(info = "<HTML>
<P>
This is a very simple circuit consisting of a voltage source and a resistor.
The loss power in the resistor is transported to the environment via its heatPort.
</P>

</HTML>
"), Documentation(info = "<HTML>
<P>
The heating rectifier shows a heat flow always if the electrical capacitor is loaded.
</P>
<P>
Simulate until T=5 s.
</P>
<P>
Plot in separate windows:<br> <br>
SineVoltage1.v  and  Capacitor1.p.v <br>
HeatCapacitor1.port.T and HeatingDiode1.heatPort.T<br>
HeatingDiode1.heatPort.Q_flow<br>
</P>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 6, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</HTML>
"), experiment(StopTime = 5));
    end HeatingResistor;
    encapsulated model NandGate "CMOS NAND Gate (see Tietze/Schenk, page 157)"
      import Modelica.Electrical.Analog.Basic;
      import Modelica.Electrical.Analog.Sources;
      import Modelica.Electrical.Analog.Examples.Utilities;
      import Modelica.Icons;
      extends Icons.Example;
      Sources.TrapezoidVoltage VIN1(V = 3.5, startTime = 2e-008, rising = 1e-009, width = 1.9e-008, falling = 1e-009, period = 4e-008) annotation(Placement(transformation(origin = {-70,20}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Sources.TrapezoidVoltage VIN2(V = 3.5, startTime = 1e-008, rising = 1e-009, width = 1.9e-008, falling = 1e-009, period = 4e-008) annotation(Placement(transformation(origin = {-70,-30}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Sources.RampVoltage VDD(V = 5, duration = 1e-009) annotation(Placement(transformation(origin = {50,70}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Basic.Ground Gnd1 annotation(Placement(transformation(extent = {{45,43},{55,53}}, rotation = 0)));
      Basic.Ground Gnd4 annotation(Placement(transformation(extent = {{-75,-5},{-65,5}}, rotation = 0)));
      Basic.Ground Gnd5 annotation(Placement(transformation(extent = {{-75,-55},{-65,-45}}, rotation = 0)));
      Utilities.Nand Nand annotation(Placement(transformation(extent = {{-40,-45},{40,55}}, rotation = 0)));
    equation
      connect(VDD.n,Gnd1.p) annotation(Line(points = {{50,60},{50,53}}));
      connect(VIN1.n,Gnd4.p) annotation(Line(points = {{-70,10},{-70,5}}));
      connect(VIN2.n,Gnd5.p) annotation(Line(points = {{-70,-40},{-70,-45}}));
      connect(Nand.Vdd,VDD.p) annotation(Line(points = {{0,55},{0,90},{50,90},{50,80}}));
      connect(VIN1.p,Nand.x1) annotation(Line(points = {{-70,30},{-40,30}}));
      connect(VIN2.p,Nand.x2) annotation(Line(points = {{-70,-20},{-40,-20}}));
      annotation(Icon(graphics), Documentation(info = "<html>
<p>
The nand gate is a basic CMOS building block. It consists of four CMOS transistors.
The output voltage Nand.y.v is low if and only if the two input voltages at Nand.x1.v and Nand.x2.v
are both high. In this way the nand functionality is realized.
<p>
The simulation end time should be set to 1e-7. Please  plot the input voltages Nand.x1.v,
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
", revisions = "<html>
<dl>
<dt>
<b>Main Authors:</b>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
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
</html>"), experiment(StopTime = 1e-007), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-90,98},{-12,66}}, lineColor = {0,0,255}, textString = "NAND Gate")}));
    end NandGate;
    model OvervoltageProtection
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(offset = 0, V = 10, freqHz = 5) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-66,6})));
      Modelica.Electrical.Analog.Basic.Resistor Rv(R = 20) annotation(Placement(transformation(extent = {{-56,32},{-36,52}})));
      Modelica.Electrical.Analog.Basic.Resistor RL(R = 2000) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {26,4})));
      Modelica.Electrical.Analog.Semiconductors.ZDiode zDiode_1 annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 90, origin = {-20,-10})));
      Modelica.Electrical.Analog.Semiconductors.ZDiode zDiode_2 annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-20,22})));
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent = {{-30,-82},{-10,-62}})));
      Modelica.Electrical.Analog.Basic.Capacitor CL(C = 1e-007) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {62,4})));
    equation
      connect(sineVoltage.p,Rv.p) annotation(Line(points = {{-66,16},{-66,42},{-56,42}}, color = {0,0,255}, smooth = Smooth.None));
      connect(Rv.n,zDiode_2.p) annotation(Line(points = {{-36,42},{-20,42},{-20,32}}, color = {0,0,255}, smooth = Smooth.None));
      connect(RL.p,zDiode_2.p) annotation(Line(points = {{26,14},{26,42},{-20,42},{-20,32}}, color = {0,0,255}, smooth = Smooth.None));
      connect(RL.n,zDiode_1.p) annotation(Line(points = {{26,-6},{26,-40},{-20,-40},{-20,-20}}, color = {0,0,255}, smooth = Smooth.None));
      connect(zDiode_1.n,zDiode_2.n) annotation(Line(points = {{-20,0},{-20,6},{-20,12},{-20,12}}, color = {0,0,255}, smooth = Smooth.None));
      connect(sineVoltage.n,zDiode_1.p) annotation(Line(points = {{-66,-4},{-66,-40},{-20,-40},{-20,-20}}, color = {0,0,255}, smooth = Smooth.None));
      connect(ground.p,zDiode_1.p) annotation(Line(points = {{-20,-62},{-20,-20}}, color = {0,0,255}, smooth = Smooth.None));
      connect(RL.p,CL.p) annotation(Line(points = {{26,14},{62,14}}, color = {0,0,255}, smooth = Smooth.None));
      connect(RL.n,CL.n) annotation(Line(points = {{26,-6},{62,-6}}, color = {0,0,255}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics), experiment(StopTime = 0.4), Documentation(info = "<html>
This example is a simple circuit for overvoltage protection. If the voltage zDiode_1.n.v is too high, the Diode zDiode_2 breaks through and the voltage gets down.<br>
The simulation end time should be set to 0.4. To get the typical behaviour please plot sineVoltage.p.v, RL.p.v, zDiode_2.n.v and zDiode_1.n.i.
</html>", revisions = "<html>
<ul>
<li><i>February 02, 2009</i>
       by Kristin Majetta<br>
       documentation added</li>
<li><i> January 08, 2009   </i>
        by Matthias Franke <br>initially implemented
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Rectangle(extent = {{-100,-100},{80,50}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Polygon(points = {{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Polygon(points = {{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Text(extent = {{-96,3},{77,-49}}, lineColor = {0,0,255}, textString = "Example"),Text(extent = {{-120,132},{120,73}}, lineColor = {255,0,0}, textString = "%name")}));
    end OvervoltageProtection;
    model Rectifier "B6 diode bridge"
      extends Modelica.Icons.Example;
      import Modelica.Electrical.Analog.Ideal;
      parameter Modelica.SIunits.Voltage VAC = 400 "RMS line-to-line";
      parameter Modelica.SIunits.Frequency f = 50 "line frequency";
      parameter Modelica.SIunits.Inductance LAC = 6e-005 "line inductor";
      parameter Modelica.SIunits.Resistance Ron = 0.001 "diode forward resistance";
      parameter Modelica.SIunits.Conductance Goff = 0.001 "diode backward conductance";
      parameter Modelica.SIunits.Voltage Vknee = 2 "diode threshold voltage";
      parameter Modelica.SIunits.Capacitance CDC = 0.015 "DC capacitance";
      parameter Modelica.SIunits.Current IDC = 500 "load current";
      output Modelica.SIunits.Voltage uDC;
      output Modelica.SIunits.Current iAC[3];
      output Modelica.SIunits.Voltage uAC[3];
      output Modelica.SIunits.Power Losses;
      Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage1(freqHz = f, V = VAC * sqrt(2 / 3)) annotation(Placement(transformation(extent = {{-70,10},{-90,30}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage2(freqHz = f, phase = -2 / 3 * Modelica.Constants.pi, V = VAC * sqrt(2 / 3)) annotation(Placement(transformation(extent = {{-70,-10},{-90,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage3(freqHz = f, phase = -4 / 3 * Modelica.Constants.pi, V = VAC * sqrt(2 / 3)) annotation(Placement(transformation(extent = {{-70,-30},{-90,-10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor Inductor1(L = LAC) annotation(Placement(transformation(extent = {{-60,10},{-40,30}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor Inductor2(L = LAC) annotation(Placement(transformation(extent = {{-60,-10},{-40,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Inductor Inductor3(L = LAC) annotation(Placement(transformation(extent = {{-60,-30},{-40,-10}}, rotation = 0)));
      Ideal.IdealDiode IdealDiode1(Ron = Ron, Goff = Goff, Vknee = Vknee) annotation(Placement(transformation(origin = {-20,40}, extent = {{-10,-10},{10,10}}, rotation = 90)));
      Ideal.IdealDiode IdealDiode2(Ron = Ron, Goff = Goff, Vknee = Vknee) annotation(Placement(transformation(origin = {0,40}, extent = {{-10,-10},{10,10}}, rotation = 90)));
      Ideal.IdealDiode IdealDiode3(Ron = Ron, Goff = Goff, Vknee = Vknee) annotation(Placement(transformation(origin = {20,40}, extent = {{-10,-10},{10,10}}, rotation = 90)));
      Ideal.IdealDiode IdealDiode4(Ron = Ron, Goff = Goff, Vknee = Vknee) annotation(Placement(transformation(origin = {-20,-40}, extent = {{-10,-10},{10,10}}, rotation = 90)));
      Ideal.IdealDiode IdealDiode5(Ron = Ron, Goff = Goff, Vknee = Vknee) annotation(Placement(transformation(origin = {0,-40}, extent = {{-10,-10},{10,10}}, rotation = 90)));
      Ideal.IdealDiode IdealDiode6(Ron = Ron, Goff = Goff, Vknee = Vknee) annotation(Placement(transformation(origin = {20,-40}, extent = {{-10,-10},{10,10}}, rotation = 90)));
      Modelica.Electrical.Analog.Basic.Capacitor Capacitor1(C = 2 * CDC) annotation(Placement(transformation(origin = {40,40}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Capacitor Capacitor2(C = 2 * CDC) annotation(Placement(transformation(origin = {40,-40}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(transformation(extent = {{40,-80},{60,-60}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SignalCurrent SignalCurrent1 annotation(Placement(transformation(origin = {60,0}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Blocks.Sources.Constant Constant1(k = IDC) annotation(Placement(transformation(extent = {{100,-10},{80,10}}, rotation = 0)));
    initial equation
      Capacitor1.v = (VAC * sqrt(2)) / 2;
      Capacitor2.v = (VAC * sqrt(2)) / 2;
    equation
      uDC = Capacitor1.v + Capacitor2.v;
      iAC = {Inductor1.i,Inductor2.i,Inductor3.i};
      uAC[1] = Inductor1.n.v - Inductor2.n.v;
      uAC[2] = Inductor2.n.v - Inductor3.n.v;
      uAC[3] = Inductor3.n.v - Inductor1.n.v;
      Losses = IdealDiode1.v * IdealDiode1.i + IdealDiode2.v * IdealDiode2.i + IdealDiode3.v * IdealDiode3.i + IdealDiode4.v * IdealDiode4.i + IdealDiode5.v * IdealDiode5.i + IdealDiode6.v * IdealDiode6.i;
      connect(SineVoltage1.n,SineVoltage2.n) annotation(Line(points = {{-90,20},{-90,0}}, color = {0,0,255}));
      connect(SineVoltage2.n,SineVoltage3.n) annotation(Line(points = {{-90,0},{-90,-20}}, color = {0,0,255}));
      connect(SineVoltage1.p,Inductor1.p) annotation(Line(points = {{-70,20},{-60,20}}, color = {0,0,255}));
      connect(SineVoltage2.p,Inductor2.p) annotation(Line(points = {{-70,0},{-60,0}}, color = {0,0,255}));
      connect(SineVoltage3.p,Inductor3.p) annotation(Line(points = {{-70,-20},{-60,-20}}, color = {0,0,255}));
      connect(IdealDiode1.p,IdealDiode4.n) annotation(Line(points = {{-20,30},{-20,-30}}, color = {0,0,255}));
      connect(IdealDiode2.p,IdealDiode5.n) annotation(Line(points = {{-6.12323e-016,30},{-6.12323e-016,16},{0,0},{0,-30},{6.12323e-016,-30}}, color = {0,0,255}));
      connect(IdealDiode3.p,IdealDiode6.n) annotation(Line(points = {{20,30},{20,-30}}, color = {0,0,255}));
      connect(IdealDiode1.n,IdealDiode2.n) annotation(Line(points = {{-20,50},{6.12323e-016,50}}, color = {0,0,255}));
      connect(IdealDiode2.n,IdealDiode3.n) annotation(Line(points = {{6.12323e-016,50},{20,50}}, color = {0,0,255}));
      connect(IdealDiode4.p,IdealDiode5.p) annotation(Line(points = {{-20,-50},{-6.12323e-016,-50}}, color = {0,0,255}));
      connect(IdealDiode5.p,IdealDiode6.p) annotation(Line(points = {{-6.12323e-016,-50},{20,-50}}, color = {0,0,255}));
      connect(Capacitor2.n,IdealDiode6.p) annotation(Line(points = {{40,-50},{20,-50}}, color = {0,0,255}));
      connect(IdealDiode3.n,Capacitor1.p) annotation(Line(points = {{20,50},{40,50}}, color = {0,0,255}));
      connect(Capacitor1.n,Capacitor2.p) annotation(Line(points = {{40,30},{40,-30}}, color = {0,0,255}));
      connect(Capacitor2.p,Ground1.p) annotation(Line(points = {{40,-30},{40,0},{50,0},{50,-60}}, color = {0,0,255}));
      connect(Capacitor1.p,SignalCurrent1.p) annotation(Line(points = {{40,50},{60,50},{60,10}}, color = {0,0,255}));
      connect(SignalCurrent1.n,Capacitor2.n) annotation(Line(points = {{60,-10},{60,-50},{40,-50}}, color = {0,0,255}));
      connect(Constant1.y,SignalCurrent1.i) annotation(Line(points = {{79,0},{79,-1.28588e-015},{67,-1.28588e-015}}, color = {0,0,255}));
      connect(Inductor1.n,IdealDiode1.p) annotation(Line(points = {{-40,20},{-20,20},{-20,30}}, color = {0,0,255}));
      connect(Inductor2.n,IdealDiode2.p) annotation(Line(points = {{-40,0},{-6.12323e-016,0},{-6.12323e-016,30}}, color = {0,0,255}));
      connect(Inductor3.n,IdealDiode3.p) annotation(Line(points = {{-40,-20},{20,-20},{20,30}}, color = {0,0,255}));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-80,90},{80,70}}, lineColor = {0,0,0}, textString = "Rectifier"),Line(points = {{-16,18},{-16,2},{-18,6},{-14,6},{-16,2}}, color = {0,0,0}),Line(points = {{-30,22},{-26,20},{-30,18},{-30,22}}, color = {0,0,0}),Line(points = {{32,30},{32,-30},{30,-26},{34,-26},{32,-30}}, color = {0,0,0}),Text(extent = {{-38,16},{-22,8}}, lineColor = {0,0,0}, textString = "iAC"),Text(extent = {{-14,8},{2,0}}, lineColor = {0,0,0}, textString = "uAC"),Text(extent = {{22,-16},{38,-24}}, lineColor = {0,0,0}, textString = "uDC")}), experiment(StopTime = 0.1, Interval = 1e-005), Documentation(info = "<HTML>
<P>
The rectifier example shows a B6 diode bridge fed by a three phase sinusoidal voltage, loaded by a DC current.<br>
DC capacitors start at ideal no-load voltage, thus making easier initial transient.
</P>
<P>
Simulate until T=0.1 s.<br><br>
Plot in separate windows:<br><br>
uDC ... DC-voltage<br>
iAC ... AC-currents 1..3<br>
uAC ... AC-voltages 1..3 (distorted)<br>
Try different load currents iDC = 0..approximately 500 A.
</P>
<p>
You may watch Losses (of the whole diode bridge) trying different diode parameters.
</p>

</HTML>
", revisions = "<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 7, 2004   </i>
       by Anton Haumer<br> realized<br>
       </li>
</ul>
</html>"));
    end Rectifier;
    model ShowSaturatingInductor "Simple demo to show behaviour of SaturatingInductor component"
      extends Modelica.Icons.Example;
      parameter Modelica.SIunits.Inductance Lzer = 2 "Inductance near current=0";
      parameter Modelica.SIunits.Inductance Lnom = 1 "Nominal inductance at Nominal current";
      parameter Modelica.SIunits.Current Inom = 1 "Nominal current";
      parameter Modelica.SIunits.Inductance Linf = 0.5 "Inductance at large currents";
      parameter Modelica.SIunits.Voltage U = 1.25 "source voltage (peak)";
      parameter Modelica.SIunits.Frequency f = 1 / (2 * Modelica.Constants.pi) "source frequency";
      parameter Modelica.SIunits.Angle phase = Modelica.Constants.pi / 2 "source voltage phase shift";
      output Modelica.SIunits.Voltage v "voltage drop over saturating inductor";
      output Modelica.SIunits.Current i "current across saturating inductor";
      Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage1(V = U, phase = phase, freqHz = f) annotation(Placement(transformation(origin = {-20,0}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(transformation(extent = {{-30,-30},{-10,-10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.SaturatingInductor SaturatingInductance1(Lzer = Lzer, Lnom = Lnom, Inom = Inom, Linf = Linf) annotation(Placement(transformation(origin = {22,6}, extent = {{-10,-10},{10,10}}, rotation = 270)));
    equation
      v = SaturatingInductance1.v;
      i = SaturatingInductance1.i;
      connect(SineVoltage1.n,Ground1.p) annotation(Line(points = {{-20,-10},{-20,-10}}, color = {0,0,255}));
      connect(SineVoltage1.n,SaturatingInductance1.n) annotation(Line(points = {{-20,-10},{22,-10},{22,-4}}, color = {0,0,255}));
      connect(SaturatingInductance1.p,SineVoltage1.p) annotation(Line(points = {{22,16},{22,26},{-20,26},{-20,10}}, color = {0,0,255}));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-80,84},{70,38}}, lineColor = {0,0,255}, textString = "Show Saturating Inductor")}), experiment(StopTime = 6.2832, Interval = 0.01), Documentation(info = "<html>

</html>"));
    end ShowSaturatingInductor;
    model ShowVariableResistor "Simple demo of a VariableResistor model"
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.VariableResistor VariableResistor annotation(Placement(transformation(extent = {{-20,-20},{0,0}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(transformation(extent = {{-100,-80},{-80,-60}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground Ground2 annotation(Placement(transformation(extent = {{60,-40},{80,-20}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R1 annotation(Placement(transformation(extent = {{-60,40},{-40,60}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R2 annotation(Placement(transformation(extent = {{-20,40},{0,60}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R3 annotation(Placement(transformation(extent = {{20,40},{40,60}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R4 annotation(Placement(transformation(extent = {{-60,-20},{-40,0}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor R5 annotation(Placement(transformation(extent = {{20,-20},{40,0}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage1 annotation(Placement(transformation(origin = {-90,-30}, extent = {{-10,-10},{10,10}}, rotation = 90)));
      Modelica.Blocks.Sources.Ramp Ramp1(height = 5, offset = 2) annotation(Placement(transformation(origin = {-10,20}, extent = {{-10,-10},{10,10}}, rotation = 270)));
    equation
      connect(R1.n,R2.p) annotation(Line(points = {{-40,50},{-20,50}}, color = {0,0,255}));
      connect(R2.n,R3.p) annotation(Line(points = {{0,50},{20,50}}, color = {0,0,255}));
      connect(R4.n,VariableResistor.p) annotation(Line(points = {{-40,-10},{-20,-10}}, color = {0,0,255}));
      connect(VariableResistor.n,R5.p) annotation(Line(points = {{0,-10},{20,-10}}, color = {0,0,255}));
      connect(R3.n,Ground2.p) annotation(Line(points = {{40,50},{70,50},{70,-20}}, color = {0,0,255}));
      connect(Ground2.p,R5.n) annotation(Line(points = {{70,-20},{70,-10},{40,-10}}, color = {0,0,255}));
      connect(SineVoltage1.p,Ground1.p) annotation(Line(points = {{-90,-40},{-90,-60}}, color = {0,0,255}));
      connect(SineVoltage1.n,R1.p) annotation(Line(points = {{-90,-20},{-90,50},{-60,50}}, color = {0,0,255}));
      connect(SineVoltage1.n,R4.p) annotation(Line(points = {{-90,-20},{-90,-10},{-60,-10}}, color = {0,0,255}));
      connect(Ramp1.y,VariableResistor.R) annotation(Line(points = {{-10,9},{-10,4.5},{-10,1},{-10,1}}, color = {0,0,255}));
      annotation(Documentation(info = "<HTML>
<P>
It is a simple test circuit for the VariableResistor. The VariableResistor
sould be compared with R2.
</P>
<P>
Simulate until T=1 s.
</P>
<P>

</HTML>
", revisions = "<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 6, 2004   </i>
       by Teresa Schlegel<br> realized<br>
       </li>
</ul>
</html>"), experiment(StopTime = 1), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-100,112},{80,40}}, lineColor = {0,0,255}, textString = "Example VariableResistor")}), Diagram);
    end ShowVariableResistor;
    model SwitchWithArc
      extends Modelica.Icons.Example;
      Modelica.Blocks.Sources.BooleanPulse booleanPulse annotation(Placement(transformation(extent = {{-80,-30},{-60,-10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(extent = {{20,-20},{40,0}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(V = 50) annotation(Placement(transformation(origin = {-20,20}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Inductor inductor1(L = 0.1) annotation(Placement(transformation(extent = {{40,30},{60,50}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor resistor1 annotation(Placement(transformation(origin = {80,20}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Ideal.IdealClosingSwitch switch1 annotation(Placement(transformation(extent = {{0,30},{20,50}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Ground ground2 annotation(Placement(transformation(extent = {{20,-100},{40,-80}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage2(V = 50) annotation(Placement(transformation(origin = {-20,-60}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Basic.Inductor inductor2(L = 0.1) annotation(Placement(transformation(extent = {{40,-50},{60,-30}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.Resistor resistor2 annotation(Placement(transformation(origin = {80,-60}, extent = {{-10,-10},{10,10}}, rotation = 270)));
      Modelica.Electrical.Analog.Ideal.CloserWithArc switch2 annotation(Placement(transformation(extent = {{0,-50},{20,-30}}, rotation = 0)));
    equation
      connect(inductor1.n,resistor1.p) annotation(Line(points = {{60,40},{80,40},{80,30}}, color = {0,0,255}));
      connect(resistor1.n,ground1.p) annotation(Line(points = {{80,10},{80,0},{30,0}}, color = {0,0,255}));
      connect(constantVoltage1.n,ground1.p) annotation(Line(points = {{-20,10},{-20,0},{30,0}}, color = {0,0,255}));
      connect(switch1.n,inductor1.p) annotation(Line(points = {{20,40},{40,40}}, color = {0,0,255}));
      connect(constantVoltage1.p,switch1.p) annotation(Line(points = {{-20,30},{-20,40},{0,40}}, color = {0,0,255}));
      connect(inductor2.n,resistor2.p) annotation(Line(points = {{60,-40},{80,-40},{80,-50}}, color = {0,0,255}));
      connect(resistor2.n,ground2.p) annotation(Line(points = {{80,-70},{80,-80},{30,-80}}, color = {0,0,255}));
      connect(constantVoltage2.n,ground2.p) annotation(Line(points = {{-20,-70},{-20,-80},{30,-80}}, color = {0,0,255}));
      connect(switch2.n,inductor2.p) annotation(Line(points = {{20,-40},{40,-40}}, color = {0,0,255}));
      connect(constantVoltage2.p,switch2.p) annotation(Line(points = {{-20,-50},{-20,-40},{0,-40}}, color = {0,0,255}));
      connect(booleanPulse.y,switch1.control) annotation(Line(points = {{-59,-20},{-40,-20},{-40,60},{10,60},{10,47}}, color = {255,0,255}));
      connect(booleanPulse.y,switch2.control) annotation(Line(points = {{-59,-20},{10,-20},{10,-30}}, color = {255,0,255}));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-100,80},{100,60}}, lineColor = {0,0,255}, textString = "Compare voltage and current of inductor1 and inductor2")}), experiment(StopTime = 2, Interval = 0.00025, Tolerance = 1e-006), Documentation(info = "<html>
<P>
This example is to compare the behaviour of switch models with
and without an electric arc taking into consideration.<br><br>

</P>
<P>
Simulate until T=2 s.
</P>
<P>
Plot in one windows:<br> <br>
switch1.i and switch2.i <br><br>

The difference in the closing area shows that the simple arc model avoids
the suddenly switching.

</P>
</html>", revisions = "<html>
<ul>
<li><i>May, 2009   </i>
       by Anton Haumer<br> initially realized<br>
       </li>
</ul>
</html>"));
    end SwitchWithArc;
    model ThyristorBehaviourTest
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent = {{18,-40},{38,-20}})));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V = 30, freqHz = 10000) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-72,4})));
      Modelica.Electrical.Analog.Basic.Resistor resistor(R = 10) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {8,20})));
      Modelica.Electrical.Analog.Sources.PulseCurrent pulseCurrent(width = 10, period = 0.0001, startTime = 2e-005, I = 0.005) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 180, origin = {-8,70})));
      Modelica.Electrical.Analog.Semiconductors.Thyristor thyristor_v4_1 annotation(Placement(transformation(extent = {{-44,30},{-24,50}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor(L = 2e-006) annotation(Placement(transformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {8,-4})));
    equation
      connect(sineVoltage.n,ground.p) annotation(Line(points = {{-72,-6},{-72,-20},{28,-20}}, color = {0,0,255}, smooth = Smooth.None));
      connect(sineVoltage.p,thyristor_v4_1.Anode) annotation(Line(points = {{-72,14},{-72,40},{-43,40}}, color = {0,0,255}, smooth = Smooth.None));
      connect(resistor.p,thyristor_v4_1.Cathode) annotation(Line(points = {{8,30},{8,40},{-25,40}}, color = {0,0,255}, smooth = Smooth.None));
      connect(pulseCurrent.n,thyristor_v4_1.Gate) annotation(Line(points = {{-18,70},{-26,70},{-26,49},{-27,49}}, color = {0,0,255}, smooth = Smooth.None));
      connect(resistor.p,pulseCurrent.p) annotation(Line(points = {{8,30},{8,70},{2,70}}, color = {0,0,255}, smooth = Smooth.None));
      connect(resistor.n,inductor.p) annotation(Line(points = {{8,10},{8,8},{8,6},{8,6}}, color = {0,0,255}, smooth = Smooth.None));
      connect(inductor.n,ground.p) annotation(Line(points = {{8,-14},{8,-20},{28,-20}}, color = {0,0,255}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics), experiment(StopTime = 0.0002), Documentation(info = "<html>
This is a simple testcircuit, to test the behavior of the thysistor model. <br>
Interesting values to plot are Cathode.v, Gate.v and sineVoltage.p.v. and in another plot window pulseCurrent.p.i<br>
The simulation time should be trom 0 seconds to 2e-4 seconds.
</html>"), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Polygon(points = {{100,72},{100,-78},{80,-98},{80,52},{100,72}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Polygon(points = {{-100,52},{-80,72},{100,72},{80,52},{-100,52}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Rectangle(extent = {{-100,-98},{80,52}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Text(extent = {{-96,5},{77,-47}}, lineColor = {0,0,255}, textString = "Example"),Text(extent = {{-120,134},{120,75}}, lineColor = {255,0,0}, textString = "%name")}));
    end ThyristorBehaviourTest;
  end Examples;
  package Basic "Basic electrical components such as resistor, capacitor, transformer"
    extends Modelica.Icons.Library;
    model Ground "Ground node"
      Interfaces.Pin p annotation(Placement(transformation(origin = {0,100}, extent = {{10,-10},{-10,10}}, rotation = 270)));
    equation
      p.v = 0;
      annotation(Documentation(info = "<HTML>
<P>
Ground of an electrical circuit. The potential at the
ground node is zero. Every electrical circuit has to contain
at least one ground object.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Line(points = {{-60,50},{60,50}}, color = {0,0,255}),Line(points = {{-40,30},{40,30}}, color = {0,0,255}),Line(points = {{-20,10},{20,10}}, color = {0,0,255}),Line(points = {{0,90},{0,50}}, color = {0,0,255}),Text(extent = {{-144,-19},{156,-59}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Line(points = {{-60,50},{60,50}}, thickness = 0.5, color = {0,0,255}),Line(points = {{-40,30},{40,30}}, thickness = 0.5, color = {0,0,255}),Line(points = {{-20,10},{20,10}}, thickness = 0.5, color = {0,0,255}),Line(points = {{0,96},{0,50}}, thickness = 0.5, color = {0,0,255}),Text(extent = {{-24,-38},{22,-6}}, textString = "p.v=0", lineColor = {0,0,255})}));
    end Ground;
    model Resistor "Ideal linear electrical resistor"
      parameter Modelica.SIunits.Resistance R(start = 1) "Resistance at temperature T_ref";
      parameter Modelica.SIunits.Temperature T_ref = 300.15 "Reference temperature";
      parameter Modelica.SIunits.LinearTemperatureCoefficient alpha = 0 "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = T_ref);
      Modelica.SIunits.Resistance R_actual "Actual resistance = R*(1 + alpha*(T_heatPort - T_ref))";
    equation
      assert(1 + alpha * (T_heatPort - T_ref) >= Modelica.Constants.eps, "Temperature outside scope of model!");
      R_actual = R * (1 + alpha * (T_heatPort - T_ref));
      v = R_actual * i;
      LossPower = v * i;
      annotation(Documentation(info = "<HTML>
<P>
The linear resistor connects the branch voltage <i>v</i> with the
branch current <i>i</i> by <i>i*R = v</i>.
The Resistance <i>R</i> is allowed to be positive, zero, or negative.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of resistance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Rectangle(extent = {{-70,30},{70,-30}}, lineColor = {0,0,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-90,0},{-70,0}}, color = {0,0,255}),Line(points = {{70,0},{90,0}}, color = {0,0,255}),Text(extent = {{-144,-40},{142,-72}}, lineColor = {0,0,0}, textString = "R=%R"),Line(visible = useHeatPort, points = {{0,-100},{0,-30}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot),Text(extent = {{-152,87},{148,47}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Rectangle(extent = {{-70,30},{70,-30}}, lineColor = {0,0,255}),Line(points = {{-96,0},{-70,0}}, color = {0,0,255}),Line(points = {{70,0},{96,0}}, color = {0,0,255})}));
    end Resistor;
    model HeatingResistor "Temperature dependent electrical resistor"
      parameter Modelica.SIunits.Resistance R_ref(start = 1) "Resistance at temperature T_ref";
      parameter Modelica.SIunits.Temperature T_ref = 300.15 "Reference temperature";
      parameter Modelica.SIunits.LinearTemperatureCoefficient alpha = 0 "Temperature coefficient of resistance (R = R_ref*(1 + alpha*(T_heatPort - T_ref))";
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = T_ref, useHeatPort = true);
      Modelica.SIunits.Resistance R "Resistance = R_ref*(1 + alpha*(T_heatPort - T_ref))";
    equation
      assert(1 + alpha * (T_heatPort - T_ref) >= Modelica.Constants.eps, "Temperature outside scope of model!");
      R = R_ref * (1 + alpha * (T_heatPort - T_ref));
      v = R * i;
      LossPower = v * i;
      annotation(__Dymola_structurallyIncomplete = true, Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Line(points = {{-110,20},{-85,20}}, color = {160,160,164}),Polygon(points = {{-95,23},{-85,20},{-95,17},{-95,23}}, lineColor = {160,160,164}, fillColor = {160,160,164}, fillPattern = FillPattern.Solid),Line(points = {{90,20},{115,20}}, color = {160,160,164}),Line(points = {{-125,0},{-115,0}}, color = {160,160,164}),Line(points = {{-120,-5},{-120,5}}, color = {160,160,164}),Text(extent = {{-110,25},{-90,45}}, lineColor = {160,160,164}, textString = "i"),Polygon(points = {{105,23},{115,20},{105,17},{105,23}}, lineColor = {160,160,164}, fillColor = {160,160,164}, fillPattern = FillPattern.Solid),Line(points = {{115,0},{125,0}}, color = {160,160,164}),Text(extent = {{90,45},{110,25}}, lineColor = {160,160,164}, textString = "i")}), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Line(points = {{-90,0},{-70,0}}, color = {0,0,255}),Line(points = {{70,0},{90,0}}, color = {0,0,255}),Rectangle(extent = {{-70,30},{70,-30}}, lineColor = {0,0,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-52,-50},{48,50}}, color = {0,0,255}),Polygon(points = {{40,52},{50,42},{54,56},{40,52}}, lineColor = {0,0,255}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid),Line(visible = useHeatPort, points = {{0,-100},{0,-30}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot),Text(extent = {{-156,109},{144,69}}, textString = "%name", lineColor = {0,0,255})}), Documentation(info = "<HTML>
<p>This is a model for an electrical resistor where the generated heat
is dissipated to the environment via connector <b>heatPort</b> and where
the resistance R is temperature dependent according to the following
equation:</p>
<pre>    R = R_ref*(1 + alpha*(heatPort.T - T_ref))
</pre>
<p><b>alpha</b> is the <b>temperature coefficient of resistance</b>, which
is often abbreviated as <b>TCR</b>. In resistor catalogues, it is usually
defined as <b>X [ppm/K]</b> (parts per million, similarly to per centage)
meaning <b>X*1.e-6 [1/K]</b>. Resistors are available for 1 .. 7000 ppm/K,
i.e., alpha = 1e-6 .. 7e-3 1/K;</p>

<p>
Via parameter <b>useHeatPort</b> the heatPort connector can be enabled and disabled
(default = enabled). If it is disabled, the generated heat is transported implicitly
to an internal temperature source with a fixed temperature of T_ref.<br>
If the heatPort connector is enabled, it must be connected.
</p>

</HTML>
", revisions = "<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of resistance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 2002   </i>
       by Anton Haumer<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end HeatingResistor;
    model Conductor "Ideal linear electrical conductor"
      parameter Modelica.SIunits.Conductance G(start = 1) "Conductance at temperature T_ref";
      parameter Modelica.SIunits.Temperature T_ref = 300.15 "Reference temperature";
      parameter Modelica.SIunits.LinearTemperatureCoefficient alpha = 0 "Temperature coefficient of conductance (G_actual = G/(1 + alpha*(T_heatPort - T_ref))";
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = T_ref);
      Modelica.SIunits.Conductance G_actual "Actual conductance = G/(1 + alpha*(T_heatPort - T_ref))";
    equation
      assert(1 + alpha * (T_heatPort - T_ref) >= Modelica.Constants.eps, "Temperature outside scope of model!");
      G_actual = G / (1 + alpha * (T_heatPort - T_ref));
      i = G_actual * v;
      LossPower = v * i;
      annotation(Documentation(info = "<HTML>
<P>
The linear conductor connects the branch voltage <i>v</i> with the
branch current <i>i</i> by <i>i = v*G</i>.
The Conductance <i>G</i> is allowed to be positive, zero, or negative.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of conductance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Rectangle(extent = {{-70,30},{70,-30}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Rectangle(extent = {{-70,30},{70,-30}}, lineColor = {0,0,255}),Line(points = {{-90,0},{-70,0}}, color = {0,0,255}),Line(points = {{70,0},{90,0}}, color = {0,0,255}),Text(extent = {{-136,-42},{142,-74}}, lineColor = {0,0,0}, pattern = LinePattern.None, textString = "G=%G"),Line(visible = useHeatPort, points = {{0,-100},{0,-30}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot),Text(extent = {{-152,87},{148,47}}, textString = "%name", lineColor = {0,0,255}),Text(extent = {{-144,-40},{142,-72}}, lineColor = {0,0,0}, textString = "G=%G")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Line(points = {{-96,0},{-70,0}}, color = {0,0,255}),Line(points = {{70,0},{96,0}}, color = {0,0,255}),Rectangle(extent = {{-70,30},{70,-30}}, lineColor = {0,0,255})}));
    end Conductor;
    model Capacitor "Ideal linear electrical capacitor"
      extends Interfaces.OnePort;
      parameter SI.Capacitance C(start = 1) "Capacitance";
    equation
      i = C * der(v);
      annotation(Documentation(info = "<HTML>
<p>
The linear capacitor connects the branch voltage <i>v</i> with the
branch current <i>i</i> by <i>i = C * dv/dt</i>.
The Capacitance <i>C</i> is allowed to be positive, zero, or negative.
</p>
</HTML>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Line(points = {{-14,28},{-14,-28}}, thickness = 0.5, color = {0,0,255}),Line(points = {{14,28},{14,-28}}, thickness = 0.5, color = {0,0,255}),Line(points = {{-90,0},{-14,0}}, color = {0,0,255}),Line(points = {{14,0},{90,0}}, color = {0,0,255}),Text(extent = {{-136,-60},{136,-92}}, lineColor = {0,0,0}, textString = "C=%C"),Text(extent = {{-150,85},{150,45}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Line(points = {{-20,40},{-20,-40}}, thickness = 0.5, color = {0,0,255}),Line(points = {{20,40},{20,-40}}, thickness = 0.5, color = {0,0,255}),Line(points = {{-96,0},{-20,0}}, color = {0,0,255}),Line(points = {{20,0},{96,0}}, color = {0,0,255})}));
    end Capacitor;
    model Inductor "Ideal linear electrical inductor"
      extends Interfaces.OnePort;
      parameter SI.Inductance L(start = 1) "Inductance";
    equation
      L * der(i) = v;
      annotation(Documentation(info = "<HTML>
<P>
The linear inductor connects the branch voltage <i>v</i> with the
branch current <i>i</i> by  <i>v = L * di/dt</i>.
The Inductance <i>L</i> is allowed to be positive, zero, or negative.
</p>
</HTML>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Ellipse(extent = {{-60,-15},{-30,15}}, lineColor = {0,0,255}),Ellipse(extent = {{-30,-15},{0,15}}, lineColor = {0,0,255}),Ellipse(extent = {{0,-15},{30,15}}, lineColor = {0,0,255}),Ellipse(extent = {{30,-15},{60,15}}, lineColor = {0,0,255}),Rectangle(extent = {{-60,-30},{60,0}}, lineColor = {255,255,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{60,0},{90,0}}, color = {0,0,255}),Line(points = {{-90,0},{-60,0}}, color = {0,0,255}),Text(extent = {{-138,-60},{144,-94}}, lineColor = {0,0,0}, textString = "L=%L"),Text(extent = {{-152,79},{148,39}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Ellipse(extent = {{-60,-15},{-30,15}}, lineColor = {0,0,255}),Ellipse(extent = {{-30,-15},{0,15}}, lineColor = {0,0,255}),Ellipse(extent = {{0,-15},{30,15}}, lineColor = {0,0,255}),Ellipse(extent = {{30,-15},{60,15}}, lineColor = {0,0,255}),Rectangle(extent = {{-60,-30},{60,0}}, lineColor = {255,255,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{60,0},{96,0}}, color = {0,0,255}),Line(points = {{-96,0},{-60,0}}, color = {0,0,255})}));
    end Inductor;
    model SaturatingInductor "Simple model of an inductor with saturation"
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      parameter Modelica.SIunits.Current Inom(start = 1) "Nominal current";
      parameter Modelica.SIunits.Inductance Lnom(start = 1) "Nominal inductance at Nominal current";
      parameter Modelica.SIunits.Inductance Lzer(start = 2 * Lnom) "Inductance near current=0";
      parameter Modelica.SIunits.Inductance Linf(start = Lnom / 2) "Inductance at large currents";
      Modelica.SIunits.Inductance Lact(start = Lzer);
      Modelica.SIunits.MagneticFlux Psi;
    protected
      parameter Modelica.SIunits.Current Ipar(start = Inom / 10, fixed = false);
    initial equation
      Lnom - Linf = ((Lzer - Linf) * Ipar) / Inom * (Modelica.Constants.pi / 2 - Modelica.Math.atan(Ipar / Inom));
    equation
      assert(Lzer > Lnom + Modelica.Constants.eps, "Lzer (= " + String(Lzer) + ") has to be > Lnom (= " + String(Lnom) + ")");
      assert(Linf < Lnom - Modelica.Constants.eps, "Linf (= " + String(Linf) + ") has to be < Lnom (= " + String(Lnom) + ")");
      ((Lact - Linf) * i) / Ipar = (Lzer - Linf) * noEvent(Modelica.Math.atan(i / Ipar));
      Psi = Lact * i;
      v = der(Psi);
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Ellipse(extent = {{-60,-15},{-30,15}}, lineColor = {0,0,255}),Ellipse(extent = {{-30,-15},{0,15}}, lineColor = {0,0,255}),Ellipse(extent = {{0,-15},{30,15}}, lineColor = {0,0,255}),Ellipse(extent = {{30,-15},{60,15}}, lineColor = {0,0,255}),Rectangle(extent = {{-60,-20},{62,0}}, lineColor = {255,255,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{60,0},{90,0}}, color = {0,0,255}),Line(points = {{-90,0},{-60,0}}, color = {0,0,255}),Rectangle(extent = {{-60,-10},{60,-20}}, lineColor = {0,0,0}, fillPattern = FillPattern.Sphere, fillColor = {0,0,255}),Text(extent = {{-148,-50},{152,-80}}, lineColor = {0,0,0}, textString = "Lnom=%Lnom"),Text(extent = {{-148,91},{152,51}}, textString = "%name", lineColor = {0,0,255})}), Documentation(info = "<HTML>
<p>
This model approximates the behaviour of an inductor with the influence of saturation,
i.e. the value of the inductance depends on the current flowing through the inductor.
The inductance decreases as current increases.<br>
The parameters are:
<ul>
<li>Inom...nominal current</li>
<li>Lnom...nominal inductance at nominal current</li>
<li>Lzer...inductance near current = 0; Lzer has to be greater than Lnom</li>
<li>Linf...inductance at large currents; Linf has to be less than Lnom</li>
</ul>
</p>
</HTML>
", revisions = "<html>
<dl>
<p>
  <dt><b>Main Author:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Release Notes:</b></dt>
  <dd>
  <ul>
  <li> May 27, 2004: Implemented by Anton Haumer</li>
  </ul>
  </dd>
</dl>
</html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Ellipse(extent = {{-60,-15},{-30,15}}, lineColor = {0,0,255}),Ellipse(extent = {{-30,-15},{0,15}}, lineColor = {0,0,255}),Ellipse(extent = {{0,-15},{30,15}}, lineColor = {0,0,255}),Ellipse(extent = {{30,-15},{60,15}}, lineColor = {0,0,255}),Rectangle(extent = {{-60,-20},{62,0}}, lineColor = {255,255,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{60,0},{96,0}}, color = {0,0,255}),Line(points = {{-96,0},{-60,0}}, color = {0,0,255}),Rectangle(extent = {{-60,-10},{60,-20}}, lineColor = {0,0,0}, fillPattern = FillPattern.Sphere, fillColor = {0,0,255})}));
    end SaturatingInductor;
    model Transformer "Transformer with two ports"
      extends Interfaces.TwoPort;
      parameter SI.Inductance L1(start = 1) "Primary inductance";
      parameter SI.Inductance L2(start = 1) "Secondary inductance";
      parameter SI.Inductance M(start = 1) "Coupling inductance";
    equation
      v1 = L1 * der(i1) + M * der(i2);
      v2 = M * der(i1) + L2 * der(i2);
      annotation(Documentation(info = "<HTML>
<p>The transformer is a two port. The left port voltage <i>v1</i>, left port current <i>i1</i>,
right port voltage <i>v2</i> and right port current <i>i2</i> are connected by the following
relation:</p>
<pre>         | v1 |         | L1   M  |  | i1' |
         |    |    =    |         |  |     |
         | v2 |         | M    L2 |  | i2' |</pre>
<p><i>L1</i>, <i>L2</i>, and <i>M</i> are the primary, secondary, and coupling inductances respectively.</p>
</html>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-45,-50},{-20,-25}}, lineColor = {0,0,255}),Ellipse(extent = {{-45,-25},{-20,0}}, lineColor = {0,0,255}),Ellipse(extent = {{-45,0},{-20,25}}, lineColor = {0,0,255}),Ellipse(extent = {{-45,25},{-20,50}}, lineColor = {0,0,255}),Rectangle(extent = {{-72,-60},{-33,60}}, lineColor = {255,255,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-90,50},{-32,50}}, color = {0,0,255}),Line(points = {{-90,-50},{-32,-50}}, color = {0,0,255}),Ellipse(extent = {{20,-50},{45,-25}}, lineColor = {0,0,255}),Ellipse(extent = {{20,-25},{45,0}}, lineColor = {0,0,255}),Ellipse(extent = {{20,0},{45,25}}, lineColor = {0,0,255}),Ellipse(extent = {{20,25},{45,50}}, lineColor = {0,0,255}),Rectangle(extent = {{33,-60},{72,60}}, lineColor = {255,255,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{32,50},{90,50}}, color = {0,0,255}),Line(points = {{32,-50},{90,-50}}, color = {0,0,255}),Text(extent = {{-103,16},{-60,-10}}, textString = "L1", lineColor = {0,0,0}, pattern = LinePattern.Dot),Text(extent = {{64,15},{105,-9}}, textString = "L2", lineColor = {0,0,0}, pattern = LinePattern.Dot),Text(extent = {{-27,-71},{33,-97}}, textString = "M", lineColor = {0,0,0}),Text(extent = {{-153,113},{147,73}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-45,-50},{-20,-25}}, lineColor = {0,0,255}),Ellipse(extent = {{-45,-25},{-20,0}}, lineColor = {0,0,255}),Ellipse(extent = {{-45,0},{-20,25}}, lineColor = {0,0,255}),Ellipse(extent = {{-45,25},{-20,50}}, lineColor = {0,0,255}),Rectangle(extent = {{-72,-60},{-33,60}}, lineColor = {255,255,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-96,50},{-32,50}}, color = {0,0,255}),Line(points = {{-96,-50},{-32,-50}}, color = {0,0,255}),Ellipse(extent = {{20,-50},{45,-25}}, lineColor = {0,0,255}),Ellipse(extent = {{20,-25},{45,0}}, lineColor = {0,0,255}),Ellipse(extent = {{20,0},{45,25}}, lineColor = {0,0,255}),Ellipse(extent = {{20,25},{45,50}}, lineColor = {0,0,255}),Rectangle(extent = {{33,-60},{72,60}}, lineColor = {255,255,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{32,50},{96,50}}, color = {0,0,255}),Line(points = {{32,-50},{96,-50}}, color = {0,0,255})}));
    end Transformer;
    model M_Transformer "Generic transformer with free number of inductors"
      parameter Integer N(final min = 1) = 3 "number of inductors";
    protected
      parameter Integer dimL = div(N * (N + 1), 2);
    public
      parameter Modelica.SIunits.Inductance L[dimL] = {1,0.1,0.2,2,0.3,3} "inductances and coupling inductances";
      Modelica.Electrical.Analog.Interfaces.PositivePin p[N] "Positive pin" annotation(Placement(transformation(extent = {{-80,-40},{-62,40}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin n[N] "Negative pin" annotation(Placement(transformation(extent = {{62,-40},{80,40}}, rotation = 0)));
      Modelica.SIunits.Voltage v[N];
      Modelica.SIunits.Current i[N];
      Modelica.SIunits.Inductance Lm[N,N];
    algorithm
      for s in 1:N loop
              for z in 1:N loop
                  Lm[z,s]:=if z >= s then L[(s - 1) * N + z - div((s - 1) * s, 2)] else Lm[s,z];

        end for;

      end for;
    equation
      for j in 1:N loop
      v[j] = p[j].v - n[j].v;
      0 = p[j].i + n[j].i;
      i[j] = p[j].i;

      end for;
      v = Lm * der(i);
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Ellipse(extent = {{-36,24},{-18,42}}),Ellipse(extent = {{18,24},{36,42}}),Ellipse(extent = {{0,24},{18,42}}),Ellipse(extent = {{-18,24},{0,42}}),Rectangle(extent = {{42,24},{-44,34}}, lineColor = {0,0,255}, pattern = LinePattern.None, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-36,34},{-62,34}}, color = {0,0,255}, pattern = LinePattern.None),Line(points = {{62,34},{36,34}}, color = {0,0,255}, pattern = LinePattern.None),Ellipse(extent = {{-36,8},{-18,26}}),Ellipse(extent = {{18,8},{36,26}}),Ellipse(extent = {{0,8},{18,26}}),Ellipse(extent = {{-18,8},{0,26}}),Rectangle(extent = {{42,6},{-44,18}}, lineColor = {0,0,255}, pattern = LinePattern.None, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-36,18},{-62,18}}, color = {0,0,255}, pattern = LinePattern.None),Line(points = {{62,18},{36,18}}, color = {0,0,255}, pattern = LinePattern.None),Line(points = {{-36,-29},{-62,-29}}, color = {0,0,255}, pattern = LinePattern.None),Ellipse(extent = {{-36,-40},{-18,-22}}),Ellipse(extent = {{-18,-40},{0,-22}}),Ellipse(extent = {{0,-40},{18,-22}}),Ellipse(extent = {{18,-40},{36,-22}}),Line(points = {{62,-29},{36,-29}}, color = {0,0,255}, pattern = LinePattern.None),Rectangle(extent = {{42,-42},{-44,-30}}, lineColor = {0,0,255}, pattern = LinePattern.None, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{0,8},{0,-18}}, color = {0,0,255}, pattern = LinePattern.Dot),Text(extent = {{-150,103},{150,63}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), Documentation(info = "<html>
The model <i> M_Transformer </i> is a model of a transformer with the posibility to choose the
number of inductors. Inside the model, an inductance matrix is built based on the
inductance of the inductors and the coupling inductances between the inductors given as a
parameter vector from the user of the model.<br>
<br>
An example shows that approach: <br>
<br>
The user chooses a model with <b>three</b> inductors, that means the parameter <b><i> N </i></b> has to be <b>3</b>.
Then he has to specify the inductances of the three inductors and the three coupling inductances. The coupling
inductances are no real existing devices, but effects that occur between two inductors.

The inductivities (main diagonal of the inductance matrix) and the coupling inductivities have
to be specified in the parameter vector <i> L </i> .  The length <i> dimL </i> of the parameter vector is calculated as follows: <b><i> dimL=(N*(N+1))/2 </i></b> <br> The following example shows how the parameter vector is used to fill in the inductance matrix.
For example: To specify the inductance matrix of a three inductances transformer (<i> N=3 </i>), e.g.<br><br>
<center>
<table>
  <tr>
    <td></td>
    <td></td>
    <td>1</td>
    <td>0.1</td>
    <td>0.2</td>
  </tr>
  <tr>
    <td>Lm</td>
    <td>=</td>
    <td>0.1</td>
    <td>2</td>
    <td>0.3</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>0.2</td>
    <td>0.3</td>
    <td>3</td>
  </tr>
</table>
</center>

the user has to allocate the parameter vector <i>L[6] </i>, since <i> Nv=(N*(N+1))/2=(3*(3+1))/2=6</i>. The parameter vector must be filled like this: <i> L=[1,0.1,0.2,2,0.3,3] </i>. <br>
<br>
Inside the model, two loops are used to fill the inductance matrix to guarantee that it is filled in a symmetric way.
</html>", revisions = "
<html>
<ul>
<li><i> November 24, 2008   </i> docu added, K. Majetta
       </li>
<li><i> September 16, 2008   </i>
       by Kristin Majetta<br> initially implemented<br>
       </li>
</ul>
</html>
"));
    end M_Transformer;
    model Gyrator "Gyrator"
      extends Interfaces.TwoPort;
      parameter SI.Conductance G1(start = 1) "Gyration conductance";
      parameter SI.Conductance G2(start = 1) "Gyration conductance";
    equation
      i1 = G2 * v2;
      i2 = -G1 * v1;
      annotation(Documentation(info = "<HTML>
<P>
A gyrator is a two-port element defined by the following equations:
</P>
<PRE>
    i1 =  G2 * v2
    i2 = -G1 * v1
</PRE>
<P>
where the constants <i>G1</i>, <i>G2</i> are called the gyration conductance.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-60,60},{60,-60}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{-90,50},{-60,50}}, color = {0,0,255}),Line(points = {{-90,-50},{-60,-50}}, color = {0,0,255}),Line(points = {{60,50},{90,50}}, color = {0,0,255}),Line(points = {{60,-50},{90,-50}}, color = {0,0,255}),Line(points = {{-40,30},{40,30}}, color = {0,0,255}),Line(points = {{-20,-20},{20,-20}}, color = {0,0,255}),Polygon(points = {{30,34},{40,30},{30,26},{30,34}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Polygon(points = {{-26,-19},{-16,-15},{-16,-23},{-26,-19}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{-5,10},{-10,-10}}, color = {0,0,0}),Line(points = {{9,10},{4,-9}}, color = {0,0,0}),Line(points = {{-14,9},{16,10}}, color = {0,0,0}),Text(extent = {{-29,59},{30,30}}, textString = "G1", lineColor = {0,0,0}),Text(extent = {{-29,-29},{29,-58}}, textString = "G2", lineColor = {0,0,0}),Text(extent = {{-156,117},{144,77}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-60,60},{60,-60}}, lineColor = {0,0,255}),Line(points = {{-96,50},{-60,50}}, color = {0,0,255}),Line(points = {{-96,-50},{-60,-50}}, color = {0,0,255}),Line(points = {{60,50},{96,50}}, color = {0,0,255}),Line(points = {{60,-50},{96,-50}}, color = {0,0,255}),Line(points = {{-40,30},{40,30}}, color = {0,0,255}),Line(points = {{-21,-22},{19,-22}}, color = {0,0,255}),Polygon(points = {{30,34},{40,30},{30,26},{30,34}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Polygon(points = {{-20,-30},{-10,-26},{-10,-34},{-20,-30}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{-4,5},{-6,-5}}, thickness = 1, color = {0,0,255}),Line(points = {{3,5},{1,-5}}, thickness = 1, color = {0,0,255}),Line(points = {{-8,5},{7,5}}, thickness = 1, color = {0,0,255}),Text(extent = {{-20,50},{20,35}}, textString = "G1", lineColor = {0,0,255}),Text(extent = {{-20,-35},{20,-50}}, textString = "G2", lineColor = {0,0,255})}));
    end Gyrator;
    model EMF "Electromotoric force (electric/mechanic transformer)"
      parameter Boolean useSupport = false "= true, if support flange enabled, otherwise implicitly grounded" annotation(Evaluate = true, HideResult = true, choices(__Dymola_checkBox = true));
      parameter SI.ElectricalTorqueConstant k(start = 1) "Transformation coefficient";
      SI.Voltage v "Voltage drop between the two pins";
      SI.Current i "Current flowing from positive to negative pin";
      SI.Angle phi "Angle of shaft flange with respect to support (= flange.phi - support.phi)";
      SI.AngularVelocity w "Angular velocity of flange relative to support";
      Interfaces.PositivePin p annotation(Placement(transformation(origin = {0,100}, extent = {{-10,-10},{10,10}}, rotation = 90)));
      Interfaces.NegativePin n annotation(Placement(transformation(origin = {0,-100}, extent = {{-10,-10},{10,10}}, rotation = 90)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      Mechanics.Rotational.Interfaces.Support support if useSupport "Support/housing of emf shaft" annotation(Placement(transformation(extent = {{-110,-10},{-90,10}})));
    protected
      Mechanics.Rotational.Components.Fixed fixed if not useSupport annotation(Placement(transformation(extent = {{-90,-20},{-70,0}})));
      Mechanics.Rotational.Interfaces.InternalSupport internalSupport(tau = -flange.tau) annotation(Placement(transformation(extent = {{-90,-10},{-70,10}})));
    equation
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;
      phi = flange.phi - internalSupport.phi;
      w = der(phi);
      k * w = v;
      flange.tau = -k * i;
      connect(internalSupport.flange,support) annotation(Line(points = {{-80,0},{-100,0}}, color = {0,0,0}, smooth = Smooth.None));
      connect(internalSupport.flange,fixed.flange) annotation(Line(points = {{-80,0},{-80,-10}}, color = {0,0,0}, smooth = Smooth.None));
      annotation(defaultComponentName = "emf", Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-85,10},{-36,-10}}, lineColor = {0,0,0}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {192,192,192}),Line(points = {{0,90},{0,40}}, color = {0,0,255}),Rectangle(extent = {{35,10},{100,-10}}, lineColor = {0,0,0}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {192,192,192}),Ellipse(extent = {{-40,40},{40,-40}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{0,-90},{0,-40}}, color = {0,0,255}),Text(extent = {{0,-50},{199,-90}}, textString = "%name", lineColor = {0,0,255}),Text(extent = {{0,80},{189,46}}, lineColor = {160,160,164}, textString = "k=%k"),Line(visible = not useSupport, points = {{-100,-30},{-40,-30}}, color = {0,0,0}),Line(visible = not useSupport, points = {{-100,-50},{-80,-30}}, color = {0,0,0}),Line(visible = not useSupport, points = {{-80,-50},{-60,-30}}, color = {0,0,0}),Line(visible = not useSupport, points = {{-60,-50},{-40,-30}}, color = {0,0,0}),Line(visible = not useSupport, points = {{-70,-30},{-70,-10}}, color = {0,0,0})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{-17,95},{-20,85},{-23,95},{-17,95}}, lineColor = {160,160,164}, fillColor = {160,160,164}, fillPattern = FillPattern.Solid),Line(points = {{-20,110},{-20,85}}, color = {160,160,164}),Text(extent = {{-40,110},{-30,90}}, lineColor = {160,160,164}, textString = "i"),Line(points = {{9,75},{19,75}}, color = {192,192,192}),Line(points = {{-20,-110},{-20,-85}}, color = {160,160,164}),Polygon(points = {{-17,-100},{-20,-110},{-23,-100},{-17,-100}}, lineColor = {160,160,164}, fillColor = {160,160,164}, fillPattern = FillPattern.Solid),Text(extent = {{-40,-110},{-30,-90}}, lineColor = {160,160,164}, textString = "i"),Line(points = {{8,-79},{18,-79}}, color = {192,192,192}),Line(points = {{14,80},{14,70}}, color = {192,192,192})}), Documentation(info = "<html>
<p>EMF transforms electrical energy into rotational mechanical energy. It is used as basic building block of an electrical motor. The mechanical connector flange can be connected to elements of the Modelica.Mechanics.Rotational library. flange.tau is the cut-torque, flange.phi is the angle at the rotational connection. </p>
</html>", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end EMF;
    model TranslationalEMF "Electromotoric force (electric/mechanic transformer)"
      parameter Boolean useSupport = false "= true, if support flange enabled, otherwise implicitly grounded" annotation(Evaluate = true, HideResult = true, choices(__Dymola_checkBox = true));
      parameter Modelica.SIunits.ElectricalForceConstant k(start = 1) "Transformation coefficient";
      Modelica.SIunits.Voltage v "Voltage drop between the two pins";
      Modelica.SIunits.Current i "Current flowing from positive to negative pin";
      Modelica.SIunits.Position s "Position of flange relative to support";
      Modelica.SIunits.Velocity vel "Velocity of flange relative to support";
      Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(Placement(transformation(origin = {0,100}, extent = {{-10,-10},{10,10}}, rotation = 90)));
      Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(Placement(transformation(origin = {0,-100}, extent = {{-10,-10},{10,10}}, rotation = 90)));
      Modelica.Mechanics.Translational.Interfaces.Flange_b flange annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      Modelica.Mechanics.Translational.Interfaces.Support support if useSupport "Support/housing" annotation(Placement(transformation(extent = {{-110,-10},{-90,10}})));
    protected
      Modelica.Mechanics.Translational.Components.Fixed fixed if not useSupport annotation(Placement(transformation(extent = {{-90,-20},{-70,0}})));
      Modelica.Mechanics.Translational.Interfaces.InternalSupport internalSupport(f = -flange.f) annotation(Placement(transformation(extent = {{-90,-10},{-70,10}})));
    equation
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;
      s = flange.s - internalSupport.s;
      vel = der(s);
      k * vel = v;
      flange.f = -k * i;
      connect(internalSupport.flange,support) annotation(Line(points = {{-80,0},{-90,0},{-90,0},{-100,0}}, color = {0,127,0}, smooth = Smooth.None));
      connect(internalSupport.flange,fixed.flange) annotation(Line(points = {{-80,0},{-80,-10}}, color = {0,127,0}, smooth = Smooth.None));
      annotation(defaultComponentName = "emf", Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-90,51},{-40,-50}}, lineColor = {135,135,135}, fillColor = {135,135,135}, fillPattern = FillPattern.HorizontalCylinder),Rectangle(extent = {{-21,20},{90,-20}}, lineColor = {135,135,135}, fillColor = {135,135,135}, fillPattern = FillPattern.Solid),Text(extent = {{0,80},{148,44}}, lineColor = {160,160,164}, textString = "k=%k"),Line(points = {{-30,49},{-30,80},{0,80},{0,91}}, color = {0,0,255}),Line(points = {{20,-49},{20,-80},{0,-80},{0,-89},{0,-90}}, color = {0,0,255}),Ellipse(extent = {{-21,50},{9,-50}}, lineColor = {0,0,255}),Ellipse(extent = {{2,50},{32,-50}}, lineColor = {0,0,255}),Ellipse(extent = {{-43,50},{-13,-50}}, lineColor = {0,0,255}),Rectangle(extent = {{-4,20},{-1,-20}}, lineColor = {135,135,135}, fillColor = {135,135,135}, fillPattern = FillPattern.Solid),Rectangle(extent = {{7,20},{10,-20}}, lineColor = {135,135,135}, fillColor = {135,135,135}, fillPattern = FillPattern.Solid),Rectangle(extent = {{-14,20},{-11,-20}}, lineColor = {135,135,135}, fillColor = {135,135,135}, fillPattern = FillPattern.Solid),Rectangle(extent = {{19,20},{44,-20}}, lineColor = {135,135,135}, fillColor = {135,135,135}, fillPattern = FillPattern.Solid),Line(visible = not useSupport, points = {{-100,-70},{-40,-70}}, color = {0,0,0}),Line(visible = not useSupport, points = {{-100,-90},{-80,-70}}, color = {0,0,0}),Line(visible = not useSupport, points = {{-80,-90},{-60,-70}}, color = {0,0,0}),Line(visible = not useSupport, points = {{-60,-90},{-40,-70}}, color = {0,0,0}),Line(visible = not useSupport, points = {{-70,-70},{-70,-50}}, color = {0,0,0}),Text(extent = {{0,-50},{199,-90}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{-17,95},{-20,85},{-23,95},{-17,95}}, lineColor = {160,160,164}, fillColor = {160,160,164}, fillPattern = FillPattern.Solid),Line(points = {{-20,110},{-20,85}}, color = {160,160,164}),Text(extent = {{-40,110},{-30,90}}, lineColor = {160,160,164}, textString = "i"),Line(points = {{9,75},{19,75}}, color = {192,192,192}),Line(points = {{-20,-110},{-20,-85}}, color = {160,160,164}),Polygon(points = {{-17,-100},{-20,-110},{-23,-100},{-17,-100}}, lineColor = {160,160,164}, fillColor = {160,160,164}, fillPattern = FillPattern.Solid),Text(extent = {{-40,-110},{-30,-90}}, lineColor = {160,160,164}, textString = "i"),Line(points = {{8,-79},{18,-79}}, color = {192,192,192}),Line(points = {{14,80},{14,70}}, color = {192,192,192}),Polygon(points = {{140,3},{150,0},{140,-3},{140,3},{140,3}}, lineColor = {0,0,0}, fillColor = {0,0,0}, fillPattern = FillPattern.Solid)}), Window(x = 0.21, y = 0, width = 0.65, height = 0.66), Documentation(info = "<html>
<p>EMF transforms electrical energy into translational mechanical energy. It is used as basic building block of an electrical linear motor. The mechanical connector flange can be connected to elements of the Modelica.Mechanics.Translational library. flange.f is the cut-force, flange.s is the distance at the translational connection. </p>
</html>", revisions = "<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 2009   </i>
       by Anton Haumer<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end TranslationalEMF;
    model VCV "Linear voltage-controlled voltage source"
      extends Interfaces.TwoPort;
      parameter Real gain(start = 1) "Voltage gain";
    equation
      v2 = v1 * gain;
      i1 = 0;
      annotation(Documentation(info = "<HTML>
<p>
The linear voltage-controlled voltage source is a TwoPort.
The right port voltage v2 is controlled by the left port voltage v1
via
</p>
<pre>
    v2 = v1 * gain.
</pre>
<p>
The left port current is zero. Any voltage gain can be chosen.
</p>
</HTML>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-70,70},{70,-70}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{-90,50},{-30,50}}, color = {0,0,255}),Line(points = {{-30,-50},{-90,-50}}, color = {0,0,255}),Line(points = {{100,50},{30,50},{30,-50},{100,-50}}, color = {0,0,255}),Ellipse(extent = {{10,20},{50,-20}}, lineColor = {0,0,255}),Line(points = {{-20,60},{20,60}}, color = {0,0,255}),Polygon(points = {{20,60},{10,63},{10,57},{20,60}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Text(extent = {{-148,-81},{152,-121}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-96,50},{-31,50}}, color = {0,0,255}),Line(points = {{-30,-50},{-96,-50}}, color = {0,0,255}),Line(points = {{96,50},{30,50},{30,-50},{96,-50}}, color = {0,0,255}),Ellipse(extent = {{10,20},{50,-20}}, lineColor = {0,0,255}),Rectangle(extent = {{-70,70},{70,-70}}, lineColor = {0,0,255}),Line(points = {{-20,60},{20,60}}, color = {0,0,255}),Polygon(points = {{20,60},{10,63},{10,57},{20,60}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255})}));
    end VCV;
    model VCC "Linear voltage-controlled current source"
      extends Interfaces.TwoPort;
      parameter SI.Conductance transConductance(start = 1) "Transconductance";
    equation
      i2 = v1 * transConductance;
      i1 = 0;
      annotation(Documentation(info = "<HTML>
<p>
The linear voltage-controlled current source is a TwoPort.
The right port current i2 is controlled by the left port voltage v1
via
</p>
<pre>
    i2 = v1 * transConductance.
</pre>
<p>
The left port current is zero. Any transConductance can be chosen.
</p>
</HTML>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-70,70},{70,-70}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{-90,50},{-30,50}}, color = {0,0,255}),Line(points = {{-30,-50},{-90,-50}}, color = {0,0,255}),Ellipse(extent = {{10,20},{50,-20}}, lineColor = {0,0,255}),Line(points = {{-20,60},{20,60}}, color = {0,0,255}),Polygon(points = {{20,60},{10,63},{10,57},{20,60}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{90,50},{30,50},{30,20}}, color = {0,0,255}),Line(points = {{91,-50},{30,-50},{30,-20}}, color = {0,0,255}),Line(points = {{10,0},{50,0}}, color = {0,0,255}),Text(extent = {{-143,-82},{157,-122}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-96,50},{-30,50}}, color = {0,0,255}),Line(points = {{-30,-50},{-96,-50}}, color = {0,0,255}),Ellipse(extent = {{10,20},{50,-20}}, lineColor = {0,0,255}),Rectangle(extent = {{-70,70},{70,-70}}, lineColor = {0,0,255}),Line(points = {{-20,60},{20,60}}, color = {0,0,255}),Polygon(points = {{20,60},{10,63},{10,57},{20,60}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{96,50},{30,50},{30,20}}, color = {0,0,255}),Line(points = {{96,-50},{30,-50},{30,-20}}, color = {0,0,255}),Line(points = {{10,0},{50,0}}, color = {0,0,255})}));
    end VCC;
    model CCV "Linear current-controlled voltage source"
      extends Interfaces.TwoPort;
      parameter SI.Resistance transResistance(start = 1) "Transresistance";
    equation
      v2 = i1 * transResistance;
      v1 = 0;
      annotation(Documentation(info = "<HTML>
<p>
The linear current-controlled voltage source is a TwoPort.
The right port voltage v2 is controlled by the left port current i1
via
</p>
<pre>
    v2 = i1 * transResistance.
</pre>
<p>
The left port voltage is zero. Any transResistance can be chosen.
</p>
</HTML>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-70,70},{70,-70}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{100,50},{30,50},{30,-50},{100,-50}}, color = {0,0,255}),Ellipse(extent = {{10,20},{50,-20}}, lineColor = {0,0,255}),Line(points = {{-20,60},{20,60}}, color = {0,0,255}),Polygon(points = {{20,60},{10,63},{10,57},{20,60}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{-90,50},{-20,50},{-20,-50},{-90,-50}}, color = {0,0,255}),Text(extent = {{-140,-82},{160,-122}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{10,20},{50,-20}}, lineColor = {0,0,255}),Rectangle(extent = {{-70,70},{70,-70}}, lineColor = {0,0,255}),Line(points = {{-20,60},{20,60}}, color = {0,0,255}),Polygon(points = {{20,60},{10,63},{10,57},{20,60}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{96,50},{30,50},{30,-50},{96,-50}}, color = {0,0,255}),Line(points = {{-96,50},{-30,50},{-30,-50},{-96,-50}}, color = {0,0,255})}));
    end CCV;
    model CCC "Linear current-controlled current source"
      extends Interfaces.TwoPort;
      parameter Real gain(start = 1) "Current gain";
    equation
      i2 = i1 * gain;
      v1 = 0;
      annotation(Documentation(info = "<HTML>
<p>
The linear current-controlled current source is a TwoPort.
The right port current i2 is controlled by the left port current i1
via
</p>
<pre>
    i2 = i1 * gain.
</pre>
<p>
The left port voltage is zero. Any current gain can be chosen.
</p>
</HTML>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-70,70},{70,-70}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{-100,50},{-30,50},{-30,-50},{-100,-50}}, color = {0,0,255}),Ellipse(extent = {{10,20},{50,-20}}, lineColor = {0,0,255}),Line(points = {{-20,60},{20,60}}, color = {0,0,255}),Polygon(points = {{20,60},{10,63},{10,57},{20,60}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{90,50},{30,50},{30,20}}, color = {0,0,255}),Line(points = {{91,-50},{30,-50},{30,-20}}, color = {0,0,255}),Line(points = {{10,0},{50,0}}, color = {0,0,255}),Text(extent = {{-146,-76},{154,-116}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{10,20},{50,-20}}, lineColor = {0,0,255}),Rectangle(extent = {{-70,70},{70,-70}}, lineColor = {0,0,255}),Line(points = {{-20,60},{20,60}}, color = {0,0,255}),Polygon(points = {{20,60},{10,63},{10,57},{20,60}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{96,50},{30,50},{30,20}}, color = {0,0,255}),Line(points = {{96,-50},{30,-50},{30,-20}}, color = {0,0,255}),Line(points = {{10,0},{50,0}}, color = {0,0,255}),Line(points = {{-96,50},{-30,50},{-30,-50},{-96,-50}}, color = {0,0,255})}));
    end CCC;
    model OpAmp "Simple nonideal model of an OpAmp with limitation"
      parameter Real Slope(start = 1) "Slope of the out.v/vin characteristic at vin=0";
      Modelica.Electrical.Analog.Interfaces.PositivePin in_p "Positive pin of the input port" annotation(Placement(transformation(extent = {{-110,-60},{-90,-40}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin in_n "Negative pin of the input port" annotation(Placement(transformation(extent = {{-90,40},{-110,60}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.PositivePin out "Output pin" annotation(Placement(transformation(extent = {{110,-10},{90,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.PositivePin VMax "Positive output voltage limitation" annotation(Placement(transformation(extent = {{-10,60},{10,80}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin VMin "Negative output voltage limitation" annotation(Placement(transformation(extent = {{-10,-80},{10,-60}}, rotation = 0)));
      SI.Voltage vin "input voltagae";
    protected
      Real f "auxiliary variable";
      Real absSlope;
    equation
      in_p.i = 0;
      in_n.i = 0;
      VMax.i = 0;
      VMin.i = 0;
      vin = in_p.v - in_n.v;
      f = 2 / (VMax.v - VMin.v);
      absSlope = smooth(0, if Slope < 0 then -Slope else Slope);
      out.v = (VMax.v + VMin.v) / 2 + (absSlope * vin) / (1 + absSlope * smooth(0, if f * vin < 0 then -f * vin else f * vin));
      annotation(Documentation(info = "<HTML>
<P>
The OpAmp is a simle nonideal model with a smooth out.v = f(vin) characteristic,
where \"vin = in_p.v - in_n.v\".
The characteristic is limited by VMax.v and VMin.v. Its slope at vin=0
is the parameter Slope, which must be positive. (Therefore, the absolute
value of Slope is taken into calculation.)
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> 2000   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{60,0},{-60,70},{-60,-70},{60,0}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{-45,-10},{-20,-10},{-14,-9},{-11,-7},{-9,7},{-6,9},{0,10},{20,10}}, color = {0,0,255}),Line(points = {{0,35},{0,80}}, color = {0,0,255}),Line(points = {{0,-35},{0,-80}}, color = {0,0,255}),Line(points = {{-90,50},{-60,50}}, color = {0,0,255}),Line(points = {{-90,-50},{-60,-50}}, color = {0,0,255}),Line(points = {{60,0},{90,0}}, color = {0,0,255}),Line(points = {{-48,32},{-28,32}}, color = {0,0,255}),Line(points = {{-39,-20},{-39,-41}}, color = {0,0,255}),Line(points = {{-50,-31},{-28,-31}}, color = {0,0,255}),Text(extent = {{-149,138},{151,98}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{60,0},{-60,70},{-60,-70},{60,0}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{-45,-10},{-20,-10},{-14,-9},{-11,-7},{-9,7},{-6,9},{0,10},{20,10}}, color = {0,0,255}),Line(points = {{0,35},{0,70}}, color = {0,0,255}),Line(points = {{0,-35},{0,-70}}, color = {0,0,255}),Line(points = {{-96,50},{-60,50}}, color = {0,0,255}),Line(points = {{-96,-50},{-60,-50}}, color = {0,0,255}),Line(points = {{60,0},{96,0}}, color = {0,0,255}),Line(points = {{-55,50},{-45,50}}, color = {0,0,255}),Line(points = {{-50,-45},{-50,-55}}, color = {0,0,255}),Line(points = {{-55,-50},{-45,-50}}, color = {0,0,255}),Text(extent = {{-112,-93},{-91,-73}}, lineColor = {160,160,164}, textString = "in_p.i=0"),Polygon(points = {{120,3},{110,0},{120,-3},{120,3}}, lineColor = {0,0,0}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {160,160,164}),Line(points = {{111,0},{136,0}}, color = {0,0,0}),Text(extent = {{118,2},{135,17}}, lineColor = {0,0,0}, textString = "i2"),Text(extent = {{-111,60},{-85,80}}, lineColor = {160,160,164}, textString = "in_n.i=0"),Line(points = {{-100,-35},{-100,23},{-100,24}}, color = {160,160,164}, arrow = {Arrow.None,Arrow.Filled}),Text(extent = {{-97,-16},{-74,4}}, lineColor = {160,160,164}, textString = "vin")}));
    end OpAmp;
    model OpAmpDetailed "Detailed model of an operational amplifier"
      // literature: Conelly, J.A.; Choi, P.: Macromodelling with SPICE. Englewood Cliffs: Prentice-Hall, 1992
      import SI = Modelica.SIunits;
      parameter SI.Resistance Rdm = 2000000.0 "input resistance (differential input mode)";
      parameter SI.Resistance Rcm = 2000000000.0 "input resistance (common mode)";
      parameter SI.Capacitance Cin = 1.4e-012 "input capacitance";
      parameter SI.Voltage Vos = 0.001 "input offset voltage";
      parameter SI.Current Ib = 8e-008 "input bias current";
      parameter SI.Current Ios = 2e-008 "input offset current";
      parameter SI.Voltage vcp = 0.0 "correction value for limiting by p_supply";
      parameter SI.Voltage vcm = 0.0 "correction value for limiting by msupply";
      parameter Real Avd0 = 106.0 "differential amplifier [dB]";
      parameter Real CMRR = 90.0 "common-mode rejection [dB]";
      parameter SI.Frequency fp1 = 5.0 "dominant pole";
      parameter SI.Frequency fp2 = 2000000.0 "pole frequency";
      parameter SI.Frequency fp3 = 20000000.0 "pole frequency";
      parameter SI.Frequency fp4 = 100000000.0 "pole frequency";
      parameter SI.Frequency fz = 5000000.0 "zero frequency";
      parameter SI.VoltageSlope sr_p = 500000.0 "slew rate for increase";
      parameter SI.VoltageSlope sr_m = 500000.0 "slew rate for decrease";
      parameter SI.Resistance Rout = 75.0 "output resistance";
      parameter SI.Current Imaxso = 0.025 "maximal output current (source current)";
      parameter SI.Current Imaxsi = 0.025 "maximal output current (sink current)";
      // number of intervalls: 2500, stop time: 0.003
      parameter SI.Time Ts = 1.2e-006 "sampling time";
      // constant expressions
      constant Real Pi = 3.141592654;
      // power supply
      final parameter SI.Voltage vcp_abs = abs(vcp);
      final parameter SI.Voltage vcm_abs = abs(vcm);
      // input stage
      //  Ib = 0.5*(I1 + I2);
      //  Ios = I1 - I2;
      final parameter SI.Current I1 = Ib + Ios / 2.0;
      final parameter SI.Current I2 = Ib - Ios / 2.0;
      // gain stage (difference and common mode)
      final parameter Real Avd0_val = 10.0 ^ (Avd0 / 20.0) "differential mode gain";
      final parameter Real Avcm_val = Avd0_val / 10.0 ^ (CMRR / 20.0) / 2.0 "common mode gain";
      // slew rate stage
      final parameter SI.VoltageSlope sr_p_val = abs(sr_p);
      final parameter SI.VoltageSlope sr_m_val = -abs(sr_m);
      // output stage
      final parameter SI.Current Imaxso_val = abs(Imaxso) "orientation out outp";
      final parameter SI.Current Imaxsi_val = abs(Imaxsi) "orientation into outp";
      Modelica.Electrical.Analog.Interfaces.PositivePin p "Positive pin of the input port" annotation(Placement(transformation(extent = {{-111,-61},{-90,-40}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin m "Negative pin of the input port" annotation(Placement(transformation(extent = {{-90,40},{-111,61}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.PositivePin outp "Output pin" annotation(Placement(transformation(extent = {{110,-10},{90,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.PositivePin p_supply "Positive output voltage limitation" annotation(Placement(transformation(extent = {{-8,65},{9,82}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin m_supply "Negative output voltage limitation" annotation(Placement(transformation(extent = {{-9,-83},{9,-65}}, rotation = 0)));
      // power supply
      SI.Voltage v_pos;
      SI.Voltage v_neg;
      // input stage
      Modelica.SIunits.Voltage v_vos;
      Modelica.SIunits.Voltage v_3;
      Modelica.SIunits.Voltage v_in;
      Modelica.SIunits.Voltage v_4;
      Modelica.SIunits.Current i_vos;
      Modelica.SIunits.Current i_3;
      Modelica.SIunits.Current i_r2;
      Modelica.SIunits.Current i_c3;
      Modelica.SIunits.Current i_4;
      // frequency response
      Real q_fr1;
      Real q_fr2;
      Real q_fr3;
      // gain stage
      SI.Voltage q_sum;
      SI.Voltage q_sum_help;
      SI.Voltage q_fp1;
      // slew rate stage
      SI.Voltage v_source;
      SI.Voltage x "auxiliary variable for slew rate";
      // output stage
      Modelica.SIunits.Voltage v_out;
      Modelica.SIunits.Current i_out;
      // functions
      function FCNiout_limit
        input SI.Voltage v_source;
        input SI.Voltage v_out;
        input SI.Resistance Rout;
        input SI.Current Imaxsi_val;
        input SI.Current Imaxso_val;
        output SI.Current result;
      algorithm
        if v_out > v_source + Rout * Imaxsi_val then 
                result:=Imaxsi_val;
        elseif v_out < v_source - Rout * Imaxso_val then
          result:=-Imaxso_val;


        else         result:=(v_out - v_source) / Rout;

        end if;
return;
      end FCNiout_limit;
      function FCNq_sum_limit
        input SI.Voltage q_sum;
        input SI.Voltage q_sum_ltf;
        input SI.Voltage v_pos;
        input SI.Voltage v_neg;
        input SI.Voltage vcp;
        input SI.Voltage vcm;
        output SI.Voltage result;
      algorithm
        if q_sum > v_pos - vcp and q_sum_ltf >= v_pos - vcp then 
                result:=v_pos - vcp;
        elseif q_sum < v_neg + vcm and q_sum_ltf <= v_neg + vcm then
          result:=v_neg + vcm;


        else         result:=q_sum;

        end if;
return;
      end FCNq_sum_limit;
    equation
      assert(Rout > 0.0, "Rout must be > 0.0.");
      v_pos = p_supply.v;
      v_neg = m_supply.v;
      p.i = i_vos;
      m.i = i_4 - i_r2 - i_c3;
      0 = i_3 + i_r2 + i_c3 - i_vos;
      p.v - m.v = v_vos + v_in;
      v_4 = m.v;
      v_3 = p.v - v_vos;
      v_vos = Vos;
      i_3 = I1 + v_3 / Rcm;
      v_in = Rdm * i_r2;
      i_c3 = Cin * der(v_in);
      i_4 = I2 + v_4 / Rcm;
      der(q_fr1) = 2.0 * Pi * fp2 * (v_in - q_fr1);
      q_fr2 + 1.0 / (2.0 * Pi * fp3) * der(q_fr2) = q_fr1 + 1.0 / (2.0 * Pi * fz) * der(q_fr1);
      der(q_fr3) = 2.0 * Pi * fp4 * (q_fr2 - q_fr3);
      q_sum = Avd0_val * q_fr3 + Avcm_val * (v_3 + v_4);
      q_sum_help = FCNq_sum_limit(q_sum, q_fp1, v_pos, v_neg, vcp_abs, vcm_abs);
      der(q_fp1) = 2.0 * Pi * fp1 * (q_sum_help - q_fp1);
      if initial() then
        v_source = q_fp1;
        x = 0;
      end if;
      der(x) = (q_fp1 - v_source) / Ts;
      der(v_source) = smooth(0, noEvent(if der(x) > sr_p_val then sr_p_val else if der(x) < sr_m_val then sr_m_val else der(x)));
      v_out = outp.v;
      i_out = outp.i;
      i_out = FCNiout_limit(v_source, v_out, Rout, Imaxsi_val, Imaxso_val);
      p_supply.i = 0;
      m_supply.i = 0;
      annotation(Documentation(info = "<HTML>
<P>
The OpAmpDetailed model is a general operational amplifier model. The emphasis is on separating each important data sheet parameter into a sub-circuit independent of the other parameters. The model is broken down into five functional stages
<b>input</b>, <b>frequency response</b>, <b>gain</b>, <b>slew rate</b> and an  <b>output</b> stage. Each stage contains data sheet parameters to be modeled.

This partitioning and the modelling of the separate submodels are based on the description in <b>[CP92]</b>.
</P>
</P>
Using <b>[CP92]</b> Joachim Haase (Fraunhofer Institute for Integrated Circuits,
Design Automation Division) transfered 2001 operational amplifier models into VHDL-AMS.
Now one of these models, the model \"amp(macro)\" was transferred into Modelica.
</P>
</P>

<dl>
<dt>
<b>Reference:</b>
<dd>
<b>[CP92]</b> Conelly, J.A.; Choi, P.: Macromodelling with SPICE. Englewood Cliffs: Prentice-Hall, 1992
</dd>
</dl>
</P>
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i>  </i>
       </li>
<li><i> Juni 17, 2009   </i>
       by Susann Wolf<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{60,0},{-60,70},{-60,-70},{60,0}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{0,35},{0,80}}, color = {0,0,255}),Line(points = {{0,-35},{0,-80}}, color = {0,0,255}),Line(points = {{-90,50},{-60,50}}, color = {0,0,255}),Line(points = {{-90,-50},{-60,-50}}, color = {0,0,255}),Line(points = {{60,0},{90,0}}, color = {0,0,255}),Line(points = {{-48,32},{-28,32}}, color = {0,0,255}),Line(points = {{-39,-20},{-39,-41}}, color = {0,0,255}),Line(points = {{-50,-31},{-28,-31}}, color = {0,0,255}),Text(extent = {{-151,141},{149,101}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{60,0},{-60,70},{-60,-70},{60,0}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{0,35},{0,70}}, color = {0,0,255}),Line(points = {{0,-35},{0,-70}}, color = {0,0,255}),Line(points = {{-96,50},{-60,50}}, color = {0,0,255}),Line(points = {{-96,-50},{-60,-50}}, color = {0,0,255}),Line(points = {{60,0},{96,0}}, color = {0,0,255}),Line(points = {{-55,50},{-45,50}}, color = {0,0,255}),Line(points = {{-50,-45},{-50,-55}}, color = {0,0,255}),Line(points = {{-55,-50},{-45,-50}}, color = {0,0,255}),Polygon(points = {{120,3},{110,0},{120,-3},{120,3}}, lineColor = {0,0,0}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {160,160,164}),Line(points = {{111,0},{136,0}}, color = {0,0,0}),Text(extent = {{114,2},{131,17}}, lineColor = {0,0,0}, textString = "i2"),Line(points = {{-100,-35},{-100,23},{-100,24}}, color = {160,160,164}, arrow = {Arrow.None,Arrow.Filled}),Text(extent = {{-97,-16},{-74,4}}, lineColor = {160,160,164}, textString = "vin")}));
    end OpAmpDetailed;
    // power supply
    // input stage
    // frequency response
    // Laplace transformation
    // gain stage
    // Laplace transformation
    // slew rate stage
    // output stage
    model VariableResistor "Ideal linear electrical resistor with variable resistance"
      parameter Modelica.SIunits.Temperature T_ref = 300.15 "Reference temperature";
      parameter Modelica.SIunits.LinearTemperatureCoefficient alpha = 0 "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = T_ref);
      Modelica.SIunits.Resistance R_actual "Resistance = R*(1 + alpha*(T_heatPort - T_ref))";
      Modelica.Blocks.Interfaces.RealInput R annotation(Placement(transformation(origin = {0,110}, extent = {{-20,-20},{20,20}}, rotation = 270)));
    equation
      assert(1 + alpha * (T_heatPort - T_ref) >= Modelica.Constants.eps, "Temperature outside scope of model!");
      R_actual = R * (1 + alpha * (T_heatPort - T_ref));
      v = R_actual * i;
      LossPower = v * i;
      annotation(Documentation(info = "<HTML>
<P>
The linear resistor connects the branch voltage <i>v</i> with the
branch current <i>i</i> by <br><br>
      <b> <i>i*R = v</i></b>
</P>
<P>
The Resistance <i>R</i> is given as input signal.
<P>
<b>Attention!!!</b><br>
  It is recommended that the R signal should not cross the zero value. Otherwise
  depending on the surrounding circuit the probability of singularities is high. <br>
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of resistance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>June 7, 2004   </i>
       by Christoph Clauss<br>changed, docu added<br>
       </li>
<li><i>April 30, 2004</i>
       by Anton Haumer<br>implemented.
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Line(points = {{-90,0},{-70,0}}, color = {0,0,255}),Rectangle(extent = {{-70,30},{70,-30}}, lineColor = {0,0,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{70,0},{90,0}}, color = {0,0,255}),Line(points = {{0,90},{0,30}}, color = {0,0,255}),Text(extent = {{-148,-41},{152,-81}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Rectangle(extent = {{-70,30},{70,-30}}, lineColor = {0,0,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-96,0},{-70,0}}, color = {0,0,255}),Line(points = {{0,90},{0,30}}, color = {0,0,255}),Line(points = {{70,0},{96,0}}, color = {0,0,255})}));
    end VariableResistor;
    model VariableConductor "Ideal linear electrical conductor with variable conductance"
      parameter Modelica.SIunits.Temperature T_ref = 300.15 "Reference temperature";
      parameter Modelica.SIunits.LinearTemperatureCoefficient alpha = 0 "Temperature coefficient of conductance (G_actual = G/(1 + alpha*(T_heatPort - T_ref))";
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = T_ref);
      Modelica.SIunits.Conductance G_actual "Actual conductance = G/(1 + alpha*(T_heatPort - T_ref))";
      Modelica.Blocks.Interfaces.RealInput G annotation(Placement(transformation(origin = {0,110}, extent = {{-20,-20},{20,20}}, rotation = 270)));
    equation
      assert(1 + alpha * (T_heatPort - T_ref) >= Modelica.Constants.eps, "Temperature outside scope of model!");
      G_actual = G / (1 + alpha * (T_heatPort - T_ref));
      i = G_actual * v;
      LossPower = v * i;
      annotation(Documentation(info = "<HTML>
<P>
The linear conductor connects the branch voltage <i>v</i> with the
branch current <i>i</i> by <br><br>
      <b> <i>i = G*v</i></b>
</P>
<P>
The Conductance <i>G</i> is given as input signal.
</P>
<P>
<b>Attention!!!</b><br>
  It is recommended that the G signal should not cross the zero value. Otherwise
  depending on the surrounding circuit the probability of singularities is high. <br>
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of conductance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>June 7, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Line(points = {{-90,0},{-70,0}}, color = {0,0,255}),Rectangle(extent = {{-70,30},{70,-30}}, lineColor = {0,0,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{70,0},{90,0}}, color = {0,0,255}),Line(points = {{0,90},{0,30}}, color = {0,0,255}),Text(extent = {{-148,-41},{152,-81}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Line(points = {{0,90},{0,30}}, color = {0,0,255}),Line(points = {{-96,0},{-70,0}}, color = {0,0,255}),Line(points = {{70,0},{96,0}}, color = {0,0,255}),Rectangle(extent = {{-70,30},{70,-30}}, lineColor = {0,0,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid)}));
    end VariableConductor;
    model VariableCapacitor "Ideal linear electrical capacitor with variable capacitance"
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      Modelica.Blocks.Interfaces.RealInput C annotation(Placement(transformation(origin = {0,110}, extent = {{-20,-20},{20,20}}, rotation = 270)));
      parameter Modelica.SIunits.Capacitance Cmin = Modelica.Constants.eps "lower bound for variable capacitance";
      Modelica.SIunits.ElectricCharge Q;
    equation
      assert(C >= 0, "Capacitance C (= " + String(C) + ") has to be >= 0!");
      Q = noEvent(max(C, Cmin)) * v;
      i = der(Q);
      annotation(Documentation(info = "<HTML>
<P>
The linear capacitor connects the branch voltage <i>v</i> with the
branch current <i>i</i> by <br><br>
      <b> <i>i = dQ/dt</i></b>  with <b><i>Q = C * v</i> </b>.
</P>
<P>
The capacitance <i>C</i> is given as input signal.
</P>
<P>
It is required that C &ge; 0, otherwise an
assertion is raised. To avoid a variable index system,<br>
C = Cmin, if 0 &le; C &lt; Cmin, where
Cmin is a parameter with default value Modelica.Constants.eps.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i>June 7, 2004   </i>
       by Christoph Clauss<br>changed, docu added<br>
       </li>
<li><i>April 30, 2004</i>
       by Anton Haumer<br>implemented.
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Line(points = {{-90,0},{-14,0}}, color = {0,0,255}),Line(points = {{14,0},{90,0}}, color = {0,0,255}),Line(points = {{0,90},{0,30}}, color = {0,0,255}),Line(points = {{-14,28},{-14,-28}}, thickness = 0.5, color = {0,0,255}),Line(points = {{14,28},{14,-28}}, thickness = 0.5, color = {0,0,255}),Text(extent = {{-144,-43},{156,-83}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Line(points = {{-96,0},{-14,0}}, color = {0,0,255}),Line(points = {{14,0},{96,0}}, color = {0,0,255}),Line(points = {{0,90},{0,30}}, color = {0,0,255}),Line(points = {{-14,28},{-14,-28}}, thickness = 0.5, color = {0,0,255}),Line(points = {{14,28},{14,-28}}, thickness = 0.5, color = {0,0,255})}));
    end VariableCapacitor;
    // protect solver from index change
    model VariableInductor "Ideal linear electrical inductor with variable inductance"
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      Modelica.Blocks.Interfaces.RealInput L annotation(Placement(transformation(origin = {0,108}, extent = {{-20,-20},{20,20}}, rotation = 270)));
      Modelica.SIunits.MagneticFlux Psi;
      parameter Modelica.SIunits.Inductance Lmin = Modelica.Constants.eps "lower bound for variable inductance";
    equation
      assert(L >= 0, "Inductance L_ (= " + String(L) + ") has to be >= 0!");
      Psi = noEvent(max(L, Lmin)) * i;
      v = der(Psi);
      annotation(Documentation(info = "<HTML>
<P>
The linear inductor connects the branch voltage <i>v</i> with the
branch current <i>i</i> by <br><br>
      <b> <i>v = d Psi/dt </i></b>   with  <b><i>Psi = L * i </i></b>.
</P>
<P>
The inductance <i>L</i> is as input signal.
</P>
<P>
It is required that L &ge; 0, otherwise an
assertion is raised. To avoid a variable index system,<br>
L = Lmin, if 0 &le; L &lt; Lmin, where
Lmin is a parameter with default value Modelica.Constants.eps.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i>June 7, 2004   </i>
       by Christoph Clauss<br>changed, docu added<br>
       </li>
<li><i>April 30, 2004</i>
       by Anton Haumer<br>implemented.
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Line(points = {{-90,0},{-60,0}}, color = {0,0,255}),Line(points = {{60,0},{90,0}}, color = {0,0,255}),Line(points = {{0,90},{0,8}}, color = {0,0,255}),Ellipse(extent = {{-60,-15},{-30,15}}, lineColor = {0,0,255}),Ellipse(extent = {{-30,-15},{0,15}}, lineColor = {0,0,255}),Ellipse(extent = {{0,-15},{30,15}}, lineColor = {0,0,255}),Ellipse(extent = {{30,-15},{60,15}}, lineColor = {0,0,255}),Rectangle(extent = {{-60,-30},{60,0}}, lineColor = {255,255,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Text(extent = {{-146,-47},{154,-87}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Line(points = {{-96,0},{-60,0}}, color = {0,0,255}),Line(points = {{0,90},{0,8}}, color = {0,0,255}),Ellipse(extent = {{-60,-15},{-30,15}}, lineColor = {0,0,255}),Ellipse(extent = {{-30,-15},{0,15}}, lineColor = {0,0,255}),Ellipse(extent = {{0,-15},{30,15}}, lineColor = {0,0,255}),Ellipse(extent = {{30,-15},{60,15}}, lineColor = {0,0,255}),Rectangle(extent = {{-60,-30},{62,0}}, lineColor = {255,255,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{60,0},{96,0}}, color = {0,0,255})}));
    end VariableInductor;
    // protect solver from index change
    annotation(Documentation(info = "<HTML>
<p>
This package contains basic analog electrical components.
</p>

</HTML>
", revisions = "<html>
<dl>
<dt>
<b>Main Authors:</b>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden<br>
<p>
</dl>
</html>"));
  end Basic;
  package Ideal "Ideal electrical elements such as switches, diode, transformer, operational amplifier"
    extends Modelica.Icons.Library;
    model IdealThyristor "Ideal thyristor"
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      parameter Modelica.SIunits.Resistance Ron(final min = 0) = 1e-005 "Closed thyristor resistance";
      parameter Modelica.SIunits.Conductance Goff(final min = 0) = 1e-005 "Opened thyristor conductance";
      parameter Modelica.SIunits.Voltage Vknee(final min = 0, start = 0) "Forward threshold voltage";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(final T = 293.15);
      Boolean off(start = true) "Switching state";
      Modelica.Blocks.Interfaces.BooleanInput fire annotation(Placement(transformation(origin = {70,110}, extent = {{-20,-20},{20,20}}, rotation = 270)));
    protected
      Real s(final unit = "1") "Auxiliary variable: if on then current, if opened then voltage";
      constant Modelica.SIunits.Voltage unitVoltage = 1 annotation(HideResult = true);
      constant Modelica.SIunits.Current unitCurrent = 1 annotation(HideResult = true);
    equation
      off = s < 0 or pre(off) and not fire;
      v = s * unitCurrent * (if off then 1 else Ron) + Vknee;
      i = s * unitVoltage * (if off then Goff else 1) + Goff * Vknee;
      LossPower = v * i;
      annotation(Documentation(info = "<html>
This is an ideal thyristor model which is<br><br>
<b>open </b>(off), if the voltage drop is less than 0 or fire is false<br>
<b>closed</b> (on), if the voltage drop is greater or equal 0  and fire is true.<br>
</P>
<p>
This is the behaviour if all parameters are exactly zero.<br><br>
Note, there are circuits, where this ideal description
with zero resistance and zero cinductance is not possible.
In order to prevent singularities during switching, the opened
thyristor has a small conductance <i>Goff</i> and the closed thyristor has a low
resistance <i>Ron</i> which is default.
</P>
<P>
The parameter <i>Vknee</i> which is the forward threshold voltage, allows to displace
the knee point <br>
along  the <i>Goff</i>-characteristic until <i>v = Vknee</i>.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled. The parameters are not temperature dependent.
</p>
</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss and Anton Haumer<br> Vknee added<br>
       </li>
<li><i>some years ago   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Text(extent = {{-150,-47},{150,-87}}, textString = "%name", lineColor = {0,0,255}),Polygon(points = {{30,0},{-30,40},{-30,-40},{30,0}}, lineColor = {0,0,0}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-90,0},{40,0}}, color = {0,0,255}),Line(points = {{40,0},{90,0}}, color = {0,0,255}),Line(points = {{30,40},{30,-40}}, color = {0,0,255}),Line(points = {{30,20},{70,60},{70,90}}, color = {0,0,255}),Line(points = {{40,50},{60,30}}, color = {0,0,255}),Line(visible = useHeatPort, points = {{0,-100},{0,-20}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-80,0},{80,0}}, color = {128,128,128}),Polygon(points = {{70,4},{80,0},{70,-4},{70,4}}, lineColor = {128,128,128}, fillColor = {128,128,128}, fillPattern = FillPattern.Solid),Line(points = {{0,80},{0,-80}}, color = {128,128,128}),Polygon(points = {{-4,70},{0,80},{4,70},{-4,70}}, lineColor = {128,128,128}, fillColor = {128,128,128}, fillPattern = FillPattern.Solid),Text(extent = {{10,80},{20,70}}, lineColor = {128,128,128}, textString = "i"),Text(extent = {{70,-10},{80,-20}}, lineColor = {128,128,128}, textString = "v"),Line(points = {{-80,-40},{-20,-10},{20,10},{40,70}}, color = {0,0,0}, thickness = 0.5),Line(points = {{20,9},{20,0}}, color = {128,128,128}, pattern = LinePattern.Dot),Text(extent = {{20,0},{40,-10}}, lineColor = {128,128,128}, pattern = LinePattern.Dot, textString = "Vknee"),Text(extent = {{20,70},{40,60}}, lineColor = {128,128,128}, pattern = LinePattern.Dot, textString = "Ron"),Text(extent = {{-20,10},{0,0}}, lineColor = {128,128,128}, pattern = LinePattern.Dot, textString = "Goff"),Ellipse(extent = {{18,12},{22,8}}, pattern = LinePattern.Dot, lineColor = {0,0,255}),Line(points = {{20,10},{70,40}}, color = {0,0,0}, thickness = 0.5)}));
    end IdealThyristor;
    model IdealGTOThyristor "Ideal GTO thyristor"
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      parameter Modelica.SIunits.Resistance Ron(final min = 0) = 1e-005 "Closed thyristor resistance";
      parameter Modelica.SIunits.Conductance Goff(final min = 0) = 1e-005 "Opened thyristor conductance";
      parameter Modelica.SIunits.Voltage Vknee(final min = 0, start = 0) "Forward threshold voltage";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(final T = 293.15);
      Boolean off(start = true) "Switching state";
      Modelica.Blocks.Interfaces.BooleanInput fire annotation(Placement(transformation(origin = {70,110}, extent = {{-20,-20},{20,20}}, rotation = 270)));
    protected
      Real s(final unit = "1") "Auxiliary variable: if on then current, if opened then voltage";
      constant Modelica.SIunits.Voltage unitVoltage = 1 annotation(HideResult = true);
      constant Modelica.SIunits.Current unitCurrent = 1 annotation(HideResult = true);
    equation
      off = s < 0 or not fire;
      v = s * unitCurrent * (if off then 1 else Ron) + Vknee;
      i = s * unitVoltage * (if off then Goff else 1) + Goff * Vknee;
      LossPower = v * i;
      annotation(Documentation(info = "<html>
This is an ideal GTO thyristor model which is<br><br>
<b>open </b>(off), if the voltage drop is less than 0 or fire is false<br>
<b>closed</b> (on), if the voltage drop is greater or equal 0  and fire is true.<br>
</P>
<p>
This is the behaviour if all parameters are exactly zero.<br><br>
Note, there are circuits, where this ideal description
with zero resistance and zero cinductance is not possible.
In order to prevent singularities during switching, the opened
thyristor has a small conductance <i>Goff</i> and the closed thyristor has a low
resistance <i>Ron</i> which is default.
</P>
<P>
The parameter <i>Vknee</i> which is the forward threshold voltage, allows to displace
the knee point <br>
along  the <i>Goff</i>-characteristic until <i>v = Vknee</i>.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled. The parameters are not temperature dependent.
</p>
</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss and Anton Haumer<br> Vknee added<br>
       </li>
<li><i>some years ago   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{30,0},{-30,40},{-30,-40},{30,0}}, lineColor = {0,0,0}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-90,0},{40,0}}, color = {0,0,255}),Line(points = {{40,0},{90,0}}, color = {0,0,255}),Line(points = {{30,40},{30,-40}}, color = {0,0,255}),Line(points = {{30,20},{70,60},{70,90}}, color = {0,0,255}),Line(points = {{40,50},{60,30}}, color = {0,0,255}),Line(visible = useHeatPort, points = {{0,-100},{0,-20}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot),Text(extent = {{-149,-43},{151,-83}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-80,0},{80,0}}, color = {128,128,128}),Polygon(points = {{70,4},{80,0},{70,-4},{70,4}}, lineColor = {128,128,128}, fillColor = {128,128,128}, fillPattern = FillPattern.Solid),Line(points = {{0,80},{0,-80}}, color = {128,128,128}),Polygon(points = {{-4,70},{0,80},{4,70},{-4,70}}, lineColor = {128,128,128}, fillColor = {128,128,128}, fillPattern = FillPattern.Solid),Text(extent = {{10,80},{20,70}}, lineColor = {128,128,128}, textString = "i"),Text(extent = {{70,-10},{80,-20}}, lineColor = {128,128,128}, textString = "v"),Line(points = {{-80,-40},{-20,-10},{20,10},{40,70}}, color = {0,0,0}, thickness = 0.5),Line(points = {{20,9},{20,0}}, color = {128,128,128}, pattern = LinePattern.Dot),Text(extent = {{20,0},{40,-10}}, lineColor = {128,128,128}, pattern = LinePattern.Dot, textString = "Vknee"),Text(extent = {{20,70},{40,60}}, lineColor = {128,128,128}, pattern = LinePattern.Dot, textString = "Ron"),Text(extent = {{-20,10},{0,0}}, lineColor = {128,128,128}, pattern = LinePattern.Dot, textString = "Goff"),Ellipse(extent = {{18,12},{22,8}}, pattern = LinePattern.Dot, lineColor = {0,0,255}),Line(points = {{20,10},{70,40}}, color = {0,0,0}, thickness = 0.5)}));
    end IdealGTOThyristor;
    model IdealCommutingSwitch "Ideal commuting switch"
      parameter SI.Resistance Ron(final min = 0) = 1e-005 "Closed switch resistance";
      parameter SI.Conductance Goff(final min = 0) = 1e-005 "Opened switch conductance";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(final T = 293.15);
      Interfaces.PositivePin p annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      Interfaces.NegativePin n2 annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      Interfaces.NegativePin n1 annotation(Placement(transformation(extent = {{90,40},{110,60}}, rotation = 0)));
      Modelica.Blocks.Interfaces.BooleanInput control "true => p--n2 connected, false => p--n1 connected" annotation(Placement(transformation(origin = {0,80}, extent = {{-20,-20},{20,20}}, rotation = 270)));
    protected
      Real s1(final unit = "1");
      Real s2(final unit = "1") "Auxiliary variables";
      constant Modelica.SIunits.Voltage unitVoltage = 1 annotation(HideResult = true);
      constant Modelica.SIunits.Current unitCurrent = 1 annotation(HideResult = true);
    equation
      0 = p.i + n2.i + n1.i;
      p.v - n1.v = s1 * unitCurrent * (if control then 1 else Ron);
      n1.i = -s1 * unitVoltage * (if control then Goff else 1);
      p.v - n2.v = s2 * unitCurrent * (if control then Ron else 1);
      n2.i = -s2 * unitVoltage * (if control then 1 else Goff);
      LossPower = p.i * p.v + n1.i * n1.v + n2.i * n2.v;
      annotation(Documentation(info = "<HTML>
<P>
The commuting switch has a positive pin p and two negative pins n1 and n2.
The switching behaviour is controlled
by the inpug signal control. If control is true, the pin p is connected
with the negative pin n2. Otherwise, the pin p is connected to the negative pin n1.
</P>
<P>
In order to prevent singularities during switching, the opened
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron.
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits,
where a description with zero Ron or zero Goff is not possible.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled. The parameters are not temperature dependent.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-44,4},{-36,-4}}, lineColor = {0,0,255}),Text(extent = {{-80,0},{-60,22}}, textString = "p", lineColor = {0,0,255}),Text(extent = {{60,50},{80,72}}, textString = "n1", lineColor = {0,0,255}),Text(extent = {{60,0},{80,22}}, textString = "n2", lineColor = {0,0,255}),Line(points = {{-90,0},{-44,0}}, color = {0,0,255}),Line(points = {{-37,2},{40,50}}, color = {0,0,255}),Line(points = {{40,50},{90,50}}, color = {0,0,255}),Line(points = {{0,90},{0,25}}, color = {0,0,255}),Line(points = {{40,0},{90,0}}, color = {0,0,255}),Line(visible = useHeatPort, points = {{0,-100},{0,25}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot),Text(extent = {{-148,-22},{152,-62}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-44,4},{-36,-4}}, lineColor = {0,0,255}),Line(points = {{-96,0},{-44,0}}, color = {0,0,255}),Line(points = {{-37,2},{40,50}}, color = {0,0,255}),Line(points = {{40,50},{96,50}}, color = {0,0,255}),Line(points = {{0,60},{0,25}}, color = {0,0,255}),Line(points = {{40,0},{96,0}}, color = {0,0,255})}));
    end IdealCommutingSwitch;
    model IdealIntermediateSwitch "Ideal intermediate switch"
      parameter SI.Resistance Ron(final min = 0) = 1e-005 "Closed switch resistance";
      parameter SI.Conductance Goff(final min = 0) = 1e-005 "Opened switch conductance";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(final T = 293.15);
      Interfaces.PositivePin p1 annotation(Placement(transformation(extent = {{-110,40},{-90,60}}, rotation = 0)));
      Interfaces.PositivePin p2 annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      Interfaces.NegativePin n1 annotation(Placement(transformation(extent = {{90,40},{110,60}}, rotation = 0)));
      Interfaces.NegativePin n2 annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.BooleanInput control "true => p1--n2, p2--n1 connected, otherwise p1--n1, p2--n2  connected" annotation(Placement(transformation(origin = {0,80}, extent = {{-20,-20},{20,20}}, rotation = 270)));
    protected
      Real s1(final unit = "1");
      Real s2(final unit = "1");
      Real s3(final unit = "1");
      Real s4(final unit = "1") "Auxiliary variables";
      constant Modelica.SIunits.Voltage unitVoltage = 1 annotation(HideResult = true);
      constant Modelica.SIunits.Current unitCurrent = 1 annotation(HideResult = true);
    equation
      p1.v - n1.v = s1 * unitCurrent * (if control then 1 else Ron);
      p2.v - n2.v = s2 * unitCurrent * (if control then 1 else Ron);
      p1.v - n2.v = s3 * unitCurrent * (if control then Ron else 1);
      p2.v - n1.v = s4 * unitCurrent * (if control then Ron else 1);
      p1.i = if control then s1 * unitVoltage * Goff + s3 * unitCurrent else s1 * unitCurrent + s3 * unitVoltage * Goff;
      p2.i = if control then s2 * unitVoltage * Goff + s4 * unitCurrent else s2 * unitCurrent + s4 * unitVoltage * Goff;
      n1.i = if control then -s1 * unitVoltage * Goff - s4 * unitCurrent else -s1 * unitCurrent - s4 * unitVoltage * Goff;
      n2.i = if control then -s2 * unitVoltage * Goff - s3 * unitCurrent else -s2 * unitCurrent - s3 * unitVoltage * Goff;
      LossPower = p1.i * p1.v + p2.i * p2.v + n1.i * n1.v + n2.i * n2.v;
      annotation(Documentation(info = "<html>
<p>The intermediate switch has four switching contact pins p1, p2, n1, and n2. The switching behaviour is controlled by the input signal control. If control is true, the pin p1 is connected to pin n2, and the pin p2 is connected to the pin n1. Otherwise, if control is false, the pin p1 is connected to n1, and p2 is connected to n2. <img src=\"../Images/IdealIntermediateSwitch1.png\"/> </p>
<p>In order to prevent singularities during switching, the opened switch has a (very low) conductance Goff and the closed switch has a (very low) resistance Ron. <img src=\"../Images/IdealIntermediateSwitch2.png\"/> </p>
<p><br/>The limiting case is also allowed, i.e., the resistance Ron of the closed switch could be exactly zero and the conductance Goff of the open switch could be also exactly zero. Note, there are circuits, where a description with zero Ron or zero Goff is not possible. </p><p><br/><b>Please note:</b> In case of useHeatPort=true the temperature dependence of the electrical behavior is <b>not </b>modelled. The parameters are not temperature dependent. </p>
</html>", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-4,30},{4,22}}, lineColor = {0,0,255}),Text(extent = {{-80,50},{-60,72}}, textString = "p1", lineColor = {0,0,255}),Text(extent = {{-80,0},{-60,22}}, textString = "p2", lineColor = {0,0,255}),Text(extent = {{60,50},{80,72}}, textString = "n1", lineColor = {0,0,255}),Text(extent = {{60,0},{80,22}}, textString = "n2", lineColor = {0,0,255}),Line(points = {{-90,0},{-44,0}}, color = {0,0,255}),Line(points = {{-90,50},{-44,50}}, color = {0,0,255}),Line(points = {{-44,0},{40,50}}, color = {0,0,255}),Line(points = {{-44,50},{40,0}}, color = {0,0,255}),Line(points = {{40,50},{90,50}}, color = {0,0,255}),Line(points = {{0,90},{0,25}}, color = {0,0,255}),Line(points = {{40,0},{90,0}}, color = {0,0,255}),Text(extent = {{-151,-24},{149,-64}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-4,29},{4,21}}, lineColor = {0,0,255}),Line(points = {{-96,0},{-40,0}}, color = {0,0,255}),Line(points = {{-96,50},{-40,50}}, color = {0,0,255}),Line(points = {{-40,0},{40,50}}, color = {0,0,255}),Line(points = {{-40,50},{40,0}}, color = {0,0,255}),Line(points = {{40,50},{96,50}}, color = {0,0,255}),Line(points = {{0,60},{0,25}}, color = {0,0,255}),Line(points = {{40,0},{96,0}}, color = {0,0,255})}));
    end IdealIntermediateSwitch;
    model ControlledIdealCommutingSwitch "Controlled ideal commuting switch"
      parameter SI.Voltage level = 0.5 "Switch level";
      parameter SI.Resistance Ron(final min = 0) = 1e-005 "Closed switch resistance";
      parameter SI.Conductance Goff(final min = 0) = 1e-005 "Opened switch conductance";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(final T = 293.15);
      Interfaces.PositivePin p annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      Interfaces.NegativePin n2 annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      Interfaces.NegativePin n1 annotation(Placement(transformation(extent = {{90,40},{110,60}}, rotation = 0)));
      Interfaces.Pin control "Control pin: if control.v > level p--n2 connected, otherwise p--n1 connected" annotation(Placement(transformation(origin = {0,100}, extent = {{-10,-10},{10,10}}, rotation = 90)));
    protected
      Real s1(final unit = "1");
      Real s2(final unit = "1") "Auxiliary variables";
      constant Modelica.SIunits.Voltage unitVoltage = 1 annotation(HideResult = true);
      constant Modelica.SIunits.Current unitCurrent = 1 annotation(HideResult = true);
    equation
      control.i = 0;
      0 = p.i + n2.i + n1.i;
      p.v - n1.v = s1 * unitCurrent * (if control.v > level then 1 else Ron);
      n1.i = -s1 * unitVoltage * (if control.v > level then Goff else 1);
      p.v - n2.v = s2 * unitCurrent * (if control.v > level then Ron else 1);
      n2.i = -s2 * unitVoltage * (if control.v > level then 1 else Goff);
      LossPower = p.i * p.v + n1.i * n1.v + n2.i * n2.v;
      annotation(Documentation(info = "<HTML>
<P>
The commuting switch has a positive pin p and two negative pins n1 and n2.
The switching behaviour is controlled
by the control pin. If its voltage exceeds the value of the parameter level,
the pin p is connected with the negative pin n2. Otherwise, the pin p is
connected the negative pin n1.
</P>
<P>
In order to prevent singularities during switching, the opened
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron.
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits,
where a description with zero Ron or zero Goff is not possible.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled. The parameters are not temperature dependent.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-44,4},{-36,-4}}, lineColor = {0,0,255}),Text(extent = {{-80,0},{-60,22}}, textString = "p", lineColor = {0,0,255}),Text(extent = {{60,50},{80,72}}, textString = "n1", lineColor = {0,0,255}),Text(extent = {{60,0},{80,22}}, textString = "n2", lineColor = {0,0,255}),Line(points = {{-90,0},{-44,0}}, color = {0,0,255}),Line(points = {{-37,2},{40,50}}, color = {0,0,255}),Line(points = {{40,50},{90,50}}, color = {0,0,255}),Line(points = {{0,90},{0,25}}, color = {0,0,255}),Line(points = {{40,0},{90,0}}, color = {0,0,255}),Line(visible = useHeatPort, points = {{0,-99},{0,25}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot),Text(extent = {{-145,-21},{155,-61}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-44,4},{-36,-4}}, lineColor = {0,0,255}),Line(points = {{-96,0},{-44,0}}, color = {0,0,255}),Line(points = {{-37,2},{40,50}}, color = {0,0,255}),Line(points = {{40,50},{96,50}}, color = {0,0,255}),Line(points = {{0,96},{0,25}}, color = {0,0,255}),Line(points = {{40,0},{96,0}}, color = {0,0,255})}));
    end ControlledIdealCommutingSwitch;
    model ControlledIdealIntermediateSwitch "Controlled ideal intermediate switch"
      parameter SI.Voltage level = 0.5 "Switch level";
      parameter SI.Resistance Ron(final min = 0) = 1e-005 "Closed switch resistance";
      parameter SI.Conductance Goff(final min = 0) = 1e-005 "Opened switch conductance";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(final T = 293.15);
      Interfaces.PositivePin p1 annotation(Placement(transformation(extent = {{-110,40},{-90,60}}, rotation = 0)));
      Interfaces.PositivePin p2 annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      Interfaces.NegativePin n1 annotation(Placement(transformation(extent = {{90,40},{110,60}}, rotation = 0)));
      Interfaces.NegativePin n2 annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      Interfaces.Pin control "Control pin: if control.v > level p1--n2, p2--n1 connected,
         otherwise p1--n1, p2--n2  connected" annotation(Placement(transformation(origin = {0,100}, extent = {{-10,-10},{10,10}}, rotation = 90)));
    protected
      Real s1(final unit = "1");
      Real s2(final unit = "1");
      Real s3(final unit = "1");
      Real s4(final unit = "1") "Auxiliary variables";
      constant Modelica.SIunits.Voltage unitVoltage = 1 annotation(HideResult = true);
      constant Modelica.SIunits.Current unitCurrent = 1 annotation(HideResult = true);
    equation
      control.i = 0;
      p1.v - n1.v = s1 * unitCurrent * (if control.v > level then 1 else Ron);
      p2.v - n2.v = s2 * unitCurrent * (if control.v > level then 1 else Ron);
      p1.v - n2.v = s3 * unitCurrent * (if control.v > level then Ron else 1);
      p2.v - n1.v = s4 * unitCurrent * (if control.v > level then Ron else 1);
      p1.i = if control.v > level then s1 * unitVoltage * Goff + s3 * unitCurrent else s1 * unitCurrent + s3 * unitVoltage * Goff;
      p2.i = if control.v > level then s2 * unitVoltage * Goff + s4 * unitCurrent else s2 * unitCurrent + s4 * unitVoltage * Goff;
      n1.i = if control.v > level then -s1 * unitVoltage * Goff - s4 * unitCurrent else -s1 * unitCurrent - s4 * unitVoltage * Goff;
      n2.i = if control.v > level then -s2 * unitVoltage * Goff - s3 * unitCurrent else -s2 * unitCurrent - s3 * unitVoltage * Goff;
      LossPower = p1.i * p1.v + p2.i * p2.v + n1.i * n1.v + n2.i * n2.v;
      annotation(Documentation(info = "<html>
<p>The intermediate switch has four switching contact pins p1, p2, n1, and n2. The switching behaviour is controlled by the control pin. If its voltage exceeds the value of the parameter level, the pin p1 is connected to pin n2, and the pin p2 is connected to the pin n1. Otherwise, the pin p1 is connected to n1, and p2 is connected to n2. <img src=\"../Images/ControlledIdealIntermediateSwitch1.png\"/> </p>
<p>In order to prevent singularities during switching, the opened switch has a (very low) conductance Goff and the closed switch has a (very low) resistance Ron. <img src=\"../Images/ControlledIdealIntermediateSwitch2.png\"/> </p>
<p><br/>The limiting case is also allowed, i.e., the resistance Ron of the closed switch could be exactly zero and the conductance Goff of the open switch could be also exactly zero. Note, there are circuits, where a description with zero Ron or zero Goff is not possible. </p><p><br/><b>Please note:</b> In case of useHeatPort=true the temperature dependence of the electrical behavior is <b>not </b>modelled. The parameters are not temperature dependent. </p>
</html>", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-4,30},{4,22}}, lineColor = {0,0,255}),Text(extent = {{-80,50},{-60,72}}, textString = "p1", lineColor = {0,0,255}),Text(extent = {{-80,0},{-60,22}}, textString = "p2", lineColor = {0,0,255}),Text(extent = {{60,50},{80,72}}, textString = "n1", lineColor = {0,0,255}),Text(extent = {{60,0},{80,22}}, textString = "n2", lineColor = {0,0,255}),Line(points = {{-90,0},{-40,0}}, color = {0,0,255}),Line(points = {{-90,50},{-39,50}}, color = {0,0,255}),Line(points = {{-40,0},{40,50}}, color = {0,0,255}),Line(points = {{-40,50},{40,0}}, color = {0,0,255}),Line(points = {{40,50},{90,50}}, color = {0,0,255}),Line(points = {{0,90},{0,25}}, color = {0,0,255}),Line(points = {{40,0},{90,0}}, color = {0,0,255}),Line(visible = useHeatPort, points = {{0,-100},{0,22}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot),Text(extent = {{-150,-23},{150,-63}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-4,29},{4,21}}, lineColor = {0,0,255}),Line(points = {{-96,0},{-40,0}}, color = {0,0,255}),Line(points = {{-96,50},{-40,50}}, color = {0,0,255}),Line(points = {{-40,0},{40,50}}, color = {0,0,255}),Line(points = {{-40,50},{40,0}}, color = {0,0,255}),Line(points = {{40,50},{96,50}}, color = {0,0,255}),Line(points = {{0,96},{0,25}}, color = {0,0,255}),Line(points = {{40,0},{96,0}}, color = {0,0,255})}));
    end ControlledIdealIntermediateSwitch;
    model IdealOpAmp "Ideal operational amplifier (norator-nullator pair)"
      SI.Voltage v1 "Voltage drop over the left port";
      SI.Voltage v2 "Voltage drop over the right port";
      SI.Current i1 "Current flowing from pos. to neg. pin of the left port";
      SI.Current i2 "Current flowing from pos. to neg. pin of the right port";
      Interfaces.PositivePin p1 "Positive pin of the left port" annotation(Placement(transformation(extent = {{-110,-60},{-90,-40}}, rotation = 0)));
      Interfaces.NegativePin n1 "Negative pin of the left port" annotation(Placement(transformation(extent = {{-110,40},{-90,60}}, rotation = 0)));
      Interfaces.PositivePin p2 "Positive pin of the right port" annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      Interfaces.NegativePin n2 "Negative pin of the right port" annotation(Placement(transformation(origin = {0,-100}, extent = {{10,-10},{-10,10}}, rotation = 270)));
    equation
      v1 = p1.v - n1.v;
      v2 = p2.v - n2.v;
      0 = p1.i + n1.i;
      0 = p2.i + n2.i;
      i1 = p1.i;
      i2 = p2.i;
      v1 = 0;
      i1 = 0;
      annotation(Documentation(info = "<html>
<P>
The ideal OpAmp is a two-port. The left port is fixed to <i>v1=0</i> and <i>i1=0</i>
(nullator). At the right port both any voltage <i>v2</i> and any current <i>i2</i>
are possible (norator).
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{60,0},{-60,70},{-60,-70},{60,0}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{-90,50},{-60,50}}, color = {0,0,255}),Line(points = {{-90,-50},{-60,-50}}, color = {0,0,255}),Line(points = {{60,0},{90,0}}, color = {0,0,255}),Line(points = {{0,-35},{0,-91}}, color = {0,0,255}),Line(points = {{-48,32},{-28,32}}, color = {0,0,255}),Line(points = {{-39,-20},{-39,-41}}, color = {0,0,255}),Line(points = {{-50,-31},{-28,-31}}, color = {0,0,255}),Text(extent = {{-150,126},{150,86}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{60,0},{-60,70},{-60,-70},{60,0}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{-96,50},{-60,50}}, color = {0,0,255}),Line(points = {{-96,-50},{-60,-50}}, color = {0,0,255}),Line(points = {{60,0},{96,0}}, color = {0,0,255}),Line(points = {{0,-35},{0,-96}}, color = {0,0,255}),Line(points = {{-55,50},{-45,50}}, color = {0,0,255}),Line(points = {{-50,-45},{-50,-55}}, color = {0,0,255}),Line(points = {{-55,-50},{-45,-50}}, color = {0,0,255}),Text(extent = {{-111,-39},{-90,-19}}, lineColor = {160,160,164}, textString = "p1.i=0"),Polygon(points = {{120,3},{110,0},{120,-3},{120,3}}, lineColor = {0,0,0}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {160,160,164}),Line(points = {{111,0},{136,0}}, color = {0,0,0}),Text(extent = {{118,2},{135,17}}, lineColor = {0,0,0}, textString = "i2"),Text(extent = {{-111,60},{-90,80}}, lineColor = {160,160,164}, textString = "n1.i=0"),Line(points = {{18,-111},{18,-86}}, color = {160,160,164}),Polygon(points = {{21,-101},{18,-111},{15,-101},{21,-101}}, lineColor = {160,160,164}, fillColor = {160,160,164}, fillPattern = FillPattern.Solid),Text(extent = {{22,-100},{39,-85}}, lineColor = {0,0,0}, textString = "i2")}));
    end IdealOpAmp;
    model IdealOpAmp3Pin "Ideal operational amplifier (norator-nullator pair), but 3 pins"
      Interfaces.PositivePin in_p "Positive pin of the input port" annotation(Placement(transformation(extent = {{-110,-60},{-90,-40}}, rotation = 0)));
      Interfaces.NegativePin in_n "Negative pin of the input port" annotation(Placement(transformation(extent = {{-110,40},{-90,60}}, rotation = 0)));
      Interfaces.PositivePin out "Output pin" annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
    equation
      in_p.v = in_n.v;
      in_p.i = 0;
      in_n.i = 0;
      annotation(Documentation(info = "<html>
<P>
The ideal OpAmp with three pins is of exactly the same behaviour as the ideal
OpAmp with four pins. Only the negative output pin is left out.
Both the input voltage and current are fixed to zero (nullator).
At the output pin both any voltage <i>v2</i> and any current <i>i2</i>
are possible.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> 2002   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{60,0},{-60,70},{-60,-70},{60,0}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{-90,50},{-60,50}}, color = {0,0,255}),Line(points = {{-90,-50},{-60,-50}}, color = {0,0,255}),Line(points = {{60,0},{90,0}}, color = {0,0,255}),Line(points = {{-48,32},{-28,32}}, color = {0,0,255}),Line(points = {{-39,-20},{-39,-41}}, color = {0,0,255}),Line(points = {{-50,-31},{-28,-31}}, color = {0,0,255}),Text(extent = {{-149,117},{151,77}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{60,0},{-60,70},{-60,-70},{60,0}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{-96,50},{-60,50}}, color = {0,0,255}),Line(points = {{-96,-50},{-60,-50}}, color = {0,0,255}),Line(points = {{60,0},{97,0}}, color = {0,0,255}),Line(points = {{-55,50},{-45,50}}, color = {0,0,255}),Line(points = {{-50,-45},{-50,-55}}, color = {0,0,255}),Line(points = {{-55,-50},{-45,-50}}, color = {0,0,255}),Text(extent = {{-111,-39},{-90,-19}}, lineColor = {160,160,164}, textString = "p1.i=0"),Polygon(points = {{120,3},{110,0},{120,-3},{120,3}}, lineColor = {0,0,0}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {160,160,164}),Line(points = {{111,0},{136,0}}, color = {0,0,0}),Text(extent = {{118,2},{135,17}}, lineColor = {0,0,0}, textString = "i2"),Text(extent = {{-111,60},{-90,80}}, lineColor = {160,160,164}, textString = "n1.i=0")}));
    end IdealOpAmp3Pin;
    model IdealOpAmpLimited "Ideal operational amplifier with limitation"
      Interfaces.PositivePin in_p "Positive pin of the input port" annotation(Placement(transformation(extent = {{-110,-60},{-90,-40}}, rotation = 0)));
      Interfaces.NegativePin in_n "Negative pin of the input port" annotation(Placement(transformation(extent = {{-110,40},{-90,60}}, rotation = 0)));
      Interfaces.PositivePin out "Output pin" annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      Interfaces.PositivePin VMax "Positive output voltage limitation" annotation(Placement(transformation(extent = {{-10,60},{10,80}}, rotation = 0)));
      Interfaces.NegativePin VMin "Negative output voltage limitation" annotation(Placement(transformation(extent = {{-10,-80},{10,-60}}, rotation = 0)));
      SI.Voltage vin "input voltage";
    protected
      Real s(final unit = "1") "Auxiliary variable";
      constant Modelica.SIunits.Voltage unitVoltage = 1 annotation(HideResult = true);
    equation
      in_p.i = 0;
      in_n.i = 0;
      VMax.i = 0;
      VMin.i = 0;
      vin = in_p.v - in_n.v;
      in_p.v - in_n.v = unitVoltage * smooth(0, if s < -1 then s + 1 else if s > 1 then s - 1 else 0);
      out.v = smooth(0, if s < -1 then VMin.v else if s > 1 then VMax.v else ((VMax.v - VMin.v) * s) / 2 + (VMax.v + VMin.v) / 2);
      annotation(Documentation(info = "<HTML>
<P>
The ideal OpAmp with limitation behaves like an ideal OpAmp without limitation,
if the output voltage is within the limits (VMin < out.v < VMax). In this case
the input voltage vin=in_p.v - in_n.v is zero.
If the input voltage is vin < 0, the output voltage is out.v = VMin.
If the input voltage is vin > 0, the output voltage is out.v = VMax.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{60,0},{-60,70},{-60,-70},{60,0}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{-45,-10},{-10,-10},{-10,10},{20,10}}, color = {0,0,255}),Line(points = {{0,35},{0,80}}, color = {0,0,255}),Line(points = {{0,-35},{0,-80}}, color = {0,0,255}),Line(points = {{-90,50},{-60,50}}, color = {0,0,255}),Line(points = {{-90,-50},{-60,-50}}, color = {0,0,255}),Line(points = {{60,0},{90,0}}, color = {0,0,255}),Line(points = {{-48,32},{-28,32}}, color = {0,0,255}),Line(points = {{-39,-20},{-39,-41}}, color = {0,0,255}),Line(points = {{-50,-31},{-28,-31}}, color = {0,0,255}),Text(extent = {{-152,135},{148,95}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{60,0},{-60,70},{-60,-70},{60,0}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{-45,-10},{-10,-10},{-10,10},{20,10}}, color = {0,0,255}),Line(points = {{0,35},{0,80}}, color = {0,0,255}),Line(points = {{0,-35},{0,-80}}, color = {0,0,255}),Line(points = {{-96,50},{-60,50}}, color = {0,0,255}),Line(points = {{-96,-50},{-60,-50}}, color = {0,0,255}),Line(points = {{60,0},{96,0}}, color = {0,0,255}),Line(points = {{-55,50},{-45,50}}, color = {0,0,255}),Line(points = {{-50,-45},{-50,-55}}, color = {0,0,255}),Line(points = {{-55,-50},{-45,-50}}, color = {0,0,255}),Text(extent = {{-111,-39},{-90,-19}}, lineColor = {160,160,164}, textString = "p1.i=0"),Polygon(points = {{120,3},{110,0},{120,-3},{120,3}}, lineColor = {0,0,0}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {160,160,164}),Line(points = {{111,0},{136,0}}, color = {0,0,0}),Text(extent = {{118,2},{135,17}}, lineColor = {0,0,0}, textString = "i2"),Text(extent = {{-111,60},{-90,80}}, lineColor = {160,160,164}, textString = "n1.i=0")}));
    end IdealOpAmpLimited;
    model IdealDiode "Ideal diode"
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      parameter Modelica.SIunits.Resistance Ron(final min = 0) = 1e-005 "Forward state-on differential resistance (closed diode resistance)";
      parameter Modelica.SIunits.Conductance Goff(final min = 0) = 1e-005 "Backward state-off conductance (opened diode conductance)";
      parameter Modelica.SIunits.Voltage Vknee(final min = 0, start = 0) "Forward threshold voltage";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort;
      Boolean off(start = true) "Switching state";
    protected
      Real s(final unit = "1") "Auxiliary variable: if on then current, if opened then voltage";
      constant Modelica.SIunits.Voltage unitVoltage = 1 annotation(HideResult = true);
      constant Modelica.SIunits.Current unitCurrent = 1 annotation(HideResult = true);
    equation
      off = s < 0;
      v = s * unitCurrent * (if off then 1 else Ron) + Vknee;
      i = s * unitVoltage * (if off then Goff else 1) + Goff * Vknee;
      LossPower = v * i;
      annotation(Documentation(info = "<html>
<P>
This is an ideal switch which is<br><br>
<b>open </b>(off), if it is reversed biased (voltage drop less than 0)<br>
<b>closed</b> (on), if it is conducting (current > 0).<br>
</P>
<p>
This is the behaviour if all parameters are exactly zero.<br><br>
Note, there are circuits, where this ideal description
with zero resistance and zero cinductance is not possible.
In order to prevent singularities during switching, the opened
diode has a small conductance <i>Gon</i> and the closed diode has a low
resistance <i>Roff</i> which is default.
</P>
<P>
The parameter <i>Vknee</i> which is the forward threshold voltage, allows to displace
the knee point <br>
along  the <i>Gon</i>-characteristic until <i>v = Vknee</i>.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled.
</p>
</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss and Anton Haumer<br> Vknee added<br>
       </li>
<li><i>some years ago   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{30,0},{-30,40},{-30,-40},{30,0}}, lineColor = {0,0,0}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-90,0},{40,0}}, color = {0,0,255}),Line(points = {{40,0},{90,0}}, color = {0,0,255}),Line(points = {{30,40},{30,-40}}, color = {0,0,255}),Line(visible = useHeatPort, points = {{0,-100},{0,-20}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot),Text(extent = {{-156,101},{144,61}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-80,0},{80,0}}, color = {128,128,128}),Polygon(points = {{70,4},{80,0},{70,-4},{70,4}}, lineColor = {128,128,128}, fillColor = {128,128,128}, fillPattern = FillPattern.Solid),Line(points = {{0,80},{0,-80}}, color = {128,128,128}),Polygon(points = {{-4,70},{0,80},{4,70},{-4,70}}, lineColor = {128,128,128}, fillColor = {128,128,128}, fillPattern = FillPattern.Solid),Text(extent = {{10,80},{20,70}}, lineColor = {128,128,128}, textString = "i"),Text(extent = {{70,-10},{80,-20}}, lineColor = {128,128,128}, textString = "v"),Line(points = {{-80,-40},{-20,-10},{20,10},{40,70}}, color = {0,0,0}, thickness = 0.5),Line(points = {{20,9},{20,0}}, color = {128,128,128}, pattern = LinePattern.Dot),Text(extent = {{20,0},{40,-10}}, lineColor = {128,128,128}, pattern = LinePattern.Dot, textString = "Vknee"),Text(extent = {{20,70},{40,60}}, lineColor = {128,128,128}, pattern = LinePattern.Dot, textString = "Ron"),Text(extent = {{-20,10},{0,0}}, lineColor = {128,128,128}, pattern = LinePattern.Dot, textString = "Goff"),Ellipse(extent = {{18,12},{22,8}}, pattern = LinePattern.Dot, lineColor = {0,0,255})}));
    end IdealDiode;
    model IdealTransformer "Ideal transformer core with or without magnetization"
      extends Modelica.Electrical.Analog.Interfaces.TwoPort;
      parameter Real n(start = 1) "Turns ratio primary:secondary voltage";
      parameter Boolean considerMagnetization = false;
      parameter Modelica.SIunits.Inductance Lm1(start = 1) "Magnetization inductance w.r.t. primary side" annotation(Dialog(enable = considerMagnetization));
    protected
      Modelica.SIunits.Current im1 "Magnetization current w.r.t. primary side";
      Modelica.SIunits.MagneticFlux psim1 "Magnetic flux w.r.t primary side";
    equation
      im1 = i1 + i2 / n;
      if considerMagnetization then
        psim1 = Lm1 * im1;
        v1 = der(psim1);
      else
        psim1 = 0;
        im1 = 0;
      end if;
      v1 = n * v2;
      annotation(Documentation(info = "<html>
<p>
The ideal transformer is a two-port circuit element;
in case of Boolean parameter <code>considerMagnetization = false</code> it is characterized by the following equations:
</p>
<pre><code>
 i2 = -i1*n;
 v2 =  v1/n;
</code></pre>
<p>
where <code>n</code> is a real number called the turns ratio.
Due to this equations, also DC voltages and currents are transformed - which is not the case for technical transformers.
</p>
<p>
In case of Boolean parameter <code>considerMagnetization = true</code> it is characterized by the following equations:
</p>
<pre><code>
 im1  = i1 + i2/n \"Magnetizing current w.r.t. primary side\";
 psim1= Lm1*im1   \"Magnetic flux w.r.t. primary side\";
 v1 = der(psim1)  \"Primary voltage\";
 v2 = v1/n        \"Secondary voltage\";
</code></pre>
<p>
where <code>Lm</code> denotes the magnetizing inductance.
Due to this equations, the DC offset of secondary voltages and currents decrement according to the time constant defined by the connected circuit.
</p>
<p>
Taking primary <code>L1sigma</code> and secondary <code>L2ssigma</code> leakage inductances into account,
compared with the <a href=\"Modelica://Modelica.Electrical.Analog.Basic.Transformer/\">basic transformer</a>
the following parameter conversion can be applied (which leads to identical results):
</p>
<pre><code>
  L1 = L1sigma + M*n \"Primary inductance at secondary no-load\";
  L2 = L2sigma + M/n \"Secondary inductance at primary no-load\";
  M  = Lm1/n         \"Mutual inductance\";
</code></pre>
<p>
For the backward conversion, one has to decide about the partitioning of the leakage to primary and secondary side.
</p>
</html>", revisions = "<html>
<ul>
<li><i>June 3, 2009   </i>
       magnetisation current added by Anton Haumer<br>
       </li>
<li><i>1998   </i>
       initially implemented by Christoph Clauss<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Ellipse(extent = {{-45,-50},{-20,-25}}),Ellipse(extent = {{-45,-25},{-20,0}}),Ellipse(extent = {{-45,0},{-20,25}}),Ellipse(extent = {{-45,25},{-20,50}}),Rectangle(extent = {{-72,-60},{-33,60}}, lineColor = {255,255,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-90,50},{-32,50}}),Line(points = {{-90,-50},{-32,-50}}),Ellipse(extent = {{20,-50},{45,-25}}),Ellipse(extent = {{20,-25},{45,0}}),Ellipse(extent = {{20,0},{45,25}}),Ellipse(extent = {{20,25},{45,50}}),Rectangle(extent = {{33,-60},{72,60}}, lineColor = {255,255,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{32,50},{90,50}}),Line(points = {{32,-50},{90,-50}}),Text(extent = {{-100,-80},{100,-100}}, textString = "n=%n"),Text(extent = {{-100,10},{-80,-10}}, lineColor = {0,0,255}, textString = "1"),Text(extent = {{80,10},{100,-10}}, lineColor = {0,0,255}, textString = "2"),Text(extent = {{-146,115},{154,75}}, textString = "%name", lineColor = {0,0,255})}), Diagram(graphics = {Text(extent = {{-100,10},{0,-10}}, lineColor = {0,0,255}, textString = "1=primary"),Text(extent = {{0,10},{100,-10}}, lineColor = {0,0,255}, textString = "2=secondary")}));
    end IdealTransformer;
    model IdealGyrator "Ideal gyrator"
      extends Interfaces.TwoPort;
      parameter SI.Conductance G(start = 1) "Gyration conductance";
    equation
      i1 = G * v2;
      i2 = -G * v1;
      annotation(Documentation(info = "<html>
<P>
A gyrator is an ideal two-port element defined by the following equations:
</P>
<PRE>
    i1 =  G * v2
    i2 = -G * v1
</PRE>
<P>
where the constant <i>G</i> is called the gyration conductance.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-70,-30},{-10,30}}, lineColor = {0,0,255}),Rectangle(extent = {{-80,-40},{-41,40}}, lineColor = {255,255,255}, pattern = LinePattern.Solid, lineThickness = 0.25, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-90,50},{-40,50},{-40,-50},{-90,-50}}, color = {0,0,255}),Line(points = {{-30,60},{20,60}}, color = {0,0,255}),Polygon(points = {{20,63},{30,60},{20,57},{20,63}}, pattern = LinePattern.Solid, lineThickness = 0.25, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Ellipse(extent = {{10,-30},{70,30}}, lineColor = {0,0,255}),Rectangle(extent = {{80,-40},{40,40}}, lineColor = {255,255,255}, pattern = LinePattern.Solid, lineThickness = 0.25, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{90,50},{40,50},{40,-50},{90,-50}}, color = {0,0,255}),Text(extent = {{-152,116},{148,76}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-70,-30},{-10,30}}, lineColor = {0,0,255}),Rectangle(extent = {{-80,-40},{-41,40}}, lineColor = {255,255,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-96,50},{-40,50},{-40,-50},{-96,-50}}, color = {0,0,255}),Line(points = {{-30,60},{20,60}}, color = {0,0,255}),Polygon(points = {{20,63},{30,60},{20,57},{20,63}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Ellipse(extent = {{10,-30},{70,30}}, lineColor = {0,0,255}),Rectangle(extent = {{80,-40},{40,40}}, lineColor = {255,255,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{96,50},{40,50},{40,-50},{96,-50}}, color = {0,0,255})}));
    end IdealGyrator;
    model Idle "Idle branch"
      extends Interfaces.OnePort;
    equation
      i = 0;
      annotation(Documentation(info = "<html>
<P>
The model Idle is a simple idle running branch.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-60,60},{60,-60}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{-90,0},{-41,0}}, color = {0,0,255}),Line(points = {{91,0},{40,0}}, color = {0,0,255}),Text(extent = {{-153,112},{147,72}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-60,60},{60,-60}}, lineColor = {0,0,255}),Line(points = {{-96,0},{-41,0}}, color = {0,0,255}),Line(points = {{96,0},{40,0}}, color = {0,0,255})}));
    end Idle;
    model Short "Short cut branch"
      extends Interfaces.OnePort;
    equation
      v = 0;
      annotation(Documentation(info = "<html>
<P>
The model Short is a simple short cut branch.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-60,60},{60,-60}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{91,0},{-90,0}}, color = {0,0,255}),Text(extent = {{-151,113},{149,73}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-60,60},{60,-60}}, lineColor = {0,0,255}),Line(points = {{96,0},{-96,0}}, color = {0,0,255}),Text(extent = {{-100,100},{100,70}}, textString = "Short", lineColor = {0,0,255})}));
    end Short;
    model IdealOpeningSwitch "Ideal electrical opener"
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      parameter SI.Resistance Ron(final min = 0) = 1e-005 "Closed switch resistance" annotation(Placement(transformation(extent = {{-56.6667,10},{-10,56.6667}}, rotation = 0)));
      parameter SI.Conductance Goff(final min = 0) = 1e-005 "Opened switch conductance" annotation(Placement(transformation(extent = {{10,10},{56.6667,56.6667}}, rotation = 0)));
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(final T = 293.15);
      Modelica.Blocks.Interfaces.BooleanInput control "true => switch open, false => p--n connected" annotation(Placement(transformation(origin = {0,70}, extent = {{-20,-20},{20,20}}, rotation = 270)));
    protected
      Real s(final unit = "1") "Auxiliary variable";
      constant Modelica.SIunits.Voltage unitVoltage = 1 annotation(HideResult = true);
      constant Modelica.SIunits.Current unitCurrent = 1 annotation(HideResult = true);
    equation
      v = s * unitCurrent * (if control then 1 else Ron);
      i = s * unitVoltage * (if control then Goff else 1);
      LossPower = v * i;
      annotation(Documentation(info = "<HTML>
<P>
The ideal opening switch has a positive pin p and a negative pin n.
The switching behaviour is controlled by the input signal control.
If control is true, pin p is not connected
with negative pin n. Otherwise, pin p is connected
with negative pin n.
</P>
<P>
In order to prevent singularities during switching, the opened
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron.
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits,
where a description with zero Ron or zero Goff is not possible.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled. The parameters are not temperature dependent.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-44,4},{-36,-4}}, lineColor = {0,0,255}),Line(points = {{-90,0},{-44,0}}, color = {0,0,255}),Line(points = {{-37,2},{40,50}}, color = {0,0,255}),Line(points = {{40,0},{90,0}}, color = {0,0,255}),Line(points = {{0,51},{0,26}}, color = {0,0,255}),Line(points = {{40,20},{40,0}}, color = {0,0,255}),Line(visible = useHeatPort, points = {{0,-100},{0,25}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot),Text(extent = {{-151,-21},{149,-61}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-44,4},{-36,-4}}, lineColor = {0,0,255}),Line(points = {{-96,0},{-44,0}}, color = {0,0,255}),Line(points = {{-37,2},{40,50}}, color = {0,0,255}),Line(points = {{40,0},{96,0}}, color = {0,0,255}),Text(extent = {{-100,-40},{100,-79}}, textString = "%name", lineColor = {0,0,255}),Line(points = {{0,51},{0,26}}, color = {0,0,255}),Line(points = {{40,20},{40,0}}, color = {0,0,255})}));
    end IdealOpeningSwitch;
    model IdealClosingSwitch "Ideal electrical closer"
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      parameter SI.Resistance Ron(final min = 0) = 1e-005 "Closed switch resistance" annotation(Placement(transformation(extent = {{-56.6667,10},{-10,56.6667}}, rotation = 0)));
      parameter SI.Conductance Goff(final min = 0) = 1e-005 "Opened switch conductance" annotation(Placement(transformation(extent = {{10,10},{56.6667,56.6667}}, rotation = 0)));
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(final T = 293.15);
      Modelica.Blocks.Interfaces.BooleanInput control "true => p--n connected, false => switch open" annotation(Placement(transformation(origin = {0,70}, extent = {{-20,-20},{20,20}}, rotation = 270)));
    protected
      Real s(final unit = "1") "Auxiliary variable";
      constant Modelica.SIunits.Voltage unitVoltage = 1 annotation(HideResult = true);
      constant Modelica.SIunits.Current unitCurrent = 1 annotation(HideResult = true);
    equation
      v = s * unitCurrent * (if control then Ron else 1);
      i = s * unitVoltage * (if control then 1 else Goff);
      LossPower = v * i;
      annotation(Documentation(info = "<HTML>
<P>
The ideal closing switch has a positive pin p and a negative pin n.
The switching behaviour is controlled by input signal control.
If control is true, pin p is connected
with negative pin n. Otherwise, pin p is not connected
with negative pin n.
</P>
<P>
In order to prevent singularities during switching, the opened
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron.
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits,
where a description with zero Ron or zero Goff is not possible.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled. The parameters are not temperature dependent.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-44,4},{-36,-4}}, lineColor = {0,0,255}),Line(points = {{-90,0},{-44,0}}, color = {0,0,255}),Line(points = {{-37,2},{40,50}}, color = {0,0,255}),Line(points = {{40,0},{90,0}}, color = {0,0,255}),Line(points = {{0,51},{0,26}}, color = {0,0,255}),Line(visible = useHeatPort, points = {{0,-100},{0,25}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot),Text(extent = {{-152,-28},{148,-68}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-44,4},{-36,-4}}, lineColor = {0,0,255}),Line(points = {{-96,0},{-44,0}}, color = {0,0,255}),Line(points = {{-37,2},{40,50}}, color = {0,0,255}),Line(points = {{40,0},{96,0}}, color = {0,0,255}),Text(extent = {{-100,-40},{100,-79}}, textString = "%name", lineColor = {0,0,255}),Line(points = {{0,51},{0,26}}, color = {0,0,255})}));
    end IdealClosingSwitch;
    model ControlledIdealOpeningSwitch "Controlled ideal electrical opener"
      parameter SI.Voltage level = 0.5 "Switch level" annotation(Placement(transformation(extent = {{-56.6667,10},{-10,56.6667}}, rotation = 0)));
      parameter SI.Resistance Ron(final min = 0) = 1e-005 "Closed switch resistance" annotation(Placement(transformation(extent = {{10,10},{56.6667,56.6667}}, rotation = 0)));
      parameter SI.Conductance Goff(final min = 0) = 1e-005 "Opened switch conductance" annotation(Placement(transformation(extent = {{-56.6667,-56.6667},{-10,-10}}, rotation = 0)));
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(final T = 293.15);
      Interfaces.PositivePin p annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      Interfaces.NegativePin n annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      Interfaces.Pin control "Control pin: control.v > level switch open, otherwise p--n connected" annotation(Placement(transformation(origin = {0,100}, extent = {{-10,-10},{10,10}}, rotation = 90)));
    protected
      Real s(final unit = "1") "Auxiliary variable";
      constant Modelica.SIunits.Voltage unitVoltage = 1 annotation(HideResult = true);
      constant Modelica.SIunits.Current unitCurrent = 1 annotation(HideResult = true);
    equation
      control.i = 0;
      0 = p.i + n.i;
      p.v - n.v = s * unitCurrent * (if control.v > level then 1 else Ron);
      p.i = s * unitVoltage * (if control.v > level then Goff else 1);
      LossPower = (p.v - n.v) * p.i;
      annotation(Documentation(info = "
<HTML>
<P>
The ideal switch has a positive pin p and a negative pin n.
The switching behaviour is controlled by the control pin.
If its voltage exceeds the voltage of the parameter level,
pin p is not connected with negative pin n.
Otherwise, pin p is connected with negative pin n.
</P>
<P>
In order to prevent singularities during switching, the opened
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron.
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits,
where a description with zero Ron or zero Goff is not possible.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled. The parameters are not temperature dependent.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-44,4},{-36,-4}}, lineColor = {0,0,255}),Line(points = {{-90,0},{-44,0}}, color = {0,0,255}),Line(points = {{-37,2},{40,50}}, color = {0,0,255}),Line(points = {{40,0},{90,0}}, color = {0,0,255}),Line(points = {{0,90},{0,25}}, color = {0,0,255}),Line(points = {{40,20},{40,0}}, color = {0,0,255}),Line(visible = useHeatPort, points = {{0,-100},{0,25}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot),Text(extent = {{-150,-34},{150,-74}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-44,4},{-36,-4}}, lineColor = {0,0,255}),Line(points = {{-96,0},{-44,0}}, color = {0,0,255}),Line(points = {{-37,2},{40,50}}, color = {0,0,255}),Line(points = {{40,0},{96,0}}, color = {0,0,255}),Line(points = {{0,96},{0,25}}, color = {0,0,255}),Line(points = {{40,20},{40,0}}, color = {0,0,255})}));
    end ControlledIdealOpeningSwitch;
    model ControlledIdealClosingSwitch "Controlled ideal electrical closer"
      parameter SI.Voltage level = 0.5 "Switch level" annotation(Placement(transformation(extent = {{-56.6667,10},{-10,56.6667}}, rotation = 0)));
      parameter SI.Resistance Ron(final min = 0) = 1e-005 "Closed switch resistance" annotation(Placement(transformation(extent = {{10,10},{56.6667,56.6667}}, rotation = 0)));
      parameter SI.Conductance Goff(final min = 0) = 1e-005 "Opened switch conductance" annotation(Placement(transformation(extent = {{-56.6667,-56.6667},{-10,-10}}, rotation = 0)));
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(final T = 293.15);
      Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.Pin control "Control pin: control.v > level switch closed, otherwise switch open" annotation(Placement(transformation(origin = {0,100}, extent = {{-10,-10},{10,10}}, rotation = 90)));
    protected
      Real s(final unit = "1") "Auxiliary variable";
      constant Modelica.SIunits.Voltage unitVoltage = 1 annotation(HideResult = true);
      constant Modelica.SIunits.Current unitCurrent = 1 annotation(HideResult = true);
    equation
      control.i = 0;
      0 = p.i + n.i;
      p.v - n.v = s * unitCurrent * (if control.v > level then Ron else 1);
      p.i = s * unitVoltage * (if control.v > level then 1 else Goff);
      LossPower = (p.v - n.v) * p.i;
      annotation(Documentation(info = "
<HTML>
<P>
The closing ideal switch has a positive pin p and a negative pin n.
The switching behaviour is controlled by the control pin.
If its voltage exceeds the voltage of the parameter level,
pin p is connected with negative pin n.
Otherwise, pin p is not connected with negative pin n.
</P>
<P>
In order to prevent singularities during switching, the opened
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron.
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits,
where a description with zero Ron or zero Goff is not possible.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled. The parameters are not temperature dependent.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-44,4},{-36,-4}}, lineColor = {0,0,255}),Line(points = {{-90,0},{-44,0}}, color = {0,0,255}),Line(points = {{-37,2},{40,50}}, color = {0,0,255}),Line(points = {{40,0},{90,0}}, color = {0,0,255}),Line(points = {{0,90},{0,25}}, color = {0,0,255}),Line(visible = useHeatPort, points = {{0,-100},{0,25}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot),Text(extent = {{-149,-32},{151,-72}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-44,4},{-36,-4}}, lineColor = {0,0,255}),Line(points = {{-96,0},{-44,0}}, color = {0,0,255}),Line(points = {{-37,2},{40,50}}, color = {0,0,255}),Line(points = {{40,0},{96,0}}, color = {0,0,255}),Line(points = {{0,96},{0,25}}, color = {0,0,255})}));
    end ControlledIdealClosingSwitch;
    model OpenerWithArc "Ideal opening switch with simple arc model"
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      parameter Modelica.SIunits.Resistance Ron = 1e-005 "Closed switch resistance";
      parameter Modelica.SIunits.Conductance Goff = 1e-005 "Opened switch conductance";
      parameter Modelica.SIunits.Voltage V0 = 30 "Initial arc voltage";
      parameter Modelica.SIunits.VoltageSlope dVdt = 10000.0 "Arc voltage slope";
      parameter Modelica.SIunits.Voltage Vmax = 60 "Max. arc voltage";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(final T = 293.15);
      Modelica.Blocks.Interfaces.BooleanInput control "false => p--n connected, true => switch open" annotation(Placement(transformation(origin = {0,100}, extent = {{-10,-10},{10,10}}, rotation = 270)));
    protected
      Boolean off = control;
      Boolean on = not off;
      discrete Modelica.SIunits.Time tSwitch;
      Boolean quenched;
    equation
      when edge(off) then
              tSwitch = time;
      
      end when;
      quenched = off and (abs(i) <= abs(v) * Goff or pre(quenched));
      if on then
        v = Ron * i;
      else
        if quenched then
          i = Goff * v;
        else
          v = min(Vmax, V0 + dVdt * (time - tSwitch)) * sign(i);
        end if;
      end if;
      LossPower = v * i;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Line(points = {{40,50},{32,32},{48,28},{40,18}}, color = {255,0,0}),Ellipse(extent = {{-44,4},{-36,-4}}),Line(points = {{-90,0},{-44,0}}),Line(points = {{-37,2},{40,50}}),Line(points = {{40,0},{90,0}}),Line(points = {{0,90},{0,26}}, color = {255,85,255}),Line(points = {{40,18},{40,0}}),Text(extent = {{-150,-35},{150,-75}}, textString = "%name", lineColor = {0,0,255})}), Diagram(graphics = {Line(points = {{-60,60},{-60,-60},{60,-60}}, color = {0,0,255}),Line(points = {{-60,-60},{-40,-60},{-40,-40},{-20,40},{40,40}}, color = {0,0,0}),Text(extent = {{30,-60},{50,-70}}, lineColor = {0,0,0}, textString = "time"),Text(extent = {{-60,60},{-20,50}}, lineColor = {0,0,0}, textString = "voltage"),Text(extent = {{-60,-30},{-40,-40}}, lineColor = {0,0,0}, textString = "V0"),Text(extent = {{-50,40},{-30,30}}, lineColor = {0,0,0}, textString = "Vmax"),Text(extent = {{-40,10},{-20,0}}, lineColor = {0,0,0}, textString = "dVdt"),Polygon(points = {{-60,60},{-62,52},{-58,52},{-60,60}}, lineColor = {0,0,0}, fillColor = {0,0,0}, fillPattern = FillPattern.Solid),Polygon(points = {{60,-60},{54,-58},{54,-62},{60,-60}}, lineColor = {0,0,0}, fillColor = {0,0,0}, fillPattern = FillPattern.Solid)}), Documentation(info = "<html>
<p>
This model is an extension to the <a href=\"Modelica://Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch\">IdealOpeningSwitch</a>.
</p>
<p>
The basic model interupts the current through the switch in an infinitesimal time span.
If an inductive circuit is connected, the voltage across the swicth is limited only by numerics.
In order to give a better idea for the voltage across the switch, a simple arc model is added:
</p>
<p>
When the Boolean input <code>control</code> signals to open the switch, a voltage across the opened switch is impressed.
This voltage starts with <code>V0</code> (simulating the voltage drop of the arc roots), then rising with slope <code>dVdt</code>
(simulating the rising voltage of an extending arc) until a maximum voltage <code>Vmax</code> is reached.
</p>
<pre><code>
     | voltage
Vmax |      +-----
     |     /
     |    /
V0   |   +
     |   |
     +---+-------- time
</pre></code>
<p>
This arc voltage tends to lower the current following through the switch; it depends on the connected circuit, when the arc is quenched.
Once the arc is quenched, i.e. the current flowing through the switch gets zero, the equation for the off-state is activated
<code>i=Goff*v</code>.
</p>
<p>
When the Boolean input <code>control</code> signals to close the switch again, the switch is closed immediately,
i.e. the equation for the on-state is activated <code>v=Ron*i</code>.
</p>
<p>
Please note: In an AC circuit, at least the arc quenches when the next natural zero-crossing of the current occurs.
In a DC circuit, the arc will not quench if the arc voltage is not sufficient that a zero-crossing of the current occurs.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled. The parameters are not temperature dependent.
</p>
</html>", revisions = "<html>
<ul>
<li><i>June, 2009   </i>
       by Christoph Clauss<br> adapted to OpenerWithArc<br>
       </li>
<li><i>May, 2009   </i>
       by Anton Haumer<br> CloserWithArc initially implemented<br>
       </li>
</ul>
</html>"));
    end OpenerWithArc;
    model CloserWithArc "Ideal closing switch with simple arc model"
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      parameter Modelica.SIunits.Resistance Ron = 1e-005 "Closed switch resistance";
      parameter Modelica.SIunits.Conductance Goff = 1e-005 "Opened switch conductance";
      parameter Modelica.SIunits.Voltage V0 = 30 "Initial arc voltage";
      parameter Modelica.SIunits.VoltageSlope dVdt = 10000.0 "Arc voltage slope";
      parameter Modelica.SIunits.Voltage Vmax = 60 "Max. arc voltage";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(final T = 293.15);
      Modelica.Blocks.Interfaces.BooleanInput control "true => p--n connected, false => switch open" annotation(Placement(transformation(origin = {0,100}, extent = {{-10,-10},{10,10}}, rotation = 270)));
    protected
      Boolean on = control;
      Boolean off = not on;
      discrete Modelica.SIunits.Time tSwitch;
      Boolean quenched;
    equation
      when edge(off) then
              tSwitch = time;
      
      end when;
      quenched = off and (abs(i) <= abs(v) * Goff or pre(quenched));
      if on then
        v = Ron * i;
      else
        if quenched then
          i = Goff * v;
        else
          v = min(Vmax, V0 + dVdt * (time - tSwitch)) * sign(i);
        end if;
      end if;
      LossPower = v * i;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Line(points = {{40,50},{32,24},{48,28},{40,0}}, color = {255,0,0}),Ellipse(extent = {{-44,4},{-36,-4}}),Line(points = {{-90,0},{-44,0}}),Line(points = {{-37,2},{40,50}}),Line(points = {{40,0},{90,0}}),Line(points = {{0,90},{0,26}}, color = {255,85,255}),Text(extent = {{-152,-29},{148,-69}}, textString = "%name", lineColor = {0,0,255})}), Diagram(graphics = {Line(points = {{-60,60},{-60,-60},{60,-60}}, color = {0,0,255}),Line(points = {{-60,-60},{-40,-60},{-40,-40},{-20,40},{40,40}}, color = {0,0,0}),Text(extent = {{30,-60},{50,-70}}, lineColor = {0,0,0}, textString = "time"),Text(extent = {{-60,60},{-20,50}}, lineColor = {0,0,0}, textString = "voltage"),Text(extent = {{-60,-30},{-40,-40}}, lineColor = {0,0,0}, textString = "V0"),Text(extent = {{-50,40},{-30,30}}, lineColor = {0,0,0}, textString = "Vmax"),Text(extent = {{-40,10},{-20,0}}, lineColor = {0,0,0}, textString = "dVdt"),Polygon(points = {{-60,60},{-62,52},{-58,52},{-60,60}}, lineColor = {0,0,0}, fillColor = {0,0,0}, fillPattern = FillPattern.Solid),Polygon(points = {{60,-60},{54,-58},{54,-62},{60,-60}}, lineColor = {0,0,0}, fillColor = {0,0,0}, fillPattern = FillPattern.Solid)}), Documentation(info = "<html>
<p>
This model is an extension to the <a href=\"Modelica://Modelica.Electrical.Analog.Ideal.IdealClosingSwitch\">IdealClosingSwitch</a>.
</p>
<p>
The basic model interupts the current through the switch in an infinitesimal time span.
If an inductive circuit is connected, the voltage across the swicth is limited only by numerics.
In order to give a better idea for the voltage across the switch, a simple arc model is added:
</p>
<p>
When the Boolean input <code>control</code> signals to open the switch, a voltage across the opened switch is impressed.
This voltage starts with <code>V0</code> (simulating the voltage drop of the arc roots), then rising with slope <code>dVdt</code>
(simulating the rising voltage of an extending arc) until a maximum voltage <code>Vmax</code> is reached.
</p>
<pre><code>
     | voltage
Vmax |      +-----
     |     /
     |    /
V0   |   +
     |   |
     +---+-------- time
</pre></code>
<p>
This arc voltage tends to lower the current following through the switch; it depends on the connected circuit, when the arc is quenched.
Once the arc is quenched, i.e. the current flowing through the switch gets zero, the equation for the off-state is activated
<code>i=Goff*v</code>.
</p>
<p>
When the Boolean input <code>control</code> signals to close the switch again, the switch is closed immediately,
i.e. the equation for the on-state is activated <code>v=Ron*i</code>.
</p>
<p>
Please note: In an AC circuit, at least the arc quenches when the next natural zero-crossing of the current occurs.
In a DC circuit, the arc will not quench if the arc voltage is not sufficient that a zero-crossing of the current occurs.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled. The parameters are not temperature dependent.
</p>
</html>", revisions = "<html>
<ul>
<li><i>May, 2009   </i>
       by Anton Haumer<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end CloserWithArc;
    model ControlledOpenerWithArc "Controlled ideal electrical opener with simple arc model"
      parameter Modelica.SIunits.Voltage level = 0.5 "Switch level" annotation(Placement(transformation(extent = {{-56.6667,10},{-10,56.6667}}, rotation = 0)));
      parameter Modelica.SIunits.Resistance Ron(final min = 0) = 1e-005 "Closed switch resistance" annotation(Placement(transformation(extent = {{10,10},{56.6667,56.6667}}, rotation = 0)));
      parameter Modelica.SIunits.Conductance Goff(final min = 0) = 1e-005 "Opened switch conductance" annotation(Placement(transformation(extent = {{-56.6667,-56.6667},{-10,-10}}, rotation = 0)));
      parameter Modelica.SIunits.Voltage V0 = 30 "Initial arc voltage";
      parameter Modelica.SIunits.VoltageSlope dVdt = 10000.0 "Arc voltage slope";
      parameter Modelica.SIunits.Voltage Vmax = 60 "Max. arc voltage";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(final T = 293.15);
      Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.Pin control "Control pin: control.v > level switch open, otherwise p--n connected" annotation(Placement(transformation(origin = {0,100}, extent = {{-10,-10},{10,10}}, rotation = 90)));
      Modelica.SIunits.Current i;
      Modelica.SIunits.Voltage v;
    protected
      constant Modelica.SIunits.Voltage unitVoltage = 1 annotation(HideResult = true);
      constant Modelica.SIunits.Current unitCurrent = 1 annotation(HideResult = true);
      Boolean off = control.v > level;
      Boolean on = not off;
      discrete Modelica.SIunits.Time tSwitch;
      Boolean quenched;
    equation
      control.i = 0;
      0 = p.i + n.i;
      i = p.i;
      p.v - n.v = v;
      when edge(off) then
              tSwitch = time;
      
      end when;
      quenched = off and (abs(i) <= abs(v) * Goff or pre(quenched));
      if on then
        v = Ron * i;
      else
        if quenched then
          i = Goff * v;
        else
          v = min(Vmax, V0 + dVdt * (time - tSwitch)) * sign(i);
        end if;
      end if;
      LossPower = v * i;
      annotation(Documentation(info = "
<HTML>

<p>
This model is an extension to the <a href=\"Modelica://Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch\">IdealOpeningSwitch</a>.
</p>


<p>
The basic model interupts the current through the switch in an infinitesimal time span.
If an inductive circuit is connected, the voltage across the swicth is limited only by numerics.
In order to give a better idea for the voltage across the switch, a simple arc model is added:
</p>
<p>
When the control pin voltage <code>control.v</code> signals to open the switch, a voltage across the opened switch is impressed.
This voltage starts with <code>V0</code> (simulating the voltage drop of the arc roots), then rising with slope <code>dVdt</code>
(simulating the rising voltage of an extending arc) until a maximum voltage <code>Vmax</code> is reached.
</p>
<pre><code>
     | voltage
Vmax |      +-----
     |     /
     |    /
V0   |   +
     |   |
     +---+-------- time
</pre></code>
<p>
This arc voltage tends to lower the current following through the switch; it depends on the connected circuit, when the arc is quenched.
Once the arc is quenched, i.e. the current flowing through the switch gets zero, the equation for the off-state is activated
<code>i=Goff*v</code>.
</p>
<p>
When the control pin <code>control.v</code> signals to close the switch again, the switch is closed immediately,
i.e. the equation for the on-state is activated <code>v=Ron*i</code>.
</p>
<p>
Please note: In an AC circuit, at least the arc quenches when the next natural zero-crossing of the current occurs.
In a DC circuit, the arc will not quench if the arc voltage is not sufficient that a zero-crossing of the current occurs.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled. The parameters are not temperature dependent.
</p>
</HTML>
", revisions = "<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-44,4},{-36,-4}}, lineColor = {0,0,255}),Line(points = {{-90,0},{-44,0}}, color = {0,0,255}),Line(points = {{-37,2},{40,50}}, color = {0,0,255}),Line(points = {{40,0},{90,0}}, color = {0,0,255}),Line(points = {{0,90},{0,25}}, color = {0,0,255}),Line(points = {{40,20},{40,0}}, color = {0,0,255}),Line(points = {{40,50},{32,34},{48,30},{40,20}}, color = {255,0,0}),Text(extent = {{-148,-34},{152,-74}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-44,4},{-36,-4}}, lineColor = {0,0,255}),Line(points = {{-96,0},{-44,0}}, color = {0,0,255}),Line(points = {{-37,2},{40,50}}, color = {0,0,255}),Line(points = {{40,0},{96,0}}, color = {0,0,255}),Line(points = {{0,96},{0,25}}, color = {0,0,255}),Line(points = {{40,20},{40,0}}, color = {0,0,255})}));
    end ControlledOpenerWithArc;
    model ControlledCloserWithArc "Controlled ideal electrical closer with simple arc model"
      parameter Modelica.SIunits.Voltage level = 0.5 "Switch level" annotation(Placement(transformation(extent = {{-56.6667,10},{-10,56.6667}}, rotation = 0)));
      parameter Modelica.SIunits.Resistance Ron(final min = 0) = 1e-005 "Closed switch resistance" annotation(Placement(transformation(extent = {{10,10},{56.6667,56.6667}}, rotation = 0)));
      parameter Modelica.SIunits.Conductance Goff(final min = 0) = 1e-005 "Opened switch conductance" annotation(Placement(transformation(extent = {{-56.6667,-56.6667},{-10,-10}}, rotation = 0)));
      parameter Modelica.SIunits.Voltage V0 = 30 "Initial arc voltage";
      parameter Modelica.SIunits.VoltageSlope dVdt = 10000.0 "Arc voltage slope";
      parameter Modelica.SIunits.Voltage Vmax = 60 "Max. arc voltage";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(final T = 293.15);
      Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.Pin control "Control pin: control.v > level switch closed, otherwise switch open" annotation(Placement(transformation(origin = {0,100}, extent = {{-10,-10},{10,10}}, rotation = 90)));
      Modelica.SIunits.Current i;
      Modelica.SIunits.Voltage v;
    protected
      constant Modelica.SIunits.Voltage unitVoltage = 1 annotation(HideResult = true);
      constant Modelica.SIunits.Current unitCurrent = 1 annotation(HideResult = true);
      Boolean off = control.v < level;
      Boolean on = not off;
      discrete Modelica.SIunits.Time tSwitch;
      Boolean quenched;
    equation
      control.i = 0;
      0 = p.i + n.i;
      i = p.i;
      p.v - n.v = v;
      when edge(off) then
              tSwitch = time;
      
      end when;
      quenched = off and (abs(i) <= abs(v) * Goff or pre(quenched));
      if on then
        v = Ron * i;
      else
        if quenched then
          i = Goff * v;
        else
          v = min(Vmax, V0 + dVdt * (time - tSwitch)) * sign(i);
        end if;
      end if;
      LossPower = v * i;
      annotation(Documentation(info = "
<HTML>

<p>
This model is an extension to the <a href=\"Modelica://Modelica.Electrical.Analog.Ideal.IdealClosingSwitch\">IdealClosingSwitch</a>.
</p>


<p>
The basic model interupts the current through the switch in an infinitesimal time span.
If an inductive circuit is connected, the voltage across the swicth is limited only by numerics.
In order to give a better idea for the voltage across the switch, a simple arc model is added:
</p>
<p>
When the control pin voltage <code>control.v</code> signals to open the switch, a voltage across the opened switch is impressed.
This voltage starts with <code>V0</code> (simulating the voltage drop of the arc roots), then rising with slope <code>dVdt</code>
(simulating the rising voltage of an extending arc) until a maximum voltage <code>Vmax</code> is reached.
</p>
<pre><code>
     | voltage
Vmax |      +-----
     |     /
     |    /
V0   |   +
     |   |
     +---+-------- time
</pre></code>
<p>
This arc voltage tends to lower the current following through the switch; it depends on the connected circuit, when the arc is quenched.
Once the arc is quenched, i.e. the current flowing through the switch gets zero, the equation for the off-state is activated
<code>i=Goff*v</code>.
</p>
<p>
When the control pin <code>control.v</code> signals to close the switch again, the switch is closed immediately,
i.e. the equation for the on-state is activated <code>v=Ron*i</code>.
</p>
<p>
Please note: In an AC circuit, at least the arc quenches when the next natural zero-crossing of the current occurs.
In a DC circuit, the arc will not quench if the arc voltage is not sufficient that a zero-crossing of the current occurs.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled. The parameters are not temperature dependent.
</p>

</HTML>
", revisions = "<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-44,4},{-36,-4}}, lineColor = {0,0,255}),Line(points = {{-90,0},{-44,0}}, color = {0,0,255}),Line(points = {{-37,2},{40,50}}, color = {0,0,255}),Line(points = {{40,0},{90,0}}, color = {0,0,255}),Line(points = {{0,90},{0,25}}, color = {0,0,255}),Text(extent = {{-100,-70},{100,-100}}, textString = "%name", lineColor = {0,0,255}),Line(points = {{40,50},{32,24},{48,28},{40,0}}, color = {255,0,0})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-44,4},{-36,-4}}, lineColor = {0,0,255}),Line(points = {{-96,0},{-44,0}}, color = {0,0,255}),Line(points = {{-37,2},{40,50}}, color = {0,0,255}),Line(points = {{40,0},{96,0}}, color = {0,0,255}),Line(points = {{0,96},{0,25}}, color = {0,0,255})}));
    end ControlledCloserWithArc;
    annotation(Documentation(info = "<html>
<p>
This package contains electrical components with idealized behaviour:
</p>

</HTML>
", revisions = "<html>
<dl>
<dt>
<b>Main Authors:</b>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
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
</html>"));
  end Ideal;
  package Interfaces "Connectors and partial models for Analog electrical components"
    extends Modelica.Icons.Library;
    connector Pin "Pin of an electrical component"
      Modelica.SIunits.Voltage v "Potential at the pin" annotation(unassignedMessage = "An electrical potential cannot be uniquely calculated.
The reason could be that
- a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
  to define the zero potential of the electrical circuit, or
- a connector of an electrical component is not connected.");
      flow Modelica.SIunits.Current i "Current flowing into the pin" annotation(unassignedMessage = "An electrical current cannot be uniquely calculated.
The reason could be that
- a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
  to define the zero potential of the electrical circuit, or
- a connector of an electrical component is not connected.");
      annotation(defaultComponentName = "pin", Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Rectangle(extent = {{-100,100},{100,-100}}, lineColor = {0,0,255}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Rectangle(extent = {{-40,40},{40,-40}}, lineColor = {0,0,255}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid),Text(extent = {{-160,110},{40,50}}, lineColor = {0,0,255}, textString = "%name")}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end Pin;
    connector PositivePin "Positive pin of an electric component"
      Modelica.SIunits.Voltage v "Potential at the pin" annotation(unassignedMessage = "An electrical potential cannot be uniquely calculated.
The reason could be that
- a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
  to define the zero potential of the electrical circuit, or
- a connector of an electrical component is not connected.");
      flow Modelica.SIunits.Current i "Current flowing into the pin" annotation(unassignedMessage = "An electrical current cannot be uniquely calculated.
The reason could be that
- a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
  to define the zero potential of the electrical circuit, or
- a connector of an electrical component is not connected.");
      annotation(defaultComponentName = "pin_p", Documentation(info = "<html><p>Connectors PositivePin
and NegativePin are nearly identical.
The only difference is that the icons are different in order
to identify more easily the pins of a component. Usually,
connector PositivePin is used for the positive and
connector NegativePin for the negative pin of an electrical
component.</p></html>", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Rectangle(extent = {{-100,100},{100,-100}}, lineColor = {0,0,255}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Rectangle(extent = {{-40,40},{40,-40}}, lineColor = {0,0,255}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid),Text(extent = {{-160,110},{40,50}}, lineColor = {0,0,255}, textString = "%name")}));
    end PositivePin;
    connector NegativePin "Negative pin of an electric component"
      Modelica.SIunits.Voltage v "Potential at the pin" annotation(unassignedMessage = "An electrical potential cannot be uniquely calculated.
The reason could be that
- a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
  to define the zero potential of the electrical circuit, or
- a connector of an electrical component is not connected.");
      flow Modelica.SIunits.Current i "Current flowing into the pin" annotation(unassignedMessage = "An electrical current cannot be uniquely calculated.
The reason could be that
- a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
  to define the zero potential of the electrical circuit, or
- a connector of an electrical component is not connected.");
      annotation(defaultComponentName = "pin_n", Documentation(info = "<html><p>Connectors PositivePin
and NegativePin are nearly identical.
The only difference is that the icons are different in order
to identify more easily the pins of a component. Usually,
connector PositivePin is used for the positive and
connector NegativePin for the negative pin of an electrical
component.</p></html>", revisions = "<html>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Rectangle(extent = {{-100,100},{100,-100}}, lineColor = {0,0,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Rectangle(extent = {{-40,40},{40,-40}}, lineColor = {0,0,255}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Text(extent = {{-40,110},{160,50}}, textString = "%name", lineColor = {0,0,255})}));
    end NegativePin;
    partial model TwoPin "Component with one electrical port"
      SI.Voltage v "Voltage drop between the two pins (= p.v - n.v)";
      PositivePin p "Positive pin Positive pin (potential p.v > n.v for positive voltage drop v)" annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      NegativePin n "Negative pin" annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
    equation
      v = p.v - n.v;
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{-120,3},{-110,0},{-120,-3},{-120,3}}, lineColor = {160,160,164}, fillColor = {160,160,164}, fillPattern = FillPattern.Solid),Line(points = {{-136,0},{-111,0}}, color = {160,160,164}),Text(extent = {{-134,5},{-117,20}}, lineColor = {160,160,164}, textString = "p.i"),Line(points = {{110,0},{135,0}}, color = {160,160,164}),Polygon(points = {{120,3},{110,0},{120,-3},{120,3}}, lineColor = {160,160,164}, fillColor = {160,160,164}, fillPattern = FillPattern.Solid),Text(extent = {{117,3},{134,18}}, lineColor = {160,160,164}, textString = "n.i")}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end TwoPin;
    partial model OnePort "Component with two electrical pins p and n and current i from p to n"
      SI.Voltage v "Voltage drop between the two pins (= p.v - n.v)";
      SI.Current i "Current flowing from pin p to pin n";
      PositivePin p "Positive pin (potential p.v > n.v for positive voltage drop v)" annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      NegativePin n "Negative pin" annotation(Placement(transformation(extent = {{110,-10},{90,10}}, rotation = 0)));
    equation
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;
      annotation(Documentation(info = "<HTML>
<P>
Superclass of elements which have <b>two</b> electrical pins:
the positive pin connector <i>p</i>, and the negative pin
connector <i>n</i>. It is assumed that the current flowing
into pin p is identical to the current flowing out of pin n.
This current is provided explicitly as current i.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Line(points = {{-110,20},{-85,20}}, color = {160,160,164}),Polygon(points = {{-95,23},{-85,20},{-95,17},{-95,23}}, lineColor = {160,160,164}, fillColor = {160,160,164}, fillPattern = FillPattern.Solid),Line(points = {{90,20},{115,20}}, color = {160,160,164}),Line(points = {{-125,0},{-115,0}}, color = {160,160,164}),Line(points = {{-120,-5},{-120,5}}, color = {160,160,164}),Text(extent = {{-110,25},{-90,45}}, lineColor = {160,160,164}, textString = "i"),Polygon(points = {{105,23},{115,20},{105,17},{105,23}}, lineColor = {160,160,164}, fillColor = {160,160,164}, fillPattern = FillPattern.Solid),Line(points = {{115,0},{125,0}}, color = {160,160,164}),Text(extent = {{90,45},{110,25}}, lineColor = {160,160,164}, textString = "i")}));
    end OnePort;
    partial model TwoPort "Component with two electrical ports, including current"
      SI.Voltage v1 "Voltage drop over the left port";
      SI.Voltage v2 "Voltage drop over the right port";
      SI.Current i1 "Current flowing from pos. to neg. pin of the left port";
      SI.Current i2 "Current flowing from pos. to neg. pin of the right port";
      PositivePin p1 "Positive pin of the left port (potential p1.v > n1.v for positive voltage drop v1)" annotation(Placement(transformation(extent = {{-110,40},{-90,60}}, rotation = 0)));
      NegativePin n1 "Negative pin of the left port" annotation(Placement(transformation(extent = {{-90,-60},{-110,-40}}, rotation = 0)));
      PositivePin p2 "Positive pin of the right port (potential p2.v > n2.v for positive voltage drop v2)" annotation(Placement(transformation(extent = {{110,40},{90,60}}, rotation = 0)));
      NegativePin n2 "Negative pin of the right port" annotation(Placement(transformation(extent = {{90,-60},{110,-40}}, rotation = 0)));
    equation
      v1 = p1.v - n1.v;
      v2 = p2.v - n2.v;
      0 = p1.i + n1.i;
      0 = p2.i + n2.i;
      i1 = p1.i;
      i2 = p2.i;
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{-120,53},{-110,50},{-120,47},{-120,53}}, lineColor = {160,160,164}, fillColor = {160,160,164}, fillPattern = FillPattern.Solid),Line(points = {{-136,50},{-111,50}}, color = {160,160,164}),Polygon(points = {{127,-47},{137,-50},{127,-53},{127,-47}}, lineColor = {160,160,164}, fillColor = {160,160,164}, fillPattern = FillPattern.Solid),Line(points = {{111,-50},{136,-50}}, color = {160,160,164}),Text(extent = {{112,-44},{128,-29}}, lineColor = {160,160,164}, textString = "i2"),Text(extent = {{118,52},{135,67}}, lineColor = {0,0,0}, textString = "i2"),Polygon(points = {{120,53},{110,50},{120,47},{120,53}}, lineColor = {0,0,0}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {160,160,164}),Line(points = {{111,50},{136,50}}, color = {0,0,0}),Line(points = {{-136,-49},{-111,-49}}, color = {160,160,164}),Polygon(points = {{-126,-46},{-136,-49},{-126,-52},{-126,-46}}, lineColor = {160,160,164}, fillColor = {160,160,164}, fillPattern = FillPattern.Solid),Text(extent = {{-127,-46},{-110,-31}}, lineColor = {160,160,164}, textString = "i1"),Text(extent = {{-136,53},{-119,68}}, lineColor = {160,160,164}, textString = "i1")}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>", info = "<html>

</html>"));
    end TwoPort;
    partial model ConditionalHeatPort "Partial model to include a conditional HeatPort in order to describe the power loss via a thermal network"
      parameter Boolean useHeatPort = false "=true, if HeatPort is enabled" annotation(Evaluate = true, HideResult = true, choices(__Dymola_checkBox = true));
      parameter Modelica.SIunits.Temperature T = 293.15 "Fixed device temperature if useHeatPort = false" annotation(Dialog(enable = not useHeatPort));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T(start = T) = T_heatPort, Q_flow = -LossPower) if useHeatPort annotation(Placement(transformation(extent = {{-10,-110},{10,-90}}), iconTransformation(extent = {{-10,-110},{10,-90}})));
      Modelica.SIunits.Power LossPower "Loss power leaving component via HeatPort";
      Modelica.SIunits.Temperature T_heatPort "Temperature of HeatPort";
    equation
      if not useHeatPort then
        T_heatPort = T;
      end if;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics), Documentation(revisions = "<html>
<ul>
<li><i> February 17, 2009   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>", info = "<html>
<p>
This partial model provides a conditional heating port for the connection to a thermal network.
</p>
<ul>
<li> If <b>useHeatPort</b> is set to <b>false</b> (default), no heat port is available, and the thermal
     loss power flows internally to the ground. In this case, the parameter <b>T</b> specifies
     the fixed device temperature (the default for T = 20<sup>o</sup>C)</li>.
<li> If <b>useHeatPort</b> is set to <b>true</b>, a heat port is available.</li>
</ul>

<p>
If this model is used, the loss power has to be provided by an equation in the model which inherits from
ConditionalHeatingPort model (<b>lossPower = ...</b>). As device temperature
<b>T_heatPort</b> can be used to describe the influence of the device temperature
on the model behaviour.
</p>
</html>"));
    end ConditionalHeatPort;
    partial model AbsoluteSensor "Base class to measure the absolute value of a pin variable"
      extends Modelica.Icons.RotationalSensor;
      Interfaces.PositivePin p "Pin to be measured" annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y "Measured quantity as Real output signal" annotation(Placement(transformation(extent = {{100,-10},{120,10}}, rotation = 0)));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-70,0},{-90,0}}, color = {0,0,0}),Line(points = {{70,0},{100,0}}, color = {0,0,255}),Text(extent = {{-150,80},{150,120}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-70,0},{-96,0}}, color = {0,0,0}),Line(points = {{70,0},{100,0}}, color = {0,0,255})}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end AbsoluteSensor;
    partial model RelativeSensor "Base class to measure a relative variable between two pins"
      extends Modelica.Icons.RotationalSensor;
      Interfaces.PositivePin p "Positive pin" annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      Interfaces.NegativePin n "Negative pin" annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y "Measured quantity as Real output signal" annotation(Placement(transformation(origin = {0,-100}, extent = {{10,-10},{-10,10}}, rotation = 90)));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-70,0},{-90,0}}, color = {0,0,0}),Line(points = {{70,0},{90,0}}, color = {0,0,0}),Line(points = {{0,-90},{0,-70}}, color = {0,0,255}),Text(extent = {{-150,80},{150,120}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-70,0},{-96,0}}, color = {0,0,0}),Line(points = {{0,-90},{0,-70}}, color = {0,0,255}),Line(points = {{70,0},{96,0}}, color = {0,0,0})}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end RelativeSensor;
    partial model VoltageSource "Interface for voltage sources"
      extends OnePort;
      parameter SI.Voltage offset = 0 "Voltage offset";
      parameter SI.Time startTime = 0 "Time offset";
      replaceable Modelica.Blocks.Interfaces.SignalSource signalSource(final offset = offset, final startTime = startTime) annotation(Placement(transformation(extent = {{70,70},{90,90}}, rotation = 0)));
    equation
      v = signalSource.y;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-50,50},{50,-50}}, lineColor = {0,0,0}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Text(extent = {{-150,80},{150,120}}, textString = "%name", lineColor = {0,0,255}),Line(points = {{-90,0},{90,0}}, color = {0,0,0}),Text(extent = {{-120,50},{-20,0}}, lineColor = {0,0,255}, textString = "+"),Text(extent = {{20,50},{120,0}}, lineColor = {0,0,255}, textString = "-")}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end VoltageSource;
    partial model CurrentSource "Interface for current sources"
      extends OnePort;
      parameter SI.Current offset = 0 "Current offset";
      parameter SI.Time startTime = 0 "Time offset";
      replaceable Modelica.Blocks.Interfaces.SignalSource signalSource(final offset = offset, final startTime = startTime) annotation(Placement(transformation(extent = {{70,69},{91,89}}, rotation = 0)));
    equation
      i = signalSource.y;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-50,50},{50,-50}}, lineColor = {0,0,0}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-90,0},{-50,0}}, color = {0,0,0}),Line(points = {{50,0},{90,0}}, color = {0,0,0}),Line(points = {{0,-50},{0,50}}, color = {0,0,0}),Text(extent = {{-150,120},{150,80}}, textString = "%name", lineColor = {0,0,255}),Polygon(points = {{90,0},{60,10},{60,-10},{90,0}}, lineColor = {0,0,255}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid)}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end CurrentSource;
    annotation(Documentation(info = "<html>
<p>
This package contains connectors and interfaces (partial models) for
analog electrical components.
</p>

</HTML>
", revisions = "<html>
<dl>
<dt>
<b>Main Authors:</b>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden<br>
<p>
<dt>
</dl>

<b>Copyright:</b>
<dl>
<dd>
Copyright &copy; 1998-2006, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i><br>
<p>
</dl>

<ul>
<li><i> 1998</i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end Interfaces;
  package Lines "Lossy and lossless segmented transmission lines, and LC distributed line models"
    extends Modelica.Icons.Library;
    model OLine "Lossy Transmission Line"
      //extends Interfaces.ThreePol;
      Interfaces.Pin p1 annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      Interfaces.Pin p2 annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      Interfaces.Pin p3 annotation(Placement(transformation(extent = {{-10,-110},{10,-90}}, rotation = 0)));
      SI.Voltage v13;
      SI.Voltage v23;
      SI.Current i1;
      SI.Current i2;
      parameter Real r(final min = Modelica.Constants.small, unit = "Ohm/m", start = 1) "Resistance per meter";
      parameter Real l(final min = Modelica.Constants.small, unit = "H/m", start = 1) "Inductance per meter";
      parameter Real g(final min = Modelica.Constants.small, unit = "S/m", start = 1) "Conductance per meter";
      parameter Real c(final min = Modelica.Constants.small, unit = "F/m", start = 1) "Capacitance per meter";
      parameter SI.Length length(final min = Modelica.Constants.small, start = 1) "Length of line";
      parameter Integer N(final min = 1, start = 1) "Number of lumped segments";
    protected
      Basic.Resistor R[N + 1](R = fill((r * length) / (N + 1), N + 1));
      Basic.Inductor L[N + 1](L = fill((l * length) / (N + 1), N + 1));
      Basic.Capacitor C[N](C = fill((c * length) / N, N));
      Basic.Conductor G[N](G = fill((g * length) / N, N));
    equation
      v13 = p1.v - p3.v;
      v23 = p2.v - p3.v;
      i1 = p1.i;
      i2 = p2.i;
      connect(p1,R[1].p);
      for i in 1:N loop
      connect(R[i].n,L[i].p);
      connect(L[i].n,C[i].p);
      connect(L[i].n,G[i].p);
      connect(C[i].n,p3);
      connect(G[i].n,p3);
      connect(L[i].n,R[i + 1].p);

      end for;
      connect(R[N + 1].n,L[N + 1].p);
      connect(L[N + 1].n,p2);
      annotation(Documentation(info = "<html>
<P>
Lossy Transmission Line.
  As can be seen in the picture below, the lossy transmission line OLine consists of segments of
  lumped resistances and inductances in series
  and conductances and capacitances that are
  connected with the reference pin p3. The precision
  of the model depends on the number N of
  lumped segments.
</P>
To get a symmetric line model, the first resistor and inductor are cut into two parts (R1 and R_Nplus1, L1 and L_Nplus1)<br>
The two new resistors and inductors have the half of the resistance/inductance the original resistor/inductor had. <br>
The resistor R1/inductor L1 are at the beginning of the line and R_Nplus1/L_Nplu1 are at the end of the line.
<p align=\"center\">
<IMG SRC=\"../Images/Electrical/Analog/OLine.png\" width=\"1000\"
ALT=\"model Analog.Lines.OLine\">
</p>
The values of the capacitances are calculated with: C=c*length/N with c given by the user, \"lenght=length of line\" and \"N=number of segments\".<br>
The values of the conductances are calculated in the same way the capacitances are, but with g instead of c.<br>
The values of the resistors and inductors are calculated with :R=r*length/(N+1) and L=l*length/(N+1).<br>
For all capacitances, conductances, resistors and inductances the values of each segment are the same exept<br>
of the first and last resistor and inductor, that only have the half of the value of the rest.<br>
Note, this is different to the lumped line model of SPICE.

<DL>
<DT>
<b>References:</b>
<DD>
  Johnson, B.; Quarles, T.; Newton, A. R.; Pederson, D. O.;
  Sangiovanni-Vincentelli, A.: SPICE3 Version 3e User's Manual
  (April 1, 1991). Department of Electrical Engineering and
  Computer Sciences, University of California, Berkley
  p. 12, p. 106 - 107
</DL>
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-60,60},{60,-60}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{0,-60},{0,-90}}, color = {0,0,255}),Line(points = {{60,0},{90,0}}, color = {0,0,255}),Line(points = {{-60,0},{-90,0}}, color = {0,0,255}),Line(points = {{30,30},{-30,30}}, color = {0,0,255}),Line(points = {{-30,40},{-30,20}}, color = {0,0,255}),Line(points = {{30,40},{30,20}}, color = {0,0,255}),Text(extent = {{-155,112},{145,72}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-60,60},{60,-60}}, lineColor = {0,0,255}),Line(points = {{0,-60},{0,-96}}, color = {0,0,255}),Line(points = {{60,0},{96,0}}, color = {0,0,255}),Line(points = {{-60,0},{-96,0}}, color = {0,0,255}),Line(points = {{30,30},{-30,30}}, color = {0,0,255}),Line(points = {{-30,40},{-30,20}}, color = {0,0,255}),Line(points = {{30,40},{30,20}}, color = {0,0,255})}));
    end OLine;
    model M_OLine "multiple OLine"
      parameter Modelica.SIunits.Length length(final min = Modelica.Constants.small) = 0.1 "Length of line";
      parameter Integer N(final min = 1) = 5 "Number of lumped segments";
      parameter Integer lines(final min = 2) = 4 "Number of lines";
    protected
      parameter Integer dim_vector_lgc = div(lines * (lines + 1), 2);
    public
      parameter Real r[lines](final min = Modelica.Constants.small, unit = "Ohm/m") = {476000.0,172000.0,172000.0,172000.0} "Resistance per meter";
      parameter Real l[dim_vector_lgc](final min = Modelica.Constants.small, unit = "H/m") = {5.98e-007,4.44e-007,4.39e-007,3.99e-007,5.81e-007,4.09e-007,4.23e-007,5.96e-007,4.71e-007,6.06e-007} "Inductance per meter";
      parameter Real g[dim_vector_lgc](final min = Modelica.Constants.small, unit = "S/m") = {8.05e-006,3.42e-005,2 - 0.00091,1.76e-006,9.16e-006,7.12e-006,2.43e-005,5.93e-006,4.19e-005,6.64e-006} "Conductance per meter";
      parameter Real c[dim_vector_lgc](final min = Modelica.Constants.small, unit = "F/m") = {2.38e-011,1.01e-010,8.56e-011,5.09e-012,2.71e-011,2.09e-011,7.16e-011,1.83e-011,1.23e-010,2.07e-011} "Capacitance per meter";
      model segment
        parameter Integer lines(final min = 1) = 3;
        //number of lines
        parameter Integer dim_vector_lgc = div(lines * (lines + 1), 2);
        Modelica.Electrical.Analog.Interfaces.PositivePin p[lines] "Positive pin" annotation(Placement(transformation(extent = {{-60,-10},{-40,10}}, rotation = 0)));
        Modelica.Electrical.Analog.Interfaces.NegativePin n[lines] "Negative pin" annotation(Placement(transformation(extent = {{40,-10},{60,10}}, rotation = 0)));
        parameter Real Cl[dim_vector_lgc] = fill(1, dim_vector_lgc);
        parameter Real Rl[lines] = fill(7, lines);
        parameter Real Ll[dim_vector_lgc] = fill(2, dim_vector_lgc);
        parameter Real Gl[dim_vector_lgc] = fill(1, dim_vector_lgc);
        Modelica.Electrical.Analog.Basic.Capacitor C[dim_vector_lgc](C = Cl);
        Modelica.Electrical.Analog.Basic.Resistor R[lines](R = Rl);
        Modelica.Electrical.Analog.Basic.Conductor G[dim_vector_lgc](G = Gl);
        Modelica.Electrical.Analog.Basic.M_Transformer inductance(N = lines, L = Ll);
        Modelica.Electrical.Analog.Basic.Ground M;
      equation
        for j in 1:lines - 1 loop
        connect(R[j].p,p[j]);
        connect(R[j].n,inductance.p[j]);
        connect(inductance.n[j],n[j]);
        connect(inductance.n[j],C[1 + (j - 1) * lines - (j - 2) * (j - 1) * 0.5].p);
        connect(C[1 + (j - 1) * lines - (j - 2) * (j - 1) * 0.5].n,M.p);
        connect(inductance.n[j],G[1 + (j - 1) * lines - (j - 2) * (j - 1) * 0.5].p);
        connect(G[1 + (j - 1) * lines - (j - 2) * (j - 1) * 0.5].n,M.p);
        for i in j + 1:lines loop
        connect(inductance.n[j],C[1 + (j - 1) * lines - (j - 2) * (j - 1) * 0.5 + 1 + i - j + 1].p);
        connect(C[1 + (j - 1) * lines - (j - 2) * (j - 1) * 0.5 + 1 + i - j + 1].n,inductance.n[i]);
        connect(inductance.n[j],G[1 + (j - 1) * lines - (j - 2) * (j - 1) * 0.5 + 1 + i - j + 1].p);
        connect(G[1 + (j - 1) * lines - (j - 2) * (j - 1) * 0.5 + 1 + i - j + 1].n,inductance.n[i]);

        end for;

        end for;
        connect(R[lines].p,p[lines]);
        connect(R[lines].n,inductance.p[lines]);
        connect(inductance.n[lines],n[lines]);
        connect(inductance.n[lines],C[dim_vector_lgc].p);
        connect(C[dim_vector_lgc].n,M.p);
        connect(inductance.n[lines],G[dim_vector_lgc].p);
        connect(G[dim_vector_lgc].n,M.p);
        annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Rectangle(extent = {{40,-40},{-40,40}}, lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics));
      end segment;
      model segment_last
        Modelica.Electrical.Analog.Interfaces.PositivePin p[lines] "Positive pin" annotation(Placement(transformation(extent = {{-40,-10},{-20,10}}, rotation = 0)));
        Modelica.Electrical.Analog.Interfaces.NegativePin n[lines] "Negative pin" annotation(Placement(transformation(extent = {{20,-10},{40,10}}, rotation = 0)));
        parameter Integer lines(final min = 1) = 3;
        parameter Integer dim_vector_lgc = div(lines * (lines + 1), 2);
        parameter Real Rl[lines] = fill(1, lines);
        parameter Real Ll[dim_vector_lgc] = fill(1, dim_vector_lgc);
        Modelica.Electrical.Analog.Basic.Resistor R[lines](R = Rl);
        Modelica.Electrical.Analog.Basic.M_Transformer inductance(N = lines, L = Ll);
        Modelica.Electrical.Analog.Basic.Ground M;
      equation
        for j in 1:lines - 1 loop
        connect(p[j],inductance.p[j]);
        connect(inductance.n[j],R[j].p);
        connect(R[j].n,n[j]);

        end for;
        connect(p[lines],inductance.p[lines]);
        connect(inductance.n[lines],R[lines].p);
        connect(R[lines].n,n[lines]);
        annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Rectangle(extent = {{20,-40},{-20,40}}, lineColor = {0,0,255})}));
      end segment_last;
      segment s[N - 1](lines = fill(lines, N - 1), dim_vector_lgc = fill(dim_vector_lgc, N - 1), Rl = fill((r * length) / N, N - 1), Ll = fill((l * length) / N, N - 1), Cl = fill((c * length) / N, N - 1), Gl = fill((g * length) / N, N - 1));
      segment s_first(lines = lines, dim_vector_lgc = dim_vector_lgc, Rl = (r * length) / (2 * N), Cl = (c * length) / N, Ll = (l * length) / (2 * N), Gl = (g * length) / N);
      segment_last s_last(lines = lines, Rl = (r * length) / (2 * N), Ll = (l * length) / (2 * N));
      Modelica.Electrical.Analog.Interfaces.PositivePin p[lines] "Positive pin" annotation(Placement(transformation(extent = {{-100,-80},{-80,80}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin n[lines] "Negative pin" annotation(Placement(transformation(extent = {{80,-80},{100,80}}, rotation = 0)));
    equation
      connect(p,s_first.p);
      connect(s_first.n,s[1].p);
      for i in 1:N - 2 loop
      connect(s[i].n,s[i + 1].p);

      end for;
      connect(s[N - 1].n,s_last.p);
      connect(s_last.n,n);
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics = {Rectangle(extent = {{60,80},{-60,-80}}, lineColor = {0,0,255}, fillPattern = FillPattern.Solid, fillColor = {255,255,255}),Line(points = {{40,60},{40,40}}),Line(points = {{40,50},{-40,50}}),Line(points = {{-40,60},{-40,40}}),Line(points = {{40,-40},{40,-60}}),Line(points = {{40,-50},{-40,-50}}),Line(points = {{-40,-40},{-40,-60}}),Line(points = {{40,30},{40,10}}),Line(points = {{40,20},{-40,20}}),Line(points = {{-40,30},{-40,10}}),Line(points = {{0,6},{0,-34}}, color = {0,0,255}, pattern = LinePattern.Dot),Text(extent = {{-146,135},{154,95}}, textString = "%name", lineColor = {0,0,255})}), Documentation(revisions = "<HTML>
<ul>

<li><i> November 24, 2008   </i> docu added, cosmetic, K. Majetta
       </li>
<li><i>February 26, 2007</i>
       by Kristin Majetta<br>
       initially modelled.</li>
</ul>
</HTML>", info = "<html>
<p>
The M_OLine is a multi line model  which consists of several segements and several single lines.
Each segement consists of resistors and inductors that are connected in series in each single line, and of capacitors and conductors both between the lines and to the ground. The inductors are coupled to each other like in the M_Inductor model. The following picture shows the schematic of a segment with four single lines (lines=4):
<br>
<br>
<p align=\"center\">
<IMG SRC=\"../Images/Electrical/Analog/segment.png\" width=\"600\"
ALT=\"model Analog.Lines.M_OLine\">
</p>
<br>
The complete multi line consists of N segments and an auxiliary segment_last:<br>
<br>
<center>
-- segment_1 -- segment_2 -- ... -- segment_N -- segment_last -- <br>
</center>
<br>

In the picture of the segment can be seen, that a single segment is unsymmetric. Connecting such unsymmetric segments in a series forces also an unsymmetric multi line. To get a symmetric model which
is useful for coupling and which guaranties the same pin properties, in the segment_1 only half valued resistors and inductors are used. The remaining resistors and inductors are at the other end of the line within the auxiliary segment_last. For the example with 4 lines the schematic of segment_last is like this:<br>
<br>
<p align=\"center\">
<IMG SRC=\"../Images/Electrical/Analog/segment_last.png\" width=\"200\"
ALT=\"model Analog.Lines.M_OLine\">
</p>
<br>
 The number of the capacitors
and conductors depends on the number of single lines that are used, because each line is connected to every other line by both a capacitor and a conductor. One line consists of <b>at least two segements</b>.
</p>

Inside the model M_OLine the model <i>segment</i> is used. This model represents one segment which is build as described above. For modelling the inductances and their mutual couplings the model M_Transformer is used.


To fill the resistance vector, resistance values as many as lines are needed, e.g. if there are four lines,
four resistances are needed. For example for a microelectronic line of 0.1m lenght, a sensible resistance-vector
would be R=[4.76e5, 1.72e5, 1.72e5, 1.72e5].

<p>
Filling the matrixes of the inductances, capacitances and conductances is a bit more complicated, because
those components occur also between two lines and not only (like the resistor) in one line. The entries of
the matrices are given by the user in form of a vector. The  vector length dim_vector_lgc is calculated by  <b>dim_vector_lgc = lines*(lines+1)/2</b>. Inside the model a symmetric inductance matrix, a symmetric capacitance matrix and
a symmetric conductance matrix are build out of the entries of the vectors given by the user. The way of building
is the same for each matrix, so the approach for filling one of the matrices will be shown at an example:
<br>
The number of lines is assumed to be four. To build the matrix, the model needs the values from the main diagonal and from <br>the positions that are below the main diagonal. To get the following matrix
<br>
<br>
<center>
<table>
  <tr>
    <td></td>
    <td></td>
    <td><b>1</b></td>
    <td>0.1</td>
    <td>0.2</td>
    <td>0.4</td>
  </tr>
  <tr>
    <td>Matrix</td>
    <td>=</td>
    <td>0.1</td>
    <td><b>2</b></td>
    <td>0.3</td>
    <td>0.5</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>0.2</td>
    <td>0.3</td>
    <td><b>3</b></td>
    <td>0.6</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>0.4</td>
    <td>0.5</td>
    <td>0.6</td>
    <td><b>4</b></td>
  </tr>
</table>
</center>
the vector with dim_vector_lgc=4*5/2=10 has to appear in the following way: vector = [<b>1</b>, 0.1, 0.2, 0.4, <b>2</b>, 0.3 0.5, <b>3</b>, 0.6, <b>4</b>]
</p>
<p>
For the example of a microelectronic line of 0.1m lenght, which is used as default example for the M_OLine model, a sensible inductance-matrix would be
<center>
<table>
  <tr>
    <td></td>
    <td></td>
    <td>5.98e-7</td>
    <td>4.44e-7</td>
    <td>4.39e-7</td>
    <td>3.99e-7</td>
  </tr>
  <tr>
    <td>L</td>
    <td>=</td>
    <td>4.44e-7</td>
    <td>5.81e-7</td>
    <td>4.09e-7</td>
    <td>4.23e-7</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>4.39e-7</td>
    <td>4.09e-7</td>
    <td>5.96e-7</td>
    <td>4.71e-7</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>3.99e-7</td>
    <td>4.23e-7</td>
    <td>4.71e-7</td>
    <td>6.06e-7</td>
  </tr>
</table>
</center>
</p>
<p>
For the example of a microelectronic line of 0.1m lenght, which is used as default example for the M_OLine model, a sensible capacitance-matrix would be
<center>
<table>
  <tr>
    <td></td>
    <td></td>
    <td>2.38e-11</td>
    <td>1.01e-10</td>
    <td>8.56e-11</td>
    <td>5.09e-12</td>
  </tr>
  <tr>
    <td>C</td>
    <td>=</td>
    <td>1.01e-10</td>
    <td>2.71e-11</td>
    <td>2.09e-11</td>
    <td>7.16e-11</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>8.56e-11</td>
    <td>2.09e-11</td>
    <td>1.83e-11</td>
    <td>1.23e-10</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>5.09e-12</td>
    <td>7.16e-11</td>
    <td>1.23e-10</td>
    <td>2.07e-11</td>
  </tr>
</table>
</center>
</p>
<p>
For the example of a microelectronic line of 0.1m lenght, which is used as default example for the M_OLine model, a sensible conductance-matrix would be
<center>
<table>
  <tr>
    <td></td>
    <td></td>
    <td>8.05e-6</td>
    <td>3.42e-5</td>
    <td>2.91e-5</td>
    <td>1.76e-5</td>
  </tr>
  <tr>
    <td>G</td>
    <td>=</td>
    <td>3.42e-5</td>
    <td>9.16e-6</td>
    <td>5.93e-6</td>
    <td>6.64e-6</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>2.90e-5</td>
    <td>7.08e-6</td>
    <td>5.93e-6</td>
    <td>4.19e-5</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>1.71e-6</td>
    <td>2.43e-5</td>
    <td>4.18e-5</td>
    <td>6.64e-6</td>
  </tr>
</table>
</center>
</p>
</html>"), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), experiment(StopTime = 1e-009, NumberOfIntervals = 2000, Tolerance = 1e-009));
    end M_OLine;
    model ULine "Lossy RC Line"
      //extends Interfaces.ThreePol;
      Interfaces.Pin p1 annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      Interfaces.Pin p2 annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      Interfaces.Pin p3 annotation(Placement(transformation(extent = {{-10,-110},{10,-90}}, rotation = 0)));
      SI.Voltage v13;
      SI.Voltage v23;
      SI.Current i1;
      SI.Current i2;
      parameter Real r(final min = Modelica.Constants.small, unit = "Ohm/m", start = 1) "Resistance per meter";
      parameter Real c(final min = Modelica.Constants.small, unit = "F/m", start = 1) "Capacitance per meter";
      parameter SI.Length length(final min = Modelica.Constants.small, start = 1) "Length of line";
      parameter Integer N(final min = 1, start = 1) "Number of lumped segments";
    protected
      Basic.Resistor R[N + 1](R = fill((r * length) / (N + 1), N + 1));
      Basic.Capacitor C[N](C = fill((c * length) / N, N));
    equation
      v13 = p1.v - p3.v;
      v23 = p2.v - p3.v;
      i1 = p1.i;
      i2 = p2.i;
      connect(p1,R[1].p);
      for i in 1:N loop
      connect(R[i].n,R[i + 1].p);

      end for;
      for i in 1:N loop
      connect(R[i].n,C[i].p);

      end for;
      for i in 1:N loop
      connect(C[i].n,p3);

      end for;
      connect(R[N + 1].n,p2);
      annotation(Documentation(info = "<html>
<P>
As can be seen in the picture below, the lossy RC line ULine consists of segments of
lumped series resistances and capacitances that are
connected with the reference pin p3. <br>The precision
of the model depends on the number N of
lumped segments.
</P>
To get a symmetric line model, the first Resistor is cut into two parts (R1 and R_Nplus1)<br>
The two new resistors have the half of the resistance of the original Resistor had. The Resistor R1<br>
is at the beginning of the line and R_Nplus1 is at the end of the line.
<p align=\"center\">
<IMG SRC=\"../Images/Electrical/Analog/ULine.png\" width=\"600\"
ALT=\"model Analog.Lines.ULine\">
</p>
The values of the capacitances are calculated with: C=c*length/N with c given by the user, \"lenght=length of line\" and \"N=number of segments\".<br>
The values of the resistors are calculated with :R=r*length/(N+1).<br>
For all capacitances and resistors the values of each segment are the same exept<br>
of the first and last resistor, that only hase the half of the value of the other resistors.<br>
Note, this is different to the lumped line model of SPICE.
<p>
<b>References</b></dt>
</p>
<dl>
<dt> Johnson, B.; Quarles, T.; Newton, A. R.; Pederson, D. O.;
    Sangiovanni-Vincentelli, A.</dt>
<dd> SPICE3 Version 3e User's Manual
    (April 1, 1991). Department of Electrical Engineering and
    Computer Sciences, University of California, Berkley
    p. 22, p. 124</dd>
</dl>
</HTML>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Rectangle(extent = {{-60,60},{60,-60}}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Line(points = {{0,-60},{0,-90}}, color = {0,0,255}),Line(points = {{60,0},{90,0}}, color = {0,0,255}),Line(points = {{-60,0},{-90,0}}, color = {0,0,255}),Line(points = {{30,30},{-30,30}}, color = {0,0,255}),Line(points = {{-30,40},{-30,20}}, color = {0,0,255}),Line(points = {{30,40},{30,20}}, color = {0,0,255}),Text(extent = {{-154,117},{146,77}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Rectangle(extent = {{-60,60},{60,-60}}, lineColor = {0,0,255}),Line(points = {{0,-60},{0,-96}}, color = {0,0,255}),Line(points = {{60,0},{96,0}}, color = {0,0,255}),Line(points = {{-60,0},{-96,0}}, color = {0,0,255}),Line(points = {{30,30},{-30,30}}, color = {0,0,255}),Line(points = {{-30,40},{-30,20}}, color = {0,0,255}),Line(points = {{30,40},{30,20}}, color = {0,0,255})}));
    end ULine;
    model TLine1 "Lossless transmission line with characteristic impedance Z0 and transmission delay TD"
      extends Modelica.Electrical.Analog.Interfaces.TwoPort;
      parameter Modelica.SIunits.Resistance Z0(start = 1) "Characteristic impedance";
      parameter Modelica.SIunits.Time TD(start = 1) "Transmission delay";
    protected
      Modelica.SIunits.Voltage er;
      Modelica.SIunits.Voltage es;
    equation
      assert(Z0 > 0, "Z0 has to be positive");
      assert(TD > 0, "TD has to be positive");
      i1 = (v1 - es) / Z0;
      i2 = (v2 - er) / Z0;
      es = 2 * delay(v2, TD) - delay(er, TD);
      er = 2 * delay(v1, TD) - delay(es, TD);
      annotation(Documentation(info = "<html>
<p>
Lossless transmission line with characteristic impedance Z0 and transmission delay TD
  The lossless transmission line TLine1 is a two Port. Both port branches
  consist of a resistor with characteristic impedance Z0 and a controled voltage
  source that takes into consideration the transmission delay TD.
  For further details see Branin's article below.
  The model parameters can be derived from inductance and
  capacitance per length (L' resp. C'), i. e.
  Z0 = sqrt(L'/C') and TD = sqrt(L'*C')*length_of_line. Resistance R'
  and conductance C' per meter are assumed to be zero.
</p>


<p>
<b>References:</b>
</p>
<dl>
<dt>Branin Jr., F. H.</dt>
<dd> Transient Analysis of Lossless Transmission Lines.
     Proceedings of the IEEE 55(1967), 2012 - 2013<dd>
<dt> Hoefer, E. E. E.; Nielinger, H.</dt>
<dd> SPICE : Analyseprogramm fuer elektronische
  Schaltungen. Springer-Verlag, Berlin, Heidelberg, New York, Tokyo, 1985.
</dd>
</dl>

</html>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Joachim Haase<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-60,60},{60,-60}}, lineColor = {0,0,255}, fillPattern = FillPattern.Solid, fillColor = {255,255,255}),Line(points = {{60,-50},{90,-50}}, color = {0,0,255}),Line(points = {{60,50},{90,50}}, color = {0,0,255}),Line(points = {{-60,50},{-90,50}}, color = {0,0,255}),Line(points = {{-60,-50},{-90,-50}}, color = {0,0,255}),Line(points = {{30,30},{-30,30}}, color = {0,0,255}),Line(points = {{-30,40},{-30,20}}, color = {0,0,255}),Line(points = {{30,40},{30,20}}, color = {0,0,255}),Text(extent = {{-50,0},{50,-20}}, textString = "TLine1", lineColor = {0,0,0}),Text(extent = {{-152,122},{148,82}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-60,60},{60,-60}}, lineColor = {0,0,255}),Line(points = {{60,-50},{96,-50}}, color = {0,0,255}),Line(points = {{60,50},{96,50}}, color = {0,0,255}),Line(points = {{-60,50},{-96,50}}, color = {0,0,255}),Line(points = {{-60,-50},{-96,-50}}, color = {0,0,255}),Line(points = {{30,30},{-30,30}}, color = {0,0,255}),Line(points = {{-30,40},{-30,20}}, color = {0,0,255}),Line(points = {{30,40},{30,20}}, color = {0,0,255}),Text(extent = {{-100,100},{100,70}}, textString = "TLine1", lineColor = {0,0,255}),Text(extent = {{-30,0},{31,-31}}, textString = "TLine1", lineColor = {0,0,255})}));
    end TLine1;
    model TLine2 "Lossless transmission line with characteristic impedance Z0, frequency F and normalized length NL"
      extends Modelica.Electrical.Analog.Interfaces.TwoPort;
      parameter Modelica.SIunits.Resistance Z0(start = 1) "Characteristic impedance";
      parameter Modelica.SIunits.Frequency F(start = 1) "Frequency";
      parameter Real NL(start = 1) "Normalized length";
    protected
      Modelica.SIunits.Voltage er;
      Modelica.SIunits.Voltage es;
      parameter Modelica.SIunits.Time TD = NL / F;
    equation
      assert(Z0 > 0, "Z0 has to be positive");
      assert(NL > 0, "NL has to be positive");
      assert(F > 0, "F  has to be positive");
      i1 = (v1 - es) / Z0;
      i2 = (v2 - er) / Z0;
      es = 2 * delay(v2, TD) - delay(er, TD);
      er = 2 * delay(v1, TD) - delay(es, TD);
      annotation(Documentation(info = "<html>
<p>
Lossless transmission line with characteristic impedance Z0, frequency F and normalized length NL
  The lossless transmission line TLine2 is a two Port. Both port branches
  consist of a resistor with the value of the characteristic impedance Z0
  and a controled voltage source that takes into consideration
  the transmission delay.
  For further details see Branin's article below.
  Resistance R' and conductance C' per meter are assumed to be zero.
  The characteristic impedance Z0 can be derived from inductance and
  capacitance per length (L' resp. C'), i. e. Z0 = sqrt(L'/C').
  The normalized length NL is equal to the length of the line divided
  by the wavelength corresponding to the frequency F, i. e. the
  transmission delay TD is the quotient of NL and F.
</p>


<p>
<b>References:</b>
</p>
<dl>
<dt>Branin Jr., F. H.</dt>
<dd> Transient Analysis of Lossless Transmission Lines.
     Proceedings of the IEEE 55(1967), 2012 - 2013<dd>
<dt> Hoefer, E. E. E.; Nielinger, H.</dt>
<dd> SPICE : Analyseprogramm fuer elektronische
  Schaltungen. Springer-Verlag, Berlin, Heidelberg, New York, Tokyo, 1985.
</dd>
</dl>

</html>
", revisions = "<html>
<li><i> 1998   </i>
       by Joachim Haase<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-60,60},{60,-60}}, lineColor = {0,0,255}, fillPattern = FillPattern.Solid, fillColor = {255,255,255}),Line(points = {{60,-50},{90,-50}}, color = {0,0,255}),Line(points = {{60,50},{90,50}}, color = {0,0,255}),Line(points = {{-60,50},{-90,50}}, color = {0,0,255}),Line(points = {{-60,-50},{-90,-50}}, color = {0,0,255}),Line(points = {{30,30},{-30,30}}, color = {0,0,255}),Line(points = {{-30,40},{-30,20}}, color = {0,0,255}),Line(points = {{30,40},{30,20}}, color = {0,0,255}),Text(extent = {{-51,-10},{50,-31}}, textString = "TLine2", lineColor = {0,0,0}),Text(extent = {{-148,119},{152,79}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-60,60},{60,-60}}, lineColor = {0,0,255}),Line(points = {{60,-50},{96,-50}}, color = {0,0,255}),Line(points = {{60,50},{96,50}}, color = {0,0,255}),Line(points = {{-60,50},{-96,50}}, color = {0,0,255}),Line(points = {{-60,-50},{-96,-50}}, color = {0,0,255}),Line(points = {{30,30},{-30,30}}, color = {0,0,255}),Line(points = {{-30,40},{-30,20}}, color = {0,0,255}),Line(points = {{30,40},{30,20}}, color = {0,0,255}),Text(extent = {{-100,100},{100,70}}, textString = "TLine2", lineColor = {0,0,255})}));
    end TLine2;
    model TLine3 "Lossless transmission line with characteristic impedance Z0 and frequency F"
      extends Modelica.Electrical.Analog.Interfaces.TwoPort;
      parameter Modelica.SIunits.Resistance Z0(start = 1) "Natural impedance";
      parameter Modelica.SIunits.Frequency F(start = 1) "Frequency";
    protected
      Modelica.SIunits.Voltage er;
      Modelica.SIunits.Voltage es;
      parameter Modelica.SIunits.Time TD = 1 / F / 4;
    equation
      assert(Z0 > 0, "Z0 has to be positive");
      assert(F > 0, "F  has to be positive");
      i1 = (v1 - es) / Z0;
      i2 = (v2 - er) / Z0;
      es = 2 * delay(v2, TD) - delay(er, TD);
      er = 2 * delay(v1, TD) - delay(es, TD);
      annotation(Documentation(info = "<html>
<p>
Lossless transmission line with characteristic impedance Z0 and frequency F
  The lossless transmission line TLine3 is a two Port. Both port branches
  consist of a resistor with value of the characteristic impedance Z0
  and a controled voltage source that takes into consideration
  the transmission delay.
  For further details see Branin's article below.
  Resistance R' and conductance C' per meter are assumed to be zero.
  The characteristic impedance Z0 can be derived from inductance and
  capacitance per length (L' resp. C'), i. e. Z0 = sqrt(L'/C').
  The length of the line is equal to a quarter of the wavelength
  corresponding to the frequency F, i. e. the
  transmission delay is the quotient of 4 and F.
  In this case, the caracteristic impedance is called natural impedance.
</p>


<p>
<b>References:</b>
</p>
<dl>
<dt>Branin Jr., F. H.</dt>
<dd> Transient Analysis of Lossless Transmission Lines.
     Proceedings of the IEEE 55(1967), 2012 - 2013<dd>
<dt> Hoefer, E. E. E.; Nielinger, H.</dt>
<dd> SPICE : Analyseprogramm fuer elektronische
  Schaltungen. Springer-Verlag, Berlin, Heidelberg, New York, Tokyo, 1985.
</dd>
</dl>

</html>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Joachim Haase<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-60,60},{60,-60}}, lineColor = {0,0,255}, fillPattern = FillPattern.Solid, fillColor = {255,255,255}),Line(points = {{60,-50},{90,-50}}, color = {0,0,255}),Line(points = {{60,50},{90,50}}, color = {0,0,255}),Line(points = {{-60,50},{-90,50}}, color = {0,0,255}),Line(points = {{-60,-50},{-90,-50}}, color = {0,0,255}),Line(points = {{30,30},{-30,30}}, color = {0,0,255}),Line(points = {{-30,40},{-30,20}}, color = {0,0,255}),Line(points = {{30,40},{30,20}}, color = {0,0,255}),Text(extent = {{-50,-10},{51,-30}}, textString = "TLine3", lineColor = {0,0,0}),Text(extent = {{-155,124},{145,84}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Rectangle(extent = {{-60,60},{60,-60}}, lineColor = {0,0,255}),Line(points = {{60,-50},{96,-50}}, color = {0,0,255}),Line(points = {{60,50},{96,50}}, color = {0,0,255}),Line(points = {{-60,50},{-96,50}}, color = {0,0,255}),Line(points = {{-60,-50},{-96,-50}}, color = {0,0,255}),Line(points = {{30,30},{-30,30}}, color = {0,0,255}),Line(points = {{-30,40},{-30,20}}, color = {0,0,255}),Line(points = {{30,40},{30,20}}, color = {0,0,255}),Text(extent = {{-100,100},{100,70}}, textString = "TLine3", lineColor = {0,0,255})}));
    end TLine3;
    annotation(Documentation(info = "<html>
<p>
This package contains lossy and lossless segmented transmission lines,
and LC distributed line models.

The line models do not yet possess a conditional heating port.
</p>

</HTML>
", revisions = "<html>
<dl>
<dt>
<b>Main Authors:</b>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    <a href=\"http://people.eas.iis.fhg.de/Joachim.Haase/\">Joachim Haase;</a>
    &lt;<a href=\"mailto:haase@eas.iis.fhg.de\">haase@eas.iis.fhg.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
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
</html>"));
  end Lines;
  package Semiconductors "Semiconductor devices such as diode, MOS and bipolar transistor"
    extends Modelica.Icons.Library;
    import Modelica.SIunits;
    model Diode "Simple diode"
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      parameter SIunits.Current Ids = 1e-006 "Saturation current";
      parameter SIunits.Voltage Vt = 0.04 "Voltage equivalent of temperature (kT/qn)";
      parameter Real Maxexp(final min = Modelica.Constants.small) = 15 "Max. exponent for linear continuation";
      parameter SIunits.Resistance R = 100000000.0 "Parallel ohmic resistance";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = 293.15);
    equation
      i = smooth(1, if v / Vt > Maxexp then Ids * (exp(Maxexp) * (1 + v / Vt - Maxexp) - 1) + v / R else Ids * (exp(v / Vt) - 1) + v / R);
      LossPower = v * i;
      annotation(Documentation(info = "
<HTML>
<P>
The simple diode is a one port. It consists of the diode itself and an parallel ohmic
resistance <i>R</i>. The diode formula is:
</P>
<PRE>
                v/vt
  i  =  ids ( e      - 1).
</PRE>
<P>
If the exponent <i>v/vt</i> reaches the limit <i>maxex</i>, the diode characterisic is linearly
continued to avoid overflow.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled yet. The parameters are not temperature dependent.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> November 15, 2005   </i>
       by Christoph Clauss<br> smooth function added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{30,0},{-30,40},{-30,-40},{30,0}}, lineColor = {0,0,0}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-90,0},{40,0}}, color = {0,0,255}),Line(points = {{40,0},{90,0}}, color = {0,0,255}),Line(points = {{30,40},{30,-40}}, color = {0,0,255}),Text(extent = {{-150,-49},{149,-77}}, lineColor = {0,0,0}, textString = "Vt=%Vt"),Text(extent = {{-154,100},{146,60}}, textString = "%name", lineColor = {0,0,255}),Line(visible = useHeatPort, points = {{0,-100},{0,-20}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{30,0},{-30,40},{-30,-40},{30,0}}, lineColor = {0,0,0}, fillColor = {255,0,0}, fillPattern = FillPattern.None),Line(points = {{-96,0},{40,0}}, color = {0,0,255}),Line(points = {{40,0},{96,0}}, color = {0,0,255}),Line(points = {{30,40},{30,-40}}, color = {0,0,255})}));
    end Diode;
    model ZDiode "Zener Diode with 3 working areas"
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      parameter Modelica.SIunits.Current Ids = 1e-006 "Saturation current";
      parameter Modelica.SIunits.Voltage Vt = 0.04 "Voltage equivalent of temperature (kT/qn)";
      parameter Real Maxexp(final min = Modelica.Constants.small) = 30 "Max. exponent for linear continuation";
      parameter Modelica.SIunits.Resistance R = 100000000.0 "Parallel ohmic resistance";
      parameter Modelica.SIunits.Voltage Bv = 5.1 "Breakthrough voltage = Zener- or Z-voltage";
      parameter Modelica.SIunits.Current Ibv = 0.7 "Breakthrough knee current";
      parameter Real Nbv = 0.74 "Breakthrough emission coefficient";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = 293.15);
    equation
      i = smooth(1, if v > Maxexp * Vt then Ids * (exp(Maxexp) * (1 + v / Vt - Maxexp) - 1) + v / R else if v + Bv < -Maxexp * Nbv * Vt then -Ids - Ibv * exp(Maxexp) * (1 - (v + Bv) / (Nbv * Vt) - Maxexp) + v / R else Ids * (exp(v / Vt) - 1) - Ibv * exp(-(v + Bv) / (Nbv * Vt)) + v / R);
      LossPower = v * i;
      annotation(Documentation(info = "
<HTML>
<P>
The simple zener diode is a one port. It consists of the diode itself and an parallel ohmic
resistance <i>R</i>. The diode formula is:
</P>
<PRE>
                v/Vt                -(v+Bv)/(Nbv*Vt)
  i  =  Ids ( e      - 1) - Ibv ( e                  ).
</PRE>
<P>
If the exponent  in one of the two branches reaches the limit <i>Maxexp</i>, the diode characterisic is linearly
continued to avoid overflow.
</P>

<P>
The zener diode model permits (in contrast to the simple diode model)
current in reverse direction if the breakdown voltage Bv (also known zener knee voltage) is exceeded.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled yet. The parameters are not temperature dependent.
</P>


</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> January 8, 2009   </i>
       by Matthias Franke <br>
       initially implemented
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{30,0},{-30,40},{-30,-40},{30,0}}, lineColor = {0,0,0}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-90,0},{40,0}}, color = {0,0,255}),Line(points = {{40,0},{90,0}}, color = {0,0,255}),Line(points = {{30,40},{30,-40}}, color = {0,0,255}),Text(extent = {{-127,-51},{135,-79}}, lineColor = {0,0,0}, textString = "Bv=%Bv"),Line(points = {{30,-40},{20,-40}}, color = {0,0,255}, smooth = Smooth.None),Text(extent = {{-150,96},{150,56}}, textString = "%name", lineColor = {0,0,255}),Line(visible = useHeatPort, points = {{0,-100},{0,-20}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{30,0},{-30,40},{-30,-40},{30,0}}, lineColor = {0,0,0}, fillColor = {255,0,0}, fillPattern = FillPattern.None),Line(points = {{-96,0},{40,0}}, color = {0,0,255}),Line(points = {{40,0},{96,0}}, color = {0,0,255}),Line(points = {{30,40},{30,-40}}, color = {0,0,255}),Line(points = {{30,-40},{20,-40}}, color = {0,0,255}, smooth = Smooth.None)}));
    end ZDiode;
    model PMOS "Simple MOS Transistor"
      Interfaces.Pin D "Drain" annotation(Placement(transformation(extent = {{90,40},{110,60}}, rotation = 0)));
      Interfaces.Pin G "Gate" annotation(Placement(transformation(extent = {{-90,-40},{-110,-60}}, rotation = 0)));
      Interfaces.Pin S "Source" annotation(Placement(transformation(extent = {{90,-40},{110,-60}}, rotation = 0)));
      Interfaces.Pin B "Bulk" annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      parameter SIunits.Length W = 2e-005 "Width";
      parameter SIunits.Length L = 6e-006 "Length";
      parameter SIunits.Transconductance Beta = 1.05e-005 "Transconductance parameter";
      parameter SIunits.Voltage Vt = -1.0 "Zero bias threshold voltage";
      parameter Real K2 = 0.41 "Bulk threshold parameter";
      parameter Real K5 = 0.839 "Reduction of pinch-off region";
      parameter SIunits.Length dW = -2.5e-006 "Narrowing of channel";
      parameter SIunits.Length dL = -2.1e-006 "Shortening of channel";
      parameter SIunits.Resistance RDS = 10000000.0 "Drain-Source-Resistance";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = 293.15);
    protected
      Real v;
      Real uds;
      Real ubs;
      Real ugst;
      Real ud;
      Real us;
      Real id;
      Real gds;
    equation
      gds = if RDS < 1e-020 and RDS > -1e-020 then 1e+020 else 1 / RDS;
      v = (Beta * (W + dW)) / (L + dL);
      ud = smooth(0, if D.v > S.v then S.v else D.v);
      us = smooth(0, if D.v > S.v then D.v else S.v);
      uds = ud - us;
      ubs = smooth(0, if B.v < us then 0 else B.v - us);
      ugst = (G.v - us - Vt + K2 * ubs) * K5;
      id = smooth(0, if ugst >= 0 then uds * gds else if ugst < uds then -v * uds * (ugst - uds / 2) + uds * gds else -(v * ugst * ugst) / 2 + uds * gds);
      G.i = 0;
      D.i = smooth(0, if D.v > S.v then -id else id);
      S.i = smooth(0, if D.v > S.v then id else -id);
      B.i = 0;
      LossPower = D.i * (D.v - S.v);
      annotation(Documentation(info = "
<HTML>
<P>
The PMOS model is a simple model of a p-channel metal-oxide semiconductor
FET. It differs slightly from the device used in the SPICE simulator.
For more details please care for H. Spiro.
</P>
<P>
The model does not consider capacitances. A high drain-source resistance RDS
is included to avoid numerical difficulties.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled yet. The parameters are not temperature dependent.
</P>
<DL>
<DT><b>References:</b>
<DD>Spiro, H.: Simulation integrierter Schaltungen. R. Oldenbourg Verlag
  Muenchen Wien 1990.
</DL>
<P>
Some typical parameter sets are:
</P>
<PRE>
  W       L      Beta        Vt       K2       K5       DW         DL
  m       m      A/V^2       V        -        -        m          m
  50.e-6  8.e-6  .0085e-3   -.15     .41      .839    -3.8e-6    -4.0e-6
  20.e-6  6.e-6  .0105e-3  -1.0      .41      .839    -2.5e-6    -2.1e-6
  30.e-6  5.e-6  .0059e-3   -.3      .98     1.01      0         -3.9e-6
  30.e-6  5.e-6  .0152e-3   -.69     .104    1.1       -.8e-6     -.4e-6
  30.e-6  5.e-6  .0163e-3   -.69     .104    1.1       -.8e-6     -.4e-6
  30.e-6  5.e-6  .0182e-3   -.69     .086    1.06      -.1e-6     -.6e-6
  20.e-6  6.e-6  .0074e-3  -1.       .4       .59      0          0
</PRE>

</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>December 7, 2005   </i>
       by Christoph Clauss<br>
       error in RDS calculation deleted</li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-90,-50},{-10,-50}}, color = {0,0,255}),Line(points = {{-10,-50},{-10,50}}, color = {0,0,255}),Line(points = {{10,70},{10,29}}, color = {0,0,255}),Line(points = {{10,20},{10,-21}}, color = {0,0,255}),Line(points = {{10,-30},{10,-71}}, color = {0,0,255}),Line(points = {{10,50},{91,50}}, color = {0,0,255}),Line(points = {{10,0},{90,0}}, color = {0,0,255}),Line(points = {{10,-50},{90,-50}}, color = {0,0,255}),Polygon(points = {{60,0},{40,5},{40,-5},{60,0}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Text(extent = {{-149,117},{151,77}}, textString = "%name", lineColor = {0,0,255}),Line(visible = useHeatPort, points = {{0,-90},{0,0}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-96,-50},{-10,-50}}, color = {0,0,255}),Line(points = {{-10,-50},{-10,50}}, color = {0,0,255}),Line(points = {{10,70},{10,29}}, color = {0,0,255}),Line(points = {{10,20},{10,-21}}, color = {0,0,255}),Line(points = {{10,-30},{10,-71}}, color = {0,0,255}),Line(points = {{10,50},{96,50}}, color = {0,0,255}),Line(points = {{10,0},{96,0}}, color = {0,0,255}),Line(points = {{10,-50},{96,-50}}, color = {0,0,255}),Polygon(points = {{60,0},{40,5},{40,-5},{60,0}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255})}));
    end PMOS;
    //assert (L + dL > 0, "Effective length must be positive");
    //assert (W + dW > 0, "Effective width  must be positive");
    model NMOS "Simple MOS Transistor"
      Interfaces.Pin D "Drain" annotation(Placement(transformation(extent = {{90,40},{110,60}}, rotation = 0)));
      Interfaces.Pin G "Gate" annotation(Placement(transformation(extent = {{-90,-40},{-110,-60}}, rotation = 0)));
      Interfaces.Pin S "Source" annotation(Placement(transformation(extent = {{90,-40},{110,-60}}, rotation = 0)));
      Interfaces.Pin B "Bulk" annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      parameter SIunits.Length W = 2e-005 "Width";
      parameter SIunits.Length L = 6e-006 "Length";
      parameter SIunits.Transconductance Beta = 4.1e-005 "Transconductance parameter";
      parameter SIunits.Voltage Vt = 0.8 "Zero bias threshold voltage";
      parameter Real K2 = 1.144 "Bulk threshold parameter";
      parameter Real K5 = 0.7311 "Reduction of pinch-off region";
      parameter SIunits.Length dW = -2.5e-006 "narrowing of channel";
      parameter SIunits.Length dL = -1.5e-006 "shortening of channel";
      parameter SIunits.Resistance RDS = 10000000.0 "Drain-Source-Resistance";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = 293.15);
    protected
      Real v;
      Real uds;
      Real ubs;
      Real ugst;
      Real ud;
      Real us;
      Real id;
      Real gds;
    equation
      gds = if RDS < 1e-020 and RDS > -1e-020 then 1e+020 else 1 / RDS;
      v = (Beta * (W + dW)) / (L + dL);
      ud = smooth(0, if D.v < S.v then S.v else D.v);
      us = if D.v < S.v then D.v else S.v;
      uds = ud - us;
      ubs = smooth(0, if B.v > us then 0 else B.v - us);
      ugst = (G.v - us - Vt + K2 * ubs) * K5;
      id = smooth(0, if ugst <= 0 then uds * gds else if ugst > uds then v * uds * (ugst - uds / 2) + uds * gds else (v * ugst * ugst) / 2 + uds * gds);
      G.i = 0;
      D.i = smooth(0, if D.v < S.v then -id else id);
      S.i = smooth(0, if D.v < S.v then id else -id);
      B.i = 0;
      LossPower = D.i * (D.v - S.v);
      annotation(Documentation(info = "
<HTML>
<P>
The NMos model is a simple model of a n-channel metal-oxide semiconductor
FET. It differs slightly from the device used in the SPICE simulator.
For more details please care for H. Spiro.
</P>
<P>
The model does not consider capacitances. A high drain-source resistance RDS
is included to avoid numerical difficulties.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled yet. The parameters are not temperature dependent.
</P>
<P>
<PRE>
  W       L      Beta        Vt       K2      K5       DW         DL
  m       m      A/V^2       V        -       -        m          m
  12.e-6  4.e-6  .062e-3   -4.5      .24     .61     -1.2e-6     -.9e-6      depletion
  60.e-6  3.e-6  .048e-3     .1      .08     .68     -1.2e-6     -.9e-6      enhancement
  12.e-6  4.e-6  .0625e-3   -.8      .21     .78     -1.2e-6     -.9e-6      zero
  50.e-6  8.e-6  .0299e-3    .24    1.144    .7311   -5.4e-6    -4.e-6
  20.e-6  6.e-6  .041e-3     .8     1.144    .7311   -2.5e-6    -1.5e-6
  30.e-6  9.e-6  .025e-3   -4.       .861    .878    -3.4e-6    -1.74e-6
  30.e-6  5.e-6  .031e-3     .6     1.5      .72      0         -3.9e-6
  50.e-6  6.e-6  .0414e-3  -3.8      .34     .8      -1.6e-6    -2.e-6       depletion
  50.e-6  5.e-6  .03e-3      .37     .23     .86     -1.6e-6    -2.e-6       enhancement
  50.e-6  6.e-6  .038e-3    -.9      .23     .707    -1.6e-6    -2.e-6       zero
  20.e-6  4.e-6  .06776e-3   .5409   .065    .71      -.8e-6     -.2e-6
  20.e-6  4.e-6  .06505e-3   .6209   .065    .71      -.8e-6     -.2e-6
  20.e-6  4.e-6  .05365e-3   .6909   .03     .8       -.3e-6     -.2e-6
  20.e-6  4.e-6  .05365e-3   .4909   .03     .8       -.3e-6     -.2e-6
  12.e-6  4.e-6  .023e-3   -4.5      .29     .6       0          0           depletion
  60.e-6  3.e-6  .022e-3     .1      .11     .65      0          0           enhancement
  12.e-6  4.e-6  .038e-3    -.8      .33     .6       0          0           zero
  20.e-6  6.e-6  .022e-3     .8     1        .66      0          0
</PRE>

<P>
<DL>
<DT><b>References:</b>
<DD>Spiro, H.: Simulation integrierter Schaltungen. R. Oldenbourg Verlag
Muenchen Wien 1990.
</DL>
</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>December 7, 2005   </i>
       by Christoph Clauss<br>
       error in RDS calculation deleted</li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-90,-50},{-10,-50}}, color = {0,0,255}),Line(points = {{-10,-50},{-10,50}}, color = {0,0,255}),Line(points = {{10,70},{10,29}}, color = {0,0,255}),Line(points = {{10,20},{10,-21}}, color = {0,0,255}),Line(points = {{10,-30},{10,-71}}, color = {0,0,255}),Line(points = {{10,50},{91,50}}, color = {0,0,255}),Line(points = {{10,0},{90,0}}, color = {0,0,255}),Line(points = {{10,-50},{90,-50}}, color = {0,0,255}),Polygon(points = {{40,0},{60,5},{60,-5},{40,0}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Text(extent = {{-155,119},{145,79}}, textString = "%name", lineColor = {0,0,255}),Line(visible = useHeatPort, points = {{0,-100},{0,0}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-96,-50},{-10,-50}}, color = {0,0,255}),Line(points = {{-10,-50},{-10,50}}, color = {0,0,255}),Line(points = {{10,70},{10,29}}, color = {0,0,255}),Line(points = {{10,20},{10,-21}}, color = {0,0,255}),Line(points = {{10,-30},{10,-71}}, color = {0,0,255}),Line(points = {{10,50},{96,50}}, color = {0,0,255}),Line(points = {{10,0},{96,0}}, color = {0,0,255}),Line(points = {{10,-50},{96,-50}}, color = {0,0,255}),Polygon(points = {{40,0},{60,5},{60,-5},{40,0}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255})}));
    end NMOS;
    //assert (L + dL > 0, "Effective length must be positive");
    //assert (W + dW > 0, "Effective width  must be positive");
    model NPN "Simple BJT according to Ebers-Moll"
      parameter Real Bf = 50 "Forward beta";
      parameter Real Br = 0.1 "Reverse beta";
      parameter SIunits.Current Is = 1e-016 "Transport saturation current";
      parameter SIunits.InversePotential Vak = 0.02 "Early voltage (inverse), 1/Volt";
      parameter SIunits.Time Tauf = 1.2e-010 "Ideal forward transit time";
      parameter SIunits.Time Taur = 5e-009 "Ideal reverse transit time";
      parameter SIunits.Capacitance Ccs = 1e-012 "Collector-substrat(ground) cap.";
      parameter SIunits.Capacitance Cje = 4e-013 "Base-emitter zero bias depletion cap.";
      parameter SIunits.Capacitance Cjc = 5e-013 "Base-coll. zero bias depletion cap.";
      parameter SIunits.Voltage Phie = 0.8 "Base-emitter diffusion voltage";
      parameter Real Me = 0.4 "Base-emitter gradation exponent";
      parameter SIunits.Voltage Phic = 0.8 "Base-collector diffusion voltage";
      parameter Real Mc = 0.333 "Base-collector gradation exponent";
      parameter SIunits.Conductance Gbc = 1e-015 "Base-collector conductance";
      parameter SIunits.Conductance Gbe = 1e-015 "Base-emitter conductance";
      parameter SIunits.Voltage Vt = 0.02585 "Voltage equivalent of temperature";
      parameter Real EMin = -100 "if x < EMin, the exp(x) function is linearized";
      parameter Real EMax = 40 "if x > EMax, the exp(x) function is linearized";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = 293.15);
    protected
      Real vbc;
      Real vbe;
      Real qbk;
      Real ibc;
      Real ibe;
      Real cbc;
      Real cbe;
      Real ExMin;
      Real ExMax;
      Real Capcje;
      Real Capcjc;
      function pow "Just a helper function for x^y"
        input Real x;
        input Real y;
        output Real z;
      algorithm
        z:=x ^ y;
      end pow;
    public
      Modelica.Electrical.Analog.Interfaces.Pin C "Collector" annotation(Placement(transformation(extent = {{90,40},{110,60}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.Pin B "Base" annotation(Placement(transformation(extent = {{-90,-10},{-110,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.Pin E "Emitter" annotation(Placement(transformation(extent = {{90,-40},{110,-60}}, rotation = 0)));
    equation
      ExMin = exp(EMin);
      ExMax = exp(EMax);
      vbc = B.v - C.v;
      vbe = B.v - E.v;
      qbk = 1 - vbc * Vak;
      ibc = smooth(1, if vbc / Vt < EMin then Is * (ExMin * (vbc / Vt - EMin + 1) - 1) + vbc * Gbc else if vbc / Vt > EMax then Is * (ExMax * (vbc / Vt - EMax + 1) - 1) + vbc * Gbc else Is * (exp(vbc / Vt) - 1) + vbc * Gbc);
      ibe = smooth(1, if vbe / Vt < EMin then Is * (ExMin * (vbe / Vt - EMin + 1) - 1) + vbe * Gbe else if vbe / Vt > EMax then Is * (ExMax * (vbe / Vt - EMax + 1) - 1) + vbe * Gbe else Is * (exp(vbe / Vt) - 1) + vbe * Gbe);
      Capcjc = smooth(1, if vbc / Phic > 0 then Cjc * (1 + (Mc * vbc) / Phic) else Cjc * pow(1 - vbc / Phic, -Mc));
      Capcje = smooth(1, if vbe / Phie > 0 then Cje * (1 + (Me * vbe) / Phie) else Cje * pow(1 - vbe / Phie, -Me));
      cbc = smooth(1, if vbc / Vt < EMin then (Taur * Is) / Vt * ExMin * (vbc / Vt - EMin + 1) + Capcjc else if vbc / Vt > EMax then (Taur * Is) / Vt * ExMax * (vbc / Vt - EMax + 1) + Capcjc else (Taur * Is) / Vt * exp(vbc / Vt) + Capcjc);
      cbe = smooth(1, if vbe / Vt < EMin then (Tauf * Is) / Vt * ExMin * (vbe / Vt - EMin + 1) + Capcje else if vbe / Vt > EMax then (Tauf * Is) / Vt * ExMax * (vbe / Vt - EMax + 1) + Capcje else (Tauf * Is) / Vt * exp(vbe / Vt) + Capcje);
      C.i = (ibe - ibc) * qbk - ibc / Br - cbc * der(vbc) + Ccs * der(C.v);
      B.i = ibe / Bf + ibc / Br + cbc * der(vbc) + cbe * der(vbe);
      E.i = -B.i - C.i + Ccs * der(C.v);
      LossPower = (C.v - E.v) * (ibe - ibc) * qbk + (vbc * ibc) / Br + (vbe * ibe) / Bf;
      annotation(Documentation(info = "
<HTML>
<P>
This model is a simple model of a bipolar npn junction transistor according
to Ebers-Moll.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled yet. The parameters are not temperature dependent.
</P>
<P>
A typical parameter set is:
</P>
<PRE>
  Bf  Br  Is     Vak  Tauf    Taur  Ccs   Cje     Cjc     Phie  Me   PHic   Mc     Gbc    Gbe    Vt
  -   -   A      V    s       s     F     F       F       V     -    V      -      mS     mS     V
  50  0.1 1e-16  0.02 0.12e-9 5e-9  1e-12 0.4e-12 0.5e-12 0.8   0.4  0.8    0.333  1e-15  1e-15  0.02585
</PRE>

<P>
<DL>
<DT><b>References:</b>
<DD>Vlach, J.; Singal, K.: Computer methods for circuit analysis and design.
Van Nostrand Reinhold, New York 1983
on page 317 ff.
</DL>
<P>
</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>

<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Line(points = {{-10,40},{-10,-40}}, color = {0,0,255}),Line(points = {{-10,0},{-90,0}}, color = {0,0,255}),Line(points = {{91,50},{30,50}}, color = {0,0,255}),Line(points = {{30,50},{-10,10}}, color = {0,0,255}),Line(points = {{-10,-10},{30,-50}}, color = {0,0,255}),Line(points = {{30,-50},{91,-50}}, color = {0,0,255}),Polygon(points = {{30,-50},{24,-36},{16,-44},{30,-50}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Text(extent = {{-152,117},{148,77}}, textString = "%name", lineColor = {0,0,255}),Line(visible = useHeatPort, points = {{0,-100},{0,-20}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Line(points = {{-10,40},{-10,-40}}, color = {0,0,255}),Line(points = {{-10,0},{-100,0}}, color = {0,0,255}),Line(points = {{30,50},{-10,10}}, color = {0,0,255}),Line(points = {{-10,-10},{30,-50}}, color = {0,0,255}),Line(points = {{30,-50},{100,-50}}, color = {0,0,255}),Line(points = {{100,50},{30,50}}, color = {0,0,255}),Polygon(points = {{30,-50},{24,-36},{16,-44},{30,-50}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255})}));
    end NPN;
    model PNP "Simple BJT according to Ebers-Moll"
      parameter Real Bf = 50 "Forward beta";
      parameter Real Br = 0.1 "Reverse beta";
      parameter SIunits.Current Is = 1e-016 "Transport saturation current";
      parameter SIunits.InversePotential Vak = 0.02 "Early voltage (inverse), 1/Volt";
      parameter SIunits.Time Tauf = 1.2e-010 "Ideal forward transit time";
      parameter SIunits.Time Taur = 5e-009 "Ideal reverse transit time";
      parameter SIunits.Capacitance Ccs = 1e-012 "Collector-substrat(ground) cap.";
      parameter SIunits.Capacitance Cje = 4e-013 "Base-emitter zero bias depletion cap.";
      parameter SIunits.Capacitance Cjc = 5e-013 "Base-coll. zero bias depletion cap.";
      parameter SIunits.Voltage Phie = 0.8 "Base-emitter diffusion voltage";
      parameter Real Me = 0.4 "Base-emitter gradation exponent";
      parameter SIunits.Voltage Phic = 0.8 "Base-collector diffusion voltage";
      parameter Real Mc = 0.333 "Base-collector gradation exponent";
      parameter SIunits.Conductance Gbc = 1e-015 "Base-collector conductance";
      parameter SIunits.Conductance Gbe = 1e-015 "Base-emitter conductance";
      parameter SIunits.Voltage Vt = 0.02585 "Voltage equivalent of temperature";
      parameter Real EMin = -100 "if x < EMin, the exp(x) function is linearized";
      parameter Real EMax = 40 "if x > EMax, the exp(x) function is linearized";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = 293.15);
    protected
      Real vbc;
      Real vbe;
      Real qbk;
      Real ibc;
      Real ibe;
      Real cbc;
      Real cbe;
      Real ExMin;
      Real ExMax;
      Real Capcje;
      Real Capcjc;
      function pow "Just a helper function for x^y"
        input Real x;
        input Real y;
        output Real z;
      algorithm
        z:=x ^ y;
      end pow;
    public
      Modelica.Electrical.Analog.Interfaces.Pin C "Collector" annotation(Placement(transformation(extent = {{90,40},{110,60}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.Pin B "Base" annotation(Placement(transformation(extent = {{-90,-10},{-110,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.Pin E "Emitter" annotation(Placement(transformation(extent = {{90,-40},{110,-60}}, rotation = 0)));
    equation
      ExMin = exp(EMin);
      ExMax = exp(EMax);
      vbc = C.v - B.v;
      vbe = E.v - B.v;
      qbk = 1 - vbc * Vak;
      ibc = smooth(1, if vbc / Vt < EMin then Is * (ExMin * (vbc / Vt - EMin + 1) - 1) + vbc * Gbc else if vbc / Vt > EMax then Is * (ExMax * (vbc / Vt - EMax + 1) - 1) + vbc * Gbc else Is * (exp(vbc / Vt) - 1) + vbc * Gbc);
      ibe = smooth(1, if vbe / Vt < EMin then Is * (ExMin * (vbe / Vt - EMin + 1) - 1) + vbe * Gbe else if vbe / Vt > EMax then Is * (ExMax * (vbe / Vt - EMax + 1) - 1) + vbe * Gbe else Is * (exp(vbe / Vt) - 1) + vbe * Gbe);
      Capcjc = smooth(1, if vbc / Phic > 0 then Cjc * (1 + (Mc * vbc) / Phic) else Cjc * pow(1 - vbc / Phic, -Mc));
      Capcje = smooth(1, if vbe / Phie > 0 then Cje * (1 + (Me * vbe) / Phie) else Cje * pow(1 - vbe / Phie, -Me));
      cbc = smooth(1, if vbc / Vt < EMin then (Taur * Is) / Vt * ExMin * (vbc / Vt - EMin + 1) + Capcjc else if vbc / Vt > EMax then (Taur * Is) / Vt * ExMax * (vbc / Vt - EMax + 1) + Capcjc else (Taur * Is) / Vt * exp(vbc / Vt) + Capcjc);
      cbe = smooth(1, if vbe / Vt < EMin then (Tauf * Is) / Vt * ExMin * (vbe / Vt - EMin + 1) + Capcje else if vbe / Vt > EMax then (Tauf * Is) / Vt * ExMax * (vbe / Vt - EMax + 1) + Capcje else (Tauf * Is) / Vt * exp(vbe / Vt) + Capcje);
      C.i = -((ibe - ibc) * qbk - ibc / Br - cbc * der(vbc) - Ccs * der(C.v));
      B.i = -(ibe / Bf + ibc / Br + cbe * der(vbe) + cbc * der(vbc));
      E.i = -B.i - C.i + Ccs * der(C.v);
      LossPower = (E.v - C.v) * (ibe - ibc) * qbk + (vbc * ibc) / Br + (vbe * ibe) / Bf;
      annotation(Documentation(info = "
<HTML>
<P>
This model is a simple model of a bipolar pnp junction transistor according
to Ebers-Moll.
<br> <br>
<b>Please note:</b>
In case of useHeatPort=true the temperature dependence of the electrical
behavior is <b> not </b> modelled yet. The parameters are not temperature dependent.
<P>
A typical parameter set is:
</P>
<PRE>
  Bf  Br  Is     Vak  Tauf    Taur  Ccs   Cje     Cjc     Phie  Me   PHic   Mc     Gbc    Gbe    Vt
  -   -   A      V    s       s     F     F       F       V     -    V      -      mS     mS     V
  50  0.1 1e-16  0.02 0.12e-9 5e-9  1e-12 0.4e-12 0.5e-12 0.8   0.4  0.8    0.333  1e-15  1e-15  0.02585
</PRE>

<P>
<DL>
<DT><b>References:</b>
<DD>Vlach, J.; Singal, K.: Computer methods for circuit analysis and design.
Van Nostrand Reinhold, New York 1983
on page 317 ff.
</DL>
<P>
</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>

<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-10,40},{-10,-40}}, color = {0,0,255}),Line(points = {{-10,0},{-90,0}}, color = {0,0,255}),Line(points = {{91,50},{30,50}}, color = {0,0,255}),Line(points = {{30,50},{-10,10}}, color = {0,0,255}),Line(points = {{-10,-10},{30,-50}}, color = {0,0,255}),Line(points = {{30,-50},{91,-50}}, color = {0,0,255}),Polygon(points = {{-10,-10},{5,-17},{-3,-25},{-10,-10}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Text(extent = {{-158,119},{142,79}}, textString = "%name", lineColor = {0,0,255}),Line(visible = useHeatPort, points = {{0,-100},{0,-20}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-10,40},{-10,-40}}, color = {0,0,255}),Line(points = {{-10,0},{-99,0}}, color = {0,0,255}),Line(points = {{100,50},{30,50}}, color = {0,0,255}),Line(points = {{30,50},{-10,10}}, color = {0,0,255}),Line(points = {{-10,-10},{30,-50}}, color = {0,0,255}),Line(points = {{30,-50},{99,-50}}, color = {0,0,255}),Polygon(points = {{-10,-10},{5,-17},{-3,-25},{-10,-10}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255})}));
    end PNP;
    model HeatingDiode "Simple diode with heating port"
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      parameter Modelica.SIunits.Current Ids = 1e-006 "Saturation current";
      /* parameter Modelica.SIunits.Voltage Vt=0.04 "Voltage equivalent of temperature (kT/qn)"; */
      parameter Real Maxexp(final min = Modelica.Constants.small) = 15 "Max. exponent for linear continuation";
      parameter Modelica.SIunits.Resistance R = 100000000.0 "Parallel ohmic resistance";
      parameter Real EG = 1.11 "activation energy";
      parameter Real N = 1 "Emission coefficient";
      parameter Modelica.SIunits.Temperature TNOM = 300.15 "Parameter measurement temperature";
      parameter Real XTI = 3 "Temperature exponent of saturation current";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(useHeatPort = true);
      Modelica.SIunits.Temperature vt_t "Temperature voltage";
      Modelica.SIunits.Current id "diode current";
    protected
      Real k = 1.380662e-023 "Boltzmann's constant, J/K";
      Real q = 1.6021892e-019 "Electron charge, As";
      Modelica.SIunits.Temperature htemp "auxiliary temperature";
      Real aux;
      Real auxp;
      Real maxexp = exp(Maxexp);
    equation
      assert(T_heatPort > 0, "temperature must be positive");
      htemp = T_heatPort;
      vt_t = (k * htemp) / q;
      id = exlin(v / (N * vt_t), Maxexp) - 1;
      aux = ((htemp / TNOM - 1) * EG) / (N * vt_t);
      auxp = exp(aux);
      i = Ids * id * pow(htemp / TNOM, XTI / N) * auxp + v / R;
      LossPower = i * v;
      annotation(__Dymola_structurallyIncomplete = true, Documentation(info = "
<HTML>
<P>
The simple diode is an electrical one port, where a heat port is added, which is
defined in the Modelica.Thermal library. It consists of the diode itself and an parallel ohmic
resistance <i>R</i>. The diode formula is:
</P>
<PRE>
                v/vt_t
  i  =  ids ( e        - 1).
</PRE>
where vt_t depends on the temperature of the heat port:
<PRE>
  vt_t = k*temp/q
</PRE>
<P>
If the exponent <i>v/vt_t</i> reaches the limit <i>maxex</i>, the diode characterisic is linearly
continued to avoid overflow.<br>
The thermal power is calculated by <i>i*v</i>.
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>April 5, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{30,0},{-30,40},{-30,-40},{30,0}}, lineColor = {0,0,0}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-90,0},{40,0}}, color = {0,0,255}),Line(points = {{40,0},{90,0}}, color = {0,0,255}),Line(points = {{30,40},{30,-40}}, color = {0,0,255}),Text(extent = {{-152,114},{148,74}}, textString = "%name", lineColor = {0,0,255}),Line(visible = useHeatPort, points = {{0,-101},{0,-20}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{30,0},{-30,40},{-30,-40},{30,0}}, lineColor = {0,0,0}, fillColor = {255,0,0}, fillPattern = FillPattern.None),Line(points = {{-99,0},{39,0}}, color = {0,0,255}),Line(points = {{40,0},{96,0}}, color = {0,0,255}),Line(points = {{30,40},{30,-40}}, color = {0,0,255})}));
    end HeatingDiode;
    model HeatingNMOS "Simple MOS Transistor with heating port"
      Modelica.Electrical.Analog.Interfaces.Pin D "Drain" annotation(Placement(transformation(extent = {{90,40},{110,60}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.Pin G "Gate" annotation(Placement(transformation(extent = {{-90,-40},{-110,-60}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.Pin S "Source" annotation(Placement(transformation(extent = {{90,-40},{110,-60}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.Pin B "Bulk" annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      parameter Modelica.SIunits.Length W = 2e-005 "Width";
      parameter Modelica.SIunits.Length L = 6e-006 "Length";
      parameter Modelica.SIunits.Transconductance Beta = 4.1e-005 "Transconductance parameter";
      parameter Modelica.SIunits.Voltage Vt = 0.8 "Zero bias threshold voltage";
      parameter Real K2 = 1.144 "Bulk threshold parameter";
      parameter Real K5 = 0.7311 "Reduction of pinch-off region";
      parameter Modelica.SIunits.Length dW = -2.5e-006 "narrowing of channel";
      parameter Modelica.SIunits.Length dL = -1.5e-006 "shortening of channel";
      parameter Modelica.SIunits.Resistance RDS = 10000000.0 "Drain-Source-Resistance";
      parameter Modelica.SIunits.Temperature Tnom = 300.15 "Parameter measurement temperature";
      parameter Real kvt = -0.00696 "fitting parameter for Vt";
      parameter Real kk2 = 0.0006 "fitting parameter for K22";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(useHeatPort = true);
    protected
      Real v;
      Real uds;
      Real ubs;
      Real ugst;
      Real ud;
      Real us;
      Real id;
      Real gds;
      Real beta_t;
      Real vt_t;
      Real k2_t;
    equation
      assert(L + dL > 0, "Effective length must be positive");
      assert(W + dW > 0, "Effective width  must be positive");
      assert(T_heatPort > 0, "temperature must be positive");
      gds = if RDS < 1e-020 and RDS > -1e-020 then 1e+020 else 1 / RDS;
      v = (beta_t * (W + dW)) / (L + dL);
      ud = smooth(0, if D.v < S.v then S.v else D.v);
      us = smooth(0, if D.v < S.v then D.v else S.v);
      uds = ud - us;
      ubs = smooth(0, if B.v > us then 0 else B.v - us);
      ugst = (G.v - us - vt_t + k2_t * ubs) * K5;
      id = smooth(0, if ugst <= 0 then uds * gds else if ugst > uds then v * uds * (ugst - uds / 2) + uds * gds else (v * ugst * ugst) / 2 + uds * gds);
      beta_t = Beta * pow(T_heatPort / Tnom, -1.5);
      vt_t = Vt * (1 + (T_heatPort - Tnom) * kvt);
      k2_t = K2 * (1 + (T_heatPort - Tnom) * kk2);
      G.i = 0;
      D.i = smooth(0, if D.v < S.v then -id else id);
      S.i = smooth(0, if D.v < S.v then id else -id);
      B.i = 0;
      LossPower = D.i * (D.v - S.v);
      annotation(__Dymola_structurallyIncomplete = true, Documentation(info = "
<HTML>
<P>
The NMos model is a simple model of a n-channel metal-oxide semiconductor
FET. It differs slightly from the device used in the SPICE simulator.
For more details please care for H. Spiro.
</P>
<P>
A heating port is added for thermal electric simulation. The heating port
is defined in the Modelica.Thermal library.
</P>
<P>
The model does not consider capacitances. A high drain-source resistance RDS
is included to avoid numerical difficulties.
</P>
<P>
<PRE>
  W       L      Beta        Vt       K2      K5       DW         DL
  m       m      A/V^2       V        -       -        m          m
  12.e-6  4.e-6  .062e-3   -4.5      .24     .61     -1.2e-6     -.9e-6      depletion
  60.e-6  3.e-6  .048e-3     .1      .08     .68     -1.2e-6     -.9e-6      enhancement
  12.e-6  4.e-6  .0625e-3   -.8      .21     .78     -1.2e-6     -.9e-6      zero
  50.e-6  8.e-6  .0299e-3    .24    1.144    .7311   -5.4e-6    -4.e-6
  20.e-6  6.e-6  .041e-3     .8     1.144    .7311   -2.5e-6    -1.5e-6
  30.e-6  9.e-6  .025e-3   -4.       .861    .878    -3.4e-6    -1.74e-6
  30.e-6  5.e-6  .031e-3     .6     1.5      .72      0         -3.9e-6
  50.e-6  6.e-6  .0414e-3  -3.8      .34     .8      -1.6e-6    -2.e-6       depletion
  50.e-6  5.e-6  .03e-3      .37     .23     .86     -1.6e-6    -2.e-6       enhancement
  50.e-6  6.e-6  .038e-3    -.9      .23     .707    -1.6e-6    -2.e-6       zero
  20.e-6  4.e-6  .06776e-3   .5409   .065    .71      -.8e-6     -.2e-6
  20.e-6  4.e-6  .06505e-3   .6209   .065    .71      -.8e-6     -.2e-6
  20.e-6  4.e-6  .05365e-3   .6909   .03     .8       -.3e-6     -.2e-6
  20.e-6  4.e-6  .05365e-3   .4909   .03     .8       -.3e-6     -.2e-6
  12.e-6  4.e-6  .023e-3   -4.5      .29     .6       0          0           depletion
  60.e-6  3.e-6  .022e-3     .1      .11     .65      0          0           enhancement
  12.e-6  4.e-6  .038e-3    -.8      .33     .6       0          0           zero
  20.e-6  6.e-6  .022e-3     .8     1        .66      0          0
</PRE>
<P>
<DL>
<DT><b>References:</b>
<DD>Spiro, H.: Simulation integrierter Schaltungen. R. Oldenbourg Verlag
Muenchen Wien 1990.
</DL>
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>December 7, 2005   </i>
       by Christoph Clauss<br>
       error in RDS calculation deleted</li>
<li><i>March 31, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-90,-50},{-10,-50}}, color = {0,0,255}),Line(points = {{-10,-50},{-10,50}}, color = {0,0,255}),Line(points = {{10,70},{10,29}}, color = {0,0,255}),Line(points = {{10,20},{10,-21}}, color = {0,0,255}),Line(points = {{10,-30},{10,-71}}, color = {0,0,255}),Line(points = {{10,50},{91,50}}, color = {0,0,255}),Line(points = {{10,0},{90,0}}, color = {0,0,255}),Line(points = {{10,-50},{90,-50}}, color = {0,0,255}),Polygon(points = {{40,0},{60,5},{60,-5},{40,0}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Text(extent = {{-152,118},{148,78}}, textString = "%name", lineColor = {0,0,255}),Line(visible = useHeatPort, points = {{0,-100},{0,0}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-96,-50},{-10,-50}}, color = {0,0,255}),Line(points = {{-10,-50},{-10,50}}, color = {0,0,255}),Line(points = {{10,70},{10,29}}, color = {0,0,255}),Line(points = {{10,20},{10,-21}}, color = {0,0,255}),Line(points = {{10,-30},{10,-71}}, color = {0,0,255}),Line(points = {{10,50},{96,50}}, color = {0,0,255}),Line(points = {{10,0},{96,0}}, color = {0,0,255}),Line(points = {{10,-50},{96,-50}}, color = {0,0,255}),Polygon(points = {{40,0},{60,5},{60,-5},{40,0}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255})}));
    end HeatingNMOS;
    model HeatingPMOS "Simple PMOS Transistor with heating port"
      Modelica.Electrical.Analog.Interfaces.Pin D "Drain" annotation(Placement(transformation(extent = {{90,40},{110,60}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.Pin G "Gate" annotation(Placement(transformation(extent = {{-90,-40},{-110,-60}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.Pin S "Source" annotation(Placement(transformation(extent = {{90,-40},{110,-60}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.Pin B "Bulk" annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      parameter Modelica.SIunits.Length W = 2e-005 "Width";
      parameter Modelica.SIunits.Length L = 6e-006 "Length";
      parameter Modelica.SIunits.Transconductance Beta = 1.05e-005 "Transconductance parameter";
      parameter Modelica.SIunits.Voltage Vt = -1.0 "Zero bias threshold voltage";
      parameter Real K2 = 0.41 "Bulk threshold parameter";
      parameter Real K5 = 0.839 "Reduction of pinch-off region";
      parameter Modelica.SIunits.Length dW = -2.5e-006 "Narrowing of channel";
      parameter Modelica.SIunits.Length dL = -2.1e-006 "Shortening of channel";
      parameter Modelica.SIunits.Resistance RDS = 10000000.0 "Drain-Source-Resistance";
      parameter Modelica.SIunits.Temperature Tnom = 300.15 "Parameter measurement temperature";
      parameter Real kvt = -0.0029 "fitting parameter for Vt";
      parameter Real kk2 = 0.00062 "fitting parameter for Kk2";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(useHeatPort = true);
    protected
      Real v;
      Real uds;
      Real ubs;
      Real ugst;
      Real ud;
      Real us;
      Real id;
      Real gds;
      Real beta_t;
      Real vt_t;
      Real k2_t;
    equation
      assert(L + dL > 0, "Effective length must be positive");
      assert(W + dW > 0, "Effective width  must be positive");
      assert(T_heatPort > 0, "temperature must be positive");
      gds = if RDS < 1e-020 and RDS > -1e-020 then 1e+020 else 1 / RDS;
      v = (beta_t * (W + dW)) / (L + dL);
      ud = smooth(0, if D.v > S.v then S.v else D.v);
      us = smooth(0, if D.v > S.v then D.v else S.v);
      uds = ud - us;
      ubs = smooth(0, if B.v < us then 0 else B.v - us);
      ugst = (G.v - us - vt_t + k2_t * ubs) * K5;
      id = smooth(0, if ugst >= 0 then uds * gds else if ugst < uds then -v * uds * (ugst - uds / 2) + uds * gds else -(v * ugst * ugst) / 2 + uds * gds);
      beta_t = Beta * pow(T_heatPort / Tnom, -1.5);
      vt_t = Vt * (1 + (T_heatPort - Tnom) * kvt);
      k2_t = K2 * (1 + (T_heatPort - Tnom) * kk2);
      G.i = 0;
      D.i = smooth(0, if D.v > S.v then -id else id);
      S.i = smooth(0, if D.v > S.v then id else -id);
      B.i = 0;
      LossPower = D.i * (D.v - S.v);
      annotation(__Dymola_structurallyIncomplete = true, Documentation(info = "
<HTML>
<P>
The PMOS model is a simple model of a p-channel metal-oxide semiconductor
FET. It differs slightly from the device used in the SPICE simulator.
For more details please care for H. Spiro.
</P>
<P>
A heating port is added for thermal electric simulation. The heating port
is defined in the Modelica.Thermal library.
</P>
<P>
The model does not consider capacitances. A high drain-source resistance RDS
is included to avoid numerical difficulties.
</P>
<DL>
<DT><b>References:</b>
<DD>Spiro, H.: Simulation integrierter Schaltungen. R. Oldenbourg Verlag
  Muenchen Wien 1990.
</DL>
<P>
Some typical parameter sets are:
</P>
<PRE>
  W       L      Beta        Vt       K2       K5       DW         DL
  m       m      A/V^2       V        -        -        m          m
  50.e-6  8.e-6  .0085e-3   -.15     .41      .839    -3.8e-6    -4.0e-6
  20.e-6  6.e-6  .0105e-3  -1.0      .41      .839    -2.5e-6    -2.1e-6
  30.e-6  5.e-6  .0059e-3   -.3      .98     1.01      0         -3.9e-6
  30.e-6  5.e-6  .0152e-3   -.69     .104    1.1       -.8e-6     -.4e-6
  30.e-6  5.e-6  .0163e-3   -.69     .104    1.1       -.8e-6     -.4e-6
  30.e-6  5.e-6  .0182e-3   -.69     .086    1.06      -.1e-6     -.6e-6
  20.e-6  6.e-6  .0074e-3  -1.       .4       .59      0          0
</PRE>
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>December 7, 2005   </i>
       by Christoph Clauss<br>
       error in RDS calculation deleted</li>
<li><i>March 31, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-90,-50},{-10,-50}}, color = {0,0,255}),Line(points = {{-10,-50},{-10,50}}, color = {0,0,255}),Line(points = {{10,70},{10,29}}, color = {0,0,255}),Line(points = {{10,20},{10,-21}}, color = {0,0,255}),Line(points = {{10,-30},{10,-71}}, color = {0,0,255}),Line(points = {{10,50},{91,50}}, color = {0,0,255}),Line(points = {{10,0},{90,0}}, color = {0,0,255}),Line(points = {{10,-50},{90,-50}}, color = {0,0,255}),Polygon(points = {{60,0},{40,5},{40,-5},{60,0}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Text(extent = {{-155,120},{145,80}}, textString = "%name", lineColor = {0,0,255}),Line(visible = useHeatPort, points = {{0,-100},{0,0}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-100,-50},{-10,-50}}, color = {0,0,255}),Line(points = {{-10,-50},{-10,50}}, color = {0,0,255}),Line(points = {{10,70},{10,29}}, color = {0,0,255}),Line(points = {{10,20},{10,-21}}, color = {0,0,255}),Line(points = {{10,-30},{10,-71}}, color = {0,0,255}),Line(points = {{10,50},{96,50}}, color = {0,0,255}),Line(points = {{10,0},{101,0}}, color = {0,0,255}),Line(points = {{10,-50},{100,-50}}, color = {0,0,255}),Polygon(points = {{60,0},{40,5},{40,-5},{60,0}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255})}));
    end HeatingPMOS;
    model HeatingNPN "Simple NPN BJT according to Ebers-Moll with heating port"
      parameter Real Bf = 50 "Forward beta";
      parameter Real Br = 0.1 "Reverse beta";
      parameter Modelica.SIunits.Current Is = 1e-016 "Transport saturation current";
      parameter Modelica.SIunits.InversePotential Vak = 0.02 "Early voltage (inverse), 1/Volt";
      parameter Modelica.SIunits.Time Tauf = 1.2e-010 "Ideal forward transit time";
      parameter Modelica.SIunits.Time Taur = 5e-009 "Ideal reverse transit time";
      parameter Modelica.SIunits.Capacitance Ccs = 1e-012 "Collector-substrat(ground) cap.";
      parameter Modelica.SIunits.Capacitance Cje = 4e-013 "Base-emitter zero bias depletion cap.";
      parameter Modelica.SIunits.Capacitance Cjc = 5e-013 "Base-coll. zero bias depletion cap.";
      parameter Modelica.SIunits.Voltage Phie = 0.8 "Base-emitter diffusion voltage";
      parameter Real Me = 0.4 "Base-emitter gradation exponent";
      parameter Modelica.SIunits.Voltage Phic = 0.8 "Base-collector diffusion voltage";
      parameter Real Mc = 0.333 "Base-collector gradation exponent";
      parameter Modelica.SIunits.Conductance Gbc = 1e-015 "Base-collector conductance";
      parameter Modelica.SIunits.Conductance Gbe = 1e-015 "Base-emitter conductance";
      parameter Real EMin = -100 "if x < EMin, the exp(x) function is linearized";
      parameter Real EMax = 40 "if x > EMax, the exp(x) function is linearized";
      parameter Modelica.SIunits.Temperature Tnom = 300.15 "Parameter measurement temperature";
      parameter Real XTI = 3 "Temperature exponent for effect on Is";
      parameter Real XTB = 0 "Forward and reverse beta temperature exponent";
      parameter Real EG = 1.11 "Energy gap for temperature effect on Is";
      parameter Real NF = 1.0 "Forward current emission coefficient";
      parameter Real NR = 1.0 "Reverse current emission coefficient";
      parameter Real K = 1.3806226e-023 "Boltzmann's constant";
      parameter Real q = 1.6021918e-019 "Elementary electronic charge";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(useHeatPort = true);
      /*protected*/
      Real vbc;
      Real vbe;
      Real qbk;
      Real ibc;
      Real ibe;
      Real cbc;
      Real cbe;
      Real ExMin;
      Real ExMax;
      Real Capcje;
      Real Capcjc;
      Real is_t;
      Real br_t;
      Real bf_t;
      Real vt_t;
      Real hexp;
      Real htempexp;
    public
      Modelica.Electrical.Analog.Interfaces.Pin C "Collector" annotation(Placement(transformation(extent = {{90,40},{110,60}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.Pin B "Base" annotation(Placement(transformation(extent = {{-90,-10},{-110,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.Pin E "Emitter" annotation(Placement(transformation(extent = {{90,-40},{110,-60}}, rotation = 0)));
    equation
      assert(T_heatPort > 0, "temperature must be positive");
      ExMin = exp(EMin);
      ExMax = exp(EMax);
      vbc = B.v - C.v;
      vbe = B.v - E.v;
      qbk = 1 - vbc * Vak;
      hexp = ((T_heatPort / Tnom - 1) * EG) / vt_t;
      htempexp = smooth(1, if hexp < EMin then ExMin * (hexp - EMin + 1) else if hexp > EMax then ExMax * (hexp - EMax + 1) else exp(hexp));
      is_t = Is * pow(T_heatPort / Tnom, XTI) * htempexp;
      br_t = Br * pow(T_heatPort / Tnom, XTB);
      bf_t = Bf * pow(T_heatPort / Tnom, XTB);
      vt_t = K / q * T_heatPort;
      ibc = smooth(1, if vbc / (NR * vt_t) < EMin then is_t * (ExMin * (vbc / (NR * vt_t) - EMin + 1) - 1) + vbc * Gbc else if vbc / (NR * vt_t) > EMax then is_t * (ExMax * (vbc / (NR * vt_t) - EMax + 1) - 1) + vbc * Gbc else is_t * (exp(vbc / (NR * vt_t)) - 1) + vbc * Gbc);
      ibe = smooth(1, if vbe / (NF * vt_t) < EMin then is_t * (ExMin * (vbe / (NF * vt_t) - EMin + 1) - 1) + vbe * Gbe else if vbe / (NF * vt_t) > EMax then is_t * (ExMax * (vbe / (NF * vt_t) - EMax + 1) - 1) + vbe * Gbe else is_t * (exp(vbe / (NF * vt_t)) - 1) + vbe * Gbe);
      Capcjc = smooth(1, if vbc / Phic > 0 then Cjc * (1 + (Mc * vbc) / Phic) else Cjc * pow(1 - vbc / Phic, -Mc));
      Capcje = smooth(1, if vbe / Phie > 0 then Cje * (1 + (Me * vbe) / Phie) else Cje * pow(1 - vbe / Phie, -Me));
      cbc = smooth(1, if vbc / (NR * vt_t) < EMin then (Taur * is_t) / (NR * vt_t) * ExMin * (vbc / (NR * vt_t) - EMin + 1) + Capcjc else if vbc / (NR * vt_t) > EMax then (Taur * is_t) / (NR * vt_t) * ExMax * (vbc / (NR * vt_t) - EMax + 1) + Capcjc else (Taur * is_t) / (NR * vt_t) * exp(vbc / (NR * vt_t)) + Capcjc);
      cbe = smooth(1, if vbe / (NF * vt_t) < EMin then (Tauf * is_t) / (NF * vt_t) * ExMin * (vbe / (NF * vt_t) - EMin + 1) + Capcje else if vbe / (NF * vt_t) > EMax then (Tauf * is_t) / (NF * vt_t) * ExMax * (vbe / (NF * vt_t) - EMax + 1) + Capcje else (Tauf * is_t) / (NF * vt_t) * exp(vbe / (NF * vt_t)) + Capcje);
      C.i = (ibe - ibc) * qbk - ibc / br_t - cbc * der(vbc) + Ccs * der(C.v);
      B.i = ibe / bf_t + ibc / br_t + cbc * der(vbc) + cbe * der(vbe);
      E.i = -B.i - C.i + Ccs * der(C.v);
      LossPower = (vbc * ibc) / br_t + (vbe * ibe) / bf_t + (ibe - ibc) * qbk * (C.v - E.v);
      annotation(__Dymola_structurallyIncomplete = true, Documentation(info = "
<HTML>
<P>
This model is a simple model of a bipolar npn junction transistor according
to Ebers-Moll.
</P>
<P>
A heating port is added for thermal electric simulation. The heating port
is defined in the Modelica.Thermal library.
</P>
<P>
A typical parameter set is (the parameter Vt is no longer used):
</P>
<PRE>
  Bf  Br  Is     Vak  Tauf    Taur  Ccs   Cje     Cjc     Phie  Me   PHic   Mc     Gbc    Gbe
  -   -   A      V    s       s     F     F       F       V     -    V      -      mS     mS
  50  0.1 1e-16  0.02 0.12e-9 5e-9  1e-12 0.4e-12 0.5e-12 0.8   0.4  0.8    0.333  1e-15  1e-15
</PRE>
<P>
<DL>
<DT><b>References:</b>
<DD>Vlach, J.; Singal, K.: Computer methods for circuit analysis and design.
Van Nostrand Reinhold, New York 1983
on page 317 ff.
</DL>
</P>
</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>March 20, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Line(points = {{-10,40},{-10,-40}}, color = {0,0,255}),Line(points = {{-10,0},{-90,0}}, color = {0,0,255}),Line(points = {{91,50},{30,50}}, color = {0,0,255}),Line(points = {{30,50},{-10,10}}, color = {0,0,255}),Line(points = {{-10,-10},{30,-50}}, color = {0,0,255}),Line(points = {{30,-50},{91,-50}}, color = {0,0,255}),Polygon(points = {{30,-50},{24,-36},{16,-44},{30,-50}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Text(extent = {{-162,125},{138,85}}, textString = "%name", lineColor = {0,0,255}),Line(visible = useHeatPort, points = {{0,-100},{0,-20}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Line(points = {{-10,40},{-10,-40}}, color = {0,0,255}),Line(points = {{-10,0},{-100,0}}, color = {0,0,255}),Line(points = {{30,50},{-10,10}}, color = {0,0,255}),Line(points = {{-10,-10},{30,-50}}, color = {0,0,255}),Line(points = {{30,-50},{100,-50}}, color = {0,0,255}),Line(points = {{100,50},{30,50}}, color = {0,0,255}),Polygon(points = {{30,-50},{24,-36},{16,-44},{30,-50}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255})}));
    end HeatingNPN;
    model HeatingPNP "Simple PNP BJT according to Ebers-Moll with heating port"
      parameter Real Bf = 50 "Forward beta";
      parameter Real Br = 0.1 "Reverse beta";
      parameter Modelica.SIunits.Current Is = 1e-016 "Transport saturation current";
      parameter Modelica.SIunits.InversePotential Vak = 0.02 "Early voltage (inverse), 1/Volt";
      parameter Modelica.SIunits.Time Tauf = 1.2e-010 "Ideal forward transit time";
      parameter Modelica.SIunits.Time Taur = 5e-009 "Ideal reverse transit time";
      parameter Modelica.SIunits.Capacitance Ccs = 1e-012 "Collector-substrat(ground) cap.";
      parameter Modelica.SIunits.Capacitance Cje = 4e-013 "Base-emitter zero bias depletion cap.";
      parameter Modelica.SIunits.Capacitance Cjc = 5e-013 "Base-coll. zero bias depletion cap.";
      parameter Modelica.SIunits.Voltage Phie = 0.8 "Base-emitter diffusion voltage";
      parameter Real Me = 0.4 "Base-emitter gradation exponent";
      parameter Modelica.SIunits.Voltage Phic = 0.8 "Base-collector diffusion voltage";
      parameter Real Mc = 0.333 "Base-collector gradation exponent";
      parameter Modelica.SIunits.Conductance Gbc = 1e-015 "Base-collector conductance";
      parameter Modelica.SIunits.Conductance Gbe = 1e-015 "Base-emitter conductance";
      parameter Real EMin = -100 "if x < EMin, the exp(x) function is linearized";
      parameter Real EMax = 40 "if x > EMax, the exp(x) function is linearized";
      parameter Modelica.SIunits.Temperature Tnom = 300.15 "Parameter measurement temperature";
      parameter Real XTI = 3 "Temperature exponent for effect on Is";
      parameter Real XTB = 0 "Forward and reverse beta temperature exponent";
      parameter Real EG = 1.11 "Energy gap for temperature effect on Is";
      parameter Real NF = 1.0 "Forward current emission coefficient";
      parameter Real NR = 1.0 "Reverse current emission coefficient";
      parameter Real K = 1.3806226e-023 "Boltzmann's constant";
      parameter Real q = 1.6021918e-019 "Elementary electronic charge";
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(useHeatPort = true);
    protected
      Real vcb;
      Real veb;
      Real qbk;
      Real icb;
      Real ieb;
      Real ccb;
      Real ceb;
      Real ExMin;
      Real ExMax;
      Real Capcje;
      Real Capcjc;
      Real is_t;
      Real br_t;
      Real bf_t;
      Real vt_t;
      Real hexp;
      Real htempexp;
    public
      Modelica.Electrical.Analog.Interfaces.Pin C "Collector" annotation(Placement(transformation(extent = {{90,40},{110,60}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.Pin B "Base" annotation(Placement(transformation(extent = {{-90,-10},{-110,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.Pin E "Emitter" annotation(Placement(transformation(extent = {{90,-40},{110,-60}}, rotation = 0)));
    equation
      assert(T_heatPort > 0, "temperature must be positive");
      ExMin = exp(EMin);
      ExMax = exp(EMax);
      vcb = C.v - B.v;
      veb = E.v - B.v;
      qbk = 1 - vcb * Vak;
      hexp = ((T_heatPort / Tnom - 1) * EG) / vt_t;
      htempexp = smooth(1, if hexp < EMin then ExMin * (hexp - EMin + 1) else if hexp > EMax then ExMax * (hexp - EMax + 1) else exp(hexp));
      is_t = Is * pow(T_heatPort / Tnom, XTI) * htempexp;
      br_t = Br * pow(T_heatPort / Tnom, XTB);
      bf_t = Bf * pow(T_heatPort / Tnom, XTB);
      vt_t = K / q * T_heatPort;
      icb = smooth(1, if vcb / (NR * vt_t) < EMin then is_t * (ExMin * (vcb / (NR * vt_t) - EMin + 1) - 1) + vcb * Gbc else if vcb / (NR * vt_t) > EMax then is_t * (ExMax * (vcb / (NR * vt_t) - EMax + 1) - 1) + vcb * Gbc else is_t * (exp(vcb / (NR * vt_t)) - 1) + vcb * Gbc);
      ieb = smooth(1, if veb / (NF * vt_t) < EMin then is_t * (ExMin * (veb / (NF * vt_t) - EMin + 1) - 1) + veb * Gbe else if veb / (NF * vt_t) > EMax then is_t * (ExMax * (veb / (NF * vt_t) - EMax + 1) - 1) + veb * Gbe else is_t * (exp(veb / (NF * vt_t)) - 1) + veb * Gbe);
      Capcjc = smooth(1, if vcb / Phic > 0 then Cjc * (1 + (Mc * vcb) / Phic) else Cjc * pow(1 - vcb / Phic, -Mc));
      Capcje = smooth(1, if veb / Phie > 0 then Cje * (1 + (Me * veb) / Phie) else Cje * pow(1 - veb / Phie, -Me));
      ccb = smooth(1, if vcb / (NR * vt_t) < EMin then (Taur * is_t) / (NR * vt_t) * ExMin * (vcb / (NR * vt_t) - EMin + 1) + Capcjc else if vcb / (NR * vt_t) > EMax then (Taur * is_t) / (NR * vt_t) * ExMax * (vcb / (NR * vt_t) - EMax + 1) + Capcjc else (Taur * is_t) / (NR * vt_t) * exp(vcb / (NR * vt_t)) + Capcjc);
      ceb = smooth(1, if veb / (NF * vt_t) < EMin then (Tauf * is_t) / (NF * vt_t) * ExMin * (veb / (NF * vt_t) - EMin + 1) + Capcje else if veb / (NF * vt_t) > EMax then (Tauf * is_t) / (NF * vt_t) * ExMax * (veb / (NF * vt_t) - EMax + 1) + Capcje else (Tauf * is_t) / (NF * vt_t) * exp(veb / (NF * vt_t)) + Capcje);
      C.i = icb / br_t + ccb * der(vcb) + Ccs * der(C.v) + (icb - ieb) * qbk;
      B.i = -ieb / bf_t - icb / br_t - ceb * der(veb) - ccb * der(vcb);
      E.i = -B.i - C.i + Ccs * der(C.v);
      LossPower = (vcb * icb) / br_t + (veb * ieb) / bf_t + (icb - ieb) * qbk * (C.v - E.v);
      annotation(__Dymola_structurallyIncomplete = true, Documentation(info = "
<HTML>
<P>
This model is a simple model of a bipolar pnp junction transistor according
to Ebers-Moll.
<P>
A heating port is added for thermal electric simulation. The heating port
is defined in the Modelica.Thermal library.
</P>
<P>
A typical parameter set is  (the parameter Vt is no longer used):
</P>
<PRE>
  Bf  Br  Is     Vak  Tauf    Taur  Ccs   Cje     Cjc     Phie  Me   PHic   Mc     Gbc    Gbe
  -   -   A      V    s       s     F     F       F       V     -    V      -      mS     mS
  50  0.1 1e-16  0.02 0.12e-9 5e-9  1e-12 0.4e-12 0.5e-12 0.8   0.4  0.8    0.333  1e-15  1e-15
</PRE>
<P>
<DL>
<DT><b>References:</b>
<DD>Vlach, J.; Singal, K.: Computer methods for circuit analysis and design.
Van Nostrand Reinhold, New York 1983
on page 317 ff.
</DL>
</HTML>
", revisions = "<html>
<ul>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i>March 20, 2004   </i>
       by Christoph Clauss<br> implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-10,40},{-10,-40}}, color = {0,0,255}),Line(points = {{-10,0},{-90,0}}, color = {0,0,255}),Line(points = {{91,50},{30,50}}, color = {0,0,255}),Line(points = {{30,50},{-10,10}}, color = {0,0,255}),Line(points = {{-10,-10},{30,-50}}, color = {0,0,255}),Line(points = {{30,-50},{91,-50}}, color = {0,0,255}),Polygon(points = {{-10,-10},{5,-17},{-3,-25},{-10,-10}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255}),Text(extent = {{-155,117},{145,77}}, textString = "%name", lineColor = {0,0,255}),Line(visible = useHeatPort, points = {{0,-100},{0,-20}}, color = {127,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-10,40},{-10,-40}}, color = {0,0,255}),Line(points = {{-10,0},{-99,0}}, color = {0,0,255}),Line(points = {{96,50},{30,50}}, color = {0,0,255}),Line(points = {{30,50},{-10,10}}, color = {0,0,255}),Line(points = {{-10,-10},{30,-50}}, color = {0,0,255}),Line(points = {{30,-50},{96,-50}}, color = {0,0,255}),Polygon(points = {{-10,-10},{5,-17},{-3,-25},{-10,-10}}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid, lineColor = {0,0,255})}));
    end HeatingPNP;
  protected
    function pow "Just a helper function for x^y in order that a symbolic engine can apply some transformations more easily"
      input Real x;
      input Real y;
      output Real z;
    algorithm
      z:=x ^ y;
    end pow;
    function exlin "Exponential function linearly continued for x > Maxexp"
      input Real x;
      input Real Maxexp;
      output Real z;
    algorithm
      z:=if x > Maxexp then exp(Maxexp) * (1 + x - Maxexp) else exp(x);
    end exlin;
  public
    model Thyristor "Simple Thyristor Model"
      parameter Modelica.SIunits.Voltage VDRM(final min = 0) = 100 "Forward breakthrough voltage";
      parameter Modelica.SIunits.Voltage VRRM(final min = 0) = 100 "Reverse breakthrough voltage";
      parameter Modelica.SIunits.Current IDRM = 0.1 "Saturation current";
      parameter Modelica.SIunits.Voltage VTM = 1.7 "Conducting voltage";
      parameter Modelica.SIunits.Current IH = 0.006 "Holding current";
      parameter Modelica.SIunits.Current ITM = 25 "Conducting current";
      parameter Modelica.SIunits.Voltage VGT = 0.7 "Gate trigger voltage";
      parameter Modelica.SIunits.Current IGT = 0.005 "Gate trigger current";
      parameter Modelica.SIunits.Time TON = 1e-006 "Switch on time";
      parameter Modelica.SIunits.Time TOFF = 1.5e-005 "Switch off time";
      parameter Modelica.SIunits.Voltage Vt = 0.04 "Voltage equivalent of temperature (kT/qn)";
      parameter Real Nbv = 0.74 "Reverse Breakthrough emission coefficient";
      Real iGK "gate current";
      Real vGK "voltage between gate and cathode";
      Real vAK "voltage between anode and cathode";
      Real vControl(start = 0);
      Real vContot;
      Real vConmain;
    public
      Modelica.Electrical.Analog.Interfaces.PositivePin Anode annotation(Placement(transformation(extent = {{-95,-12},{-75,8}}), iconTransformation(extent = {{-100,-10},{-80,10}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin Cathode annotation(Placement(transformation(extent = {{80,-10},{100,10}}), iconTransformation(extent = {{80,-10},{100,10}})));
      Modelica.Electrical.Analog.Interfaces.PositivePin Gate annotation(Placement(transformation(extent = {{60,80},{80,100}}), iconTransformation(extent = {{60,80},{80,100}})));
    protected
      parameter Modelica.SIunits.Voltage Von = 5;
      parameter Modelica.SIunits.Voltage Voff = 1.5;
      parameter Modelica.SIunits.Resistance Ron = (VTM - 0.7) / ITM "Forward conducting mode resistance";
      parameter Modelica.SIunits.Resistance Roff = VDRM ^ 2 / VTM / IH "Blocking mode resistance";
    equation
      Anode.i + Gate.i + Cathode.i = 0;
      vGK = Gate.v - Cathode.v;
      vAK = Anode.v - Cathode.v;
      iGK = Gate.i;
      vGK = smooth(0, if vGK < 0.65 then VGT / IGT * iGK else 0.65 ^ 2 / VGT + (iGK * (VGT - 0.65)) / IGT);
      vContot = vConmain + smooth(0, if iGK < 0.95 * IGT then 0 else if iGK < 0.95 * IGT + 0.001 then 10000 * (iGK - 0.95 * IGT) * vAK else 10 * vAK);
      der(vControl) = (vContot - vControl) / (if vContot - vControl > 0 then 1.87 * TON else 0.638 * TOFF);
      Anode.i = smooth(1, if vAK < -VRRM then -VRRM / Roff * exp(-(vAK + VRRM) / (Nbv * Vt)) else if vControl < Voff then vAK / Roff else if vControl < Von then vAK / (sqrt(Ron * Roff) * (Ron / Roff) ^ ((3 * (2 * vControl - Von - Voff) / (2 * (Von - Voff)) - 4 * ((2 * vControl - Von - Voff) / (2 * (Von - Voff))) ^ 3) / 2)) else vAK / Ron);
      vConmain = if Anode.i > IH or vAK > VDRM then Von else 0;
      annotation(Documentation(info = "<html>
This is a simple thyristor model with three pins: Anode, Cathode and Gate.
There are three operating modes: <br>
conducting, blocking and reverse breakthrough. <br>
</P>
<p>
As long as the thyristor is in blocking mode it behaves like a linear resistance Roff=VDRM^2/(VTM*IH). <br>
But if the voltage between anode and cathode exceeds VDRM or a positive gate current flows for a sufficient time the mode changes to conducting mode. <br>
The model stays in conducting mode until the anode current falls below the holding current IH. There is no way to switch off the thyristor via the gate. <br>
If the voltage between anode and cathode is negative, the model represents a diode (parameters Vt, Nbv) with reverse breakthrough voltage VRRM. <br>
</P>
<P>
The dV/dt switch on is not taken into account in this model. The gate circuit is not influenced by the main circuit.
</p>
</HTML>
", revisions = "<html>
<ul>
<li><i>May 12, 2009   </i>
       by Matthias Franke
       </li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{30,0},{-30,40},{-30,-40},{30,0}}, lineColor = {0,0,0}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-90,0},{40,0}}, color = {0,0,255}),Line(points = {{40,0},{90,0}}, color = {0,0,255}),Line(points = {{30,40},{30,-40}}, color = {0,0,255}),Line(points = {{30,20},{70,60},{70,90}}, color = {0,0,255}),Line(points = {{40,50},{60,30}}, color = {0,0,255}),Text(extent = {{-142,-59},{158,-99}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-80,0},{80,0}}, color = {128,128,128}),Polygon(points = {{70,4},{80,0},{70,-4},{70,4}}, lineColor = {128,128,128}, fillColor = {128,128,128}, fillPattern = FillPattern.Solid),Line(points = {{0,80},{0,-80}}, color = {128,128,128}),Polygon(points = {{-4,70},{0,80},{4,70},{-4,70}}, lineColor = {128,128,128}, fillColor = {128,128,128}, fillPattern = FillPattern.Solid),Text(extent = {{5,81},{15,71}}, lineColor = {128,128,128}, textString = "i"),Text(extent = {{70,-10},{80,-20}}, lineColor = {128,128,128}, textString = "v"),Line(points = {{20,9},{20,0}}, color = {128,128,128}, pattern = LinePattern.Dot),Text(extent = {{25,64},{45,54}}, lineColor = {128,128,128}, pattern = LinePattern.Dot, textString = "Ron"),Line(points = {{14,20},{25,73}}, color = {0,0,0}, thickness = 0.5),Line(points = {{-57,-11},{55,9}}, color = {0,0,0}, smooth = Smooth.None, thickness = 0.5),Line(points = {{-57,-11},{-59,-13},{-60,-18},{-63,-65}}, color = {0,0,0}, thickness = 0.5, smooth = Smooth.None),Text(extent = {{-67,11},{-47,1}}, lineColor = {128,128,128}, pattern = LinePattern.Dot, textString = "VRRM"),Text(extent = {{44,-2},{64,-12}}, lineColor = {128,128,128}, pattern = LinePattern.Dot, textString = "VDRM"),Line(points = {{-57,1},{-57,-1}}, color = {0,0,0}, smooth = Smooth.None),Line(points = {{54,1},{54,-1}}, color = {0,0,0}, smooth = Smooth.None),Line(points = {{55,9},{54,11},{50,13},{17,17},{15,18},{14,20}}, color = {0,0,0}, smooth = Smooth.None, pattern = LinePattern.Dot),Text(extent = {{-28,-9},{-8,-19}}, lineColor = {128,128,128}, pattern = LinePattern.Dot, textString = "Roff"),Line(points = {{2,20},{-2,20}}, color = {0,0,0}, smooth = Smooth.None),Text(extent = {{-14,23},{-2,16}}, lineColor = {128,128,128}, pattern = LinePattern.Dot, textString = "IH")}));
    end Thyristor;
    //Kirchhoff's equations
    // Gate and Control voltage
    // Anode-Cathode characteristics
    // holding effect and forward breakthrough
    annotation(Documentation(info = "
<HTML>
<p>
This package contains semiconductor devices:
<ul>
<li>diode</li>
<li>MOS transistors</li>
<li>bipolar transistors</li>
</ul>

All semiconductor devices contain a conditional heat port, which is
not active by default. If it is active the loss power is calculated
to be used in a thermal net.

The heating variants of the semiconductor devices are provided to
use the thermal pot temperature in the electric calculation. That means that for a true thermal electric
interaction the heating device models have to be used.

</p>
</HTML>
", revisions = "<html>
<dl>
<dt>
<b>Main Authors:</b>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden<br>
<p>
<dt>
</dl>
</html>"));
  end Semiconductors;
  package Sensors "Potential, voltage, current, and power sensors"
    extends Modelica.Icons.Library;
    model PotentialSensor "Sensor to measure the potential"
      extends Modelica.Icons.RotationalSensor;
      Interfaces.PositivePin p "pin to be measured" annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput phi "Absolute voltage potential as output signal" annotation(Placement(transformation(extent = {{100,-10},{120,10}}, rotation = 0)));
    equation
      p.i = 0;
      phi = p.v;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Text(extent = {{-29,-11},{30,-70}}, lineColor = {0,0,0}, textString = "V"),Line(points = {{-70,0},{-90,0}}, color = {0,0,0}),Line(points = {{100,0},{70,0}}, color = {0,0,255}),Text(extent = {{-150,80},{150,120}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-70,0},{-96,0}}, color = {0,0,0}),Line(points = {{100,0},{70,0}}, color = {0,0,255})}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end PotentialSensor;
    model VoltageSensor "Sensor to measure the voltage between two pins"
      extends Modelica.Icons.RotationalSensor;
      Interfaces.PositivePin p "positive pin" annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      Interfaces.NegativePin n "negative pin" annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput v "Voltage between pin p and n (= p.v - n.v) as output signal" annotation(Placement(transformation(origin = {0,-100}, extent = {{10,-10},{-10,10}}, rotation = 90)));
    equation
      p.i = 0;
      n.i = 0;
      v = p.v - n.v;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Text(extent = {{-29,-11},{30,-70}}, lineColor = {0,0,0}, textString = "V"),Line(points = {{-70,0},{-90,0}}, color = {0,0,0}),Line(points = {{70,0},{90,0}}, color = {0,0,0}),Line(points = {{0,-90},{0,-70}}, color = {0,0,255}),Text(extent = {{-150,80},{150,120}}, textString = "%name", lineColor = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-70,0},{-96,0}}, color = {0,0,0}),Line(points = {{70,0},{96,0}}, color = {0,0,0}),Line(points = {{0,-90},{0,-70}}, color = {0,0,255})}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end VoltageSensor;
    model CurrentSensor "Sensor to measure the current in a branch"
      extends Modelica.Icons.RotationalSensor;
      Interfaces.PositivePin p "positive pin" annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      Interfaces.NegativePin n "negative pin" annotation(Placement(transformation(extent = {{90,-10},{110,10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput i "current in the branch from p to n as output signal" annotation(Placement(transformation(origin = {0,-100}, extent = {{10,-10},{-10,10}}, rotation = 90)));
    equation
      p.v = n.v;
      p.i = i;
      n.i = -i;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Text(extent = {{-29,-11},{30,-70}}, lineColor = {0,0,0}, textString = "A"),Line(points = {{-70,0},{-90,0}}, color = {0,0,0}),Text(extent = {{-150,80},{150,120}}, textString = "%name", lineColor = {0,0,255}),Line(points = {{70,0},{90,0}}, color = {0,0,0}),Line(points = {{0,-90},{0,-70}}, color = {0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Text(extent = {{-153,79},{147,119}}, textString = "%name", lineColor = {0,0,255}),Line(points = {{-70,0},{-96,0}}, color = {0,0,0}),Line(points = {{70,0},{96,0}}, color = {0,0,0}),Line(points = {{0,-90},{0,-70}}, color = {0,0,255})}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end CurrentSensor;
    model PowerSensor "Sensor to measure the power"
      Modelica.Electrical.Analog.Interfaces.PositivePin pc "Positive pin, current path" annotation(Placement(transformation(extent = {{-90,-10},{-110,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin nc "Negative pin, current path" annotation(Placement(transformation(extent = {{110,-10},{90,10}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.PositivePin pv "Positive pin, voltage path" annotation(Placement(transformation(extent = {{-10,110},{10,90}}, rotation = 0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin nv "Negative pin, voltage path" annotation(Placement(transformation(extent = {{10,-110},{-10,-90}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput power annotation(Placement(transformation(origin = {-80,-110}, extent = {{-10,10},{10,-10}}, rotation = 270)));
      Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation(Placement(transformation(origin = {0,-30}, extent = {{10,-10},{-10,10}}, rotation = 90)));
      Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation(Placement(transformation(extent = {{-50,-10},{-30,10}}, rotation = 0)));
      Modelica.Blocks.Math.Product product annotation(Placement(transformation(origin = {-30,-50}, extent = {{-10,-10},{10,10}}, rotation = 270)));
    equation
      connect(pv,voltageSensor.p) annotation(Line(points = {{0,100},{0,-20},{6.12323e-016,-20}}, color = {0,0,255}));
      connect(voltageSensor.n,nv) annotation(Line(points = {{-6.12323e-016,-40},{-6.12323e-016,-63},{0,-63},{0,-100}}, color = {0,0,255}));
      connect(pc,currentSensor.p) annotation(Line(points = {{-100,0},{-50,0}}, color = {0,0,255}));
      connect(currentSensor.n,nc) annotation(Line(points = {{-30,0},{100,0}}, color = {0,0,255}));
      connect(currentSensor.i,product.u2) annotation(Line(points = {{-40,-10},{-40,-30},{-36,-30},{-36,-38}}, color = {0,0,127}));
      connect(voltageSensor.v,product.u1) annotation(Line(points = {{10,-30},{-24,-30},{-24,-38}}, color = {0,0,127}));
      connect(product.y,power) annotation(Line(points = {{-30,-61},{-30,-80},{-80,-80},{-80,-110}}, color = {0,0,127}));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics = {Ellipse(extent = {{-70,70},{70,-70}}, lineColor = {0,0,0}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{0,100},{0,70}}, color = {0,0,255}),Line(points = {{0,-70},{0,-100}}, color = {0,0,255}),Line(points = {{-80,-100},{-80,0}}, color = {0,0,255}),Line(points = {{-100,0},{100,0}}, color = {0,0,255}),Text(extent = {{150,120},{-150,160}}, textString = "%name", lineColor = {0,0,255}),Line(points = {{0,70},{0,40}}, color = {0,0,0}),Line(points = {{22.9,32.8},{40.2,57.3}}, color = {0,0,0}),Line(points = {{-22.9,32.8},{-40.2,57.3}}, color = {0,0,0}),Line(points = {{37.6,13.7},{65.8,23.9}}, color = {0,0,0}),Line(points = {{-37.6,13.7},{-65.8,23.9}}, color = {0,0,0}),Line(points = {{0,0},{9.02,28.6}}, color = {0,0,0}),Polygon(points = {{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}}, lineColor = {0,0,0}, fillColor = {0,0,0}, fillPattern = FillPattern.Solid),Ellipse(extent = {{-5,5},{5,-5}}, lineColor = {0,0,0}, fillColor = {0,0,0}, fillPattern = FillPattern.Solid),Text(extent = {{-29,-11},{30,-70}}, lineColor = {0,0,0}, textString = "P")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {2,2}), graphics), Documentation(info = "<html><p>
This power sensor measures instantaneous electrical power of a singlephase system and has a separated voltage and current path. The pins of the voltage path are <code>pv</code> and <code>nv</code>, the pins of the current path are <code>pc</code> and <code>nc</code>. The internal resistance of the current path is zero, the internal resistance of the voltage path is infinite.
</p>
</html>", revisions = "<html>
<ul>
<li><i> January 12, 2006   </i>
       by Anton Haumer<br> implemented<br>
       </li>
</ul>
</html>"));
    end PowerSensor;
    annotation(Documentation(info = "<html>
<p>
This package contains potential, voltage, and current sensors.
</p>

</HTML>
", revisions = "<html>
<dl>
<dt>
<b>Main Authors:</b>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
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
</html>"));
  end Sensors;
  package Sources "Time-dependend and controlled voltage and current sources"
    extends Modelica.Icons.Library;
    model SignalVoltage "Generic voltage source using the input signal as source voltage"
      Interfaces.PositivePin p annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      Interfaces.NegativePin n annotation(Placement(transformation(extent = {{110,-10},{90,10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput v "Voltage between pin p and n (= p.v - n.v) as input signal" annotation(Placement(transformation(origin = {0,70}, extent = {{-20,-20},{20,20}}, rotation = 270)));
      SI.Current i "Current flowing from pin p to pin n";
    equation
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-50,50},{50,-50}}, lineColor = {0,0,0}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-90,0},{-50,0}}, color = {0,0,0}),Line(points = {{50,0},{90,0}}, color = {0,0,0}),Line(points = {{-50,0},{50,0}}, color = {0,0,0}),Text(extent = {{-150,-104},{150,-64}}, textString = "%name", lineColor = {0,0,255}),Text(extent = {{-120,50},{-20,0}}, lineColor = {0,0,255}, textString = "+"),Text(extent = {{20,50},{120,0}}, lineColor = {0,0,255}, textString = "-")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-50,50},{50,-50}}, lineColor = {0,0,0}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-96,0},{-50,0}}, color = {0,0,0}),Line(points = {{50,0},{96,0}}, color = {0,0,0}),Line(points = {{-50,0},{50,0}}, color = {0,0,0}),Line(points = {{-109,20},{-84,20}}, color = {160,160,164}),Polygon(points = {{-94,23},{-84,20},{-94,17},{-94,23}}, lineColor = {160,160,164}, fillColor = {160,160,164}, fillPattern = FillPattern.Solid),Line(points = {{91,20},{116,20}}, color = {160,160,164}),Text(extent = {{-109,25},{-89,45}}, lineColor = {160,160,164}, textString = "i"),Polygon(points = {{106,23},{116,20},{106,17},{106,23}}, lineColor = {160,160,164}, fillColor = {160,160,164}, fillPattern = FillPattern.Solid),Text(extent = {{91,45},{111,25}}, lineColor = {160,160,164}, textString = "i"),Line(points = {{-119,-5},{-119,5}}, color = {160,160,164}),Line(points = {{-124,0},{-114,0}}, color = {160,160,164}),Line(points = {{116,0},{126,0}}, color = {160,160,164})}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end SignalVoltage;
    model ConstantVoltage "Source for constant voltage"
      parameter SI.Voltage V(start = 1) "Value of constant voltage";
      extends Interfaces.OnePort;
    equation
      v = V;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-90,0},{-10,0}}, color = {0,0,0}),Line(points = {{-10,60},{-10,-60}}, color = {0,0,0}),Line(points = {{0,30},{0,-30}}, color = {0,0,0}),Line(points = {{0,0},{90,0}}, color = {0,0,0}),Text(extent = {{-150,-112},{150,-72}}, textString = "%name=%V", lineColor = {0,0,255}),Text(extent = {{-120,50},{-20,0}}, lineColor = {0,0,255}, textString = "+"),Text(extent = {{20,50},{120,0}}, lineColor = {0,0,255}, textString = "-")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-90,0},{-10,0}}, color = {0,0,0}),Line(points = {{-10,60},{-10,-60}}, color = {0,0,0}),Line(points = {{0,30},{0,-30}}, color = {0,0,0}),Line(points = {{0,0},{90,0}}, color = {0,0,0})}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end ConstantVoltage;
    model StepVoltage "Step voltage source"
      parameter SI.Voltage V(start = 1) "Height of step";
      extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.Step signalSource(height = V));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-70,-70},{0,-70},{0,70},{69,70}}, color = {192,192,192})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{-80,90},{-88,68},{-72,68},{-80,90}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,68},{-80,-80}}, color = {192,192,192}),Line(points = {{-80,-18},{0,-18},{0,50},{80,50}}, color = {0,0,0}, thickness = 0.5),Line(points = {{-90,-70},{82,-70}}, color = {192,192,192}),Polygon(points = {{90,-70},{68,-62},{68,-78},{90,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{70,-80},{94,-100}}, lineColor = {160,160,164}, textString = "time"),Text(extent = {{-21,-72},{25,-90}}, lineColor = {160,160,164}, textString = "startTime"),Line(points = {{0,-17},{0,-71}}, color = {192,192,192}, pattern = LinePattern.Dash),Text(extent = {{-68,-36},{-22,-54}}, lineColor = {160,160,164}, textString = "offset"),Line(points = {{-13,50},{-13,-17}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{2,50},{-19,50},{2,50}}, lineColor = {192,192,192}, pattern = LinePattern.Dash),Polygon(points = {{-13,-17},{-16,-4},{-10,-4},{-13,-17},{-13,-17}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-13,50},{-16,37},{-9,37},{-13,50}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-68,26},{-22,8}}, lineColor = {160,160,164}, textString = "V"),Polygon(points = {{-13,-69},{-16,-56},{-10,-56},{-13,-69},{-13,-69}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-13,-18},{-13,-70}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{-13,-18},{-16,-31},{-9,-31},{-13,-18}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-67,93},{-2,67}}, lineColor = {160,160,164}, textString = "v = p.v - n.v")}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end StepVoltage;
    model RampVoltage "Ramp voltage source"
      parameter SI.Voltage V(start = 1) "Height of ramp";
      parameter SI.Time duration(min = Modelica.Constants.small, start = 2) "Duration of ramp";
      extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.Ramp signalSource(final height = V, final duration = duration));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{-80,90},{-88,68},{-72,68},{-80,90}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,68},{-80,-80}}, color = {192,192,192}),Line(points = {{-80,-20},{-20,-20},{50,50}}, color = {0,0,0}, thickness = 0.5),Line(points = {{-90,-70},{82,-70}}, color = {192,192,192}),Polygon(points = {{90,-70},{68,-62},{68,-78},{90,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-40,-20},{-42,-30},{-37,-30},{-40,-20}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-40,-20},{-40,-70}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{-40,-70},{-43,-60},{-38,-60},{-40,-70},{-40,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-80,-33},{-41,-49}}, lineColor = {160,160,164}, textString = "offset"),Text(extent = {{-40,-70},{6,-88}}, lineColor = {160,160,164}, textString = "startTime"),Text(extent = {{-67,93},{-2,67}}, lineColor = {160,160,164}, textString = "v = p.v - n.v"),Text(extent = {{70,-80},{94,-100}}, lineColor = {160,160,164}, textString = "time"),Line(points = {{-20,-20},{-20,-70}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-19,-20},{50,-20}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Line(points = {{50,50},{101,50}}, color = {0,0,0}, thickness = 0.5),Line(points = {{50,50},{50,-20}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{50,-20},{42,-18},{42,-22},{50,-20}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-20,-20},{-11,-18},{-11,-22},{-20,-20}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{50,50},{48,40},{53,40},{50,50}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{50,-20},{47,-10},{52,-10},{50,-20},{50,-20}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{53,25},{82,7}}, lineColor = {160,160,164}, textString = "V"),Text(extent = {{0,-17},{35,-37}}, lineColor = {160,160,164}, textString = "duration")}), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-80,-60},{-50,-60},{50,60},{80,60}}, color = {192,192,192})}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end RampVoltage;
    model SineVoltage "Sine voltage source"
      parameter SI.Voltage V(start = 1) "Amplitude of sine wave";
      parameter SI.Angle phase = 0 "Phase of sine wave";
      parameter SI.Frequency freqHz(start = 1) "Frequency of sine wave";
      extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.Sine signalSource(amplitude = V, freqHz = freqHz, phase = phase));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-66,0},{-56.2,29.9},{-49.8,46.5},{-44.2,58.1},{-39.3,65.2},{-34.3,69.2},{-29.4,69.8},{-24.5,67},{-19.6,61},{-14.6,52},{-9,38.6},{-1.98,18.6},{12.79,-26.9},{19.1,-44},{24.8,-56.2},{29.7,-64},{34.6,-68.6},{39.5,-70},{44.5,-67.9},{49.4,-62.5},{54.3,-54.1},{59.9,-41.3},{67,-21.7},{74,0}}, color = {192,192,192})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-80,-90},{-80,84}}, color = {192,192,192}),Polygon(points = {{-80,100},{-86,84},{-74,84},{-80,100}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-99,-40},{85,-40}}, color = {192,192,192}),Polygon(points = {{101,-40},{85,-34},{85,-46},{101,-40}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-40,0},{-31.6,34.2},{-26.1,53.1},{-21.3,66.4},{-17.1,74.6},{-12.9,79.1},{-8.64,79.8},{-4.42,76.6},{-0.201,69.7},{4.02,59.4},{8.84,44.1},{14.9,21.2},{27.5,-30.8},{33,-50.2},{37.8,-64.2},{42,-73.1},{46.2,-78.4},{50.5,-80},{54.7,-77.6},{58.9,-71.5},{63.1,-61.9},{67.9,-47.2},{74,-24.8},{80,0}}, color = {0,0,0}, thickness = 0.5),Line(points = {{-41,-2},{-80,-2}}, color = {0,0,0}, thickness = 0.5),Text(extent = {{-106,-11},{-60,-29}}, lineColor = {160,160,164}, textString = "offset"),Line(points = {{-41,-2},{-41,-40}}, color = {192,192,192}, pattern = LinePattern.Dash),Text(extent = {{-60,-43},{-14,-61}}, lineColor = {160,160,164}, textString = "startTime"),Text(extent = {{84,-52},{108,-72}}, lineColor = {160,160,164}, textString = "time"),Line(points = {{-9,79},{43,79}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-42,-1},{50,0}}, color = {192,192,192}, pattern = LinePattern.Dash),Polygon(points = {{33,80},{30,67},{37,67},{33,80}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{37,57},{83,39}}, lineColor = {160,160,164}, textString = "V"),Polygon(points = {{33,1},{30,14},{36,14},{33,1},{33,1}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{33,79},{33,0}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Text(extent = {{-69,109},{-4,83}}, lineColor = {160,160,164}, textString = "v = p.v - n.v")}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end SineVoltage;
    model ExpSineVoltage "Exponentially damped sine voltage source"
      parameter SI.Voltage V(start = 1) "Amplitude of sine wave";
      parameter SI.Frequency freqHz(start = 2) "Frequency of sine wave";
      parameter SI.Angle phase = 0 "Phase of sine wave";
      parameter SI.Damping damping(start = 1) "Damping coefficient of sine wave";
      extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.ExpSine signalSource(amplitude = V, freqHz = freqHz, phase = phase, damping = damping));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-64,-14},{-59.2,18.3},{-56,36.3},{-52.7,50.5},{-49.5,60.2},{-46.3,65.3},{-43.1,65.6},{-39.9,61.3},{-36.7,53.1},{-32.6,38.2},{-27,11.8},{-19,-27.9},{-14.2,-47.7},{-10.1,-59.9},{-6.1,-67.2},{-2.1,-69.3},{1.9,-66.5},{5.9,-59.3},{10.77,-46.1},{24.44,-0.3},{29.3,12.4},{34.1,20.8},{38.1,24},{42.9,23.2},{47.8,17.8},{54.2,5.4},{67.1,-24.5},{73.5,-35.2},{79.1,-39.9},{84.7,-39.9},{91.2,-34.5},{96,-27.8}}, color = {192,192,192})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-80,-90},{-80,84}}, color = {192,192,192}),Polygon(points = {{-80,100},{-86,84},{-74,84},{-80,100}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-99,-40},{85,-40}}, color = {192,192,192}),Polygon(points = {{101,-40},{85,-34},{85,-46},{101,-40}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-50,0},{-46.1,28.2},{-43.5,44},{-40.9,56.4},{-38.2,64.9},{-35.6,69.4},{-33,69.6},{-30.4,65.9},{-27.8,58.7},{-24.5,45.7},{-19.9,22.5},{-13.4,-12.2},{-9.5,-29.5},{-6.23,-40.1},{-2.96,-46.5},{0.302,-48.4},{3.57,-45.9},{6.83,-39.6},{10.8,-28.1},{21.9,12},{25.8,23.1},{29.7,30.5},{33,33.3},{36.9,32.5},{40.8,27.8},{46,16.9},{56.5,-9.2},{61.7,-18.6},{66.3,-22.7},{70.9,-22.6},{76.1,-18},{80,-12.1}}, color = {0,0,0}, thickness = 0.5),Text(extent = {{-78,1},{-55,-19}}, lineColor = {160,160,164}, textString = "offset"),Text(extent = {{-72,-36},{-26,-54}}, lineColor = {160,160,164}, textString = "startTime"),Text(extent = {{84,-52},{108,-72}}, lineColor = {160,160,164}, textString = "time"),Line(points = {{-50,0},{18,0}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-50,0},{-81,0}}, color = {0,0,0}, thickness = 0.5),Line(points = {{-50,77},{-50,0}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{18,-1},{18,76}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{18,73},{-50,73}}, color = {192,192,192}),Text(extent = {{-42,88},{9,74}}, lineColor = {160,160,164}, textString = "1/freqHz"),Polygon(points = {{-49,73},{-40,75},{-40,71},{-49,73}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{18,73},{10,75},{10,71},{18,73}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-50,-61},{-19,-61}}, color = {192,192,192}),Polygon(points = {{-18,-61},{-26,-59},{-26,-63},{-18,-61}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-51,-63},{-27,-75}}, lineColor = {160,160,164}, textString = "t"),Text(extent = {{-82,-67},{108,-96}}, lineColor = {160,160,164}, textString = "V*exp(-damping*t)*sin(2*pi*freqHz*t+phase)"),Line(points = {{-50,0},{-50,-40}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-50,-54},{-50,-72}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{18,-76},{-1,-48}}, color = {192,192,192}, pattern = LinePattern.Dash),Text(extent = {{-77,105},{-38,92}}, lineColor = {160,160,164}, textString = "v = p.v - n.v")}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end ExpSineVoltage;
    model ExponentialsVoltage " Rising and falling exponential voltage source"
      parameter Real vMax(start = 1) "Upper bound for rising edge";
      parameter SI.Time riseTime(min = 0, start = 0.5) "Rise time";
      parameter SI.Time riseTimeConst(min = Modelica.Constants.small, start = 0.1) "Rise time constant";
      parameter SI.Time fallTimeConst(min = Modelica.Constants.small, start = riseTimeConst) "Fall time constant";
      extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.Exponentials signalSource(outMax = vMax, riseTime = riseTime, riseTimeConst = riseTimeConst, fallTimeConst = fallTimeConst));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-76,-59},{-73.2,-44.3},{-70.3,-31.1},{-66.8,-16.6},{-63.3,-4},{-59.7,6.92},{-55.5,18.18},{-51.3,27.7},{-46.3,37},{-40.6,45.5},{-34.3,53.1},{-27.2,59.6},{-18.7,65.3},{-8.1,70.2},{-6,71},{-3.88,58.5},{-1.05,43.7},{1.78,30.8},{4.606,19.45},{8.14,7.3},{11.68,-3},{15.9,-13.2},{20.2,-21.6},{25.1,-29.5},{30.8,-36.4},{37.1,-42.3},{44.9,-47.5},{54.8,-51.8},{64,-54.4}}, color = {192,192,192})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-100,-70},{84,-70}}, color = {192,192,192}),Polygon(points = {{100,-70},{84,-64},{84,-76},{100,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-40,-30},{-37.2,-15.3},{-34.3,-2.1},{-30.8,12.4},{-27.3,25},{-23.7,35.92},{-19.5,47.18},{-15.3,56.7},{-10.3,66},{-4.6,74.5},{1.7,82.1},{8.8,88.6},{17.3,94.3},{27.9,99.2},{30,100},{32.12,87.5},{34.95,72.7},{37.78,59.8},{40.606,48.45},{44.14,36.3},{47.68,26},{51.9,15.8},{56.2,7.4},{61.1,-0.5},{66.8,-7.4},{73.1,-13.3},{80.9,-18.5},{90.8,-22.8},{100,-25.4}}, color = {0,0,0}, thickness = 0.5),Polygon(points = {{-80,90},{-88,68},{-72,68},{-80,90}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,68},{-80,-80}}, color = {192,192,192}),Text(extent = {{-70,91},{-29,71}}, lineColor = {160,160,164}, textString = "outPort"),Text(extent = {{-78,-43},{-46,-56}}, lineColor = {160,160,164}, textString = "offset"),Polygon(points = {{-40,-70},{-43,-60},{-38,-60},{-40,-70},{-40,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-40,-29},{-40,-60}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{-40,-30},{-42,-40},{-37,-40},{-40,-30}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-39,-30},{-80,-30}}, color = {0,0,0}, thickness = 0.5),Text(extent = {{-59,-71},{-13,-89}}, lineColor = {160,160,164}, textString = "startTime"),Polygon(points = {{-41,-30},{-32,-28},{-32,-32},{-41,-30}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-40,-30},{29,-30}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{29,-30},{21,-28},{21,-32},{29,-30}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-26,-12},{19,-28}}, lineColor = {160,160,164}, textString = "riseTime"),Text(extent = {{78,-76},{102,-96}}, lineColor = {160,160,164}, textString = "time"),Line(points = {{-100,-70},{84,-70}}, color = {192,192,192}),Polygon(points = {{100,-70},{84,-64},{84,-76},{100,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-40,-30},{-37.2,-15.3},{-34.3,-2.1},{-30.8,12.4},{-27.3,25},{-23.7,35.92},{-19.5,47.18},{-15.3,56.7},{-10.3,66},{-4.6,74.5},{1.7,82.1},{8.8,88.6},{17.3,94.3},{27.9,99.2},{30,100},{32.12,87.5},{34.95,72.7},{37.78,59.8},{40.606,48.45},{44.14,36.3},{47.68,26},{51.9,15.8},{56.2,7.4},{61.1,-0.5},{66.8,-7.4},{73.1,-13.3},{80.9,-18.5},{90.8,-22.8},{100,-25.4}}, color = {0,0,0}, thickness = 0.5),Polygon(points = {{-80,90},{-88,68},{-72,68},{-80,90}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,68},{-80,-80}}, color = {192,192,192}),Text(extent = {{-70,91},{-29,71}}, lineColor = {160,160,164}, textString = "outPort"),Text(extent = {{-78,-43},{-46,-56}}, lineColor = {160,160,164}, textString = "offset"),Polygon(points = {{-40,-70},{-43,-60},{-38,-60},{-40,-70},{-40,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-40,-29},{-40,-60}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{-40,-30},{-42,-40},{-37,-40},{-40,-30}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-39,-30},{-80,-30}}, color = {0,0,0}, thickness = 0.5),Text(extent = {{-59,-71},{-13,-89}}, lineColor = {160,160,164}, textString = "startTime"),Polygon(points = {{-41,-30},{-32,-28},{-32,-32},{-41,-30}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-40,-30},{29,-30}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{29,-30},{21,-28},{21,-32},{29,-30}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-26,-12},{19,-28}}, lineColor = {160,160,164}, textString = "riseTime"),Text(extent = {{78,-76},{102,-96}}, lineColor = {160,160,164}, textString = "time"),Line(points = {{30,100},{30,-34}}, color = {192,192,192}, pattern = LinePattern.Dash)}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end ExponentialsVoltage;
    model PulseVoltage "Pulse voltage source"
      parameter SI.Voltage V(start = 1) "Amplitude of pulse";
      parameter Real width(final min = Modelica.Constants.small, final max = 100, start = 50) "Width of pulse in % of period";
      parameter SI.Time period(final min = Modelica.Constants.small, start = 1) "Time for one period";
      extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.Pulse signalSource(amplitude = V, width = width, period = period));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-70,-70},{-40,-70},{-40,70},{0,70},{0,-70},{40,-70},{40,70},{80,70}}, color = {192,192,192})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{-80,90},{-88,68},{-72,68},{-80,90}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,68},{-80,-80}}, color = {192,192,192}),Line(points = {{-90,-70},{82,-70}}, color = {192,192,192}),Polygon(points = {{90,-70},{68,-62},{68,-78},{90,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-34,1},{-37,-12},{-30,-12},{-34,1}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-34,-1},{-34,-70}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{-33,-70},{-36,-57},{-30,-57},{-33,-70},{-33,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-78,-24},{-35,-36}}, lineColor = {160,160,164}, textString = "offset"),Text(extent = {{-31,-69},{15,-87}}, lineColor = {160,160,164}, textString = "startTime"),Text(extent = {{70,-80},{94,-100}}, lineColor = {160,160,164}, textString = "time"),Line(points = {{-10,0},{-10,-70}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-80,0},{-20,0},{-21,50},{21,50},{20,-1},{41,0},{40,50},{80,51}}, color = {0,0,0}, thickness = 0.5),Line(points = {{-19,88},{-19,49}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{21,74},{21,50}}, color = {160,160,164}, pattern = LinePattern.Dash),Line(points = {{41,88},{41,50}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-19,83},{42,83}}, color = {192,192,192}),Line(points = {{-19,69},{21,69}}, color = {192,192,192}),Text(extent = {{-9,97},{37,85}}, lineColor = {160,160,164}, textString = "period"),Text(extent = {{-18,81},{21,69}}, lineColor = {160,160,164}, textString = "width"),Line(points = {{-52,50},{-19,50}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-34,50},{-34,1}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Text(extent = {{-78,34},{-37,20}}, lineColor = {160,160,164}, textString = "V"),Polygon(points = {{-34,49},{-37,36},{-30,36},{-34,49}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-34,1},{-37,14},{-31,14},{-34,1},{-34,1}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{80,51},{80,0},{90,-1}}, color = {0,0,0}, thickness = 0.5),Polygon(points = {{-19,69},{-10,71},{-10,67},{-19,69}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{21,69},{13,71},{13,67},{21,69}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-19,83},{-10,85},{-10,81},{-19,83}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{41,83},{33,85},{33,81},{41,83}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-78,103},{-24,89}}, lineColor = {160,160,164}, textString = "v = p.v - n.v")}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end PulseVoltage;
    model SawToothVoltage "Saw tooth voltage source"
      parameter SI.Voltage V(start = 1) "Amplitude of saw tooth";
      parameter SI.Time period(start = 1) "Time for one period";
      extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.SawTooth signalSource(amplitude = V, period = period));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-85,-70},{-65,-70},{-5,71},{-5,-70},{55,71},{55,-70}}, color = {192,192,192})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{-80,90},{-88,68},{-72,68},{-80,90}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,68},{-80,-80}}, color = {192,192,192}),Line(points = {{-90,-70},{82,-70}}, color = {192,192,192}),Polygon(points = {{90,-70},{68,-62},{68,-78},{90,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-34,-19},{-37,-32},{-30,-32},{-34,-19}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-34,-20},{-34,-70}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-78,-24},{-35,-36}}, lineColor = {160,160,164}, textString = "offset"),Text(extent = {{-31,-69},{15,-87}}, lineColor = {160,160,164}, textString = "startTime"),Text(extent = {{70,-80},{94,-100}}, lineColor = {160,160,164}, textString = "time"),Line(points = {{-10,-20},{-10,-70}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-10,88},{-10,-20}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{30,88},{30,59}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-10,83},{30,83}}, color = {192,192,192}),Text(extent = {{-12,97},{34,85}}, lineColor = {160,160,164}, textString = "period"),Line(points = {{-44,60},{30,60}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-34,47},{-34,-7}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Text(extent = {{-78,34},{-37,20}}, lineColor = {160,160,164}, textString = "V"),Polygon(points = {{-34,60},{-37,47},{-30,47},{-34,60}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-34,-20},{-37,-7},{-31,-7},{-34,-20},{-34,-20}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-10,83},{-1,85},{-1,81},{-10,83}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{30,83},{22,85},{22,81},{30,83}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,-20},{-10,-20},{30,60},{30,-20},{72,60},{72,-20}}, color = {0,0,0}, thickness = 0.5),Text(extent = {{-77,100},{-27,88}}, lineColor = {160,160,164}, textString = "v = p.v - n.v")}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end SawToothVoltage;
    model TrapezoidVoltage "Trapezoidal voltage source"
      parameter SI.Voltage V(start = 1) "Amplitude of trapezoid";
      parameter SI.Time rising(final min = 0, start = 0) "Rising duration of trapezoid";
      parameter SI.Time width(final min = 0, start = 0.5) "Width duration of trapezoid";
      parameter SI.Time falling(final min = 0, start = 0) "Falling duration of trapezoid";
      parameter SI.Time period(final min = Modelica.Constants.small, start = 1) "Time for one period";
      parameter Integer nperiod(start = -1) "Number of periods (< 0 means infinite number of periods)";
      extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.Trapezoid signalSource(amplitude = V, rising = rising, width = width, falling = falling, period = period, nperiod = nperiod));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-81,-70},{-60,-70},{-30,70},{1,70},{30,-70},{51,-70},{80,70}}, color = {192,192,192})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{-80,90},{-88,68},{-72,68},{-80,90}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,68},{-80,-80}}, color = {192,192,192}),Line(points = {{-90,-70},{82,-70}}, color = {192,192,192}),Polygon(points = {{90,-70},{68,-62},{68,-78},{90,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-45,-30},{-47,-41},{-43,-41},{-45,-30}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-45,-31},{-45,-70}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{-45,-70},{-47,-60},{-43,-60},{-45,-70},{-45,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-86,-43},{-43,-55}}, lineColor = {160,160,164}, textString = "offset"),Text(extent = {{-47,-69},{-1,-87}}, lineColor = {160,160,164}, textString = "startTime"),Text(extent = {{70,-80},{94,-100}}, lineColor = {160,160,164}, textString = "time"),Line(points = {{-30,81},{-30,-70}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-10,59},{-10,40}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{20,59},{20,39}}, color = {160,160,164}, pattern = LinePattern.Dash),Line(points = {{40,59},{40,-30}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-29,56},{40,56}}, color = {192,192,192}),Text(extent = {{-8,70},{21,60}}, lineColor = {160,160,164}, textString = "width"),Line(points = {{-42,40},{-10,40}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-39,40},{-39,-19}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Text(extent = {{-77,14},{-40,0}}, lineColor = {160,160,164}, textString = "V"),Polygon(points = {{-29,56},{-22,58},{-22,54},{-29,56}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-10,56},{-17,58},{-17,54},{-10,56}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,-30},{-30,-30},{-9,46},{21,46},{40,-30},{60,-30},{80,46},{100,46}}, color = {0,0,0}, thickness = 0.5),Polygon(points = {{-39,40},{-41,29},{-37,29},{-39,40}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-39,-29},{-41,-19},{-37,-19},{-39,-29},{-39,-29}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{60,81},{60,-30}}, color = {192,192,192}, pattern = LinePattern.Dash),Polygon(points = {{39,56},{32,58},{32,54},{39,56}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{20,56},{27,58},{27,54},{20,56}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{20,56},{13,58},{13,54},{20,56}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-12,56},{-5,58},{-5,54},{-12,56}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-34,70},{-5,60}}, lineColor = {160,160,164}, textString = "rising"),Text(extent = {{16,70},{45,60}}, lineColor = {160,160,164}, textString = "falling"),Text(extent = {{-77,103},{-23,91}}, lineColor = {160,160,164}, textString = "v = p.v - n.v"),Line(points = {{-20,76},{61,76}}, color = {192,192,192}),Polygon(points = {{-29,76},{-20,78},{-20,74},{-29,76}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{61,76},{53,78},{53,74},{61,76}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-2,86},{25,77}}, lineColor = {160,160,164}, textString = "period")}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end TrapezoidVoltage;
    model TableVoltage "Voltage source by linear interpolation in a table"
      parameter Real table[:,:] = [0,0;1,1;2,4] "Table matrix (time = first column, voltage = second column)";
      extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.TimeTable signalSource(table = table));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-58,-36},{-58,84},{42,84},{42,-36},{-58,-36},{-58,-6},{42,-6},{42,24},{-58,24},{-58,54},{42,54},{42,84},{-8,84},{-8,-37}}, color = {192,192,192})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{-80,90},{-88,68},{-72,68},{-80,90}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,68},{-80,-80}}, color = {192,192,192}),Line(points = {{-90,-70},{82,-70}}, color = {192,192,192}),Polygon(points = {{90,-70},{68,-62},{68,-78},{90,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Rectangle(extent = {{-20,90},{30,-30}}, lineColor = {255,255,255}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-20,-30},{-20,90},{80,90},{80,-30},{-20,-30},{-20,0},{80,0},{80,30},{-20,30},{-20,60},{80,60},{80,90},{30,90},{30,-31}}, color = {0,0,0}),Text(extent = {{-77,-42},{-38,-58}}, lineColor = {160,160,164}, textString = "offset"),Polygon(points = {{-31,-30},{-33,-40},{-28,-40},{-31,-30}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-30,-70},{-33,-60},{-28,-60},{-30,-70},{-30,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-31,-31},{-31,-70}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Line(points = {{-20,-20},{-20,-70}}, color = {192,192,192}, pattern = LinePattern.Dash),Text(extent = {{-38,-70},{8,-88}}, lineColor = {160,160,164}, textString = "startTime"),Line(points = {{-20,-30},{-80,-30}}, color = {192,192,192}, pattern = LinePattern.Dash),Text(extent = {{66,-81},{91,-93}}, lineColor = {160,160,164}, textString = "time"),Text(extent = {{-15,83},{24,68}}, lineColor = {0,0,0}, textString = "time"),Text(extent = {{33,83},{76,67}}, lineColor = {0,0,0}, textString = "v"),Text(extent = {{-81,98},{-31,85}}, lineColor = {160,160,164}, textString = "v = p.v - n.v")}), Documentation(info = "<HTML>
<p>
This block generates a voltage source by <b>linear interpolation</b> in
a table. The time points and voltage values are stored in a matrix
<b>table[i,j]</b>, where the first column table[:,1] contains the
time points and the second column contains the voltage to be interpolated.
The table interpolation has the following proporties:
</p>
<ul>
<li>The time points need to be <b>monotonically increasing</b>. </li>
<li><b>Discontinuities</b> are allowed, by providing the same
    time point twice in the table. </li>
<li>Values <b>outside</b> of the table range, are computed by
    <b>extrapolation</b> through the last or first two points of the
    table.</li>
<li>If the table has only <b>one row</b>, no interpolation is performed and
    the voltage value is just returned independantly of the
    actual time instant, i.e., this is a constant voltage source.</li>
<li>Via parameters <b>startTime</b> and <b>offset</b> the curve defined
    by the table can be shifted both in time and in the voltage.
<li>The table is implemented in a numerically sound way by
    generating <b>time events</b> at interval boundaries,
    in order to not integrate over a discontinuous or not differentiable
    points.
</li>
</ul>
<p>
Example:
</p>
<pre>
   table = [0  0
            1  0
            1  1
            2  4
            3  9
            4 16]
If, e.g., time = 1.0, the voltage v =  0.0 (before event), 1.0 (after event)
    e.g., time = 1.5, the voltage v =  2.5,
    e.g., time = 2.0, the voltage v =  4.0,
    e.g., time = 5.0, the voltage v = 23.0 (i.e. extrapolation).
</pre>
</HTML>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end TableVoltage;
    model SignalCurrent "Generic current source using the input signal as source current"
      Interfaces.PositivePin p annotation(Placement(transformation(extent = {{-110,-10},{-90,10}}, rotation = 0)));
      Interfaces.NegativePin n annotation(Placement(transformation(extent = {{110,-10},{90,10}}, rotation = 0)));
      SI.Voltage v "Voltage drop between the two pins (= p.v - n.v)";
      Modelica.Blocks.Interfaces.RealInput i "Current flowing from pin p to pin n as input signal" annotation(Placement(transformation(origin = {0,70}, extent = {{-20,-20},{20,20}}, rotation = 270)));
    equation
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-50,50},{50,-50}}, lineColor = {0,0,0}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-90,0},{-50,0}}, color = {0,0,0}),Line(points = {{50,0},{90,0}}, color = {0,0,0}),Line(points = {{0,-50},{0,50}}, color = {0,0,0}),Text(extent = {{-150,-120},{150,-80}}, textString = "%name", lineColor = {0,0,255}),Polygon(points = {{90,0},{60,10},{60,-10},{90,0}}, lineColor = {0,0,255}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-50,50},{50,-50}}, lineColor = {0,0,0}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-96,0},{-50,0}}, color = {0,0,0}),Line(points = {{50,0},{96,0}}, color = {0,0,0}),Line(points = {{0,-50},{0,50}}, color = {0,0,0})}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end SignalCurrent;
    model ConstantCurrent "Source for constant current"
      parameter SI.Current I(start = 1) "Value of constant current";
      extends Interfaces.OnePort;
    equation
      i = I;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-50,50},{50,-50}}, lineColor = {0,0,0}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-90,0},{-50,0}}, color = {0,0,0}),Line(points = {{50,0},{90,0}}, color = {0,0,0}),Line(points = {{0,-50},{0,50}}, color = {0,0,0}),Text(extent = {{-150,80},{150,120}}, textString = "%name=%I", lineColor = {0,0,255}),Polygon(points = {{90,0},{60,10},{60,-10},{90,0}}, lineColor = {0,0,255}, fillColor = {0,0,255}, fillPattern = FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Ellipse(extent = {{-50,50},{50,-50}}, lineColor = {0,0,0}, fillColor = {255,255,255}, fillPattern = FillPattern.Solid),Line(points = {{-96,0},{-50,0}}, color = {0,0,0}),Line(points = {{50,0},{96,0}}, color = {0,0,0}),Line(points = {{0,-50},{0,50}}, color = {0,0,0})}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end ConstantCurrent;
    model StepCurrent "Step current source"
      parameter SI.Current I(start = 1) "Height of step";
      extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.Step signalSource(height = I));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-86,-70},{-14,-70},{-14,70},{57,70}}, color = {192,192,192})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{-80,90},{-88,68},{-72,68},{-80,90}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,68},{-80,-80}}, color = {192,192,192}),Line(points = {{-80,-18},{0,-18},{0,50},{80,50}}, color = {0,0,0}, thickness = 0.5),Line(points = {{-90,-70},{82,-70}}, color = {192,192,192}),Polygon(points = {{90,-70},{68,-62},{68,-78},{90,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{70,-80},{94,-100}}, lineColor = {160,160,164}, textString = "time"),Text(extent = {{-21,-72},{25,-90}}, lineColor = {160,160,164}, textString = "startTime"),Line(points = {{0,-17},{0,-71}}, color = {192,192,192}, pattern = LinePattern.Dash),Text(extent = {{-68,-36},{-22,-54}}, lineColor = {160,160,164}, textString = "offset"),Line(points = {{-13,50},{-13,-17}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{2,50},{-19,50},{2,50}}, lineColor = {192,192,192}, pattern = LinePattern.Dash),Polygon(points = {{-13,-17},{-16,-4},{-10,-4},{-13,-17},{-13,-17}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-13,50},{-16,37},{-9,37},{-13,50}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-68,26},{-22,8}}, lineColor = {160,160,164}, textString = "I"),Polygon(points = {{-13,-69},{-16,-56},{-10,-56},{-13,-69},{-13,-69}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-13,-18},{-13,-70}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{-13,-18},{-16,-31},{-9,-31},{-13,-18}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-73,75},{-53,95}}, lineColor = {192,192,192}, textString = "i")}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end StepCurrent;
    model RampCurrent "Ramp current source"
      parameter SI.Current I(start = 1) "Height of ramp";
      parameter SI.Time duration(min = Modelica.Constants.small, start = 2) "Duration of ramp";
      extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.Ramp signalSource(final height = I, final duration = duration));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{-80,90},{-88,68},{-72,68},{-80,90}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,68},{-80,-80}}, color = {192,192,192}),Line(points = {{-80,-20},{-20,-20},{50,50}}, color = {0,0,0}, thickness = 0.5),Line(points = {{-90,-70},{82,-70}}, color = {192,192,192}),Polygon(points = {{90,-70},{68,-62},{68,-78},{90,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-40,-20},{-42,-30},{-37,-30},{-40,-20}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-40,-20},{-40,-70}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{-40,-70},{-43,-60},{-38,-60},{-40,-70},{-40,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-80,-33},{-41,-49}}, lineColor = {160,160,164}, textString = "offset"),Text(extent = {{-40,-70},{6,-88}}, lineColor = {160,160,164}, textString = "startTime"),Text(extent = {{70,-80},{94,-100}}, lineColor = {160,160,164}, textString = "time"),Line(points = {{-20,-20},{-20,-70}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-19,-20},{50,-20}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Line(points = {{50,50},{101,50}}, color = {0,0,0}, thickness = 0.5),Line(points = {{50,50},{50,-20}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{50,-20},{42,-18},{42,-22},{50,-20}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-20,-20},{-11,-18},{-11,-22},{-20,-20}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{50,50},{48,40},{53,40},{50,50}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{50,-20},{47,-10},{52,-10},{50,-20},{50,-20}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{53,25},{82,7}}, lineColor = {160,160,164}, textString = "I"),Text(extent = {{0,-17},{35,-37}}, lineColor = {160,160,164}, textString = "duration"),Text(extent = {{-73,75},{-53,95}}, lineColor = {192,192,192}, textString = "i")}), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-80,-60},{-50,-60},{50,60},{80,60}}, color = {192,192,192})}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end RampCurrent;
    model SineCurrent "Sine current source"
      parameter SI.Current I(start = 1) "Amplitude of sine wave";
      parameter SI.Angle phase = 0 "Phase of sine wave";
      parameter SI.Frequency freqHz(start = 1) "Frequency of sine wave";
      extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.Sine signalSource(amplitude = I, freqHz = freqHz, phase = phase));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-70,0},{-60.2,29.9},{-53.8,46.5},{-48.2,58.1},{-43.3,65.2},{-38.3,69.2},{-33.4,69.8},{-28.5,67},{-23.6,61},{-18.6,52},{-13,38.6},{-5.98,18.6},{8.79,-26.9},{15.1,-44},{20.8,-56.2},{25.7,-64},{30.6,-68.6},{35.5,-70},{40.5,-67.9},{45.4,-62.5},{50.3,-54.1},{55.9,-41.3},{63,-21.7},{70,0}}, color = {192,192,192})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-80,-90},{-80,84}}, color = {192,192,192}),Polygon(points = {{-80,100},{-86,84},{-74,84},{-80,100}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-99,-40},{85,-40}}, color = {192,192,192}),Polygon(points = {{101,-40},{85,-34},{85,-46},{101,-40}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-40,0},{-31.6,34.2},{-26.1,53.1},{-21.3,66.4},{-17.1,74.6},{-12.9,79.1},{-8.64,79.8},{-4.42,76.6},{-0.201,69.7},{4.02,59.4},{8.84,44.1},{14.9,21.2},{27.5,-30.8},{33,-50.2},{37.8,-64.2},{42,-73.1},{46.2,-78.4},{50.5,-80},{54.7,-77.6},{58.9,-71.5},{63.1,-61.9},{67.9,-47.2},{74,-24.8},{80,0}}, color = {0,0,0}, thickness = 0.5),Line(points = {{-41,-2},{-80,-2}}, color = {0,0,0}, thickness = 0.5),Text(extent = {{-106,-11},{-60,-29}}, lineColor = {160,160,164}, textString = "offset"),Line(points = {{-41,-2},{-41,-40}}, color = {192,192,192}, pattern = LinePattern.Dash),Text(extent = {{-60,-43},{-14,-61}}, lineColor = {160,160,164}, textString = "startTime"),Text(extent = {{84,-52},{108,-72}}, lineColor = {160,160,164}, textString = "time"),Line(points = {{-9,79},{43,79}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-42,-1},{50,0}}, color = {192,192,192}, pattern = LinePattern.Dash),Polygon(points = {{33,80},{30,67},{37,67},{33,80}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{37,57},{83,39}}, lineColor = {160,160,164}, textString = "I"),Polygon(points = {{33,1},{30,14},{36,14},{33,1},{33,1}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{33,79},{33,0}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Text(extent = {{-73,82},{-53,102}}, lineColor = {192,192,192}, textString = "i")}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end SineCurrent;
    model ExpSineCurrent "Exponentially damped sine current source"
      parameter Real I(start = 1) "Amplitude of sine wave";
      parameter SI.Frequency freqHz(start = 2) "Frequency of sine wave";
      parameter SI.Angle phase = 0 "Phase of sine wave";
      parameter SI.Damping damping(start = 1) "Damping coefficient of sine wave";
      extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.ExpSine signalSource(amplitude = I, freqHz = freqHz, phase = phase, damping = damping));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-80,-14},{-75.2,18.3},{-72,36.3},{-68.7,50.5},{-65.5,60.2},{-62.3,65.3},{-59.1,65.6},{-55.9,61.3},{-52.7,53.1},{-48.6,38.2},{-43,11.8},{-35,-27.9},{-30.2,-47.7},{-26.1,-59.9},{-22.1,-67.2},{-18.1,-69.3},{-14.1,-66.5},{-10.1,-59.3},{-5.23,-46.1},{8.44,-0.3},{13.3,12.4},{18.1,20.8},{22.1,24},{26.9,23.2},{31.8,17.8},{38.2,5.4},{51.1,-24.5},{57.5,-35.2},{63.1,-39.9},{68.7,-39.9},{75.2,-34.5},{80,-27.8}}, color = {192,192,192})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-80,-90},{-80,84}}, color = {192,192,192}),Polygon(points = {{-80,100},{-86,84},{-74,84},{-80,100}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-99,-40},{85,-40}}, color = {192,192,192}),Polygon(points = {{101,-40},{85,-34},{85,-46},{101,-40}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-50,0},{-46.1,28.2},{-43.5,44},{-40.9,56.4},{-38.2,64.9},{-35.6,69.4},{-33,69.6},{-30.4,65.9},{-27.8,58.7},{-24.5,45.7},{-19.9,22.5},{-13.4,-12.2},{-9.5,-29.5},{-6.23,-40.1},{-2.96,-46.5},{0.302,-48.4},{3.57,-45.9},{6.83,-39.6},{10.8,-28.1},{21.9,12},{25.8,23.1},{29.7,30.5},{33,33.3},{36.9,32.5},{40.8,27.8},{46,16.9},{56.5,-9.2},{61.7,-18.6},{66.3,-22.7},{70.9,-22.6},{76.1,-18},{80,-12.1}}, color = {0,0,0}, thickness = 0.5),Text(extent = {{-78,1},{-55,-19}}, lineColor = {160,160,164}, textString = "offset"),Text(extent = {{-72,-36},{-26,-54}}, lineColor = {160,160,164}, textString = "startTime"),Text(extent = {{84,-52},{108,-72}}, lineColor = {160,160,164}, textString = "time"),Line(points = {{-50,0},{18,0}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-50,0},{-81,0}}, color = {0,0,0}, thickness = 0.5),Line(points = {{-50,77},{-50,0}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{18,-1},{18,76}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{18,73},{-50,73}}, color = {192,192,192}),Text(extent = {{-42,88},{9,74}}, lineColor = {160,160,164}, textString = "1/freqHz"),Polygon(points = {{-49,73},{-40,75},{-40,71},{-49,73}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{18,73},{10,75},{10,71},{18,73}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-50,-61},{-19,-61}}, color = {192,192,192}),Polygon(points = {{-18,-61},{-26,-59},{-26,-63},{-18,-61}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-51,-63},{-27,-75}}, lineColor = {160,160,164}, textString = "t"),Text(extent = {{-82,-67},{108,-96}}, lineColor = {160,160,164}, textString = "I*exp(-damping*t)*sin(2*pi*freqHz*t+phase)"),Line(points = {{-50,0},{-50,-40}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-50,-54},{-50,-72}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{18,-76},{-1,-48}}, color = {192,192,192}, pattern = LinePattern.Dash),Text(extent = {{-74,83},{-54,103}}, lineColor = {192,192,192}, textString = "i")}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end ExpSineCurrent;
    model ExponentialsCurrent " Rising and falling exponential current source"
      parameter Real iMax(start = 1) "Upper bound for rising edge";
      parameter SI.Time riseTime(min = 0, start = 0.5) "Rise time";
      parameter SI.Time riseTimeConst(min = Modelica.Constants.small, start = 0.1) "Rise time constant";
      parameter SI.Time fallTimeConst(min = Modelica.Constants.small, start = riseTimeConst) "Fall time constant";
      extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.Exponentials signalSource(outMax = iMax, riseTime = riseTime, riseTimeConst = riseTimeConst, fallTimeConst = fallTimeConst));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-76,-59},{-73.2,-44.3},{-70.3,-31.1},{-66.8,-16.6},{-63.3,-4},{-59.7,6.92},{-55.5,18.18},{-51.3,27.7},{-46.3,37},{-40.6,45.5},{-34.3,53.1},{-27.2,59.6},{-18.7,65.3},{-8.1,70.2},{-6,71},{-3.88,58.5},{-1.05,43.7},{1.78,30.8},{4.606,19.45},{8.14,7.3},{11.68,-3},{15.9,-13.2},{20.2,-21.6},{25.1,-29.5},{30.8,-36.4},{37.1,-42.3},{44.9,-47.5},{54.8,-51.8},{64,-54.4}}, color = {192,192,192})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-100,-70},{84,-70}}, color = {192,192,192}),Polygon(points = {{100,-70},{84,-64},{84,-76},{100,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-40,-30},{-37.2,-15.3},{-34.3,-2.1},{-30.8,12.4},{-27.3,25},{-23.7,35.92},{-19.5,47.18},{-15.3,56.7},{-10.3,66},{-4.6,74.5},{1.7,82.1},{8.8,88.6},{17.3,94.3},{27.9,99.2},{30,100},{32.12,87.5},{34.95,72.7},{37.78,59.8},{40.606,48.45},{44.14,36.3},{47.68,26},{51.9,15.8},{56.2,7.4},{61.1,-0.5},{66.8,-7.4},{73.1,-13.3},{80.9,-18.5},{90.8,-22.8},{100,-25.4}}, color = {0,0,0}, thickness = 0.5),Polygon(points = {{-80,90},{-88,68},{-72,68},{-80,90}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,68},{-80,-80}}, color = {192,192,192}),Polygon(points = {{-40,-70},{-43,-60},{-38,-60},{-40,-70},{-40,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-40,-29},{-40,-60}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{-40,-30},{-42,-40},{-37,-40},{-40,-30}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-39,-30},{-80,-30}}, color = {0,0,0}, thickness = 0.5),Text(extent = {{-59,-71},{-13,-89}}, lineColor = {160,160,164}, textString = "startTime"),Polygon(points = {{-41,-30},{-32,-28},{-32,-32},{-41,-30}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-40,-30},{29,-30}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{29,-30},{21,-28},{21,-32},{29,-30}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-26,-12},{19,-28}}, lineColor = {160,160,164}, textString = "riseTime"),Line(points = {{-39,-30},{-80,-30}}, color = {0,0,0}, thickness = 0.5),Line(points = {{30,100},{30,-34}}, color = {192,192,192}, pattern = LinePattern.Dash),Text(extent = {{-73,75},{-53,95}}, lineColor = {192,192,192}, textString = "i")}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end ExponentialsCurrent;
    model PulseCurrent "Pulse current source"
      parameter SI.Current I(start = 1) "Amplitude of pulse";
      parameter Real width(final min = Modelica.Constants.small, final max = 100, start = 50) "Width of pulse in % of period";
      parameter SI.Time period(final min = Modelica.Constants.small, start = 1) "Time for one period";
      extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.Pulse signalSource(amplitude = I, width = width, period = period));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-70,-67},{-40,-67},{-40,73},{0,73},{0,-67},{40,-67},{40,73},{80,73}}, color = {192,192,192})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{-80,90},{-88,68},{-72,68},{-80,90}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,68},{-80,-80}}, color = {192,192,192}),Line(points = {{-90,-70},{82,-70}}, color = {192,192,192}),Polygon(points = {{90,-70},{68,-62},{68,-78},{90,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-34,1},{-37,-12},{-30,-12},{-34,1}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-34,-1},{-34,-70}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{-33,-70},{-36,-57},{-30,-57},{-33,-70},{-33,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-78,-24},{-35,-36}}, lineColor = {160,160,164}, textString = "offset"),Text(extent = {{-31,-69},{15,-87}}, lineColor = {160,160,164}, textString = "startTime"),Text(extent = {{70,-80},{94,-100}}, lineColor = {160,160,164}, textString = "time"),Line(points = {{-10,0},{-10,-70}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-80,0},{-20,0},{-21,50},{21,50},{20,-1},{41,0},{40,50},{80,51}}, color = {0,0,0}, thickness = 0.5),Line(points = {{-19,88},{-19,49}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{21,74},{21,50}}, color = {160,160,164}, pattern = LinePattern.Dash),Line(points = {{41,88},{41,50}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-19,83},{42,83}}, color = {192,192,192}),Line(points = {{-19,69},{21,69}}, color = {192,192,192}),Text(extent = {{-9,97},{37,85}}, lineColor = {160,160,164}, textString = "period"),Text(extent = {{-18,81},{21,69}}, lineColor = {160,160,164}, textString = "width"),Line(points = {{-52,50},{-19,50}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-34,50},{-34,1}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Text(extent = {{-78,34},{-37,20}}, lineColor = {160,160,164}, textString = "I"),Polygon(points = {{-34,49},{-37,36},{-30,36},{-34,49}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-34,1},{-37,14},{-31,14},{-34,1},{-34,1}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{80,51},{80,0},{90,-1}}, color = {0,0,0}, thickness = 0.5),Polygon(points = {{-19,69},{-10,71},{-10,67},{-19,69}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{21,69},{13,71},{13,67},{21,69}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-19,83},{-10,85},{-10,81},{-19,83}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{41,83},{33,85},{33,81},{41,83}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-73,75},{-53,95}}, lineColor = {192,192,192}, textString = "i")}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end PulseCurrent;
    model SawToothCurrent "Saw tooth current source"
      parameter SI.Current I(start = 1) "Amplitude of saw tooth";
      parameter SI.Time period(start = 1) "Time for one period";
      extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.SawTooth signalSource(amplitude = I, period = period));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-70,-71},{-50,-71},{10,70},{10,-71},{70,70},{70,-71}}, color = {192,192,192})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{-80,90},{-88,68},{-72,68},{-80,90}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,68},{-80,-80}}, color = {192,192,192}),Line(points = {{-90,-70},{82,-70}}, color = {192,192,192}),Polygon(points = {{90,-70},{68,-62},{68,-78},{90,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-34,-19},{-37,-32},{-30,-32},{-34,-19}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-34,-20},{-34,-70}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-78,-24},{-35,-36}}, lineColor = {160,160,164}, textString = "offset"),Text(extent = {{-31,-69},{15,-87}}, lineColor = {160,160,164}, textString = "startTime"),Text(extent = {{70,-80},{94,-100}}, lineColor = {160,160,164}, textString = "time"),Line(points = {{-10,-20},{-10,-70}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-10,88},{-10,-20}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{30,88},{30,59}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-10,83},{30,83}}, color = {192,192,192}),Text(extent = {{-12,97},{34,85}}, lineColor = {160,160,164}, textString = "period"),Line(points = {{-44,60},{30,60}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-34,47},{-34,-7}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Text(extent = {{-78,34},{-37,20}}, lineColor = {160,160,164}, textString = "I"),Polygon(points = {{-34,60},{-37,47},{-30,47},{-34,60}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-34,-20},{-37,-7},{-31,-7},{-34,-20},{-34,-20}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-10,83},{-1,85},{-1,81},{-10,83}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{30,83},{22,85},{22,81},{30,83}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,-20},{-10,-20},{30,60},{30,-20},{72,60},{72,-20}}, color = {0,0,0}, thickness = 0.5),Text(extent = {{-73,75},{-53,95}}, lineColor = {192,192,192}, textString = "i")}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end SawToothCurrent;
    model TrapezoidCurrent "Trapezoidal current source"
      parameter SI.Current I(start = 1) "Amplitude of trapezoid";
      parameter SI.Time rising(final min = 0, start = 0) "Rising duration of trapezoid";
      parameter SI.Time width(final min = 0, start = 0.5) "Width duration of trapezoid";
      parameter SI.Time falling(final min = 0, start = 0) "Falling duration of trapezoid";
      parameter SI.Time period(final min = Modelica.Constants.small, start = 1) "Time for one period";
      parameter Integer nperiod(start = -1) "Number of periods (< 0 means infinite number of periods)";
      extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.Trapezoid signalSource(amplitude = I, rising = rising, width = width, falling = falling, period = period, nperiod = nperiod));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-81,-66},{-60,-66},{-30,74},{1,74},{30,-66},{51,-66},{80,74}}, color = {192,192,192})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{-80,90},{-88,68},{-72,68},{-80,90}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,68},{-80,-80}}, color = {192,192,192}),Line(points = {{-90,-70},{82,-70}}, color = {192,192,192}),Polygon(points = {{90,-70},{68,-62},{68,-78},{90,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-45,-30},{-47,-41},{-43,-41},{-45,-30}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-45,-31},{-45,-70}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Polygon(points = {{-45,-70},{-47,-60},{-43,-60},{-45,-70},{-45,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-86,-43},{-43,-55}}, lineColor = {160,160,164}, textString = "offset"),Text(extent = {{-47,-69},{-1,-87}}, lineColor = {160,160,164}, textString = "startTime"),Text(extent = {{70,-80},{94,-100}}, lineColor = {160,160,164}, textString = "time"),Line(points = {{-29,79},{-30,-70}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-10,59},{-10,40}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{20,59},{20,39}}, color = {160,160,164}, pattern = LinePattern.Dash),Line(points = {{40,59},{40,-30}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-20,75},{60,75}}, color = {192,192,192}),Line(points = {{-29,56},{40,56}}, color = {192,192,192}),Text(extent = {{-9,88},{37,76}}, lineColor = {160,160,164}, textString = "period"),Text(extent = {{-8,70},{21,60}}, lineColor = {160,160,164}, textString = "width"),Line(points = {{-42,40},{-10,40}}, color = {192,192,192}, pattern = LinePattern.Dash),Line(points = {{-39,40},{-39,-19}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Text(extent = {{-77,14},{-40,0}}, lineColor = {160,160,164}, textString = "I"),Polygon(points = {{-29,56},{-22,58},{-22,54},{-29,56}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-10,56},{-17,58},{-17,54},{-10,56}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-29,75},{-20,77},{-20,73},{-29,75}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{60,75},{52,77},{52,73},{60,75}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,-30},{-30,-30},{-9,46},{21,46},{40,-30},{60,-30},{80,46},{100,46}}, color = {0,0,0}, thickness = 0.5),Polygon(points = {{-39,40},{-41,29},{-37,29},{-39,40}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-39,-29},{-41,-19},{-37,-19},{-39,-29},{-39,-29}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{60,80},{60,-30}}, color = {192,192,192}, pattern = LinePattern.Dash),Polygon(points = {{39,56},{32,58},{32,54},{39,56}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{20,56},{27,58},{27,54},{20,56}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{20,56},{13,58},{13,54},{20,56}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-12,56},{-5,58},{-5,54},{-12,56}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Text(extent = {{-34,70},{-5,60}}, lineColor = {160,160,164}, textString = "rising"),Text(extent = {{16,70},{45,60}}, lineColor = {160,160,164}, textString = "falling"),Text(extent = {{-73,75},{-53,95}}, lineColor = {192,192,192}, textString = "i")}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end TrapezoidCurrent;
    model TableCurrent "Current source by linear interpolation in a table"
      parameter Real table[:,:] = [0,0;1,1;2,4] "Table matrix (time = first column, current = second column)";
      extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.TimeTable signalSource(table = table));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Line(points = {{-66,-36},{-66,84},{34,84},{34,-36},{-66,-36},{-66,-6},{34,-6},{34,24},{-66,24},{-66,54},{34,54},{34,84},{-16,84},{-16,-37}}, color = {192,192,192})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, grid = {1,1}), graphics = {Polygon(points = {{-80,90},{-88,68},{-72,68},{-80,90}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-80,68},{-80,-80}}, color = {192,192,192}),Line(points = {{-90,-70},{82,-70}}, color = {192,192,192}),Polygon(points = {{90,-70},{68,-62},{68,-78},{90,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Rectangle(extent = {{-20,90},{30,-30}}, lineColor = {255,255,255}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-20,-30},{-20,90},{80,90},{80,-30},{-20,-30},{-20,0},{80,0},{80,30},{-20,30},{-20,60},{80,60},{80,90},{30,90},{30,-31}}, color = {0,0,0}),Text(extent = {{-77,-42},{-38,-58}}, lineColor = {160,160,164}, textString = "offset"),Polygon(points = {{-31,-30},{-33,-40},{-28,-40},{-31,-30}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Polygon(points = {{-30,-70},{-33,-60},{-28,-60},{-30,-70},{-30,-70}}, lineColor = {192,192,192}, fillColor = {192,192,192}, fillPattern = FillPattern.Solid),Line(points = {{-31,-31},{-31,-70}}, color = {192,192,192}, pattern = LinePattern.Solid, thickness = 0.25, arrow = {Arrow.None,Arrow.None}),Line(points = {{-20,-20},{-20,-70}}, color = {192,192,192}, pattern = LinePattern.Dash),Text(extent = {{-38,-70},{8,-88}}, lineColor = {160,160,164}, textString = "startTime"),Line(points = {{-20,-30},{-80,-30}}, color = {192,192,192}, pattern = LinePattern.Dash),Text(extent = {{66,-81},{91,-93}}, lineColor = {160,160,164}, textString = "time"),Text(extent = {{-15,83},{24,68}}, lineColor = {0,0,0}, textString = "time"),Text(extent = {{33,83},{76,67}}, lineColor = {0,0,0}, textString = "v"),Text(extent = {{-73,75},{-53,95}}, lineColor = {192,192,192}, textString = "i")}), Documentation(info = "<HTML>
<p>
This block generates a current source by <b>linear interpolation</b> in
a table. The time points and current values are stored in a matrix
<b>table[i,j]</b>, where the first column table[:,1] contains the
time points and the second column contains the current to be interpolated.
The table interpolation has the following proporties:
</p>
<ul>
<li>The time points need to be <b>monotonically increasing</b>. </li>
<li><b>Discontinuities</b> are allowed, by providing the same
    time point twice in the table. </li>
<li>Values <b>outside</b> of the table range, are computed by
    <b>extrapolation</b> through the last or first two points of the
    table.</li>
<li>If the table has only <b>one row</b>, no interpolation is performed and
    the current value is just returned independantly of the
    actual time instant, i.e., this is a constant current source.</li>
<li>Via parameters <b>startTime</b> and <b>offset</b> the curve defined
    by the table can be shifted both in time and in the current.
<li>The table is implemented in a numerically sound way by
    generating <b>time events</b> at interval boundaries,
    in order to not integrate over a discontinuous or not differentiable
    points.
</li>
</ul>
<p>
Example:
</p>
<pre>
   table = [0  0
            1  0
            1  1
            2  4
            3  9
            4 16]
If, e.g., time = 1.0, the current i =  0.0 (before event), 1.0 (after event)
    e.g., time = 1.5, the current i =  2.5,
    e.g., time = 2.0, the current i =  4.0,
    e.g., time = 5.0, the current i = 23.0 (i.e. extrapolation).
</pre>
</HTML>
", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
    end TableCurrent;
    annotation(Documentation(info = "<html>
<p>
This package contains time-dependend and controlled voltage and current sources.
</p>

</HTML>
", revisions = "<html>
<dl>
<dt>
<b>Main Authors:</b>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
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
</html>"));
  end Sources;
end Analog;

