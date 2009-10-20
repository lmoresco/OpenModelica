package Main

public import Mcode;
public import Absyn;

protected import Parse;
protected import Trans;
protected import Emit;

public function main "Parse and translate a PAM program into MCode,
  then emit it as textual assembly code.
"
  type Mcode_MCodeLst = list<Mcode.MCode>;
  Absyn.Stmt program;
  Mcode_MCodeLst mcode;
algorithm 
  print("[Parse. Enter a program, then press CTRL+z (Windows) or CTRL+d (Linux).]\n");  
  program := Parse.parse();
  mcode := Trans.transProgram(program);
  Emit.emitAssembly(mcode);
end main;
end Main;

