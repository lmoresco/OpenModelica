// name:     ArrayAddSub1
// keywords: array
// status:   correct
// 
// Addition and substraction ops applied on arrays
// 

class AddSub1
  Real Add3[2, 2] = {{1, 1}, {2, 2}} + {{1, 2}, {3, 4}};  
                                      // Result: {{2, 3}, {5, 6}}
  Real Sub1[3] = {1, 2, 3} - {1, 2, 0};    // Result: {0, 0, 3}
end AddSub1; 

// fclass AddSub1
// Real Add3[1,1] = 2.0;
// Real Add3[1,2] = 3.0;
// Real Add3[2,1] = 5.0;
// Real Add3[2,2] = 6.0;
// Real Sub1[1] = 0.0;
// Real Sub1[2] = 0.0;
// Real Sub1[3] = 3.0;
// end AddSub1;
