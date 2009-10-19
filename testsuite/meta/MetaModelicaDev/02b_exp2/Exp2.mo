package Exp2

public 
uniontype Exp
  record INT
    Integer integer;
  end INT;

  record BINARY
    Exp exp1;
    BinOp binOp2;
    Exp exp3;
  end BINARY;

  record UNARY
    UnOp unOp;
    Exp exp;
  end UNARY;
end Exp;

public 
uniontype BinOp
  record ADD end ADD;
  record SUB end SUB;
  record MUL end MUL;
  record DIV end DIV;
  /* Add POW here */
end BinOp;

public 
uniontype UnOp
  record NEG end NEG;
  /* Add FAC here */
end UnOp;

public function eval
  input Exp inExp;
  output Integer outInteger;
algorithm 
  outInteger:=
  matchcontinue (inExp)
    local
      Integer ival,v1,v2,v3;
      Exp e1,e2,e;
      BinOp binop;
      UnOp unop;
    case (INT(integer = ival)) then ival; 
    case (BINARY(exp1 = e1,binOp2 = binop,exp3 = e2))
      equation 
        v1 = eval(e1);
        v2 = eval(e2);
        v3 = applyBinop(binop, v1, v2);
      then v3;
    case (UNARY(unOp = unop,exp = e))
      equation 
        v1 = eval(e);
        v2 = applyUnop(unop, v1); 
      then v2;
  end matchcontinue;
end eval;

protected function applyBinop
  input BinOp inBinOp1;
  input Integer inInteger2;
  input Integer inInteger3;
  output Integer outInteger;
algorithm 
  outInteger:=
  matchcontinue (inBinOp1,inInteger2,inInteger3)
    local Integer v1,v2;
    case (ADD(),v1,v2) then v1+v2; 
    case (SUB(),v1,v2) then v1-v2; 
    case (MUL(),v1,v2) then v1*v2; 
    case (DIV(),v1,v2) then intDiv(v1,v2); 
  end matchcontinue;
end applyBinop;

protected function applyUnop
  input UnOp inUnOp;
  input Integer inInteger;
  output Integer outInteger;
algorithm 
  outInteger:=
  matchcontinue (inUnOp,inInteger)
    local Integer v;
    case (NEG(),v) then -v; 
  end matchcontinue;
end applyUnop;

protected function yyparse
  output Integer i;
external annotation(Library = "parser.o lexer.o");
end yyparse;

protected function getAST
  output Exp exp;
external;
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

end Exp2;

