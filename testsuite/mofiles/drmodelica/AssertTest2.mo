// name:     AssertTest2
// keywords: assert
// status:   correct
// 
// <insert description here>
// 

class AssertTest
  parameter Real lowlimit;
  parameter Real highlimit;
  Real x = 5;
equation
  assert(x >= lowlimit and x <= highlimit, "Variable x out of limit");
end AssertTest;

class Test2
  AssertTest assertTest(lowlimit = 6, highlimit = 20);
end Test2;

// fclass Test2
// parameter Real assertTest.lowlimit = 6;
// parameter Real assertTest.highlimit = 20;
// Real assertTest.x;
// equation
//   assertTest.x = 5.0;
// assert(assertTest.x >= assertTest.lowlimit AND assertTest.x <= assertTest.highlimit,"Variable x out of limit");
// end Test2;
