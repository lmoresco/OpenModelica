package Parse

import Absyn;

public function parse
  output Absyn.Exp exp;
  Integer yyres;
external "C";
end parse;

end Parse;

