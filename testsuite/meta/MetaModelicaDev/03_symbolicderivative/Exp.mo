package Exp "Do not modify contents"
  
uniontype Exp
  record REAL
    Real real;
  end REAL;
  record ADD
    Exp exp1;
    Exp exp2;
  end ADD;
  record SUB
  Exp exp1;
    Exp exp2;
  end SUB;
  record MUL
    Exp exp1;
    Exp exp2;
  end MUL;
  record DIV
    Exp exp1;
    Exp exp2;
  end DIV;
  record NEG
    Exp exp;
  end NEG;
  record IDENT
    String id;
  end IDENT;
  record CALL
    String id;
    list<Exp> args;
  end CALL;
end Exp;

public function printExp
  input Exp exp;
protected
  String str;
algorithm
  str := expStr(exp);
  print(str);
end printExp;
  
public function expStr
"Translates an Exp into a String"
  input Exp exp;
  output String str;
algorithm
  str := matchcontinue (exp)
    local
      Real r;
      Exp e,lhs,rhs;
      String left,right,res,id;
      list<Exp> expList;
    case REAL(r) then realString(r);
    case ADD(lhs,rhs) then binExpStr(lhs,"+",rhs);
    case SUB(lhs,rhs) then binExpStr(lhs,"-",rhs);
    case MUL(lhs,rhs) then binExpStr(lhs,"*",rhs);
    case DIV(lhs,rhs) then binExpStr(lhs,"/",rhs);
    case NEG(e) then "-" +& expStr(e);
    case IDENT(id) then id;
    case CALL(id,expList)
      equation
        res = expListStr(expList);
      then id +& "(" +& res +& ")";
    case _ then "#UNKNOWN_EXP#";
  end matchcontinue;
end expStr;

protected function expListStr
"Translates a list of Exp into a comma-separated String"
  input list<Exp> expList;
  output String str;
algorithm
  str := matchcontinue (expList)
    local
      Real r;
      Exp e;
      list<Exp> rest;
      String res_1,res_2;
    case {} then "";
    case {e} then expStr(e);
    case e::rest
      equation
        res_1 = expStr(e);
        res_2 = expListStr(rest);
      then res_1 +& res_2;
  end matchcontinue;
end expListStr;

protected function binExpStr
"Translates a binary expression (lhs op rhs) into a String"
  input Exp lhs;
  input String op;
  input Exp rhs;
  output String str;
algorithm
  str := "(" +& expStr(lhs) +& op +& expStr(rhs) +& ")";
end binExpStr;

/*

protected function yyparse
  output Integer i;
external "C";
end yyparse;

protected function getAST
  output Exp exp;
external "C";
end getAST;

protected function parse2
  input Integer i;
  output Exp exp;
algorithm
  exp := matchcontinue i
    local
      Exp e;
    case 0
      equation
        e = getAST();
      then e;
 end matchcontinue;
end parse2;
  
public function parse
  output Exp exp;
  Integer i;
algorithm
  i := yyparse();
  exp := parse2(i);
end parse;

*/

end Exp;
