package ScanParse

public import Absyn;

public function scanparse
  output Absyn.Prog outProg;
external "C" outProg = parse() annotation(Library = {"lexer.o","parser.o"});
end scanparse;

end ScanParse;

