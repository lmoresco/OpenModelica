// name:     WhenSemantics1
// keywords: when semantics
// status:   correct
// 
// Simple when

model WhenSemantics1
  Real x,y,z;
equation
  y=sin(time)+x+z;
  when sample(0.1,0.1) then
    x=pre(y);
  end when;
  when {sample(0.1,0.1),time>=0.15,time>=0.25} then
    z=time;
  end when;
end WhenSemantics1;

// fmodel WhenSemantics1 
//  Real y;
//  discrete Real x,z;
//equation /* Sorted*/
// if time=0.1,0.15,0.2,0.25,0.3,0.4,0.5,... then
//   z=time;
// else
//   z=pre(z);
// end if;
// if time=0.1,0.2,0.3,... then
//   x=pre(y);
// else
//   x=pre(x);
// end if;
// y=sin(time)+x+z;
// end WhenSemantics1
