within Modelica.Electrical.Analog.Examples;
encapsulated model ChuaCircuit "Chua's circuit, ns, V, A"
  import Modelica.Electrical.Analog.Basic;
  import Modelica.Electrical.Analog.Examples.Utilities;
  import Modelica.Icons;
  extends Icons.Example;
  annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=50000.0), Documentation(info="<html>
<p>
 Chua's circuit is the most simple nonlinear circuit which shows chaotic behaviour. The circuit consists of linear basic elements (capacitors, resistor, conductor, inductor), and one nonlinear element, which is called Chua's diode. The chaotic behaviour is simulated.
<p>
The simulation end time should be set to 5e4. To get the chaotic behaviour please plot C1.v. Choose C2.v as the independent variable.
<p>
<dl>
<dt>
<b>Reference:</b>
<dd>
Kennedy, M.P.: Three Steps to Chaos - Part I: Evolution. IEEE Transactions on CAS I 40 (1993)10, 640-656
</dd>
</dl>
 
</HTML>
", revisions="<html>
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
  Basic.Conductor G(G=0.565) annotation(Placement(visible=true, transformation(origin={0.0,40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
  Basic.Ground Gnd annotation(Placement(visible=true, transformation(origin={0.0,-60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
  Basic.Inductor L(L=18) annotation(Placement(visible=true, transformation(origin={-50.0,20.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
  Basic.Resistor Ro(R=0.0125) annotation(Placement(visible=true, transformation(origin={-50.0,-20.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
  Utilities.NonlinearResistor Nr(Ga(min=-1)=-0.757576, Gb(min=-1)=-0.409091, Ve=1) annotation(Placement(visible=true, transformation(origin={47.8454,-0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
  Basic.Capacitor C1(C=10, v(start=4)) annotation(Placement(visible=true, transformation(origin={20.0,-0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
  Basic.Capacitor C2(C=100) annotation(Placement(visible=true, transformation(origin={-20.0,-0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
equation 
  connect(L.p,G.p) annotation(Line(visible=true, origin={-36.6667,36.6667}, points={{-13.333,-6.667},{-13.333,3.333},{26.667,3.333}}, color={0,0,255}));
  connect(L.n,Ro.p) annotation(Line(visible=true, origin={-50.0,-0.0}, points={{0.0,10.0},{0.0,-10.0}}, color={0,0,255}));
  connect(Ro.n,Gnd.p) annotation(Line(visible=true, origin={-25.0,-42.9994}, points={{-25.0,12.999},{-25.0,-2.999},{25.0,-2.999},{25.0,-7.001}}, color={0,0,255}));
  connect(G.p,C2.p) annotation(Line(visible=true, origin={-16.6667,30.0}, points={{6.667,10.0},{-3.333,10.0},{-3.333,-20.0}}, color={0,0,255}));
  connect(Nr.n,Gnd.p) annotation(Line(visible=true, origin={23.9227,-37.9994}, points={{23.923,27.999},{23.923,-7.999},{-23.923,-7.999},{-23.923,-12.001}}, color={0,0,255}));
  connect(C1.p,G.n) annotation(Line(visible=true, origin={16.6667,30.0}, points={{3.333,-20.0},{3.333,10.0},{-6.667,10.0}}, color={0,0,255}));
  connect(C1.n,Gnd.p) annotation(Line(visible=true, origin={10.0,-37.9994}, points={{10.0,27.999},{10.0,-7.999},{-10.0,-7.999},{-10.0,-12.001}}, color={0,0,255}));
  connect(G.n,Nr.p) annotation(Line(visible=true, origin={35.2303,30.0}, points={{-25.23,10.0},{12.615,10.0},{12.615,-20.0}}, color={0,0,255}));
  connect(C2.n,Gnd.p) annotation(Line(visible=true, origin={-10.0,-37.9994}, points={{-10.0,27.999},{-10.0,-7.999},{10.0,-7.999},{10.0,-12.001}}, color={0,0,255}));
end ChuaCircuit;
