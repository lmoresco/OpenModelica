// name: builtinmod.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//
// FAILREASON: Enumeration instance m is missing it's start value.
//


type MyReal
  extends Real;
end MyReal;

type MyInteger
  extends Integer;
end MyInteger;

type MyBoolean
  extends Boolean;
end MyBoolean;

type MyString
  extends String;
end MyString;

type MyStateSelect
  extends StateSelect;
end MyStateSelect;

model A
  MyReal r(quantity = "m", unit = "kg", displayUnit = "kg",
    min = -100, max = 100, start = 10, fixed = true, nominal = 1.0,
    stateSelect = StateSelect.never);

  MyInteger i(quantity = "m", min = -100, max = 100, start = 10, fixed = true);
  MyBoolean b(quantity = "m", start = false, fixed = true);
  MyString s(quantity = "m", start = "hello");
  MyStateSelect m(start = StateSelect.avoid);
end A;

// Result:
// 
// EXPANDED FORM:
// 
// class A
//   Real(quantity="m", unit="kg", displayUnit="kg", min=-100, max=100, start=10, fixed=true, nominal=1.0, stateSelect=StateSelect.never) r;
//   Integer(quantity="m", min=-100, max=100, start=10, fixed=true) i;
//   Boolean(quantity="m", start=false, fixed=true) b;
//   String(quantity="m", start="hello") s;
//   enumeration() m;
// end A;
// 
// 
// Found 5 components and 0 parameters.
// class A
//   Real r(quantity = "m", unit = "kg", displayUnit = "kg", min = -100.0, max = 100.0, start = 10.0, fixed = true, nominal = 1.0, StateSelect = StateSelect.never);
//   Integer i(quantity = "m", min = -100, max = 100, start = 10, fixed = true);
//   Boolean b(quantity = "m", start = false, fixed = true);
//   String s(quantity = "m", start = "hello");
//   enumeration(never, avoid, default, prefer, always) m(start = StateSelect.avoid);
// end A;
// endResult
