model A 
  parameter Integer p1=35; 
  parameter Integer p2=32,p4; 
end A;

model C
  B b1(a1(p1=0,p2=0),a2.p2=3);
end C;