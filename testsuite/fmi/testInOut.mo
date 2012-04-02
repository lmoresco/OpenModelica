within ;
model testInOut

  InOutTest inOutTest
    annotation (Placement(transformation(extent={{-22,60},{-2,80}})));
  Modelica.Blocks.Sources.Sine sine
    annotation (Placement(transformation(extent={{-92,66},{-72,86}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{62,60},{82,80}})));
  FMUImport_InOutTest.FMUBlock inOutTest_fmu
    annotation (Placement(transformation(extent={{-20,26},{0,46}})));
  Modelica.Blocks.Sources.IntegerStep integerStep(startTime=0.2)
    annotation (Placement(transformation(extent={{-92,14},{-72,34}})));
  Modelica.Blocks.Sources.BooleanStep booleanStep(startTime=0.2)
    annotation (Placement(transformation(extent={{-90,-34},{-70,-14}})));
  Modelica.Blocks.MathBoolean.And and1(nu=2)
    annotation (Placement(transformation(extent={{64,-18},{76,-6}})));
  Modelica.Blocks.MathInteger.Sum sum(nu=2, k={1,-1})
    annotation (Placement(transformation(extent={{66,30},{78,42}})));
equation
  connect(sine.y, inOutTest.u) annotation (Line(
      points={{-71,76},{-42,76},{-42,77},{-20,77}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(inOutTest.y, add.u1) annotation (Line(
      points={{-3,77},{12.1,77},{12.1,76},{60,76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine.y, inOutTest_fmu.u) annotation (Line(
      points={{-71,76},{-56,76},{-56,41},{-20.4,41}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(inOutTest_fmu.y, add.u2) annotation (Line(
      points={{0.4,41},{34,41},{34,64},{60,64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integerStep.y, inOutTest_fmu.u1) annotation (Line(
      points={{-71,24},{-62,24},{-62,36},{-20.4,36}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(booleanStep.y, inOutTest_fmu.u2) annotation (Line(
      points={{-69,-24},{-48,-24},{-48,31},{-20.4,31}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booleanStep.y, inOutTest.u2) annotation (Line(
      points={{-69,-24},{-48,-24},{-48,63},{-20,63}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(integerStep.y, inOutTest.u1) annotation (Line(
      points={{-71,24},{-62,24},{-62,70},{-20,70}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(inOutTest.y2, and1.u[1]) annotation (Line(
      points={{-3,63},{32,63},{32,-9.9},{64,-9.9}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(inOutTest_fmu.y2, and1.u[2]) annotation (Line(
      points={{0.4,31},{32,31},{32,-14.1},{64,-14.1}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(inOutTest.y1, sum.u[1]) annotation (Line(
      points={{-3,70},{32,70},{32,38.1},{66,38.1}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(inOutTest_fmu.y1, sum.u[2]) annotation (Line(
      points={{0.4,36},{34,36},{34,33.9},{66,33.9}},
      color={255,127,0},
      smooth=Smooth.None));
  annotation (uses(Modelica(version="3.2")), Diagram(graphics));
end testInOut;
