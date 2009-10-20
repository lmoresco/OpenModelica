package Main

import ScanParse;
import Eval;
import Absyn;

public function main
  Absyn.Prog ast;
algorithm
  print("[Parse. Enter a program, then press CTRL+z (Windows) or CTRL+d (Linux).]\n");    
  ast := ScanParse.scanparse();
  Eval.evalprog(ast);
end main;
end Main;

