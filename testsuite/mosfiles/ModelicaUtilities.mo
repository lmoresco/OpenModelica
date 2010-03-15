model ModelicaUtilities

function myExtFunction
  input String str;
  input Real t := 0.0;
  output String out;
  external "C" annotation(Library = "ModelicaUtilities.myExtFunction.c");
end myExtFunction;

  String p;
equation
  when initial() then
    p = myExtFunction("abc", time /* So we can't ceval and are forced to test its runtime properties */);
  end when;
end ModelicaUtilities;
