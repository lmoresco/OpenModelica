within TwoTanks;

block LiquidSource
  output LiquidFlow qOut;
  parameter Real flowLevel = 0.02;
equation
  qOut.lflow = flowLevel;
end LiquidSource;