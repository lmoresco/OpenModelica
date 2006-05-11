
model Q
    Real x=1;
end Q;
   

type T1 = Real;
type T2 = Real[4];

type Resistance
  extends Real(unit="ohm");
end Resistance;

package Types
  type T2 = T1(unit="foo");
  type T1 = Integer;
end Types;

model A 
  parameter Integer p1=35; 
  parameter Integer p2=32,p4; 
end A;

model C
  B b1(a1(p1=0,p2=0),a2.p2=3);
end C;
model A2
  parameter Real x=1;
Real y=11;
end A2;

model B2 
  parameter Real f=1;
 A a(x=3);
end B2;

model C2
  Real m = 1;
  parameter Real n=2;
end C2;

model D2 
  extends B2(a(x=2*y),f=1);
  extends C2(m=1,n=2);
end D2;
model E
  A a(p1=1,p2=2);
end E;