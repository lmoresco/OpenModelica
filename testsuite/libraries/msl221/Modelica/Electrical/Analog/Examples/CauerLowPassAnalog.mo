within Modelica.Electrical.Analog.Examples;
model CauerLowPassAnalog "Cauer low pass filter with analog components"
  annotation(uses(Modelica(version="2.2")), experiment(StopTime=60), experimentSetupOutput, Documentation(revisions="<html>
<ul>
<li><i>January 13, 2006</i> 
       by Christoph Clauss<br>
       included into Modelica Standard Library</li>
<li><i>September 15, 2005</i>
       by Peter Trappe designed and by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</html>", info="<html>
 
<p>
The example Cauer Filter is a low-pass-filter of the fifth order. It is realized
using an analog network. The voltage source V is the input voltage (step),
and the R2.p.v is the filter output voltage. The pulse response is calculated.
<p>
The simulation end time should be 60. Please plot both V.p.v (input voltage) and R2.p.v (output voltage). 
<p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-98.85},{80,51.15}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}),Text(visible=true, fillColor={0,0,255}, extent={{-96,-49},{77,3}}, textString="Example", fontName="Arial"),Text(visible=true, fillColor={255,0,0}, extent={{-120,73},{120,132}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-150,100},{150,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={127,127,255}, fillPattern=FillPattern.Solid, extent={{-62,28},{-58,32}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={127,127,255}, fillPattern=FillPattern.Solid, extent={{-2,28},{2,32}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={127,127,255}, fillPattern=FillPattern.Solid, extent={{58,28},{62,32}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={127,127,255}, fillPattern=FillPattern.Solid, extent={{58,-52},{62,-48}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={127,127,255}, fillPattern=FillPattern.Solid, extent={{-2,-52},{2,-48}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={127,127,255}, fillPattern=FillPattern.Solid, extent={{-62,-52},{-58,-48}}),Text(visible=true, extent={{-110,64},{100,116}}, textString="CauerLowPassAnalog", fontName="Arial")}));
  parameter Real l1=1.304;
  parameter Real l2=0.8586;
  parameter Real c1=1.072;
  parameter Real c2=1/(1.704992^2*l1);
  parameter Real c3=1.682;
  parameter Real c4=1/(1.179945^2*l2);
  parameter Real c5=0.7262;
  Modelica.Electrical.Analog.Basic.Ground G annotation(Placement(visible=true, transformation(origin={0,-80}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C1(C=c1) annotation(Placement(visible=true, transformation(origin={-60,-20}, extent={{-10,-10},{10,10}}, rotation=270)));
  Modelica.Electrical.Analog.Basic.Capacitor C2(C=c2) annotation(Placement(visible=true, transformation(origin={-30,30}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C3(C=c3) annotation(Placement(visible=true, transformation(origin={0,-20}, extent={{-10,-10},{10,10}}, rotation=270)));
  Modelica.Electrical.Analog.Basic.Capacitor C4(C=c4) annotation(Placement(visible=true, transformation(origin={30,30}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C5(C=c5) annotation(Placement(visible=true, transformation(origin={60,-20}, extent={{-10,-10},{10,10}}, rotation=270)));
  Modelica.Electrical.Analog.Basic.Inductor L1(L=l1) annotation(Placement(visible=true, transformation(origin={-30,70}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Inductor L2(L=l2) annotation(Placement(visible=true, transformation(origin={30,70}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R2 annotation(Placement(visible=true, transformation(origin={100,-20}, extent={{-10,-10},{10,10}}, rotation=270)));
  Modelica.Electrical.Analog.Sources.StepVoltage V(startTime=1, offset=0) annotation(Placement(visible=true, transformation(origin={-100,-10}, extent={{-10,-10},{10,10}}, rotation=270)));
  Modelica.Electrical.Analog.Basic.Resistor R1 annotation(Placement(visible=true, transformation(origin={-90,30}, extent={{-10,-10},{10,10}}, rotation=-360)));
equation 
  connect(V.n,G.p) annotation(Line(visible=true, points={{-100,-20},{-100,-70},{0,-70}}, color={0,0,255}));
  connect(C5.p,R2.p) annotation(Line(visible=true, points={{60,-10},{60,30},{100,30},{100,-10}}, color={0,0,255}));
  connect(R2.n,C1.n) annotation(Line(visible=true, points={{100,-30},{100,-50},{-60,-50},{-60,-30}}, color={0,0,255}));
  connect(R2.n,C3.n) annotation(Line(visible=true, points={{100,-30},{100,-50},{0,-50},{0,-30},{0,-30}}, color={0,0,255}));
  connect(R2.n,C5.n) annotation(Line(visible=true, points={{100,-30},{100,-50},{60,-50},{60,-30}}, color={0,0,255}));
  connect(C1.n,C5.n) annotation(Line(visible=true, points={{-60,-30},{-60,-50},{60,-50},{60,-30}}, color={0,0,255}));
  connect(C1.n,C3.n) annotation(Line(visible=true, points={{-60,-30},{-60,-50},{0,-50},{0,-30},{0,-30}}, color={0,0,255}));
  connect(C5.n,G.p) annotation(Line(visible=true, points={{60,-30},{60,-50},{0,-50},{0,-70}}, color={0,0,255}));
  connect(C3.n,G.p) annotation(Line(visible=true, points={{0,-30},{0,-30},{0,-70}}, color={0,0,255}));
  connect(C4.n,R2.p) annotation(Line(visible=true, points={{40,30},{100,30},{100,-10}}, color={0,0,255}));
  connect(C4.n,C5.p) annotation(Line(visible=true, points={{40,30},{60,30},{60,-10}}, color={0,0,255}));
  connect(R2.n,G.p) annotation(Line(visible=true, points={{100,-30},{100,-50},{0,-50},{0,-70}}, color={0,0,255}));
  connect(L2.n,R2.p) annotation(Line(visible=true, points={{40,70},{40,30},{100,30},{100,-10}}, color={0,0,255}));
  connect(L2.n,C5.p) annotation(Line(visible=true, points={{40,70},{40,30},{60,30},{60,-10}}, color={0,0,255}));
  connect(L2.n,C4.n) annotation(Line(visible=true, points={{40,70},{40,30}}, color={0,0,255}));
  connect(C3.p,L2.p) annotation(Line(visible=true, points={{0,-10},{0,-10},{0,30},{20,30},{20,70}}, color={0,0,255}));
  connect(C2.n,L2.p) annotation(Line(visible=true, points={{-20,30},{20,30},{20,70}}, color={0,0,255}));
  connect(L2.p,C4.p) annotation(Line(visible=true, points={{20,70},{20,30}}, color={0,0,255}));
  connect(L1.n,C4.p) annotation(Line(visible=true, points={{-20,70},{-20,30},{20,30}}, color={0,0,255}));
  connect(L1.n,C3.p) annotation(Line(visible=true, points={{-20,70},{-20,30},{1.83691e-15,30},{0,-10}}, color={0,0,255}));
  connect(C2.n,C4.p) annotation(Line(visible=true, points={{-20,30},{20,30}}, color={0,0,255}));
  connect(C2.n,C3.p) annotation(Line(visible=true, points={{-20,30},{1.83691e-15,30},{0,-10}}, color={0,0,255}));
  connect(L1.n,C2.n) annotation(Line(visible=true, points={{-20,70},{-20,30}}, color={0,0,255}));
  connect(L1.p,C1.p) annotation(Line(visible=true, points={{-40,70},{-40,30},{-60,30},{-60,-10}}, color={0,0,255}));
  connect(L1.p,C2.p) annotation(Line(visible=true, points={{-40,70},{-40,30}}, color={0,0,255}));
  connect(C1.n,G.p) annotation(Line(visible=true, points={{-60,-30},{-60,-50},{0,-50},{0,-70}}, color={0,0,255}));
  connect(R1.n,C1.p) annotation(Line(visible=true, points={{-80,30},{-60,30},{-60,-10}}, color={0,0,255}));
  connect(R1.n,C2.p) annotation(Line(visible=true, points={{-80,30},{-40,30}}, color={0,0,255}));
  connect(R1.p,V.p) annotation(Line(visible=true, points={{-100,30},{-100,0}}, color={0,0,255}));
end CauerLowPassAnalog;
