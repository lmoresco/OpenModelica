// name:     Lookup8
// keywords: scoping
// status:   correct
// 
// Instance hierarchy are looked up before class hierachy
// 


model Cytosol
  Real V = 1;
end Cytosol;

model Test
  Real Cytosol_V=Cytosol.V;
  Cytosol Cytosol;
end Test;

// Result:
// fclass Test
// Real Cytosol_V;
// Real Cytosol.V;
// equation
//   Cytosol_V = Cytosol.V;
//   Cytosol.V = 1.0;
// end Test;
// endResult
