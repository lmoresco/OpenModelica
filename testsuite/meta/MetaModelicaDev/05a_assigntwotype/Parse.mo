package Parse

import AssignTwoType;

protected function yyparse
  output Integer i;
external "C" annotation(Library = {"lexer.o","parser.o"});
end yyparse;

protected function getAST
  output AssignTwoType.Program program;
external "C" annotation(Library = {"lexer.o","parser.o"});
end getAST;

public function parse
  output AssignTwoType.Program program;
  Integer yyres;
algorithm
  yyres := yyparse();
  program := matchcontinue (yyres)
    case 0 then getAST();
 end matchcontinue;
end parse;

end Parse;
