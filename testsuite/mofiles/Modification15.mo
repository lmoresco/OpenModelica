// name:     Modification15
// keywords: modification
// status:   correct
// 
// This tests if a warning or an error is 
// displayed when the same attribute is 
// modified twice by distict and different modifications.
// This partially works, it ignores x(unit = "K") entirely.
//


class C3
  class C4
    Real x;
  end C4;

  // Ok, different attributes designated (unit, displayUnit and value)
  C4 a(x.unit = "V", x.displayUnit="mV", x=5.0); 
  // identical to:
  C4 b(x(unit = "V", displayUnit="mV") = 5.0);
  // Not OK, modifying the same attribute unit
  C4 c(x(unit = "V", displayUnit="mV", unit="J") = 5.0, x(unit = "K"));
end C3;

// Result:
// class C3
//   Real a.x(unit = "V", displayUnit = "mV") = 5.0;
//   Real b.x(unit = "V", displayUnit = "mV") = 5.0;
//   Real c.x(unit = "V", displayUnit = "mV") = 5.0;
// end C3;
// [Modification15.mo:14:5-14:11:readonly] Warning: Variable c.x: Duplicate modifications for attribute: unit in modifier: (unit = "V", unit = "J"). 
// 	Considering only the first modification: (unit = "V") and ignoring the rest (unit = "J").
// 
// endResult
