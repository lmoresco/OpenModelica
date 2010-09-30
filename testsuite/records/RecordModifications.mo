// name:     Record Modifications
// keywords: algorithm
// status:   correct

package HardMagnetic
public 
constant Real mu_0 = 3;
record BaseData
  parameter Real H_cBRef = 1;
  parameter Real B_rRef = 1;
  parameter Real T_ref = 293.15;
  parameter Real alpha_Br = 0;
  parameter Real T_op = 293.15;
  final parameter Real B_r = B_rRef * (1 + alpha_Br * (T_op - T_ref));
  final parameter Real H_cB = H_cBRef * (1 + alpha_Br * (T_op - T_ref));
  final parameter Real mu_r = B_r / (mu_0 * H_cB);
end BaseData;
record NdFeB
  extends HardMagnetic.BaseData(H_cBRef = 900000, B_rRef = 1.2, T_ref = 20 + 273.15, alpha_Br =  -0.001);
end NdFeB;
end HardMagnetic;

class RecordExtends
  HardMagnetic.NdFeB a = HardMagnetic.NdFeB();
end RecordExtends;

// Result:
// function HardMagnetic.NdFeB "Automatically generated record constructor for HardMagnetic.NdFeB"
// input Real H_cBRef = 900000.0;
// input Real B_rRef = 1.2;
// input Real T_ref = 293.15;
// input Real alpha_Br = -0.001;
// input Real T_op = 293.15;
// input Real B_r = B_rRef * (1.0 + alpha_Br * (T_op - T_ref));
// input Real H_cB = H_cBRef * (1.0 + alpha_Br * (T_op - T_ref));
// input Real mu_r = B_r * 1.0 / H_cB / 3.0;
// output NdFeB res;
// end HardMagnetic.NdFeB;
// 
// class RecordExtends
// parameter Real a.H_cBRef = 900000.0;
// parameter Real a.B_rRef = 1.2;
// parameter Real a.T_ref = 293.15;
// parameter Real a.alpha_Br = -0.001;
// parameter Real a.T_op = 293.15;
// parameter Real a.B_r = a.B_rRef * (1.0 + a.alpha_Br * (a.T_op - a.T_ref));
// parameter Real a.H_cB = a.H_cBRef * (1.0 + a.alpha_Br * (a.T_op - a.T_ref));
// parameter Real a.mu_r = a.B_r * 1.0 / a.H_cB / 3.0;
// end RecordExtends;
// endResult
