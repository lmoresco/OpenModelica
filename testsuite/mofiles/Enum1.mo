// name:     Enumeration1
// keywords: enumeration enum
// status:   correct
// 
// 
// 

model Enumeration1
   type Color = enumeration(green "1st",blue "2st", yelow "3th");
   Real[Color] x;
equation 
   x[Color.green] = 1;
   x[Color.blue] = 2;
   x[Color.yelow] = 3;
end Enumeration1;

// fclass Enumeration1
// Real x[1];
// Real x[2];
// Real x[3];
// equation
//   x[Color.green] = 1.0;
//   x[Color.blue] = 2.0;
//   x[Color.yelow] = 3.0;
// end Enumeration1;
