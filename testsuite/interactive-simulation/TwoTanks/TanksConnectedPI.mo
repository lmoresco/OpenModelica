within TwoTanks;

block TanksConnectedPI
  LiquidSource  source(flowLevel = 0.02);
  Tank          tank1(area = 1);
  Tank          tank2(area = 1.3);
  PIcontinuousController piContinuous1(ref = 0.25);
  PIcontinuousController piContinuous2(ref = 0.4);
 equation
  connect(source.qOut, tank1.qIn);
  connect(piContinuous1.cOut, tank1.tActuator);
  connect(tank1.tSensor, piContinuous1.cIn);
  connect(tank1.qOut, tank2.qIn);
  connect(piContinuous2.cOut, tank2.tActuator);
  connect(tank2.tSensor, piContinuous2.cIn);
end TanksConnectedPI;