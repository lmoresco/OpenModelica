package SimCodeTest

function test
protected
  Absyn.Path path;
  DAE.Function func;
algorithm
  RTOpts.args({"+g=Modelica"});
  path:=Absyn.QUALIFIED("SimCodeC",Absyn.IDENT("abc"));
  func:=DAE.FUNCTION(path,{DAE.FUNCTION_DEF({})},(DAE.T_FUNCTION({},DAE.T_NORETCALL_DEFAULT,DAE.FUNCTION_ATTRIBUTES_DEFAULT),SOME(path)),false,DAE.NO_INLINE(),DAE.emptyElementSource);
  SimCode.translateFunctions("SimCodeC_abc", func, {}, {});
end test;

end SimCodeTest;
