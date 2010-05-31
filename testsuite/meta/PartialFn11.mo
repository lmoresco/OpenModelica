// name:     PartialFn11
// keywords: PartialFn
// status:  correct
//
// Using function pointers, partially evaluated functions
//

partial function PartFn
  input Real x;
  output Real y;
end PartFn;

function FullFn
  extends PartFn;
  input Real extraReal1;
  input Real extraReal2;
algorithm
  y := x * ((extraReal1 + extraReal2) / 2.0);
end FullFn;

function CallerFn
  input Real inReal;
  input PartFn inPartFn;
  output Real outReal;
algorithm
  outReal := inPartFn(inReal) * 2.0;
end CallerFn;

model PartialFn11
  Real x;
  Real y;
equation 
  x = 2.0;
  y = CallerFn(x, function FullFn(1.5,7.5));
end PartialFn11; 

// fclass PartialFn11
// Real x;
// Real y;
// equation
//   x = 2.0;
//   y = CallerFn(x,function FullFn(1.5,7.5));
// end PartialFn11;
