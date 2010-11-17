// name: StringPool
// cflags: noevalfunc
// status: correct
// teardown_command: rm -f StringPool_*
//
// Tests that the stringpool runtime returns proper strings from
// function calls

package StringPool

function weirdStrStuff
  input String str;
  output String os1;
  output String os2;
algorithm
  os1 := "os1";
  os2 := "os2";
end weirdStrStuff;

function weirdStrStuff1
  input String str;
  output String os;
  String os1,os2;
algorithm
  (os1,os2) := weirdStrStuff(str);
  os := "overwritethecharpoolhere";
  os := os1+os2;
end weirdStrStuff1;

  constant String str1 = weirdStrStuff1("abc");
end StringPool;
