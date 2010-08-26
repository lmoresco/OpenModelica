// name:     Pow
// keywords: pow, exponentation, simplification, bug1161
// status:   correct
// 
// Test fix for bug #1161: http://openmodelica.ida.liu.se:8080/cb/issue/1161?navigation=true
// 

model Pow
	parameter Integer pi = 3;
	parameter Real pr = 4.0;
	Real i, j, k, l;
equation
	i = 3 * (2 ^ pi);
	j = 3 * (pi ^ 2);
	k = 3.0 * (2 ^ pr);
	l = 3.0 * (pr ^ 2);
end Pow;

// Result:
// class Pow
// parameter Integer pi = 3;
// parameter Real pr = 4.0;
// Real i;
// Real j;
// Real k;
// Real l;
// equation
//   i = Real(3 * 2 ^ pi);
//   j = Real(3 * pi ^ 2.0);
//   k = 3.0 * 2.0 ^ pr;
//   l = 3.0 * pr ^ 2.0;
// end Pow;
// endResult
