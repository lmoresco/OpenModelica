final encapsulated package UtilTest

import Util;

function listRangeString
"Takes start, stop index, generates a list<Integer> which it then
transforms into a list<String>"
  input Integer start;
  input Integer stop;
  output Integer sum;
  output list<String> ss;
protected
  list<Integer> is;
algorithm
  is := Util.listIntRange2(start,stop);
  is := Util.listMap1(is, intMul, 3);
  ss := Util.listMap(is, intString);
  sum := Util.listFold(is, intAdd, 0);
end listRangeString;

function getIntOption
  input Option<Integer> io;
  output Integer i;
algorithm
  SOME(i) := io;
end getIntOption;

function listMapGetOption
  input list<Option<Integer>> ios;
  output list<Integer> is1;
  output list<Integer> is2;
algorithm
  is1 := Util.listMap(ios, Util.getOption);
  is2 := Util.listMap(ios, getIntOption);
end listMapGetOption;

function listMap1r
  input list<String> ss;
  input String s;
  output list<String> oss;
algorithm
  oss := Util.listMap1r(ss, stringAppend, s);
end listMap1r;

end UtilTest;
