package Parse

import SymbolicDerivative.Exp;

protected function yyparse
  output Integer i;
external "C" annotation(Library = {"lexer.o","parser.o"});
end yyparse;

protected function getAST
  output Exp exp;
external "C" annotation(Library = {"lexer.o","parser.o"});
end getAST;

public function parse
  output Exp exp;
  Integer yyres;
algorithm
  yyres := yyparse();
  exp := matchcontinue (yyres)
    case 0 then getAST();
 end matchcontinue;
end parse;

end Parse;
