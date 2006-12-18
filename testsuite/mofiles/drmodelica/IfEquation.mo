// name:     IfEquation
// keywords: if
// status:   correct
// 


class IfEquation
  parameter Real u;
  parameter Real uMax;
  parameter Real uMin;
  Real y;
equation
  if u > uMax then 
    y = uMax;
  elseif u < uMin then 
    y = uMin;
  else 
    y = u;
  end if;
end IfEquation;

model Test
	IfEquation y1(u = 1.0, uMax = 2.0, uMin = 0.0);
	IfEquation y2(u = 0.0, uMax = 2.0, uMin = 0.0);
	IfEquation y3(u = 3.0, uMax = 2.0, uMin = 0.0);
end Test;    

// fclass Test 
// end Test;
