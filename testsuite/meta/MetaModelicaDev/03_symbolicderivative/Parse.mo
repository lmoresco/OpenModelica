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

function parse
  output Exp exp;
algorithm
  0 := yyparse();
  exp := getAST();
end parse;

end Parse;
