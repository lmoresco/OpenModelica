model CheckSqrt
 Real x(start=1),y(start=1);
 Real u = sin(3.14*time);
 parameter Real c = 1;
equation
 der(x) = if (u>0) then -c*sqrt(u) else 0;
 der(y) = if (noEvent(u>0)) then -c*sqrt(u) else 0;
end CheckSqrt;

