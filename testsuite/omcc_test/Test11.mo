// name:Test11.mo
// keywords: This tests the enumeration statements
// status: correct
 
class test
  String str;
type test= enumeration(red "yt");
  test v;
 equation
   str=v.red;
 end test;  


// succeed
// omcc- v.2012