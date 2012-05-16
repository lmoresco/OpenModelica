// name:Test20.mo    
// keywords:this tests modelica conditional statement-when
// status:   correct
 

model testwhen
Real x,y;
equation
x+y=5;
when sample(0,2) then
y=7-2*x;
end when;
end testwhen;



// succeed
// omcc- v.2012