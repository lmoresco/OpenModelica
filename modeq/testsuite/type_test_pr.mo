// name:     EquationIf1
// keywords: equation
// status:   correct
// 
// Testing `if' clauses in equations.
// 

class type1
	Real r;
	Integer i;
end type1;

class type2
	Boolean rr;
	Integer ii;
end type2;


function f
  input type1 x;
	
  output Integer r;
algorithm
 
end f;

model Function1
  type1 x,y;
  type2 y;
  Integer i;
equation
  i = f(x);
  i = f(y);
end Function1;

// fclass Function1
//   Real    x;
//   Real    y;
//   Real    z;
//   Real f~1.x;
//   Real f~1.r;
//   Real f~2.x;
//   Real f~2.r;
// equation
//   x = y;
//   f~1.x = z;
//   x = f~1.r;
//   f~2.x = z;
//   y = f~2.r;
// algorithm
//   f~1.r := 2.0 * f~1.x;
// algorithm
//   f~2.r := 2.0 * f~2.x;
// end Function1;


// fclass EquationIf1
//   parameter Boolean b;
//   Real x;
// equation
//   b = true;
//   x = 1.0;
// end EquationIf1;
