package AssignTwoType "file AssignTwoType.mo"

public 
type ExpLst = list<Exp>;

uniontype Program "Abstract syntax for the Assigntwotype language"
  record PROGRAM
    ExpLst expLst;
    Exp exp;
  end PROGRAM;
end Program;

public 
uniontype Exp
  record INT
    Integer integer;
  end INT;

  record REAL
    Real real;
  end REAL;
  
  record BINARY
    Exp exp1;
    BinOp binOp2;
    Exp exp3;
  end BINARY;

  record UNARY
    UnOp unOp;
    Exp exp;
  end UNARY;

  record ASSIGN
    Ident ident;
    Exp exp;
  end ASSIGN;

  record IDENT
    Ident ident;
  end IDENT;

  // your code here
  // add a record called STRING

end Exp;

public 
uniontype BinOp
  record ADD end ADD;
  record SUB end SUB;
  record MUL end MUL;
  record DIV end DIV;
end BinOp;

public 
uniontype UnOp
  record NEG end NEG;
end UnOp;

public 
type Ident = String;

public 
uniontype Value "Values stored in environments"
  record INTval
    Integer integer;
  end INTval;

  record REALval
    Real real;
  end REALval;
end Value;

public 
type VarBnd = tuple<Ident,Value> "Bindings and environments";

public 
type Env = list<VarBnd>;

public 
uniontype Ty2 "Ty2 is an auxiliary datatype used to handle types during evaluation"
  
  record INT2
    Integer integer1;
    Integer integer2;
  end INT2;

  record REAL2
    Real real1;
    Real real2;
  end REAL2;
    
end Ty2;

protected function printvalue
  input Value inValue;
algorithm 
  _:=
  matchcontinue (inValue)
    local
      Ident x_1;
      Integer x;
    case (INTval(integer = x))
      equation 
        x_1 = intString(x);
        print(x_1); then ();
    case (REALval(real = x))
      local Real x;
      equation 
        x_1 = realString(x);
        print(x_1); then ();
  end matchcontinue;
end printvalue;

public function evalprogram
  input Program inProgram;
algorithm 
  _:=
  matchcontinue (inProgram)
    local
      ExpLst assignments_1,assignments;
      Env env2;
      Value value;
      Exp exp;
    case (PROGRAM(expLst = assignments,exp = exp))
      equation 
        assignments_1 = listReverse(assignments);
        env2 = evals({}, assignments_1);
        (_,value) = eval(env2, exp);
        printvalue(value);
        print("\n");
      then ();
  end matchcontinue;
end evalprogram;

protected function evals
  input Env inEnv;
  input ExpLst inExpLst;
  output Env outEnv;
algorithm 
  outEnv:=
  matchcontinue (inEnv,inExpLst)
    local
      Env e,env2,env3,env;
      Exp exp;
      ExpLst expl;
    case (e,{}) then e; 
    case (env,exp :: expl)
      equation 
        (env2,_) = eval(env, exp);
        env3 = evals(env2, expl); then env3;
  end matchcontinue;
end evals;

protected function eval
  input Env inEnv;
  input Exp inExp;
  output Env outEnv;
  output Value outValue;
algorithm 
  (outEnv,outValue):=
  matchcontinue (inEnv,inExp)
    local
      Env env,env2,env1;
      Integer ival,x,y,z;
      Real rval;
      String sval;
      Value value,v1,v2;
      Ident id;
      Exp e1,e2,e,exp;
      BinOp binop;
      UnOp unop;
    case (env,INT(integer = ival)) then (env,INTval(ival)); 
    case (env,REAL(real = rval)) then (env,REALval(rval)); 
    // your code here
    // case (env, STRING(...)) ...
    case (env,IDENT(ident = id)) "variable id"
      equation 
        (env2,value) = lookupextend(env, id); then (env2,value);
    case (env,BINARY(exp1 = e1,binOp2 = binop,exp3 = e2)) "int binop int"
      equation 
        (env1,v1) = eval(env, e1);
        (env2,v2) = eval(env, e2);
        INT2(integer1 = x,integer2 = y) = typeLub(v1, v2);
        z = applyIntBinop(binop, x, y); 
      then (env2,INTval(z));
    case (env,BINARY(exp1 = e1,binOp2 = binop,exp3 = e2)) "int/real binop int/real"
      local Real x,y,z;
      equation 
        (env1,v1) = eval(env, e1);
        (env2,v2) = eval(env, e2);
        REAL2(real1 = x,real2 = y) = typeLub(v1, v2);
        z = applyRealBinop(binop, x, y); 
      then (env2,REALval(z));
    case (env,UNARY(unOp = unop,exp = e)) "int unop exp"
      equation 
        (env1,INTval(integer = x)) = eval(env, e);
        y = applyIntUnop(unop, x); 
      then (env1,INTval(y));
    case (env,UNARY(unOp = unop,exp = e)) "real unop exp"
      local Real x,y;
      equation 
        (env1,REALval(real = x)) = eval(env, e);
        y = applyRealUnop(unop, x); 
      then (env1,REALval(y));
    case (env,ASSIGN(ident = id,exp = exp)) "eval of an assignment node returns the updated environment and
    the assigned value id := exp"
      equation 
        (env1,value) = eval(env, exp);
        env2 = update(env1, id, value); 
      then (env2,value);
  end matchcontinue;
