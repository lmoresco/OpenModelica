package Assignment "Assignment.mo"

public 
type ExpLst = list<Exp>;

uniontype Program "Abstract syntax for the Assignments language"
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
type Value = Integer "Values stored in environments";

public 
type VarBnd = tuple<Ident,Value> "Bindings and environments";

public 
type Env = list<VarBnd>;

function lookup
  input Env inEnv;
  input Ident inIdent;
  output Value outInteger;
algorithm
 outInteger:=
  matchcontinue (inEnv,inIdent)
    local  Ident id2,id;  Value value;  Env rest;
    case ( (id2,value) :: rest, id)
      then  if id ==& id2 then value else lookup(rest,id);
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
      Env env;
      Ident id;
      Value value;
    case (env,id)
      equation 
        failure(value = lookup(env, id));
      then ((id,0) :: env,0);
    case (env,id)
      equation 
        value = lookup(env, id);
      then (env,value);
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

protected function applyBinop
  input BinOp inBinOp1;
  input Integer inInteger2;
  input Integer inInteger3;
  output Integer outInteger;
algorithm 
  outInteger:=
  matchcontinue (inBinOp1,inInteger2,inInteger3)
    local Value v1,v2;
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
    local Value v;
    case (NEG(),v) then -v; 
  end matchcontinue;
end applyUnop;

protected function eval
  input Env inEnv;
  input Exp inExp;
  output Env outEnv;
  output Integer outInteger;
algorithm 
  (outEnv,outInteger):=
  matchcontinue (inEnv,inExp)
    local
      Env env,env2,env3,env1;
      Value ival,value,v1,v2,v3;
      Ident s,id;
      Exp exp,e1,e2,e;
      BinOp binop;
      UnOp unop;
    case (env,INT(integer = ival)) then (env,ival);
    /* eval of an identifier node will lookup the identifier and return a
    value if present; otherwise insert a binding to zero, and return zero. */       
    case (env,IDENT(ident = id)) 
      equation 
        (env2,value) = lookupextend(env, id);
      then (env2,value);
    /* eval of an assignment node returns the updated environment and the assigned value. */
    case (env,ASSIGN(ident = id,exp = exp)) 
      equation 
        (env2,value) = eval(env, exp);
        env3 = update(env2, id, value); 
      then (env3,value);
    /* eval of a node e1,ADD,e2 , etc. in an environment env */   
    case (env1,BINARY(exp1 = e1,binOp2 = binop,exp3 = e2)) 
      equation 
        (env2,v1) = eval(env1, e1);
        (env3,v2) = eval(env2, e2);
        v3 = applyBinop(binop, v1, v2); 
      then (env3,v3);
    case (env1,UNARY(unOp = unop,exp = e))
      equation 
        (env2,v1) = eval(env1, e);
        v2 = applyUnop(unop, v1); 
      then (env2,v2);
  end matchcontinue;
end eval;

protected function evals
  input Env inEnv;
  input ExpLst inExpLst;
  output Env outEnv;
algorithm 
  outEnv:=
  matchcontinue (inEnv,inExpLst)
    local
      Env e,env2,env3,env;
      Value v;
      Ident s;
      Exp exp;
      ExpLst expl;
    case (e,{}) then e;    // the environment stay the same if there are no expressions 
    case (env,exp :: expl) // the head expression is evaluated in the current environment
                           // generating a new environment in which the rest of the expression
                           // list is evaluated. the last environment is returned 
      equation 
        (env2,v) = eval(env, exp);
        env3 = evals(env2, expl); 
      then env3;
  end matchcontinue;
end evals;

public function evalprogram
  input Program inProgram;
  output Integer outInteger;
algorithm 
  outInteger:=
  matchcontinue (inProgram)
    local
      ExpLst assignments_1,assignments;
      Env env2;
      Value value;
      Exp exp;
    case (PROGRAM(expLst = assignments,exp = exp))
      equation 
        assignments_1 = listReverse(assignments);
        print("\nThe assignments: ");        
        printAssignments(assignments_1);
        print("The expression: ");
        printExp(exp);
        env2 = evals({}, assignments_1);
        print("\nThe environment: ");
        printEnvironment(env2);
        (_,value) = eval(env2, exp);
      then value;
  end matchcontinue;
end evalprogram;

function printAssignments
  input ExpLst assignList;
algorithm
  _ := matchcontinue(assignList)
    local ExpLst expLst; Exp exp;
    case ({})
      equation
      then (); // if nothing is in the list don't print anything
    case (exp::{}) 
      equation
        printExp(exp);
        print("\n");
      then ();
    case (exp::expLst) 
      equation
        printExp(exp);
        print(", ");
        printAssignments(expLst);
      then ();
  end matchcontinue;
end printAssignments;
  
  
function printExp
  input Exp inExp;
algorithm
  _ := matchcontinue(inExp)
    local   
      Integer i;
      Exp exp1, exp2, exp;
      Ident id;
    case(INT(i)) 
      equation
        print(intString(i));
      then ();
    case(BINARY(exp1, op, exp2)) 
      local BinOp op;
      equation
        printExp(exp1);
        printBinaryOp(op);
        printExp(exp2);
      then ();
    case (UNARY(op, exp))
      local UnOp op;
      equation
        printUnaryOp(op);
        printExp(exp);
      then ();
    case(ASSIGN(id, exp))
      equation
        print(id);
        print(" = ");
        printExp(exp);
      then ();
    case(IDENT(id)) 
      equation
        print(id);
      then ();
    case _
      equation
        print("- printExp failed\n");
      then fail();
  end matchcontinue;
end printExp;

function printBinaryOp
  input BinOp op;
algorithm
  _ := matchcontinue (op)
    case (ADD()) equation print("+"); then ();
    case (SUB()) equation print("-"); then ();
    case (MUL()) equation print("*"); then ();
    case (DIV()) equation print("/"); then ();
  end matchcontinue;   
end printBinaryOp;

function printUnaryOp
  input UnOp op;
algorithm
  _ := matchcontinue (op)
    case (NEG()) equation print("-"); then ();
  end matchcontinue;   
end printUnaryOp;

function printEnvironment
  input Env varBndList;
algorithm
  _ := matchcontinue(varBndList)
    local 
      Ident id;
      Value val; 
      Env varBndLstRest; 
    case ({}) then (); // if nothing is in the list don't print anything
    case ((id, val)::{}) 
      equation
        print(id);
        print(" = ");
        print(intString(val));
        print("\n");
      then ();
    case ((id, val)::varBndLstRest) 
      equation
        print(id);
        print(" = ");
        print(intString(val));
        print(", ");
        printEnvironment(varBndLstRest);
      then ();
  end matchcontinue;
end printEnvironment;
protected function yyparse
  output Integer i;
external annotation(Library = "parser.o lexer.o");
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

public function programIdent "for debugging"
  input Program prog;
  output Program out;
algorithm
  out := prog;
end programIdent;

end Assignment;

