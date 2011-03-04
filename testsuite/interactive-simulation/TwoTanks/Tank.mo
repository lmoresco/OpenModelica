within TwoTanks;

block Tank
  output ReadSignal     tSensor     "Connector, sensor reading tank level (m)";
  input  ActSignal      tActuator   "Connector, actuator controlling input flow";
  input  LiquidFlow     qIn         "Connector, flow (m3/s) through input valve";
  output LiquidFlow     qOut        "Connector, flow (m3/s) through output valve";
  parameter Real area(unit = "m2")       =  0.5;
  parameter Real flowGain(start = 1.99, unit = "m2/s") = 0.5;
  parameter Real minV= 0, maxV = 10;    // Limits for output valve flow
  Boolean test;
  Real           h(start = 0.0, unit = "m")   "Tank level";
 equation
  test = if h < 0.30 then true else false;
  der(h)      = (qIn.lflow - qOut.lflow)/area;    // Mass balance equation
  qOut.lflow  = if (-flowGain*tActuator.act) >maxV then maxV
          else if (-flowGain*tActuator.act) <minV then minV
          else (-flowGain*tActuator.act);
  tSensor.val = h;
end Tank;