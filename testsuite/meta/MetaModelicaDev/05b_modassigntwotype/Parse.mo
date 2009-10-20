package Parse

import Absyn;

// Note: The RML implementation of MetaModelica does not handle this.
// We only use this file to define the interface for other functions to call.
// The actual code is hand-written in C.
// The OpenModelica implementation of RML knows how to generate stubs for
// external C functions, and works fine there.

protected function yyparse
  output Integer i;
external "C";
end yyparse;

protected function getAST
  output Absyn.Exp exp;
external "C";
end getAST;

protected function parse2
  input Integer yyparse;
  output Absyn.Exp out;
algorithm
  exp := matchcontinue (yyres)
    case 0 then getAST();
    case _ equation print("Failed parsing"); then fail();
 end matchcontinue;
end parse2;

public function parse
  output Absyn.Exp exp;
  Integer yyres;
algorithm
  yyres := yyparse();
  exp := parse2(yyres);
end parse;

end Parse;

