package Parse

import Assignment;

protected function yyparse
  output Integer i;
external;
end yyparse;

protected function getAST
  output Assignment.Program program;
external;
end getAST;

public function parse
  output Assignment.Program program;
  Integer yyres;
algorithm
  yyres := yyparse();
  program := matchcontinue (yyres)
    case 0 then getAST();
 end matchcontinue;
end parse;

end Parse;