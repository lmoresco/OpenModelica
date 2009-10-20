package Eval
  
import Absyn;

uniontype Value " Values, bindings and environment "
  record INTval
    Integer x1;
  end INTval;
  record REALval
    Real x1;
  end REALval;
end Value;

type VarBnd = tuple<Absyn.Ident,Value>;

type Env = list<VarBnd>;

type VarBndList = list<VarBnd>;
constant VarBndList init_env={};

uniontype Ty2 " Ty2 is an auxiliary datatype used to handle types during evaluation "
  record INT2
    Integer x1;
    Integer x2;
  end INT2;
  record REAL2
    Real x1;
    Real x2;
  end REAL2;
end Ty2;

protected function lookup "************** Auxiliary functions **************"
  input Env in_env;
  input Absyn.Ident in_ident;
  output Value out_value;
algorithm 
  out_value:=
  matchcontinue (in_env,in_ident)
    local
      String id2,id;
      Value value;
      list<tuple<String,Value>> rest;
    case ((id2,value) :: _,id) " lookup returns the value associated with an identifier.
 * If no association is present, lookup will fail. 
   Identifier id is found in the first pair of the list, and value
   * is returned. 
   "
      equation 
        equality(id = id2); then value;
    case ((id2,_) :: rest,id) " id is not found in the first pair of the list, and lookup will
   * recursively search the rest of the list. If found, value is returned.
   "
      equation 
        failure(equality(id = id2));
        value = lookup(rest, id); then value;
  end matchcontinue;
end lookup;

protected function lookupextend
  input Env in_env;
  input Absyn.Ident in_ident;
  output Env out_env;
  output Value out_value;
algorithm 
  (out_env,out_value):=
  matchcontinue (in_env,in_ident)
    local
      Value value;
      list<tuple<String,Value>> env;
      String id;
    case (env,id) " Return value of id in env. If id not present, add id and return 0 "
      equation 
        failure(value = lookup(env, id));
        value = INTval(0); then ((id,value) :: env,value);
    case (env,id)
      equation 
        value = lookup(env, id); then (env,value);
  end matchcontinue;
end lookupextend;

protected function update
  input Env in_env;
  input Absyn.Ident in_ident;
  input Value in_value;
  output Env out_env;
algorithm 
  out_env:=
  matchcontinue (in_env,in_ident,in_value)
    local
      list<tuple<String,Value>> env;
      String id;
      Value value;
    case (env,id,value) then (id,value) :: env; 
  end matchcontinue;
end update;

protected function type_lub
  input Value in_value1;
  input Value in_value2;
  output Ty2 out_ty2;
algorithm 
  out_ty2:=
  matchcontinue (in_value1,in_value2)
    local
      Integer x,y;
      Real x2,y2;
    case (INTval(x),INTval(y)) then INT2(x,y); 
    case (INTval(x),REALval(y))
      local Real y;
      equation 
        x2 = intReal(x); then REAL2(x2,y);
    case (REALval(x),INTval(y))
      local Real x;
      equation 
        y2 = intReal(y); then REAL2(x,y2);
    case (REALval(x),REALval(y))
      local Real x,y; then REAL2(x,y);
  end matchcontinue;
end type_lub;

protected function apply_int_binop "************** Binary and unary operators **************"
  input Absyn.BinOp in_binop1;
  input Integer in_integer2;
  input Integer in_integer3;
  output Integer outInteger;
algorithm 
  outInteger:=
  matchcontinue (in_binop1,in_integer2,in_integer3)
    local Integer x,y;
    case (Absyn.ADD(),x,y) then x + y;
    case (Absyn.SUB(),x,y) then x - y;
    case (Absyn.MUL(),x,y) then x * y;
    case (Absyn.DIV(),x,y) then intDiv(x, y);
  end matchcontinue;
end apply_int_binop;

protected function apply_real_binop
  input Absyn.BinOp in_binop1;
  input Real in_real2;
  input Real in_real3;
  output Real out_real;
algorithm 
  out_real:=
  matchcontinue (in_binop1,in_real2,in_real3)
    local Real x,y;
    case (Absyn.ADD(),x,y) then x + y;
    case (Absyn.SUB(),x,y) then x - y;
    case (Absyn.MUL(),x,y) then x * y;
    case (Absyn.DIV(),x,y) then x / y;
  end matchcontinue;
end apply_real_binop;

protected function apply_int_unop
  input Absyn.UnOp AbsynNEG;
  input Integer x;
  output Integer y;
algorithm 
  y := -x;
end apply_int_unop;

protected function apply_real_unop
  input Absyn.UnOp AbsynNEG;
  input Real x;
  output Real y;
algorithm 
  y := -.x;
end apply_real_unop;

public function eval "************** Expression evaluation **************"
  input Env in_env;
  input Absyn.Exp in_exp;
  output Env out_env;
  output Value out_value;
algorithm 
  (out_env,out_value):=
  matchcontinue (in_env,in_exp)
    local
      list<tuple<String,Value>> env,env2,env1;
      Integer ival,x,y,z;
      Real rval;
      Value value,v1,v2;
      String id;
      Absyn.Exp e1,e2,e,exp;
      Absyn.BinOp binop;
      Absyn.UnOp unop;
    case (env,Absyn.INT(ival)) then (env,INTval(ival)); 
    case (env,Absyn.REAL(rval)) then (env,REALval(rval)); 
    case (env,Absyn.IDENT(id)) " variable id "
      equation 
        (env2,value) = lookupextend(env, id); then (env2,value);
    case (env,Absyn.BINARY(e1,binop,e2)) " int binop int "
      equation 
        (env1,v1) = eval(env, e1);
        (env2,v2) = eval(env, e2);
        INT2(x,y) = type_lub(v1, v2);
        z = apply_int_binop(binop, x, y); then (env2,INTval(z));
    case (env,Absyn.BINARY(e1,binop,e2)) " int/real binop int/real "
      local Real x,y,z;
      equation 
        (env1,v1) = eval(env, e1);
        (env2,v2) = eval(env, e2);
        REAL2(x,y) = type_lub(v1, v2);
        z = apply_real_binop(binop, x, y); then (env2,REALval(z));
    case (env,Absyn.UNARY(unop,e)) " int unop exp "
      equation
        (env1,INTval(x)) = eval(env, e);
        y = apply_int_unop(unop, x); then (env1,INTval(y));
    case (env,Absyn.UNARY(unop,e)) " real unop exp "
      local Real x,y;
      equation 
        (env1,REALval(x)) = eval(env, e);
        y = apply_real_unop(unop, x); then (env1,REALval(y));
    case (env,Absyn.ASSIGN(id,exp)) " eval of an assignment node returns the updated environment and
   * the assigned value   id := exp "
      equation
        (env1,value) = eval(env, exp);
        env2 = update(env1, id, value); then (env2,value);
    case (_,_)
      equation
        print("eval failed\n");
      then fail();
  end matchcontinue;
end eval;
end Eval;

