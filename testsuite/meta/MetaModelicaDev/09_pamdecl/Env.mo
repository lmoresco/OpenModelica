package Env

public 
type Ident = String;

public 
uniontype Value
  record INTVAL
    Integer integer;
  end INTVAL;

  record REALVAL
    Real real;
  end REALVAL;

  record BOOLVAL
    Boolean boolean;
  end BOOLVAL;

end Value;

public 
uniontype Value2
  record INTVAL2
    Integer integer1;
    Integer integer2;
  end INTVAL2;

  record REALVAL2
    Real real1;
    Real real2;
  end REALVAL2;

end Value2;

public 
uniontype Type
  record INTTYPE end INTTYPE;

  record REALTYPE end REALTYPE;

  record BOOLTYPE end BOOLTYPE;

end Type;

public 
uniontype Bind
  record BIND
    Ident ident;
    Type type_;
    Value value;
  end BIND;

end Bind;

public 
type Env = list<Bind>;

public function initial_
  output BindLst outBindLst;
  type BindLst = list<Bind>;
algorithm 
  outBindLst:=
  matchcontinue ()
    case () then {BIND("false",BOOLTYPE(),BOOLVAL(false)),
          BIND("true",BOOLTYPE(),BOOLVAL(true))}; 
  end matchcontinue;
end initial_;

public function lookup
  input Env inEnv;
  input Ident inIdent;
  output Value outValue;
algorithm 
  outValue:=
  matchcontinue (inEnv,inIdent)
    local
      Ident idenv,id;
      Value v;
      Env rest;
    case ((BIND(ident = idenv,value = v) :: _),id)
      equation 
        equality(id = idenv); then v;
    case ((BIND(ident = idenv) :: rest),id)
      equation 
        failure(equality(id = idenv));
        v = lookup(rest, id); then v;
  end matchcontinue;
end lookup;

public function lookuptype
  input Env inEnv;
  input Ident inIdent;
  output Type outType;
algorithm 
  outType:=
  matchcontinue (inEnv,inIdent)
    local
      Ident idenv,id;
      Type t;
      Env rest;
    case ((BIND(ident = idenv,type_ = t) :: _),id)
      equation 
        equality(id = idenv); then t;
    case ((BIND(ident = idenv) :: rest),id)
      equation 
        failure(equality(id = idenv));
        t = lookuptype(rest, id); then t;
  end matchcontinue;
end lookuptype;

public function update
  input Env env;
  input Ident id;
  input Type ty;
  input Value v;
  output Env newenv;
algorithm 
  newenv := (BIND(id,ty,v) :: env);
end update;
end Env;

