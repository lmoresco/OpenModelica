// name:     Derivative Annotation
// keywords: functions, index reduction
// status:   correct
// 

function f1
  annotation(derivative=df1);
  input Real a;
  output Real b;
  external b = myfoo(a) annotation(derivative=df1,Library="foo.o",Include="#include \"myfoo.h\"");
end f1;

function df1
  input Real a;
  input Real b;
  output Real c;
  external c = dmyfoo(a,b) annotation(Library="foo.o",Include="#include \"myfoo.h\"");
end df1;  

model extfunction
  Real y1,y2;
  Real t;
  Real x(start=1);
equation
 t = time -x;
 y1 = f1(t);
 y2 = der(y1);
 der(x) = y1 + y2;
end extfunction;

// Result:
// function df1
//   input Real a;
//   input Real b;
//   output Real c;
// 
// external "C";
// end df1;
// 
// function f1
//   input Real a;
//   output Real b;
// 
// external "C";
// end f1;
// 
// class extfunction
//   Real y1;
//   Real y2;
//   Real t;
//   Real x(start = 1.0);
// equation
//   t = time - x;
//   y1 = f1(t);
//   y2 = der(y1);
//   der(x) = y1 + y2;
// end extfunction;
// endResult