end eval;

protected function typeLub
  input Value inValue1;
  input Value inValue2;
  output Ty2 outTy2;
algorithm 
  outTy2:=
  matchcontinue (inValue1,inValue2)
    local
      Integer x,y;
      Real x2,y2;
    case (INTval(integer = x),INTval(integer = y)) then INT2(x,y); 
    case (INTval(integer = x),REALval(real = y))
      local Real y;
      equation 
        x2 = intReal(x); then REAL2(x2,y);
    case (REALval(real = x),INTval(integer = y))
      local Real x;
      equation 
        y2 = intReal(y); then REAL2(x,y2);
    case (REALval(real = x),REALval(real = y))
      local Real x,y; then REAL2(x,y);
  end matchcontinue;
end typeLub;

protected function applyIntBinop
  input BinOp inBinOp1;
  input Integer inInteger2;
  input Integer inInteger3;
  output Integer outInteger;
algorithm 
  outInteger:=
  matchcontinue (inBinOp1,inInteger2,inInteger3)
    local Integer x,y;
    case (ADD(),x,y) then x + y;
    case (SUB(),x,y) then x - y;
    case (MUL(),x,y) then x * y;
    case (DIV(),x,y) then intDiv(x, y);
  end matchcontinue;
end applyIntBinop;

protected function applyRealBinop
  input BinOp inBinOp1;
  input Real inReal2;
  input Real inReal3;
  output Real outReal;
algorithm 
  outReal:=
  matchcontinue (inBinOp1,inReal2,inReal3)
    local Real x,y;
    case (ADD(),x,y) then x + y;  
    case (SUB(),x,y) then x - y;  
    case (MUL(),x,y) then x * y;  
    case (DIV(),x,y) then x / y; 
  end matchcontinue;
end applyRealBinop;

protected function applyIntUnop
  input UnOp inUnOp;
  input Integer inInteger;
  output Integer outInteger;
algorithm 
  outInteger:=
  matchcontinue (inUnOp,inInteger)
    local Integer x;
    case (NEG(),x) then -x; 
  end matchcontinue;
end applyIntUnop;

protected function applyRealUnop
  input UnOp inUnOp;
  input Real inReal;
  output Real outReal;
algorithm 
  outReal:=
  matchcontinue (inUnOp,inReal)
    local Real x;
    case (NEG(),x) then -.x;  
  end matchcontinue;
end applyRealUnop;

protected function lookup
  input Env inEnv;
  input Ident inIdent;
  output Value outValue;
algorithm 
  outValue:=
  matchcontinue (inEnv,inIdent)
    local
      Ident id2,id;
      Value value;
      Env rest;
    case ((id2,value) :: _,id) "lookup returns the value associated with an identifier.
  If no association is present, lookup will fail. Identifier id is found in the first pair of the list, and value
  is returned."
      equation 
        equality(id = id2); then value;
    case ((id2,_) :: rest,id) "id is not found in the first pair of the list, and lookup will
  recursively search the rest of the list. If found, value is returned.
"
      equation 
        failure(equality(id = id2));
        value = lookup(rest, id); then value;
  end matchcontinue;
end lookup;

protected function lookupextend
  input Env inEnv;
  input Ident inIdent;
  output Env outEnv;
  output Value outValue;
algorithm 
  (outEnv,outValue):=
  matchcontinue (inEnv,inIdent)
    local
      Value value;
      Env env;
      Ident id;
    case (env,id) "Return value of id in env. If id not present, add id and return 0"
      equation 
        failure(value = lookup(env, id));
        value = INTval(0); then ((id,value) :: env,value);
    case (env,id)
      equation 
        value = lookup(env, id); then (env,value);
  end matchcontinue;
end lookupextend;

protected function update
  input Env inEnv;
  input Ident inIdent;
  input Value inValue;
  output Env outEnv;
algorithm 
  outEnv:=
  matchcontinue (inEnv,inIdent,inValue)
    local
      Env env;
      Ident id;
      Value value;
    case (env,id,value) then (id,value) :: env; 
  end matchcontinue;
end update;

protected function yyparse
  output Integer i;
external;
end yyparse;

protected function getAST
  output Program program;
external;
end getAST;

public function parse
  output Program program;
  Integer yyres;
algorithm
  yyres := yyparse();
  program := matchcontinue (yyres)
    case 0 then getAST();
 end matchcontinue;
end parse;

end AssignTwoType;

