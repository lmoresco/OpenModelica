// name:     Enumeration5
// keywords: enumeration enum
// status:   incorrect
// 
// 
// 

package P
 type E = enumeration(a,b,c);
 model h
  replaceable type E=enumeration(j, l, k);
  Real hh[E];  
 equation
  hh[E.j] = 1.0;
  hh[E.l] = 2.0;
  hh[E.k] = 3.0;
 end h;
end P;

model Enumeration5  
   P.h t; 
   P.h tt(redeclare type E=enumeration(a1, b2, c1));
end Enumeration5;


// Result:
// fclass Enumeration5
// Real t.hh[1];
// Real t.hh[2];
// Real t.hh[3];
// Real tt.hh[1];
// Real tt.hh[2];
// Real tt.hh[3];
// equation
//   t.hh[E.j] = 1.0;
//   t.hh[E.l] = 2.0;
//   t.hh[E.k] = 3.0;
//   tt.hh[E.a1] = 1.0;
//   tt.hh[E.b1] = 2.0;
//   tt.hh[E.c1] = 3.0;
// end Enumeration5;
// endResult
