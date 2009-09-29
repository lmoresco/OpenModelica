// name: ArrayOperators
// keywords: array, operators
// status: correct

model ArrayOperators
  constant Real rarr1[2,2] = [1,2;3,4] .* [5,6;7,8];
  constant Real rarr2[2,2] = [5,6;7,8] ./ [1,2;3,4];
  constant Real rarr3[2,2] = [1,2;3,4] .+ [5,6;7,8];
  constant Real rarr4[2,2] = [5,6;7,8] .- [1,2;3,4];
end ArrayOperators;

// fclass ArrayOperators
// constant Real rarr1[1,1] = 5;
// constant Real rarr1[1,2] = 12;
// constant Real rarr1[2,1] = 21;
// constant Real rarr1[2,2] = 32;
// constant Real rarr2[1,1] = 5.0;
// constant Real rarr2[1,2] = 3.0;
// constant Real rarr2[2,1] = 2.33333333333333;
// constant Real rarr2[2,2] = 2.0;
// constant Real rarr3[1,1] = 6;
// constant Real rarr3[1,2] = 8;
// constant Real rarr3[2,1] = 10;
// constant Real rarr3[2,2] = 12;
// constant Real rarr4[1,1] = 4;
// constant Real rarr4[1,2] = 4;
// constant Real rarr4[2,1] = 4;
// constant Real rarr4[2,2] = 4;
// end ArrayOperators;
