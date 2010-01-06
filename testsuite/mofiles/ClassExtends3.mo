// name: ClassExtends3
// keywords: class, extends
// status: correct
//
// Tests that partial packages may be extended, and functions inside
// redeclared. Constants inherited will use the full functions to calculate
// their values.
//

partial package A  
  function usePart
    input Integer a;
    output Integer b;
  algorithm
    b := part2(part(a));
  end usePart;

  partial function part
    input Integer a;
    output Integer b;
  end part;

  partial function part2
    input Integer a;
    output Integer b;
  end part2;

  constant Integer X = usePart(1);
  constant Integer Y = part(1);
end A;

package B
  extends A;
  redeclare function extends part
  algorithm
    b := a;
  end part;
  redeclare function extends part2
  algorithm
    b := a;
  end part2;
  Integer b = usePart(integer(time));
end B;

// Result:
// fclass B
// constant Integer X = 1;
// constant Integer Y = 1;
// Integer b = B.usePart(floor(time));
// end B;
// endResult
