//|name:     ConnectConst1
//|keywords: connect,constant,unknown
//|status:   incorrect
// 
// You should not be able to declare connectors as constant, or should you?
// 

class C
  flow Real f;
  Real e;
end A;

model World
  C c1;
  constant C c2;
equation
  connect(c1,c2);
end World;
