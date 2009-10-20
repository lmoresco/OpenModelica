package Parse

import Absyn;

protected function yyparse
  output Integer i;
external;
end yyparse;

protected function getAST
  output Absyn.Exp exp;
external;
end getAST;

public function parse
  output Absyn.Exp exp;
  Integer yyres;
algorithm
  yyres := yyparse();
  exp := matchcontinue (yyres)
    case 0 then getAST();
    case _ equation print("Failed parsing"); then fail();
 end matchcontinue;
end parse;

end Parse;

