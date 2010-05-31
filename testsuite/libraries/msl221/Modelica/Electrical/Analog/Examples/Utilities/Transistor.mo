within Modelica.Electrical.Analog.Examples.Utilities;
model Transistor
  annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, extent={{-80.0,-80.0},{80.0,80.0}}),Line(visible=true, points={{80.0,60.0},{100.0,60.0}}, color={0,0,255}),Line(visible=true, points={{80.0,-60.0},{100.0,-60.0}}, color={0,0,255}),Line(visible=true, points={{-100.0,0.0},{-80.0,0.0}}, color={0,0,255}),Line(visible=true, points={{-60.0,0.0},{-10.0,0.0}}, color={0,0,255}),Line(visible=true, points={{-10.0,40.0},{-10.0,-40.0}}, color={0,0,255}),Line(visible=true, points={{60.0,60.0},{40.0,60.0},{-10.0,10.0}}, color={0,0,255}),Line(visible=true, points={{-10.0,-10.0},{40.0,-60.0},{60.0,-60.0}}, color={0,0,255})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  Basic.Resistor rtb(R=0.05) annotation(Placement(visible=true, transformation(origin={-70,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  Basic.Resistor rtc(R=0.1) annotation(Placement(visible=true, transformation(origin={50,10}, extent={{-10,-10},{10,10}}, rotation=0)));
  Semiconductors.NPN Tr(Bf=50, Br=0.1, Is=1e-16, Vak=0.02, Tauf=1.2e-10, Taur=5e-09, Ccs=1e-12, Cje=4e-13, Cjc=5e-13, Phie=0.8, Me=0.4, Phic=0.8, Mc=0.333, Gbc=1e-15, Gbe=1e-15, Vt=0.02585) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-20,-20},{20,20}}, rotation=0)));
  Basic.Ground Ground1 annotation(Placement(visible=true, transformation(origin={-40,-70}, extent={{-10,-10},{10,10}}, rotation=0)));
  Interfaces.Pin c annotation(Placement(visible=true, transformation(origin={100,60}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,60}, extent={{-10,-10},{10,10}}, rotation=0)));
  Interfaces.Pin b annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  Interfaces.Pin e annotation(Placement(visible=true, transformation(origin={100,-60}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,-60}, extent={{-10,-10},{10,10}}, rotation=0)));
  Basic.Capacitor ct(C=1e-10) annotation(Placement(visible=true, transformation(origin={-40,-30}, extent={{-10,-10},{10,10}}, rotation=-90)));
equation 
  connect(Tr.E,e) annotation(Line(visible=true, points={{20.0,-10.0},{80.0,-10.0},{80.0,-60.0},{100.0,-60.0}}, color={0,0,255}));
  connect(b,rtb.p) annotation(Line(visible=true, points={{-100.0,0.0},{-80.0,0.0}}, color={0,0,255}));
  connect(rtc.n,c) annotation(Line(visible=true, points={{60.0,10.0},{80.0,10.0},{80.0,60.0},{100.0,60.0}}, color={0,0,255}));
  connect(Tr.C,rtc.p) annotation(Line(visible=true, points={{20.0,10.0},{40.0,10.0}}, color={0,0,255}));
  connect(rtb.n,Tr.B) annotation(Line(visible=true, points={{-60.0,0.0},{-20.0,0.0}}, color={0,0,255}));
  connect(rtb.n,ct.p) annotation(Line(visible=true, points={{-60.0,0.0},{-40.0,0.0},{-40.0,-20.0}}, color={0,0,255}));
  connect(ct.n,Ground1.p) annotation(Line(visible=true, points={{-40.0,-40.0},{-40.0,-60.0}}, color={0,0,255}));
end Transistor;
