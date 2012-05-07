
// if else condition
function class3
  Real x = 17.0;
  algorithm
    if(x==17.0) then 
    print("\n success");
    end if;
end class3;




// if else condition
function class3
  Real x = 17.0;
  algorithm
    if(x==17.0)then 
    print("\n success");
    else
    print("\n failure");
    end if;
end class3;


// if and else if  condition
function class3
  Integer x = 17;
  algorithm
    if(x==17)then 
    print("\n success");
    else if (x<17)then
    print("\n failure");
    end if;
  end if;
end class3;



// nested if statements:

function class3
  Integer x = 17;
  algorithm
    if(x==17.0)then 
    print("\n success");
      if (x>17.0)then
       print("\n success");
      else
       print("\n failure");
    end if;
  end if;
end class3;



// nested if statements 2:

function class3
 protected
  Integer x = 17;
  Real y=20.0;
  algorithm
    if(x==17.0)then 
    print("\n success");
      if (x>17.0)then
       print("\n success");
      else
       print("\n failure");
    end if;
      if(y<20.0) then 
        print("\n success");
       else
        print("\n failure");
      end if;      
  end if;
end class3;

// enumeration
class test
  String str;
type test= enumeration(red "yt");
  test v;
 equation
   str=v.red;
 end test;  

// guard expression

class new
 Boolean v[n];
 Boolean x;
 Integer I;
equation
 x= if(I>=1 and I<=n) then v[I] else false;
end new; 

// function call

function addval
  input Integer a=1;
  input Integer b=1;
  output Integer c;
  algorithm
  c:=a+b;
  end addval;
  
class add
Integer d;
equation
d=addval();
end add;

// This tests default values for function arguments.
function equal
 input Real x[:];
 input Real y[:];
 input Real eps=1e-6;
 output Boolean equal;
algorithm
 equal := false;
end equal;

model test
  Real x[2],y[2]={1,2};
  Boolean b;
equation
x=y;
b = equal(x,y);
end test;

// this model test array

class Arraytest1
  Real n = 1, m = 4, k = 5;
  Real Voltage;
  Real[3] positionvector = {1, 2, 3};
  Real[3,3] identitymatrix = {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}};
  Integer[n,m,k] arr3d;
  Boolean[2] truthvalues = {false, true};
  Voltage[10] voltagevector;
end Arraytest1;

// arraytest2 alternative declaration

class Arraytest2
  Real n = 1, m = 4, k = 5;
  Real    Voltage;
  Real    positionvector[3]   = {1, 2, 3};
  Real    identitymatrix[3,3] = {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}};
  Integer arr3d[n,m,k];
  Boolean truthvalues[2]     = {false, true};
  Voltage voltagevector[10];
end Arraytest2;

// algorithmic constructs

 model Algorithmtest
  Real x, z, u;
  parameter Real w = 3, y = 2;
  Real x1, x2, x3;
equation
  x = y*2;
  z = w;
algorithm
  x1 := z  + x;
  x2 := y  - 5;
  x3 := x2 + y;
equation
  u = x1 + x2;
end Algorithmtest;

// this test while statenments 

class whiletest
  parameter Real eps = 1.E-6;
  Integer i;
  Real sum;
  Real delta;
algorithm
  i := 1;
  delta := exp(-0.01 * i);
  while delta >= eps loop
    sum := sum + delta;
    i := i + 1;
    delta := exp(-0.01 * i);
  end while;
end whiletest;

// this tests the for loop

class fortest
  parameter Real x=10;
  Real xpowers[n];
  parameter Integer i=1;
  parameter Integer n = 5;
equation
  xpowers[1]=1;
  for i in 1:n-1 loop
    xpowers[i + 1] = xpowers[i]*x;
  end for;
end fortest;  

// when statements

model testwhen
Real x,y;
equation
x+y=5;
when sample(0,2) then
y=7-2*x;
end when;
end testwhen;


// assert statements

class asserttest
 parameter Real l=-5;
 parameter Real h= 5;
 Real x;
equation
 assert(x>=l and x<=highlimit,"Variable x out of limit");
end asserttest;



// local class and nested class

class c1
 class Lpin
   Real p;
end Lpin;

class voltage = Real(unit="Kv");
 Voltage v1,v2;
 Lpin pn;
end c1;

//Restrcited classes- model

model resistor "electrical resistor"
Pin p,n "positive and negative pins";
Voltage v;
Current i;
parameter Real R(unit="ohm")  "resistance";
equation
v=i*R;
end resistor;


//Restrcited classes- record

record person
Real age;
String name;
end person;

//Restrcited classes- type

type Matrix =Real[3,3];

//Restrcited classes- connector
connector Pin
  Voltage v;
  flow Current i;
end Pin;  

//Restrcited classes- block

block multiply
 input Real x;
 input Real y(start=0);
 output Real result;
equation
 result = x*y;
end multiply;

// pacakagesesting


package MyPack
  import Modelica.SIunits.*;

class Foo
  Voltage v;
  Modelica.SIunits.Ampere i;
end Foo;

end MyPack;

// encapsulated pacakages testing

encapsulated package MyPack
  import SI = Modelica.SIunits;
  import Modelica;

class Foo
  SI.Voltage v;
  Modelica.SIunits.Ampere i;
end Foo;

end MyPack;


// meta modelica language constructs


//union types

uniontype Number
record INT Integer int; end INT;
record RATIONAL Integer dividend, divisor; end RATIONAL;
record REAL Real real; end REAL;
record COMPLEX Real re,im; end COMPLEX;
end Number;


// lists and pattern matching
type StringList = list<String>;
  
function myStringDelimitList
  input StringList stringList;
  input String delimiter;
  output String outString;
algorithm
  outString := match stringList
    local
      String head;
      StringList tail;
    // Remember to match the empty list
    case {} then "" ;
    // The last element does not need the delimiter
    case {head} then head;
    // Pattern-matching using the cons operator
    case head::tail then head + delimiter + stringDelimitList(tail,delimiter);
  end match;
end myStringDelimitList;

// tuples

type ThreeTup = tuple<Integer,Real,String>;
  
// options

type StringOption = Option<String>;
  
  
  
