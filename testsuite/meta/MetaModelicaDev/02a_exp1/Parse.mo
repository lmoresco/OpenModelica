package Parse

import Exp1;

protected function yyparse
  output Integer i;
external "C";
end yyparse;

protected function getAST
  output Exp1.Exp exp;
external "C";
end getAST;

public function parse
  output Exp1.Exp exp;
  Integer yyres;
algorithm
  yyres := yyparse();
  exp := matchcontinue (yyres)
    case 0 then getAST();
 end matchcontinue;
end parse;

end Parse;
