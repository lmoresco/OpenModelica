// name:     Enumeration2
// keywords: enumeration enum
// status:   correct
// 
// 
// 

model Enumeration2
   type Color = enumeration(green "1st",blue "2st", yelow "3th");
   Real[Color] x;
equation 
   for e in Color loop
     x[e] = 1;
   end for;
end Enumeration2;


// Result:
// class Enumeration2
// Real x[1];
// Real x[2];
// Real x[3];
// equation
//   x[1] = 1.0;
//   x[2] = 1.0;
//   x[3] = 1.0;
// end Enumeration2;
// endResult
