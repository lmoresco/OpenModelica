// name: SimpleTypeExtend
// keywords: inheritance
// status: correct
//
// Tests to make sure you cannot extend built-in types and add components
// THIS TEST SHOULD FAIL
//

model SimpleTypeExtend
  extends Real;
  Real illegalReal;
end SimpleTypeExtend;

// fclass SimpleTypeExtend
// parameter String unit = "";
// parameter String quantity = "";
// parameter String displayUnit = "";
// parameter Real min = 0.0;
// parameter Real max = 0.0;
// parameter Real start = 0.0;
// parameter Boolean fixed = false;
// parameter Real nominal;
// parameter enumeration(never, avoid, default, prefer, always)stateSelect = StateSelect.default;
// Real illegalReal;
// end SimpleTypeExtend;
