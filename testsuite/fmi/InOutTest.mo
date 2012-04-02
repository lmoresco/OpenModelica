within ;
model InOutTest

  Modelica.Blocks.Continuous.FirstOrder firstOrder
    annotation (Placement(transformation(extent={{-32,60},{-12,80}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-100,50},{-60,90}})));
  Modelica.Blocks.Continuous.PI PI
    annotation (Placement(transformation(extent={{8,60},{28,80}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{80,60},{100,80}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=1)
    annotation (Placement(transformation(extent={{42,60},{62,80}})));
  Modelica.Blocks.Interfaces.IntegerInput u1
    annotation (Placement(transformation(extent={{-100,-20},{-60,20}})));
  Modelica.Blocks.Interfaces.IntegerOutput y1
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  Modelica.Blocks.Interfaces.BooleanInput u2
    annotation (Placement(transformation(extent={{-100,-90},{-60,-50}})));
  Modelica.Blocks.Interfaces.BooleanOutput y2
    annotation (Placement(transformation(extent={{80,-80},{100,-60}})));
  Modelica.Blocks.MathInteger.TriggeredAdd triggeredAdd
    annotation (Placement(transformation(extent={{26,-6},{38,6}})));
  Modelica.Blocks.Logical.And and1
    annotation (Placement(transformation(extent={{12,-80},{32,-60}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0.2)
    annotation (Placement(transformation(extent={{-30,-58},{-10,-38}})));
equation
  connect(u, firstOrder.u) annotation (Line(
      points={{-80,70},{-34,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(firstOrder.y, PI.u) annotation (Line(
      points={{-11,70},{6,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PI.y, limiter.u) annotation (Line(
      points={{29,70},{40,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter.y, y) annotation (Line(
      points={{63,70},{90,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(u2, and1.u2) annotation (Line(
      points={{-80,-70},{-48,-70},{-48,-78},{10,-78}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(and1.y, y2) annotation (Line(
      points={{33,-70},{90,-70}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(greaterThreshold.y, and1.u1) annotation (Line(
      points={{-9,-48},{-2,-48},{-2,-70},{10,-70}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(greaterThreshold.u, u) annotation (Line(
      points={{-32,-48},{-40,-48},{-40,-46},{-44,-46},{-44,70},{-80,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(and1.y, triggeredAdd.trigger) annotation (Line(
      points={{33,-70},{46,-70},{46,-24},{28,-24},{28,-7.2},{28.4,-7.2}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(u1, triggeredAdd.u) annotation (Line(
      points={{-80,0},{23.6,0}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(triggeredAdd.y, y1) annotation (Line(
      points={{39.2,0},{90,0}},
      color={255,127,0},
      smooth=Smooth.None));
  annotation (uses(Modelica(version="3.2")), Diagram(graphics));
end InOutTest;
