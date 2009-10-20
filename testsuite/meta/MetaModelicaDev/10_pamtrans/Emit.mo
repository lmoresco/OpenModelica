package Emit

public import Mcode;

public function emitAssembly "Print out the MCode in textual assembly format
  Note: this is not really part of the specification of PAM semantics
"
  input Mcode_MCodeLst inMcodeMCodeLst;
  type Mcode_MCodeLst = list<Mcode.MCode>;
algorithm 
  _:=
  matchcontinue (inMcodeMCodeLst)
    local
      Mcode.MCode instr;
      Mcode_MCodeLst rest;
    case ({}) then (); 
    case (instr :: rest)
      equation 
        emitInstr(instr);
        emitAssembly(rest); then ();
  end matchcontinue;
end emitAssembly;

protected function emitInstr "Print an MCode instruction"
  input Mcode.MCode inMCode;
algorithm 
  _:=
  matchcontinue (inMCode)
    local
      String op;
      Mcode.MBinOp mbinop;
      Mcode.MOperand mopr,mlab;
      Mcode.MCondJmp jmpop;
    case (Mcode.MB(mBinOp = mbinop,binary = mopr))
      equation 
        op = mbinopToStr(mbinop);
        emitOpOperand(op, mopr); then ();
    case (Mcode.MJ(mCondJmp = jmpop,conditional = mlab))
      equation 
        op = mjmpopToStr(jmpop);
        emitOpOperand(op, mlab); then ();
    case (Mcode.MJMP(mOperand = mlab))
      equation 
        emitOpOperand("J", mlab); then ();
    case (Mcode.MLOAD(mOperand = mopr))
      equation 
        emitOpOperand("LOAD", mopr); then ();
    case (Mcode.MSTO(mOperand = mopr))
      equation 
        emitOpOperand("STO", mopr); then ();
    case (Mcode.MGET(mOperand = mopr))
      equation 
        emitOpOperand("GET", mopr); then ();
    case (Mcode.MPUT(mOperand = mopr))
      equation 
        emitOpOperand("PUT", mopr); then ();
    case (Mcode.MLABEL(mOperand = mlab))
      equation 
        emitMoperand(mlab);
        print("\tLAB\n"); then ();
    case (Mcode.MHALT())
      equation 
        print("\tHALT\n"); then ();
  end matchcontinue;
end emitInstr;

protected function emitOpOperand
  input String opstr;
  input Mcode.MOperand mopr;
algorithm 
  print("\t");
  print(opstr);
  print("\t");
  emitMoperand(mopr);
  print("\n");
end emitOpOperand;

protected function emitInt
  input Integer i;
  String s;
algorithm 
  s := intString(i);
  print(s);
end emitInt;

protected function emitMoperand
  input Mcode.MOperand inMOperand;
algorithm 
  _:=
  matchcontinue (inMOperand)
    local
      String id;
      Integer number,labno,tempnr;
    case (Mcode.I(id = id))
      equation 
        print(id); then ();
    case (Mcode.N(integer = number))
      equation 
        emitInt(number); then ();
    case (Mcode.L(datatype = labno))
      equation 
        print("L");
        emitInt(labno); then ();
    case (Mcode.T(integer = tempnr))
      equation 
        print("T");
        emitInt(tempnr); then ();
  end matchcontinue;
end emitMoperand;

protected function mbinopToStr
  input Mcode.MBinOp inMBinOp;
  output String outString;
algorithm 
  outString:=
  matchcontinue (inMBinOp)
    case (Mcode.MADD()) then "ADD"; 
    case (Mcode.MSUB()) then "SUB"; 
    case (Mcode.MMULT()) then "MULT"; 
    case (Mcode.MDIV()) then "DIV"; 
  end matchcontinue;
end mbinopToStr;

protected function mjmpopToStr
  input Mcode.MCondJmp inMCondJmp;
  output String outString;
algorithm 
  outString:=
  matchcontinue (inMCondJmp)
    case (Mcode.MJNP()) then "JNP"; 
    case (Mcode.MJP()) then "JP"; 
    case (Mcode.MJN()) then "JN"; 
    case (Mcode.MJNZ()) then "JNZ"; 
    case (Mcode.MJPZ()) then "JPZ"; 
    case (Mcode.MJZ()) then "JZ"; 
  end matchcontinue;
end mjmpopToStr;
end Emit;

