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
algorithm
  0 := yyparse();
  program := getAST();
end parse;

end Parse;
