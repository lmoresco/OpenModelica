package SimCodeTest

function test
protected
  Absyn.Path path;
  DAE.Function func;
algorithm
  Flags.new({"+g=Modelica"});
  path:=Absyn.QUALIFIED("SimCodeC",Absyn.IDENT("abc"));
  func:=DAE.FUNCTION(path,{DAE.FUNCTION_DEF({})},DAE.T_FUNCTION({},DAE.T_NORETCALL_DEFAULT,DAE.FUNCTION_ATTRIBUTES_DEFAULT,{path}),false,DAE.NO_INLINE(),DAE.emptyElementSource,NONE());
  SimCode.translateFunctions("SimCodeC_abc", SOME(func), {}, {}, {});
end test;

end SimCodeTest;
