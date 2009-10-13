// name:     ArrayMult
// keywords: array
// status:   correct
// 
// Array multiplication
class ArrayMult
  Real m1[3] = {1, 2, 3} * 2;       // Elementwise mult: {2, 4, 6}; 
  Real m2[3] = 3 * {1, 2, 3};       // Elementwise mult: {3, 6, 9};
  Real m3 = {1, 2, 3} * {1, 2, 2};     // Scalar product:    11;
  Real m4[2] = {{1, 2}, {3, 4}} * {1, 2};   // Matrix mult:    {5, 11};
  Real m5[1] = {1, 2, 3} * {{1}, {2}, {10}};    // Matrix mult:    {35};
  Real m6[1] = {1, 2, 3} * [1; 2; 10];       // Matrix mult:     {35};
  Real m7[2, 2] = {{1, 2}, {3, 4}} * {{1, 2}, {2, 1}};   // Matrix mult:   {{5, 4}, {11, 10}};
  Real m8[2, 2] = [1, 2; 3, 4] * [1, 2; 2, 1];   // Matrix mult: {{5, 4}, {11, 10}};
end ArrayMult;  

// fclass ArrayMult
// Real m1[1] = 2.0;
// Real m1[2] = 4.0;
// Real m1[3] = 6.0;
// Real m2[1] = 3.0;
// Real m2[2] = 6.0;
// Real m2[3] = 9.0;
// Real m3 = 11.0;
// Real m4[1] = 5.0;
// Real m4[2] = 11.0;
// Real m5[1] = 35.0;
// Real m6[1] = 35.0;
// Real m7[1,1] = 5.0;
// Real m7[1,2] = 4.0;
// Real m7[2,1] = 11.0;
// Real m7[2,2] = 10.0;
// Real m8[1,1] = 5.0;
// Real m8[1,2] = 4.0;
// Real m8[2,1] = 11.0;
// Real m8[2,2] = 10.0;
// end ArrayMult;
