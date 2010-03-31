// name:     VectorizeOneReturnValue
// keywords: Array
// status:   correct
// 
// sin not yet implmeneted

class OneReturnValue
  Real a = 1, b = 0, c = 1;
  
  Real s1[3] = sin({a, b, c});  
                // Vector argument, result: {sin(a), sin(b), sin(c)}
  Real s2[2, 2] = sin([1, 2; 3, 4]);
                // Matrix argument, result: [sin(1), sin(2); sin(3), sin(4)]
end OneReturnValue;  

// fclass OneReturnValue
// Real a = 1.0;
// Real b = 0.0;
// Real c = 1.0;
// Real s1[1] = sin(a);
// Real s1[2] = sin(b);
// Real s1[3] = sin(c);
// Real s2[1,1] = 0.841470984807897;
// Real s2[1,2] = 0.909297426825682;
// Real s2[2,1] = 0.141120008059867;
// Real s2[2,2] = -0.756802495307928;
// end OneReturnValue;
// Result:
// fclass OneReturnValue
// Real a = 1.0;
// Real b = 0.0;
// Real c = 1.0;
// Real s1[1] = sin(a);
// Real s1[2] = sin(b);
// Real s1[3] = sin(c);
// Real s2[1,1] = 0.841470984807897;
// Real s2[1,2] = 0.909297426825682;
// Real s2[2,1] = 0.141120008059867;
// Real s2[2,2] = -0.756802495307928;
// end OneReturnValue;
// endResult
