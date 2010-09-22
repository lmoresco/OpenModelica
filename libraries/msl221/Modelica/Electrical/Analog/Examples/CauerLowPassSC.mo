within Modelica.Electrical.Analog.Examples;
model CauerLowPassSC "Cauer low-pass filter with operational amplifiers and switched capacitors"
  model Rp
    annotation(uses(Modelica(version="2.2")), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, origin={0,0.97}, lineColor={0,0,255}, extent={{-80,-30.97},{80,29.03}}),Line(visible=true, points={{-92,0},{-80,0}}, color={127,127,255}),Line(visible=true, points={{80,0},{92,0}}, color={127,127,255}),Text(visible=true, extent={{-40,-72},{32,-40}}, textString="R=%R", fontName="Arial"),Line(visible=true, points={{-74,0},{-80,0},{-60,0}}, color={127,255,127}),Line(visible=true, points={{-80,-20},{-60,-20},{-60,-16},{-40,-10},{-4,-10}}, color={127,255,127}),Line(visible=true, points={{4,-10},{40,-10},{60,-16},{60,-20},{80,-20}}, color={127,255,127}),Line(visible=true, points={{80,0},{60,0}}, color={127,255,127}),Line(visible=true, points={{60,0},{60,-4}}, color={127,255,127}),Line(visible=true, points={{-60,0},{-60,-6}}, color={159,223,159}),Line(visible=true, points={{-4,0},{-4,-20}}, color={127,255,127}),Line(visible=true, points={{4,0},{4,-20}}, color={127,255,127}),Text(visible=true, fillColor={0,0,255}, extent={{-60,40},{60,80}}, textString="%name", fontName="Arial")}));
    parameter Real clock=1;
    parameter Modelica.SIunits.Resistance R=1 "Resistance";
    Modelica.Blocks.Sources.BooleanPulse BooleanPulse1(period=clock) annotation(Placement(visible=true, transformation(origin={0,60}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Electrical.Analog.Basic.Capacitor Capacitor1(C=R*clock) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch IdealCommutingSwitch1 annotation(Placement(visible=true, transformation(origin={-50,2.66454e-15}, extent={{10,10},{-10,-10}}, rotation=-360)));
    Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch IdealCommutingSwitch2 annotation(Placement(visible=true, transformation(origin={50,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(visible=true, transformation(origin={-60,44}, extent={{-5,-6},{5,6}}, rotation=-540)));
    Modelica.Electrical.Analog.Basic.Ground Ground2 annotation(Placement(visible=true, transformation(origin={60,-46}, extent={{-5,-6},{5,6}}, rotation=0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation(Placement(visible=true, transformation(origin={-102,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-102,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation(Placement(visible=true, transformation(origin={100,-4.44089e-16}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,2}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    connect(IdealCommutingSwitch1.p,Capacitor1.p) annotation(Line(visible=true, origin={-30,2.55691e-15}, points={{-10,2.55691e-15},{10,-2.55691e-15}}, color={0,0,255}));
    connect(Capacitor1.n,IdealCommutingSwitch2.p) annotation(Line(visible=true, points={{20,0},{40,0}}, color={0,0,255}));
    connect(IdealCommutingSwitch2.control,BooleanPulse1.y) annotation(Line(visible=true, points={{50,8},{50,30},{20,30},{20,60},{11,60}}, color={255,0,255}));
    connect(IdealCommutingSwitch1.control,BooleanPulse1.y) annotation(Line(visible=true, points={{-50,-8},{-50,30},{20,30},{20,60},{11,60}}, color={255,0,255}));
    connect(Ground1.p,IdealCommutingSwitch1.n2) annotation(Line(visible=true, points={{-60,38},{-60,2.15242e-16}}, color={0,0,255}));
    connect(Ground2.p,IdealCommutingSwitch2.n2) annotation(Line(visible=true, points={{60,-40},{60,0}}, color={0,0,255}));
    connect(IdealCommutingSwitch1.n1,n1) annotation(Line(visible=true, origin={19,0}, points={{-79,-5},{-99,-5},{-99,0},{-121,0}}, color={0,0,255}));
    connect(IdealCommutingSwitch2.n1,n2) annotation(Line(visible=true, points={{60,5},{80,5},{80,-4.44089e-16},{100,-4.44089e-16}}, color={0,0,255}));
  end Rp;

  model Rn
    parameter Real clock=1;
    parameter Modelica.SIunits.Resistance R=1 "Resistance";
    annotation(uses(Modelica(version="2.2")), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, origin={0,-0.97}, lineColor={0,0,255}, extent={{-80,-29.03},{80,30.97}}),Text(visible=true, extent={{-30,-72},{30,-40}}, textString="R=%R", fontName="Arial"),Line(visible=true, points={{-74,0},{-80,0},{-60,0}}, color={127,255,127}),Line(visible=true, points={{-80,-20},{-60,-20},{-60,-16},{-40,-8},{-4,-8}}, color={127,255,127}),Line(visible=true, points={{80,0},{60,0}}, color={127,255,127}),Line(visible=true, points={{-60,2},{-60,-4}}, color={159,223,159}),Line(visible=true, points={{-4,2},{-4,-18}}, color={127,255,127}),Line(visible=true, points={{4,2},{4,-18}}, color={127,255,127}),Text(visible=true, fillColor={0,0,255}, extent={{-60,40},{60,80}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-92,0},{-80,0}}, color={127,127,255}),Line(visible=true, points={{90,0},{80,0},{80,0}}, color={127,127,255}),Line(visible=true, points={{4,-8},{40,-8},{60,-4}}, color={127,255,127}),Line(visible=true, points={{60,0},{60,-4}}, color={127,255,127}),Line(visible=true, points={{60,-16},{60,-20},{80,-20}}, color={127,255,127})}));
    Modelica.Blocks.Sources.BooleanPulse BooleanPulse1(period=clock) annotation(Placement(visible=true, transformation(origin={0,60}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Electrical.Analog.Basic.Capacitor Capacitor1(C=R*clock) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch IdealCommutingSwitch1 annotation(Placement(visible=true, transformation(origin={-50,0}, extent={{-10,-10},{10,10}}, rotation=-180)));
    Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch IdealCommutingSwitch2 annotation(Placement(visible=true, transformation(origin={50,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(visible=true, transformation(origin={-60,-26}, extent={{-6,-6},{6,6}}, rotation=0)));
    Modelica.Electrical.Analog.Basic.Ground Ground2 annotation(Placement(visible=true, transformation(origin={60,-26}, extent={{-6,-6},{6,6}}, rotation=0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation(Placement(visible=true, transformation(origin={-102,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-102,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation(Placement(visible=true, transformation(origin={100,4.44089e-16}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,2}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    connect(IdealCommutingSwitch1.p,Capacitor1.p) annotation(Line(visible=true, points={{-40,0},{-20,0}}, color={0,0,255}));
    connect(Capacitor1.n,IdealCommutingSwitch2.p) annotation(Line(visible=true, points={{20,0},{40,0}}, color={0,0,255}));
    connect(IdealCommutingSwitch2.control,BooleanPulse1.y) annotation(Line(visible=true, points={{50,8},{50,30},{20,30},{20,60},{11,60}}, color={255,0,255}));
    connect(IdealCommutingSwitch1.control,BooleanPulse1.y) annotation(Line(visible=true, points={{-50,-8},{-50,30},{20,30},{20,60},{11,60}}, color={255,0,255}));
    connect(Ground2.p,IdealCommutingSwitch2.n2) annotation(Line(visible=true, points={{60,-20},{60,0}}, color={0,0,255}));
    connect(IdealCommutingSwitch2.n1,n2) annotation(Line(visible=true, points={{60,5},{80,5},{80,0},{100,4.44089e-16}}, color={0,0,255}));
    connect(n1,IdealCommutingSwitch1.n2) annotation(Line(visible=true, points={{-102,0},{-60,0}}, color={0,0,255}));
    connect(Ground1.p,IdealCommutingSwitch1.n1) annotation(Line(visible=true, points={{-60,-20},{-60,-5}}, color={0,0,255}));
  end Rn;

  annotation(uses(Modelica(version="2.2")), experiment(StopTime=60, NumberOfIntervals=1500), experimentSetupOutput, Documentation(revisions="<html>
<ul>
<li><i>January 13, 2006</i> 
       by Christoph Clauss<br>
       included into Modelica Standard Library</li>
<li><i>September 15, 2005</i>
       by by Peter Trappe designed and by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</html>", info="<html>
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
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{80,50}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}),Text(visible=true, fillColor={0,0,255}, extent={{-96,-49},{77,3}}, textString="Example", fontName="Arial"),Text(visible=true, fillColor={255,0,0}, extent={{-120,73},{120,132}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-250,200},{250,-200}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,140},{94,180}}, textString="CauerLowPassSC", fontName="Arial")}));
  parameter Real l1=1.304;
  parameter Real l2=0.8586;
  parameter Real c1=1.072;
  parameter Real c2=1/(1.704992^2*l1);
  parameter Real c3=1.682;
  parameter Real c4=1/(1.179945^2*l2);
  parameter Real c5=0.7262;
  Modelica.Electrical.Analog.Basic.Capacitor C1(C=c1 + c2) annotation(Placement(visible=true, transformation(origin={-183,40}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C2(C=c2) annotation(Placement(visible=true, transformation(origin={-231,-60}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C3(C=l1) annotation(Placement(visible=true, transformation(origin={-81,40}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C4(C=c4) annotation(Placement(visible=true, transformation(origin={-21,60}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C5(C=c2) annotation(Placement(visible=true, transformation(origin={-21,-90}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op1 annotation(Placement(visible=true, transformation(origin={-181,-30}, extent={{-20,-20},{20,20}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground G annotation(Placement(visible=true, transformation(origin={-182,-68}, extent={{-7,-8},{7,8}}, rotation=0)));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op2 annotation(Placement(visible=true, transformation(origin={-81,-30}, extent={{-20,-20},{20,20}}, rotation=0)));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op3 annotation(Placement(visible=true, transformation(origin={25,-30}, extent={{-20,-20},{20,20}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground G1 annotation(Placement(visible=true, transformation(origin={-81,-68}, extent={{-7,-8},{7,8}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C6(C=c2 + c3 + c4) annotation(Placement(visible=true, transformation(origin={18,40}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op4 annotation(Placement(visible=true, transformation(origin={119,-30}, extent={{-20,-20},{20,20}}, rotation=0)));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin Op5 annotation(Placement(visible=true, transformation(origin={219,-30}, extent={{-20,-20},{20,20}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C7(C=l2) annotation(Placement(visible=true, transformation(origin={119,40}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C8(C=c4) annotation(Placement(visible=true, transformation(origin={169,-120}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor C9(C=c4 + c5) annotation(Placement(visible=true, transformation(origin={217,20}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground G2 annotation(Placement(visible=true, transformation(origin={18,-68}, extent={{-7,-8},{7,8}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground G3 annotation(Placement(visible=true, transformation(origin={119,-68}, extent={{-7,-8},{7,8}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground G4 annotation(Placement(visible=true, transformation(origin={219,-68}, extent={{-7,-8},{7,8}}, rotation=0)));
  Modelica.Electrical.Analog.Sources.StepVoltage V(startTime=1) annotation(Placement(visible=true, transformation(origin={-241,-150}, extent={{-10,-10},{10,10}}, rotation=90)));
  Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(visible=true, transformation(origin={-241,-176}, extent={{-6,-6},{6,6}}, rotation=0)));
  Rn R4(clock=0.1) annotation(Placement(visible=true, transformation(origin={-130,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
  Rn R5(clock=0.1) annotation(Placement(visible=true, transformation(origin={-130,-70}, extent={{-10,-10},{10,10}}, rotation=0)));
  Rn R8(clock=0.1) annotation(Placement(visible=true, transformation(origin={70,20}, extent={{-10,-10},{10,10}}, rotation=0)));
  Rn R9(clock=0.1) annotation(Placement(visible=true, transformation(origin={70,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
  Rp R1(clock=0.1) annotation(Placement(visible=true, transformation(origin={-230,-20}, extent={{-10,-10},{10,10}}, rotation=0)));
  Rp R2(clock=0.1) annotation(Placement(visible=true, transformation(origin={-230,20}, extent={{-10,-10},{10,10}}, rotation=0)));
  Rp R3(clock=0.1) annotation(Placement(visible=true, transformation(origin={-190,80}, extent={{-10,-10},{10,10}}, rotation=0)));
  Rp Rp1(clock=0.1) annotation(Placement(visible=true, transformation(origin={-22,20}, extent={{-10,-10},{10,10}}, rotation=0)));
  Rp R7(clock=0.1) annotation(Placement(visible=true, transformation(origin={-22,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
  Rp R10(clock=0.1) annotation(Placement(visible=true, transformation(origin={170,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
  Rp R11(clock=0.1) annotation(Placement(visible=true, transformation(origin={218,60}, extent={{-10,-10},{10,10}}, rotation=0)));
protected 
  Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation(Placement(visible=true, transformation(origin={-213,-20}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation(Placement(visible=true, transformation(origin={-213,20}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n3 annotation(Placement(visible=true, transformation(origin={-213,40}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n4 annotation(Placement(visible=true, transformation(origin={-161,40}, extent={{2,2},{-2,-2}}, rotation=-180)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n5 annotation(Placement(visible=true, transformation(origin={-113,-30}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin p1 annotation(Placement(visible=true, transformation(origin={-152,-120}, extent={{-3,-2},{3,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n6 annotation(Placement(visible=true, transformation(origin={-61,40}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n7 annotation(Placement(visible=true, transformation(origin={-5,-30}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n8 annotation(Placement(visible=true, transformation(origin={-5,20}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin p2 annotation(Placement(visible=true, transformation(origin={-5,40}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin out1 annotation(Placement(visible=true, transformation(origin={45,-120}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin p3 annotation(Placement(visible=true, transformation(origin={59,80}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n9 annotation(Placement(visible=true, transformation(origin={87,20}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n10 annotation(Placement(visible=true, transformation(origin={87,-30}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n11 annotation(Placement(visible=true, transformation(origin={139,40}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n12 annotation(Placement(visible=true, transformation(origin={239,60}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n13 annotation(Placement(visible=true, transformation(origin={239,20}, extent={{-2,-2},{2,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin p4 annotation(Placement(visible=true, transformation(origin={190,20}, extent={{-3,-2},{3,2}}, rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin n14 annotation(Placement(visible=true, transformation(origin={190,-30}, extent={{-3,-2},{3,2}}, rotation=0)));
equation 
  connect(R11.n1,p4) annotation(Line(visible=true, points={{207.8,60},{190,60},{190,20}}, color={0,0,255}));
  connect(R11.n2,n12) annotation(Line(visible=true, points={{228,60.2},{234,60.2},{234,60},{239,60}}, color={0,0,255}));
  connect(R10.n2,n14) annotation(Line(visible=true, points={{180,-29.8},{186,-29.8},{186,-30},{190,-30}}, color={0,0,255}));
  connect(R10.n1,Op4.out) annotation(Line(visible=true, points={{159.8,-30},{139,-30}}, color={0,0,255}));
  connect(R7.n2,n7) annotation(Line(visible=true, points={{-12,-29.8},{-8,-29.8},{-8,-30},{-5,-30}}, color={0,0,255}));
  connect(Op2.out,R7.n1) annotation(Line(visible=true, points={{-61,-30},{-32.2,-30}}, color={0,0,255}));
  connect(Rp1.n1,n11) annotation(Line(visible=true, points={{-32.2,20},{-52,20},{-52,100},{139,100},{139,40}}, color={0,0,255}));
  connect(Rp1.n2,n8) annotation(Line(visible=true, points={{-12,20.2},{-8,20.2},{-8,20},{-5,20}}, color={0,0,255}));
  connect(R3.n2,n4) annotation(Line(visible=true, points={{-180,80.2},{-170,80.2},{-170,80},{-161,80},{-161,40}}, color={0,0,255}));
  connect(R3.n1,n3) annotation(Line(visible=true, points={{-200.2,80},{-213,80},{-213,40}}, color={0,0,255}));
  connect(R2.n1,n6) annotation(Line(visible=true, points={{-240.2,20},{-240,20},{-240,100},{-61,100},{-61,40}}, color={0,0,255}));
  connect(R2.n2,n2) annotation(Line(visible=true, points={{-220,20.2},{-218,20.2},{-218,20},{-213,20}}, color={0,0,255}));
  connect(R1.n2,n1) annotation(Line(visible=true, points={{-220,-19.8},{-216,-19.8},{-216,-20},{-213,-20}}, color={0,0,255}));
  connect(R1.n1,V.n) annotation(Line(visible=true, points={{-240.2,-20},{-250,-20},{-250,-130},{-241,-130},{-241,-160}}, color={0,0,255}));
  connect(R9.n2,n10) annotation(Line(visible=true, points={{80,-29.8},{84,-29.8},{84,-30},{87,-30}}, color={0,0,255}));
  connect(Op3.out,R9.n1) annotation(Line(visible=true, points={{45,-30},{59.8,-30}}, color={0,0,255}));
  connect(R8.n2,n9) annotation(Line(visible=true, points={{80,20.2},{84,20.2},{84,20},{87,20}}, color={0,0,255}));
  connect(p3,R8.n1) annotation(Line(visible=true, points={{59,80},{59.8,80},{59.8,20}}, color={0,0,255}));
  connect(R5.n2,n5) annotation(Line(visible=true, points={{-120,-69.8},{-116,-69.8},{-116,-70},{-113,-70},{-113,-30}}, color={0,0,255}));
  connect(R5.n1,p1) annotation(Line(visible=true, points={{-140.2,-70},{-152,-70},{-152,-120}}, color={0,0,255}));
  connect(Op1.out,R4.n1) annotation(Line(visible=true, points={{-161,-30},{-140.2,-30}}, color={0,0,255}));
  connect(R4.n2,n5) annotation(Line(visible=true, points={{-120,-29.8},{-116,-29.8},{-116,-30},{-113,-30}}, color={0,0,255}));
  connect(V.p,Ground1.p) annotation(Line(visible=true, points={{-241,-140},{-241,-170}}, color={0,0,255}));
  connect(Op5.in_p,G4.p) annotation(Line(visible=true, points={{199,-40},{199,-60},{219,-60}}, color={0,0,255}));
  connect(Op4.in_p,G3.p) annotation(Line(visible=true, points={{99,-40},{99,-60},{119,-60}}, color={0,0,255}));
  connect(C8.n,n14) annotation(Line(visible=true, points={{179,-120},{190,-120},{190,-30}}, color={0,0,255}));
  connect(Op5.in_n,n14) annotation(Line(visible=true, points={{199,-20},{190,-20},{190,-30}}, color={0,0,255}));
  connect(p4,n14) annotation(Line(visible=true, points={{190,20},{190,-30}}, color={0,0,255}));
  connect(C9.p,p4) annotation(Line(visible=true, points={{207,20},{190,20}}, color={0,0,255}));
  connect(n13,Op5.out) annotation(Line(visible=true, points={{239,20},{239,-30}}, color={0,0,255}));
  connect(n12,n13) annotation(Line(visible=true, points={{239,60},{239,20}}, color={0,0,255}));
  connect(C9.n,n13) annotation(Line(visible=true, points={{227,20},{239,20}}, color={0,0,255}));
  connect(p3,n12) annotation(Line(visible=true, points={{59,80},{239,80},{239,60}}, color={0,0,255}));
  connect(G2.p,Op3.in_p) annotation(Line(visible=true, points={{18,-60},{5,-60},{5,-40}}, color={0,0,255}));
  connect(n11,Op4.out) annotation(Line(visible=true, points={{139,40},{139,-30}}, color={0,0,255}));
  connect(C7.n,n11) annotation(Line(visible=true, points={{129,40},{139,40}}, color={0,0,255}));
  connect(n9,C7.p) annotation(Line(visible=true, points={{87,20},{87,40},{109,40}}, color={0,0,255}));
  connect(n10,Op4.in_n) annotation(Line(visible=true, points={{87,-30},{87,-20},{99,-20}}, color={0,0,255}));
  connect(n9,n10) annotation(Line(visible=true, points={{87,20},{87,-30}}, color={0,0,255}));
  connect(C4.p,p3) annotation(Line(visible=true, points={{-31,60},{-41,60},{-41,80},{59,80}}, color={0,0,255}));
  connect(out1,C8.p) annotation(Line(visible=true, points={{45,-120},{159,-120}}, color={0,0,255}));
  connect(p1,out1) annotation(Line(visible=true, points={{-152,-120},{45,-120}}, color={0,0,255}));
  connect(Op3.out,out1) annotation(Line(visible=true, points={{45,-30},{45,-120}}, color={0,0,255}));
  connect(C6.n,Op3.out) annotation(Line(visible=true, points={{28,40},{45,40},{45,-30}}, color={0,0,255}));
  connect(C4.n,p2) annotation(Line(visible=true, points={{-11,60},{-5,60},{-5,40}}, color={0,0,255}));
  connect(n8,p2) annotation(Line(visible=true, points={{-5,20},{-5,40}}, color={0,0,255}));
  connect(C6.p,p2) annotation(Line(visible=true, points={{8,40},{-5,40}}, color={0,0,255}));
  connect(n7,n8) annotation(Line(visible=true, points={{-5,-30},{-5,20}}, color={0,0,255}));
  connect(C5.n,n7) annotation(Line(visible=true, points={{-11,-90},{-5,-90},{-5,-30}}, color={0,0,255}));
  connect(n7,Op3.in_n) annotation(Line(visible=true, points={{-5,-30},{-5,-20},{5,-20}}, color={0,0,255}));
  connect(n6,Op2.out) annotation(Line(visible=true, points={{-61,40},{-61,-30}}, color={0,0,255}));
  connect(C3.n,n6) annotation(Line(visible=true, points={{-71,40},{-61,40}}, color={0,0,255}));
  connect(C2.p,p1) annotation(Line(visible=true, points={{-241,-60},{-241,-120},{-152,-120}}, color={0,0,255}));
  connect(C3.p,n5) annotation(Line(visible=true, points={{-91,40},{-113,40},{-113,-30}}, color={0,0,255}));
  connect(n5,Op2.in_n) annotation(Line(visible=true, points={{-113,-30},{-113,-20},{-101,-20}}, color={0,0,255}));
  connect(C5.p,Op1.out) annotation(Line(visible=true, points={{-31,-90},{-161,-90},{-161,-30}}, color={0,0,255}));
  connect(n4,Op1.out) annotation(Line(visible=true, points={{-161,40},{-161,-30}}, color={0,0,255}));
  connect(C1.n,n4) annotation(Line(visible=true, points={{-173,40},{-161,40}}, color={0,0,255}));
  connect(n3,C1.p) annotation(Line(visible=true, points={{-213,40},{-193,40}}, color={0,0,255}));
  connect(n2,n3) annotation(Line(visible=true, points={{-213,20},{-213,40}}, color={0,0,255}));
  connect(n1,n2) annotation(Line(visible=true, points={{-213,-20},{-213,20}}, color={0,0,255}));
  connect(C2.n,n1) annotation(Line(visible=true, points={{-221,-60},{-213,-60},{-213,-20}}, color={0,0,255}));
  connect(n1,Op1.in_n) annotation(Line(visible=true, points={{-213,-20},{-201,-20}}, color={0,0,255}));
  connect(G1.p,Op2.in_p) annotation(Line(visible=true, points={{-81,-60},{-81,-50},{-101,-50},{-101,-40}}, color={0,0,255}));
  connect(Op1.in_p,G.p) annotation(Line(visible=true, points={{-201,-40},{-201,-50},{-181,-50},{-181,-60},{-182,-60}}, color={0,0,255}));
end CauerLowPassSC;
