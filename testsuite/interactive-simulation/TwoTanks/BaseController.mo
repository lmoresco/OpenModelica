within TwoTanks;

partial block BaseController
  input  ReadSignal cIn  "Input sensor level, connector";
  output ActSignal  cOut "Control to actuator, connector";
  parameter Real Ts(unit = "s") = 0.1 "Time period between discrete samples";
  parameter Real K = 2 "Gain";
  parameter Real T(unit = "s") = 10 "Time constant";
  parameter Real ref "Reference level";
  Real error "Deviation from reference level";
  Real outCtr "Output control signal";
equation
  error = ref - cIn.val;
  cOut.act = outCtr;
end BaseController;