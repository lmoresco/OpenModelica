package Absyn " file: Absyn.mo 
   Semantics oriented abstract syntax of the AssignTwoType language "

type Ident = String;

uniontype BinOp
  record ADD  end ADD;
  record SUB  end SUB;
  record MUL  end MUL;
  record DIV  end DIV;
end BinOp;

uniontype UnOp
  record NEG  end NEG;
end UnOp;

uniontype Exp
  record INT
    Integer x1;
  end INT;
  record REAL
    Real x1;
  end REAL;
  record BINARY
    Exp x1;
    BinOp x2;
    Exp x3;
  end BINARY;
  record UNARY
    UnOp x1;
    Exp x2;
  end UNARY;
  record ASSIGN
    Ident x1;
    Exp x2;
  end ASSIGN;
  record IDENT
    Ident x1;
  end IDENT;
end Exp;
end Absyn;

