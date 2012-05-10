// name:     VectorizeOneReturnValue
// keywords: Array
// status:   correct
// 

class OneReturnValue
  Real a = 1, b = 0, c = 1;
  
  Real s1[3] = sin({a, b, c});  
                // Vector argument, result: {sin(a), sin(b), sin(c)}
  Real s2[2, 2] = sin([1, 2; 3, 4]);
                // Matrix argument, result: [sin(1), sin(2); sin(3), sin(4)]
end OneReturnValue;  

// Result:
// class OneReturnValue
//   Real a = 1.0;
//   Real b = 0.0;
//   Real c = 1.0;
//   Real s1[1] = sin(a);
//   Real s1[2] = sin(b);
//   Real s1[3] = sin(c);
//   Real s2[1,1] = 0.8414709848078965;
//   Real s2[1,2] = 0.9092974268256817;
//   Real s2[2,1] = 0.1411200080598672;
//   Real s2[2,2] = -0.7568024953079282;
// end OneReturnValue;
// endResult
