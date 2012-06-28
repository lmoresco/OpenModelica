// name: type2.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//


model MyReal
  extends Real;
end MyReal;

model MyReal2
  extends MyReal;
end MyReal2;

model M
  MyReal2 m;
end M;

// Result:
// 
// EXPANDED FORM:
// 
// class M
//   Real m;
// end M;
// 
// 
// Found 1 components and 0 parameters.
// class M
//   final parameter String m.unit = "";
//   final parameter String m.quantity = "";
//   final parameter String m.displayUnit = "";
//   final parameter Real m.min = 0.0;
//   final parameter Real m.max = 0.0;
//   final parameter Real m.start = 0.0;
//   final parameter Boolean m.fixed = false;
//   final parameter Real m.nominal;
//   final parameter enumeration(never, avoid, default, prefer, always) m.stateSelect = StateSelect.default;
//   final parameter enumeration(given, sought, refine) m.uncertain = Uncertainty.given;
//   final parameter String m.distribution.name "the name of the distibution, e.g \"normal\" ";
//   final parameter Real m.distribution.params[1] "parameter values for the specified distribution, e.g {0,0.1} for a normal distribution";
//   final parameter String m.distribution.paramNames[1] "the parameter names for the specified distribution, e.g {\"my\",\"sigma\"} for a normal distribution";
// end M;
// endResult
