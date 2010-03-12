model ModelicaUtilities

function myExtFunction
  input String str;
  output String out;
  external "C" annotation(Library = "ModelicaUtilities.myExtFunction.c");
end myExtFunction;

  String p;
equation
  p = myExtFunction("abc");
end ModelicaUtilities;
