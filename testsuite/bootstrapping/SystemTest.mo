encapsulated package SystemTest
  import System.substring;
  function substringTest
    input String str;
    input Integer i1,i2,i3;
    output String s1,s2,s3;
  algorithm
    s1 := substring(str,i1,i2);
    s2 := substring(str,i2,i3);
    s3 := substring(str,i1,i3);
  end substringTest;
end SystemTest;
