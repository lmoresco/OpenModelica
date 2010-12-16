// name:     AssertTest1
// keywords: assert
// status:   correct
// 
// Drmodelica: 9.1 assert (p. 298) 
// 

class AssertTest
  parameter Real lowlimit;
  parameter Real highlimit;
  Real x = 5;
equation
  assert(x >= lowlimit and x <= highlimit, "Variable x out of limit");
end AssertTest;

class Test1
  AssertTest assertTest(lowlimit = 4, highlimit = 8);
end Test1;

// class Test1
// parameter Real assertTest.lowlimit = 4;
// parameter Real assertTest.highlimit = 8;
// Real assertTest.x;
// equation
//   assertTest.x = 5.0;
// assert(assertTest.x >= assertTest.lowlimit AND assertTest.x <= assertTest.highlimit,"Variable x out of limit");
// end Test1;
