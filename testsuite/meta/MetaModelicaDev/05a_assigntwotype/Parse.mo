package Parse

protected function yyparse
  output Integer i;
external;
end yyparse;

protected function getAST
  output Program program;
external;
end getAST;

public function parse
  output Program program;
  Integer yyres;
algorithm
  yyres := yyparse();
  program := matchcontinue (yyres)
    case 0 then getAST();
 end matchcontinue;
end parse;

end Parse;