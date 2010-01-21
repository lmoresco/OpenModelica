// name:     Extends5
// keywords: extends, function
// status:   correct
//
// Testing of bug that causes infinite loop if you call a function in an extended class.

class P
  function f
    input Integer i;
    output Integer out;
  algorithm
    out := i;
  end f;
end P;

class Extends5
  extends P;
  constant Integer i = f(1);
end Extends5;

// fclass Extends5
// constant Integer i = 1;
// end Extends5;
