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

end UtilTest;
