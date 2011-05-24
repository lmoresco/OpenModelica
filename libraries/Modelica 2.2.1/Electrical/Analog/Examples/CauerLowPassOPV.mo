within Modelica.Electrical.Analog.Examples;
model CauerLowPassOPV "Cauer low pass filter with operational amplifiers"
  annotation(uses(Modelica(version="2.2")), experiment(StopTime=60), experimentSetupOutput, Documentation(revisions="<html>
<ul>
<li><i>January 13, 2006</i> 
       by Christoph Clauss<br>
       included into Modelica Standard Library</li>
<li><i>September 15, 2005</i>
       by by Peter Trappe designed and by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</html>", info="<html>
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
</html>"), Diagram(coordinateSystem(extent={{-250,200},{250,-200}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-130,120},{80,172}}, textString="CauerLowPassOPV", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{80,50}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}),Text(visible=true, fillColor={0,0,255}, extent={{-96,-49},{77,3}}, textString="Example", fontName="Arial"),Text(visible=true, fillColor={255,0,0}, extent={{-120,73},{120,132}}, textString="%name", fontName="Arial")}));
  parameter Real l1=1.304;
  parameter Real l2=0.8586;
  parameter Real c1=1.072;
  parameter Real c2=1/(1.704992^2*l1);
  parameter Real c3=1.682;
  parameter Real c4=1/(1.179945^2*l2);
  parameter Real c5=0.7262;
  Modelica.Electrical.Analog.Basic.Capacitor C1(C=c1 + c2) annotation(Placement(visible=true, transformation(origin={-182,20}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C2(C=c2) annotation(Placement(visible=true, transformation(origin={-230,-80}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C3(C=l1) annotation(Placement(visible=true, transformation(origin={-80,20}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C4(C=c4) annotation(Placement(visible=true, transformation(origin={-20,40}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C5(C=c2) annotation(Placement(visible=true, transformation(origin={-20,-110}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R1 annotation(Placement(visible=true, transformation(origin={-230,-40}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R2 annotation(Placement(visible=true, transformation(origin={-230,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R3 annotation(Placement(visible=true, transformation(origin={-183,60}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op1 annotation(Placement(visible=true, transformation(origin={-180,-50}, extent={{-20,-20},{20,20}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground G annotation(Placement(visible=true, transformation(origin={-181,-88}, extent={{-7,-8},{7,8}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R4(R=-1) annotation(Placement(visible=true, transformation(origin={-130,-50}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R5(R=-1) annotation(Placement(visible=true, transformation(origin={-130,-90}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op2 annotation(Placement(visible=true, transformation(origin={-80,-50}, extent={{-20,-20},{20,20}}, rotation=0)));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op3 annotation(Placement(visible=true, transformation(origin={26,-50}, extent={{-20,-20},{20,20}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground G1 annotation(Placement(visible=true, transformation(origin={-80,-88}, extent={{-7,-8},{7,8}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R6 annotation(Placement(visible=true, transformation(origin={-21,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R7 annotation(Placement(visible=true, transformation(origin={-21,-50}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C6(C=c2 + c3 + c4) annotation(Placement(visible=true, transformation(origin={19,20}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R8(R=-1) annotation(Placement(visible=true, transformation(origin={70,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R9(R=-1) annotation(Placement(visible=true, transformation(origin={70,-50}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R10 annotation(Placement(visible=true, transformation(origin={170,-50}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op4 annotation(Placement(visible=true, transformation(origin={120,-50}, extent={{-20,-20},{20,20}}, rotation=0)));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op5 annotation(Placement(visible=true, transformation(origin={220,-50}, extent={{-20,-20},{20,20}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C7(C=l2) annotation(Placement(visible=true, transformation(origin={120,20}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C8(C=c4) annotation(Placement(visible=true, transformation(origin={170,-140}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C9(C=c4 + c5) annotation(Placement(visible=true, transformation(origin={218,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R11 annotation(Placement(visible=true, transformation(origin={219,40}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground G2 annotation(Placement(visible=true, transformation(origin={19,-88}, extent={{-7,-8},{7,8}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground G3 annotation(Placement(visible=true, transformation(origin={120,-88}, extent={{-7,-8},{7,8}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground G4 annotation(Placement(visible=true, transformation(origin={220,-88}, extent={{-7,-8},{7,8}}, rotation=0)));
  Modelica.Electrical.Analog.Sources.StepVoltage V(startTime=1) annotation(Placement(visible=true, transformation(origin={-240,-170}, extent={{-10,-10},{10,10}}, rotation=90)));
  Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(visible=true, transformation(origin={-240,-196}, extent={{-6,-6},{6,6}}, rotation=0)));
protected 
  Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation(Placement(visible=true, transformation(origin={-212,-40}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation(Placement(visible=true, transformation(origin={-212,0}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n3 annotation(Placement(visible=true, transformation(origin={-212,20}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n4 annotation(Placement(visible=true, transformation(origin={-160,20}, extent={{2,2},{-2,-2}}, rotation=-180)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n5 annotation(Placement(visible=true, transformation(origin={-112,-50}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin p1 annotation(Placement(visible=true, transformation(origin={-151,-140}, extent={{-3,-2},{3,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n6 annotation(Placement(visible=true, transformation(origin={-60,20}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n7 annotation(Placement(visible=true, transformation(origin={-4,-50}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n8 annotation(Placement(visible=true, transformation(origin={-4,0}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin p2 annotation(Placement(visible=true, transformation(origin={-4,20}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin out1 annotation(Placement(visible=true, transformation(origin={46,-140}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin p3 annotation(Placement(visible=true, transformation(origin={60,60}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n9 annotation(Placement(visible=true, transformation(origin={88,0}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n10 annotation(Placement(visible=true, transformation(origin={88,-50}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n11 annotation(Placement(visible=true, transformation(origin={140,20}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n12 annotation(Placement(visible=true, transformation(origin={240,40}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n13 annotation(Placement(visible=true, transformation(origin={240,0}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin p4 annotation(Placement(visible=true, transformation(origin={191,0}, extent={{-3,-2},{3,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n14 annotation(Placement(visible=true, transformation(origin={191,-50}, extent={{-3,-2},{3,2}}, rotation=0)));
equation 
  connect(V.n,R1.p) annotation(Line(visible=true, points={{-240,-160},{-250,-160},{-250,-40},{-240,-40}}, color={0,0,255}));
  connect(V.p,Ground1.p) annotation(Line(visible=true, points={{-240,-180},{-240,-190}}, color={0,0,255}));
  connect(Op5.in_p,G4.p) annotation(Line(visible=true, points={{200,-60},{200,-80},{220,-80}}, color={0,0,255}));
  connect(Op4.in_p,G3.p) annotation(Line(visible=true, points={{100,-60},{100,-80},{120,-80}}, color={0,0,255}));
  connect(C8.n,n14) annotation(Line(visible=true, points={{180,-140},{191,-140},{191,-50}}, color={0,0,255}));
  connect(Op5.in_n,n14) annotation(Line(visible=true, points={{200,-40},{191,-40},{191,-50}}, color={0,0,255}));
  connect(p4,n14) annotation(Line(visible=true, points={{191,0},{191,-50}}, color={0,0,255}));
  connect(R10.n,n14) annotation(Line(visible=true, points={{180,-50},{191,-50}}, color={0,0,255}));
  connect(R11.p,p4) annotation(Line(visible=true, points={{209,40},{191,40},{191,0}}, color={0,0,255}));
  connect(C9.p,p4) annotation(Line(visible=true, points={{208,0},{191,0}}, color={0,0,255}));
  connect(n13,Op5.out) annotation(Line(visible=true, points={{240,0},{240,-50}}, color={0,0,255}));
  connect(n12,n13) annotation(Line(visible=true, points={{240,40},{240,0}}, color={0,0,255}));
  connect(C9.n,n13) annotation(Line(visible=true, points={{228,0},{240,0}}, color={0,0,255}));
  connect(p3,n12) annotation(Line(visible=true, points={{60,60},{240,60},{240,40}}, color={0,0,255}));
  connect(R11.n,n12) annotation(Line(visible=true, points={{229,40},{240,40}}, color={0,0,255}));
  connect(G2.p,Op3.in_p) annotation(Line(visible=true, points={{19,-80},{6,-80},{6,-60}}, color={0,0,255}));
  connect(Op4.out,R10.p) annotation(Line(visible=true, points={{140,-50},{160,-50}}, color={0,0,255}));
  connect(n11,Op4.out) annotation(Line(visible=true, points={{140,20},{140,-50}}, color={0,0,255}));
  connect(R6.p,n11) annotation(Line(visible=true, points={{-31,0},{-48,0},{-48,80},{140,80},{140,20}}, color={0,0,255}));
  connect(C7.n,n11) annotation(Line(visible=true, points={{130,20},{140,20}}, color={0,0,255}));
  connect(n9,C7.p) annotation(Line(visible=true, points={{88,0},{88,20},{110,20}}, color={0,0,255}));
  connect(n10,Op4.in_n) annotation(Line(visible=true, points={{88,-50},{88,-40},{100,-40}}, color={0,0,255}));
  connect(R9.n,n10) annotation(Line(visible=true, points={{80,-50},{88,-50}}, color={0,0,255}));
  connect(n9,n10) annotation(Line(visible=true, points={{88,0},{88,-50}}, color={0,0,255}));
  connect(R8.n,n9) annotation(Line(visible=true, points={{80,0},{88,0}}, color={0,0,255}));
  connect(p3,R8.p) annotation(Line(visible=true, points={{60,60},{60,0}}, color={0,0,255}));
  connect(C4.p,p3) annotation(Line(visible=true, points={{-30,40},{-40,40},{-40,60},{60,60}}, color={0,0,255}));
  connect(out1,C8.p) annotation(Line(visible=true, points={{46,-140},{160,-140}}, color={0,0,255}));
  connect(p1,out1) annotation(Line(visible=true, points={{-151,-140},{46,-140}}, color={0,0,255}));
  connect(Op3.out,out1) annotation(Line(visible=true, points={{46,-50},{46,-140}}, color={0,0,255}));
  connect(R9.p,Op3.out) annotation(Line(visible=true, points={{60,-50},{46,-50}}, color={0,0,255}));
  connect(C6.n,Op3.out) annotation(Line(visible=true, points={{29,20},{46,20},{46,-50}}, color={0,0,255}));
  connect(C4.n,p2) annotation(Line(visible=true, points={{-10,40},{-4,40},{-4,20}}, color={0,0,255}));
  connect(n8,p2) annotation(Line(visible=true, points={{-4,0},{-4,20}}, color={0,0,255}));
  connect(C6.p,p2) annotation(Line(visible=true, points={{9,20},{-4,20}}, color={0,0,255}));
  connect(n7,n8) annotation(Line(visible=true, points={{-4,-50},{-4,0},{-4,0}}, color={0,0,255}));
  connect(R6.n,n8) annotation(Line(visible=true, points={{-11,0},{-4,0}}, color={0,0,255}));
  connect(C5.n,n7) annotation(Line(visible=true, points={{-10,-110},{-4,-110},{-4,-50}}, color={0,0,255}));
  connect(n7,Op3.in_n) annotation(Line(visible=true, points={{-4,-50},{-4,-40},{6,-40}}, color={0,0,255}));
  connect(R7.n,n7) annotation(Line(visible=true, points={{-11,-50},{-4,-50}}, color={0,0,255}));
  connect(Op2.out,R7.p) annotation(Line(visible=true, points={{-60,-50},{-31,-50}}, color={0,0,255}));
  connect(R2.p,n6) annotation(Line(visible=true, points={{-240,0},{-240,80},{-60,80},{-60,20}}, color={0,0,255}));
  connect(n6,Op2.out) annotation(Line(visible=true, points={{-60,20},{-60,-50}}, color={0,0,255}));
  connect(C3.n,n6) annotation(Line(visible=true, points={{-70,20},{-60,20}}, color={0,0,255}));
  connect(C2.p,p1) annotation(Line(visible=true, points={{-240,-80},{-240,-140},{-151,-140}}, color={0,0,255}));
  connect(R5.p,p1) annotation(Line(visible=true, points={{-140,-90},{-151,-90},{-151,-140}}, color={0,0,255}));
  connect(R5.n,n5) annotation(Line(visible=true, points={{-120,-90},{-112,-90},{-112,-50}}, color={0,0,255}));
  connect(C3.p,n5) annotation(Line(visible=true, points={{-90,20},{-112,20},{-112,-50}}, color={0,0,255}));
  connect(n5,Op2.in_n) annotation(Line(visible=true, points={{-112,-50},{-112,-40},{-100,-40}}, color={0,0,255}));
  connect(R4.n,n5) annotation(Line(visible=true, points={{-120,-50},{-112,-50}}, color={0,0,255}));
  connect(C5.p,Op1.out) annotation(Line(visible=true, points={{-30,-110},{-160,-110},{-160,-50}}, color={0,0,255}));
  connect(R4.p,Op1.out) annotation(Line(visible=true, points={{-140,-50},{-160,-50}}, color={0,0,255}));
  connect(n4,Op1.out) annotation(Line(visible=true, points={{-160,20},{-160,-50}}, color={0,0,255}));
  connect(R3.n,n4) annotation(Line(visible=true, points={{-173,60},{-160,60},{-160,20}}, color={0,0,255}));
  connect(C1.n,n4) annotation(Line(visible=true, points={{-172,20},{-160,20}}, color={0,0,255}));
  connect(n3,R3.p) annotation(Line(visible=true, points={{-212,20},{-212,60},{-193,60}}, color={0,0,255}));
  connect(n3,C1.p) annotation(Line(visible=true, points={{-212,20},{-192,20}}, color={0,0,255}));
  connect(n2,n3) annotation(Line(visible=true, points={{-212,0},{-212,20}}, color={0,0,255}));
  connect(n1,n2) annotation(Line(visible=true, points={{-212,-40},{-212,0}}, color={0,0,255}));
  connect(R2.n,n2) annotation(Line(visible=true, points={{-220,0},{-212,0}}, color={0,0,255}));
  connect(C2.n,n1) annotation(Line(visible=true, points={{-220,-80},{-212,-80},{-212,-40}}, color={0,0,255}));
  connect(n1,Op1.in_n) annotation(Line(visible=true, points={{-212,-40},{-200,-40}}, color={0,0,255}));
  connect(R1.n,n1) annotation(Line(visible=true, points={{-220,-40},{-212,-40}}, color={0,0,255}));
  connect(G1.p,Op2.in_p) annotation(Line(visible=true, points={{-80,-80},{-80,-70},{-100,-70},{-100,-60}}, color={0,0,255}));
  connect(Op1.in_p,G.p) annotation(Line(visible=true, points={{-200,-60},{-200,-70},{-180,-70},{-180,-80},{-181,-80}}, color={0,0,255}));
end CauerLowPassOPV;
