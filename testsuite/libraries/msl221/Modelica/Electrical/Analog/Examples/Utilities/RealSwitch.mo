within Modelica.Electrical.Analog.Examples.Utilities;
model RealSwitch
  annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  Interfaces.Pin n1 annotation(Placement(visible=true, transformation(origin={100,60}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,60}, extent={{-10,-10},{10,10}}, rotation=0)));
  Interfaces.Pin n2 annotation(Placement(visible=true, transformation(origin={100,14}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,14}, extent={{-10,-10},{10,10}}, rotation=0)));
  Interfaces.Pin p annotation(Placement(visible=true, transformation(origin={-100,37.5}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,40}, extent={{-10,-10},{10,10}}, rotation=0)));
  Basic.Resistor R(R=0.01) annotation(Placement(visible=true, transformation(origin={-45.8334,37.5}, extent={{-23.3333,-23.3333},{23.3333,23.3333}}, rotation=0)));
  Interfaces.Pin control annotation(Placement(visible=true, transformation(origin={35,100}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={34,100}, extent={{-10,-10},{10,10}}, rotation=0)));
  Ideal.ControlledIdealCommutingSwitch S(level=2.5) annotation(Placement(visible=true, transformation(origin={35.0947,37.5}, extent={{-23.3333,-23.3333},{23.3333,23.3333}}, rotation=0)));
equation 
  connect(p,R.p) annotation(Line(visible=true, points={{-100.0,37.5},{-69.1667,37.5}}, color={0,0,255}));
  connect(R.n,S.p) annotation(Line(visible=true, points={{-22.5001,37.5},{11.7614,37.5}}, color={0,0,255}));
  connect(n1,S.n1) annotation(Line(visible=true, origin={71.4891,54.5833}, points={{28.5109,5.4167},{-7.7249,5.4167},{-7.7249,-5.4167},{-13.0611,-5.4167}}, color={0,0,255}));
  connect(n2,S.n2) annotation(Line(visible=true, origin={71.4891,25.75}, points={{28.5109,-11.75},{-7.7249,-11.75},{-7.7249,11.75},{-13.0611,11.75}}, color={0,0,255}));
  connect(control,S.control) annotation(Line(visible=true, points={{35.0,100.0},{35.0947,60.8333}}, color={0,0,255}));
end RealSwitch;
