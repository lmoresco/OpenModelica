package FCEmit "fcemit.rml"

public import FCode;

protected function printInt
  input Integer i;
  String s;
algorithm 
  s := intString(i);
  print(s);
end printInt;

protected function foreach
  input FuncTypeType_aTo inFuncTypeTypeATo;
  input list<Type_a> inTypeALst;
  partial function FuncTypeType_aTo
    input Type_a inTypeA;
    replaceable type Type_a subtypeof Any;
  end FuncTypeType_aTo;
  replaceable type Type_a subtypeof Any;
algorithm 
  _:=
  matchcontinue (inFuncTypeTypeATo,inTypeALst)
    local
      FuncTypeType_aTo F;
      Type_a x;
      list<Type_a> xs;
    case (_,{}) then (); 
    case (F,(x :: xs))
      equation 
        F(x);
        foreach(F, xs);
      then
        ();
  end matchcontinue;
end foreach;

protected function map
  input FuncTypeType_aToType_b inFuncTypeTypeAToTypeB;
  input list<Type_a> inTypeALst;
  output list<Type_b> outTypeBLst;
  partial function FuncTypeType_aToType_b
    input Type_a inTypeA;
    output Type_b outTypeB;
    replaceable type Type_a subtypeof Any;
    replaceable type Type_b subtypeof Any;
  end FuncTypeType_aToType_b;
  replaceable type Type_a subtypeof Any;
  replaceable type Type_b subtypeof Any;
algorithm 
  outTypeBLst:=
  matchcontinue (inFuncTypeTypeAToTypeB,inTypeALst)
    local
      Type_b y;
      list<Type_b> ys;
      FuncTypeType_aToType_b F;
      Type_a x;
      list<Type_a> xs;
    case (_,{}) then {}; 
    case (F,(x :: xs))
      equation 
        y = F(x);
        ys = map(F, xs);
      then
        (y :: ys);
  end matchcontinue;
end map;

protected 
uniontype Base
  record BASE
    String string;
  end BASE;

  record REC
    Integer integer;
  end REC;

end Base;

protected 
uniontype InvTy
  record PTRity
    InvTy invTy;
  end PTRity;

  record ARRity
    InvTy invTy;
    Integer integer;
  end ARRity;

  record VARity
    String string;
  end VARity;

  record FUNity
    String string;
    list<Arg> argLst;
  end FUNity;

end InvTy;

protected 
uniontype Arg
  record ARG
    Base base;
    InvTy invTy;
  end ARG;

end Arg;

protected function emitStruct
  input Integer stamp;
algorithm 
  print("struct rec");
  printInt(stamp);
end emitStruct;

protected function emitBase
  input Base inBase;
algorithm 
  _:=
  matchcontinue (inBase)
    local
      String str;
      Integer stamp;
    case (BASE(str))
      equation 
        print(str);
      then
        ();
    case (REC(stamp))
      equation 
        emitStruct(stamp);
      then
        ();
  end matchcontinue;
end emitBase;

protected function emitInvty
  input InvTy inInvTy;
algorithm 
  _:=
  matchcontinue (inInvTy)
    local
      InvTy ity;
      Integer sz;
      String str,id;
      list<Arg> args;
    case (PTRity(ity))
      equation 
        print("(");
        print("*");
        emitInvty(ity);
        print(")");
      then
        ();
    case (ARRity(ity,sz))
      equation 
        emitInvty(ity);
        print("[");
        printInt(sz);
        print("]");
      then
        ();
    case (VARity(str))
      equation 
        print(str);
      then
        ();
    case (FUNity(id,args))
      equation 
        print(id);
        print("(");
        emitArgs(args);
        print(")");
      then
        ();
  end matchcontinue;
end emitInvty;

protected function emitArgs
  input list<Arg> inArgLst;
algorithm 
  _:=
  matchcontinue (inArgLst)
    local
      Arg arg;
      list<Arg> args;
    case ({})
      equation 
        print("void");
      then
        ();
    case ((arg :: args))
      equation 
        emitArg(arg);
        foreach(emitCommaArg, args);
      then
        ();
  end matchcontinue;
end emitArgs;

protected function emitArg
  input Arg inArg;
algorithm 
  _:=
  matchcontinue (inArg)
    local
      Base base;
      InvTy ity;
    case (ARG(base,ity))
      equation 
        emitBase(base);
        print(" ");
        emitInvty(ity);
      then
        ();
  end matchcontinue;
end emitArg;

protected function emitCommaArg
  input Arg arg;
algorithm 
  print(", ");
  emitArg(arg);
end emitCommaArg;

protected function invertTy
  input InvTy inInvTy;
  input FCode.Ty inTy;
  output Base outBase;
  output InvTy outInvTy;
algorithm 
  (outBase,outInvTy):=
  matchcontinue (inInvTy,inTy)
    local
      replaceable type Type_a subtypeof Any;
      Type_a ity;
      Base base;
      InvTy ity_1;
      FCode.Ty ty;
      Integer sz,stamp;
    case (ity,FCode.CHAR()) then (BASE("char"),ity); 
    case (ity,FCode.INT()) then (BASE("int"),ity); 
    case (ity,FCode.REAL()) then (BASE("double"),ity); 
    case (ity,FCode.PTR(ty))
      local InvTy ity;
      equation 
        (base,ity_1) = invertTy(PTRity(ity), ty);
      then
        (base,ity_1);
    case (ity,FCode.ARR(sz,ty))
      local InvTy ity;
      equation 
        (base,ity_1) = invertTy(ARRity(ity,sz), ty);
      then
        (base,ity_1);
    case (ity,FCode.REC(FCode.RECORD(stamp,_)))
      local InvTy ity;
      then
        (REC(stamp),ity);
    case (ity,FCode.UNFOLD(stamp))
      local InvTy ity;
      then
        (REC(stamp),ity);
  end matchcontinue;
end invertTy;

protected function emitVar
  input FCode.Var inVar;
algorithm 
  _:=
  matchcontinue (inVar)
    local
      Base base;
      InvTy ity;
      String id;
      FCode.Ty ty;
    case (FCode.VAR(id,ty))
      equation 
        (base,ity) = invertTy(VARity(id), ty);
        emitBase(base);
        print(" ");
        emitInvty(ity);
      then
        ();
  end matchcontinue;
end emitVar;

protected function emitVarBnd
  input FCode.Var var;
algorithm 
  print("\t");
  emitVar(var);
  print(";\n");
end emitVarBnd;

protected function emitRecBnds
  input list<FCode.Var> inFCodeVarLst;
  input String inString;
algorithm 
  _:=
  matchcontinue (inFCodeVarLst,inString)
    local
      String id_1,id,prefix;
      FCode.Ty ty;
      list<FCode.Var> bnds;
    case ({},_) then (); 
    case ((FCode.VAR(id,ty) :: bnds),prefix)
      equation 
        id_1 = stringAppend(prefix, id);
        emitVarBnd(FCode.VAR(id_1,ty));
        emitRecBnds(bnds, prefix);
      then
        ();
  end matchcontinue;
end emitRecBnds;

protected function emitRecord
  input FCode.Record inRecord;
algorithm 
  _:=
  matchcontinue (inRecord)
    local
      String stamp1,prefix0,prefix1;
      Integer stamp0;
      list<FCode.Var> bnds;
    case (FCode.RECORD(_,{})) then (); 
    case (FCode.RECORD(stamp0,(bnds as (_ :: _))))
      equation 
        emitStruct(stamp0);
        print(" {\n");
        stamp1 = intString(stamp0);
        prefix0 = stringAppend("rec", stamp1);
        prefix1 = stringAppend(prefix0, "_");
        emitRecBnds(bnds, prefix1);
        print("};\n");
      then
        ();
  end matchcontinue;
end emitRecord;

protected function emitUnop
  input FCode.UnOp inUnOp;
algorithm 
  _:=
  matchcontinue (inUnOp)
    local
      Base base;
      InvTy ity;
      FCode.Ty ty;
      Integer stamp;
      String id;
    case (FCode.CtoI())
      equation 
        print("(int)(");
      then
        ();
    case (FCode.ItoR())
      equation 
        print("(double)(");
      then
        ();
    case (FCode.RtoI())
      equation 
        print("(int)(");
      then
        ();
    case (FCode.ItoC())
      equation 
        print("(char)(");
      then
        ();
    case (FCode.PtoI())
      equation 
        print("(int)(");
      then
        ();
    case (FCode.TOPTR(ty))
      equation 
        print("(");
        (base,ity) = invertTy(VARity(""), FCode.PTR(ty));
        emitBase(base);
        print(" ");
        emitInvty(ity);
        print(")(");
      then
        ();
    case (FCode.LOAD(_))
      equation 
        print("*(");
      then
        ();
    case (FCode.OFFSET(FCode.RECORD(stamp,_),id))
      equation 
        print("P_OFFSET(rec");
        printInt(stamp);
        print("_");
        print(id);
        print(",");
      then
        ();
  end matchcontinue;
end emitUnop;

protected function binopToStr
  input FCode.BinOp inBinOp;
  output String outString;
algorithm 
  outString:=
  matchcontinue (inBinOp)
    case (FCode.IADD()) then " + "; 
    case (FCode.ISUB()) then " - "; 
    case (FCode.IMUL()) then " * "; 
    case (FCode.IDIV()) then " / "; 
    case (FCode.IMOD()) then " % "; 
    case (FCode.IAND()) then " && "; 
    case (FCode.IOR()) then " || "; 
    case (FCode.ILT()) then " < "; 
    case (FCode.ILE()) then " <= "; 
    case (FCode.IEQ()) then " == "; 
    case (FCode.RADD()) then " + "; 
    case (FCode.RSUB()) then " - "; 
    case (FCode.RMUL()) then " * "; 
    case (FCode.RDIV()) then " / "; 
    case (FCode.RLT()) then " < "; 
    case (FCode.RLE()) then " <= "; 
    case (FCode.REQ()) then " == "; 
    case (FCode.PADD(_)) then " + "; 
    case (FCode.PSUB(_)) then " - "; 
    case (FCode.PDIFF(_)) then " - "; 
    case (FCode.PLT(_)) then " < "; 
    case (FCode.PLE(_)) then " <= "; 
    case (FCode.PEQ(_)) then " == "; 
  end matchcontinue;
end binopToStr;

protected function emitExp
  input FCode.Exp inExp;
algorithm 
  _:=
  matchcontinue (inExp)
    local
      Integer i,level;
      String r_1,str,id;
      Real r;
      FCode.UnOp unop;
      FCode.Exp exp,exp1,exp2;
      FCode.BinOp binop;
      list<FCode.Exp> exps;
    case (FCode.ICON(i))
      equation 
        printInt(i);
      then
        ();
    case (FCode.RCON(r))
      equation 
        r_1 = realString(r);
        print(r_1);
      then
        ();
    case (FCode.DISPLAY(level))
      equation 
        print("display[");
        printInt(level);
        print("]");
      then
        ();
    case (FCode.UNARY(unop,exp))
      equation 
        emitUnop(unop);
        emitExp(exp);
        print(")");
      then
        ();
    case (FCode.BINARY(exp1,binop,exp2))
      equation 
        print("((");
        emitExp(exp1);
        print(")");
        str = binopToStr(binop);
        print(str);
        print("(");
        emitExp(exp2);
        print("))");
      then
        ();
    case (FCode.FCALL(id,exps))
      equation 
        print(id);
        print("(");
        emitExps(exps);
        print(")");
      then
        ();
  end matchcontinue;
end emitExp;

protected function emitCommaExp
  input FCode.Exp exp;
algorithm 
  print(", ");
  emitExp(exp);
end emitCommaExp;

protected function emitExps
  input list<FCode.Exp> inFCodeExpLst;
algorithm 
  _:=
  matchcontinue (inFCodeExpLst)
    local
      FCode.Exp exp;
      list<FCode.Exp> exps;
    case {} then (); 
    case ((exp :: exps))
      equation 
        emitExp(exp);
        foreach(emitCommaExp, exps);
      then
        ();
  end matchcontinue;
end emitExps;

protected function emitAssignRetval
  input Option<tuple<Type_a, FCode.Exp>> inTplTypeAFCodeExpOption;
  replaceable type Type_a subtypeof Any;
algorithm 
  _:=
  matchcontinue (inTplTypeAFCodeExpOption)
    local FCode.Exp exp;
    case (NONE) then (); 
    case (SOME((_,exp)))
      equation 
        print("\tretval = ");
        emitExp(exp);
        print(";\n");
      then
        ();
  end matchcontinue;
end emitAssignRetval;

protected function emitStmt
  input FCode.Stmt inStmt;
algorithm 
  _:=
  matchcontinue (inStmt)
    local
      FCode.Exp lhs,rhs,exp;
      String id;
      list<FCode.Exp> exps;
      Option<tuple<FCode.Ty, FCode.Exp>> ret;
      FCode.Stmt stmt,stmt1,stmt2;
    case (FCode.STORE(_,lhs,rhs))
      equation 
        print("\t*");
        emitExp(lhs);
        print(" = ");
        emitExp(rhs);
        print(";\n");
      then
        ();
    case (FCode.PCALL(id,exps))
      equation 
        print("\t");
        print(id);
        print("(");
        emitExps(exps);
        print(");\n");
      then
        ();
    case (FCode.RETURN(ret))
      equation 
        emitAssignRetval(ret);
        print("\tgoto epilogue;\n");
      then
        ();
    case (FCode.WHILE(exp,stmt))
      equation 
        print("\twhile( ");
        emitExp(exp);
        print(" ) {\n");
        emitStmt(stmt);
        print("\t}\n");
      then
        ();
    case (FCode.IF(exp,stmt1,stmt2))
      equation 
        print("\tif( ");
        emitExp(exp);
        print(" ) {\n");
        emitStmt(stmt1);
        print("\t} else {\n");
        emitStmt(stmt2);
        print("\t}\n");
      then
        ();
    case (FCode.SEQ(stmt1,stmt2))
      equation 
        emitStmt(stmt1);
        emitStmt(stmt2);
      then
        ();
    case (FCode.SKIP()) then (); 
  end matchcontinue;
end emitStmt;

protected function convFormalDecl
  input FCode.Var inVar;
  output Arg outArg;
algorithm 
  outArg:=
  matchcontinue (inVar)
    local
      Base base;
      InvTy ity;
      FCode.Ty ty;
    case (FCode.VAR(_,ty))
      equation 
        (base,ity) = invertTy(VARity(""), ty);
      then
        ARG(base,ity);
  end matchcontinue;
end convFormalDecl;

protected function emitProcHead
  input Option<FCode.Ty> inFCodeTyOption;
  input String inString;
  input list<Arg> inArgLst;
algorithm 
  _:=
  matchcontinue (inFCodeTyOption,inString,inArgLst)
    local
      String id;
      list<Arg> args;
      Base base;
      InvTy ity;
      FCode.Ty ty;
    case (NONE,id,args)
      equation 
        print("void ");
        print(id);
        print("(");
        emitArgs(args);
        print(")");
      then
        ();
    case (SOME(ty),id,args)
      equation 
        (base,ity) = invertTy(FUNity(id,args), ty);
        emitBase(base);
        print(" ");
        emitInvty(ity);
      then
        ();
  end matchcontinue;
end emitProcHead;

protected function emitProcDecl
  input FCode.Proc inProc;
algorithm 
  _:=
  matchcontinue (inProc)
    local
      list<Arg> formals_1;
      String id;
      list<FCode.Var> formals;
      Option<FCode.Ty> ty_opt;
    case (FCode.PROC(id,formals,ty_opt,_))
      equation 
        formals_1 = map(convFormalDecl, formals);
        print("extern ");
        emitProcHead(ty_opt, id, formals_1);
        print(";\n");
      then
        ();
  end matchcontinue;
end emitProcDecl;

protected function convFormalDefn
  input FCode.Var inVar;
  output Arg outArg;
algorithm 
  outArg:=
  matchcontinue (inVar)
    local
      Base base;
      InvTy ity;
      String id;
      FCode.Ty ty;
    case (FCode.VAR(id,ty))
      equation 
        (base,ity) = invertTy(VARity(id), ty);
      then
        ARG(base,ity);
  end matchcontinue;
end convFormalDefn;

protected function emitDeclRetval
  input Option<FCode.Ty> inFCodeTyOption;
algorithm 
  _:=
  matchcontinue (inFCodeTyOption)
    local FCode.Ty ty;
    case (NONE) then (); 
    case (SOME(ty))
      equation 
        emitVarBnd(FCode.VAR("retval",ty));
      then
        ();
  end matchcontinue;
end emitDeclRetval;

protected function emitReturnRetval
  input Option<Type_a> inTypeAOption;
  replaceable type Type_a subtypeof Any;
algorithm 
  _:=
  matchcontinue (inTypeAOption)
    case (NONE) then (); 
    case (SOME(_))
      equation 
        print("\treturn retval;\n");
      then
        ();
  end matchcontinue;
end emitReturnRetval;

protected function emitLoadFormals
  input list<FCode.Var> inFCodeVarLst;
  input String inString;
algorithm 
  _:=
  matchcontinue (inFCodeVarLst,inString)
    local
      String id,stamp;
      list<FCode.Var> formals;
    case ({},_) then (); 
    case ((FCode.VAR(id,_) :: formals),stamp)
      equation 
        print("\tframe.rec");
        print(stamp);
        print("_");
        print(id);
        print(" = ");
        print(id);
        print(";\n");
        emitLoadFormals(formals, stamp);
      then
        ();
  end matchcontinue;
end emitLoadFormals;

protected function emitSetupDisplay
  input Integer inInteger;
  input list<FCode.Var> inFCodeVarLst;
  input FCode.Record inRecord;
algorithm 
  _:=
  matchcontinue (inInteger,inFCodeVarLst,inRecord)
    local
      String lev_1,stamp_1;
      Integer lev,stamp;
      list<FCode.Var> formals,vars;
    case (_,_,FCode.RECORD(_,{})) then (); 
    case (lev,formals,FCode.RECORD(stamp,(vars as (_ :: _))))
      equation 
        print("\t");
        emitStruct(stamp);
        print(" frame;\n");
        print("\tvoid *saveFP = display[");
        lev_1 = intString(lev);
        print(lev_1);
        print("];\n");
        print("\tdisplay[");
        print(lev_1);
        print("] = &frame;\n");
        stamp_1 = intString(stamp);
        emitLoadFormals(formals, stamp_1);
      then
        ();
  end matchcontinue;
end emitSetupDisplay;

protected function emitRestoreDisplay
  input Integer inInteger;
  input FCode.Record inRecord;
algorithm 
  _:=
  matchcontinue (inInteger,inRecord)
    local Integer lev;
    case (_,FCode.RECORD(_,{})) then (); 
    case (lev,FCode.RECORD(_,(_ :: _)))
      equation 
        print("\tdisplay[");
        printInt(lev);
        print("] = saveFP;\n");
      then
        ();
  end matchcontinue;
end emitRestoreDisplay;

protected function emitProcDefn
  input FCode.Proc inProc;
algorithm 
  _:=
  matchcontinue (inProc)
    local
      list<Arg> formals_1;
      String id;
      list<FCode.Var> formals;
      Option<FCode.Ty> ty_opt;
      Integer lev;
      FCode.Record r;
      FCode.Stmt stmt;
    case (FCode.PROC(_,_,_,NONE)) then (); 
    case (FCode.PROC(id,formals,ty_opt,SOME(FCode.BLOCK(lev,r,stmt))))
      equation 
        formals_1 = map(convFormalDefn, formals);
        emitProcHead(ty_opt, id, formals_1);
        print("\n{\n");
        emitDeclRetval(ty_opt);
        emitSetupDisplay(lev, formals, r);
        emitStmt(stmt);
        print("epilogue:;\n");
        emitRestoreDisplay(lev, r);
        emitReturnRetval(ty_opt);
        print("}\n");
      then
        ();
  end matchcontinue;
end emitProcDefn;

protected 
uniontype Cmp "
  RECORDS
"
  record LT end LT;

  record EQ end EQ;

  record GT end GT;

end Cmp;

protected function compare1
  input Integer inInteger1;
  input Integer inInteger2;
  output Cmp outCmp;
algorithm 
  outCmp:=
  matchcontinue (inInteger1,inInteger2)
    local Integer i,j;
    case (i,j)
      equation 
        (i < j) = true;
      then
        LT();
    case (i,j)
      equation 
        (i < j) = false;
      then
        GT();
  end matchcontinue;
end compare1;

protected function compare
  input Integer inInteger1;
  input Integer inInteger2;
  output Cmp outCmp;
algorithm 
  outCmp:=
  matchcontinue (inInteger1,inInteger2)
    local
      Integer i,j;
      Cmp cmp;
    case (i,j)
      equation 
        (i == j) = true;
      then
        EQ();
    case (i,j)
      equation 
        (i == j) = false;
        cmp = compare1(i, j);
      then
        cmp;
  end matchcontinue;
end compare;

protected 
uniontype RTree
  record EMPTY end EMPTY;

  record NODE
    RTree rTree1;
    FCode.Record record_2;
    RTree rTree3;
  end NODE;

end RTree;

protected function insert
  input FCode.Record inRecord;
  input RTree inRTree;
  output RTree outRTree;
algorithm 
  outRTree:=
  matchcontinue (inRecord,inRTree)
    local
      FCode.Record r,r_1;
      Cmp cmp;
      RTree left_1,right_1,left,right;
      Integer stamp_1,stamp;
    case (r,EMPTY()) then NODE(EMPTY(),r,EMPTY()); 
    case ((r_1 as FCode.RECORD(stamp_1,_)),NODE(left,(r as FCode.RECORD(stamp,_)),right))
      equation 
        cmp = compare(stamp_1, stamp);
        (left_1,right_1) = insert1(cmp, r_1, left, right);
      then
        NODE(left_1,r,right_1);
  end matchcontinue;
end insert;

protected function insert1
  input Cmp inCmp1;
  input FCode.Record inRecord2;
  input RTree inRTree3;
  input RTree inRTree4;
  output RTree outRTree1;
  output RTree outRTree2;
algorithm 
  (outRTree1,outRTree2):=
  matchcontinue (inCmp1,inRecord2,inRTree3,inRTree4)
    local
      RTree left,right,left_1,right_1;
      FCode.Record r_1;
    case (EQ(),_,left,right) then (left,right); 
    case (LT(),r_1,left,right)
      equation 
        left_1 = insert(r_1, left);
      then
        (left_1,right);
    case (GT(),r_1,left,right)
      equation 
        right_1 = insert(r_1, right);
      then
        (left,right_1);
  end matchcontinue;
end insert1;

protected function emitRecTree
  input RTree inRTree;
algorithm 
  _:=
  matchcontinue (inRTree)
    local
      RTree left,right;
      FCode.Record r;
    case (EMPTY()) then (); 
    case (NODE(left,r,right))
      equation 
        emitRecTree(left);
        emitRecord(r);
        emitRecTree(right);
      then
        ();
  end matchcontinue;
end emitRecTree;

protected function tyRecs
  input FCode.Ty inTy;
  input RTree inRTree;
  output RTree outRTree;
algorithm 
  outRTree:=
  matchcontinue (inTy,inRTree)
    local
      replaceable type Type_a subtypeof Any;
      Type_a recs,recs1,recs0;
      FCode.Ty ty;
      RTree recs2;
      FCode.Record r;
      list<FCode.Var> bnds;
    case (FCode.CHAR(),recs) then recs; 
    case (FCode.INT(),recs) then recs; 
    case (FCode.REAL(),recs) then recs; 
    case (FCode.PTR(ty),recs0)
      equation 
        recs1 = tyRecs(ty, recs0);
      then
        recs1;
    case (FCode.ARR(_,ty),recs0)
      equation 
        recs1 = tyRecs(ty, recs0);
      then
        recs1;
    case (FCode.REC((r as FCode.RECORD(_,bnds))),recs0)
      local RTree recs1,recs0;
      equation 
        recs1 = insert(r, recs0);
        recs2 = varsRecs(bnds, recs1);
      then
        recs2;
    case (FCode.UNFOLD(_),recs)
      local RTree recs;
      then
        recs;
  end matchcontinue;
end tyRecs;

protected function varsRecs
  input list<FCode.Var> inFCodeVarLst;
  input RTree inRTree;
  output RTree outRTree;
algorithm 
  outRTree:=
  matchcontinue (inFCodeVarLst,inRTree)
    local
      RTree recs,recs1,recs2,recs0;
      FCode.Ty ty;
      list<FCode.Var> vars;
    case ({},recs) then recs; 
    case ((FCode.VAR(_,ty) :: vars),recs0)
      equation 
        recs1 = tyRecs(ty, recs0);
        recs2 = varsRecs(vars, recs1);
      then
        recs2;
  end matchcontinue;
end varsRecs;

protected function tyOptRecs
  input Option<FCode.Ty> inFCodeTyOption;
  input RTree inRTree;
  output RTree outRTree;
algorithm 
  outRTree:=
  matchcontinue (inFCodeTyOption,inRTree)
    local
      replaceable type Type_a subtypeof Any;
      Type_a recs;
      RTree recs1,recs0;
      FCode.Ty ty;
    case (NONE,recs) then recs; 
    case (SOME(ty),recs0)
      equation 
        recs1 = tyRecs(ty, recs0);
      then
        recs1;
  end matchcontinue;
end tyOptRecs;

protected function unopRecs
  input FCode.UnOp inUnOp;
  input RTree inRTree;
  output RTree outRTree;
algorithm 
  outRTree:=
  matchcontinue (inUnOp,inRTree)
    local
      RTree recs1,recs0,recs;
      FCode.Ty ty;
    case (FCode.TOPTR(ty),recs0)
      equation 
        recs1 = tyRecs(ty, recs0);
      then
        recs1;
    case (FCode.CtoI(),recs) then recs; 
    case (FCode.ItoR(),recs) then recs; 
    case (FCode.RtoI(),recs) then recs; 
    case (FCode.ItoC(),recs) then recs; 
    case (FCode.PtoI(),recs) then recs; 
    case (FCode.LOAD(_),recs) then recs; 
    case (FCode.OFFSET(_,_),recs) then recs; 
  end matchcontinue;
end unopRecs;

protected function expRecs
  input FCode.Exp inExp;
  input RTree inRTree;
  output RTree outRTree;
algorithm 
  outRTree:=
  matchcontinue (inExp,inRTree)
    local
      replaceable type Type_a subtypeof Any;
      Type_a recs;
      RTree recs1,recs2,recs0;
      FCode.UnOp unop;
      FCode.Exp exp,exp1,exp2;
      list<FCode.Exp> exps;
    case (FCode.ICON(_),recs) then recs; 
    case (FCode.RCON(_),recs) then recs; 
    case (FCode.DISPLAY(_),recs) then recs; 
    case (FCode.UNARY(unop,exp),recs0)
      equation 
        recs1 = unopRecs(unop, recs0);
        recs2 = expRecs(exp, recs1);
      then
        recs1;
    case (FCode.BINARY(exp1,_,exp2),recs0)
      equation 
        recs1 = expRecs(exp1, recs0);
        recs2 = expRecs(exp2, recs1);
      then
        recs2;
    case (FCode.FCALL(_,exps),recs0)
      equation 
        recs1 = expsRecs(exps, recs0);
      then
        recs1;
  end matchcontinue;
end expRecs;

protected function expsRecs
  input list<FCode.Exp> inFCodeExpLst;
  input RTree inRTree;
  output RTree outRTree;
algorithm 
  outRTree:=
  matchcontinue (inFCodeExpLst,inRTree)
    local
      RTree recs,recs1,recs2,recs0;
      FCode.Exp exp;
      list<FCode.Exp> exps;
    case ({},recs) then recs; 
    case ((exp :: exps),recs0)
      equation 
        recs1 = expRecs(exp, recs0);
        recs2 = expsRecs(exps, recs1);
      then
        recs2;
  end matchcontinue;
end expsRecs;

protected function stmtRecs
  input FCode.Stmt inStmt;
  input RTree inRTree;
  output RTree outRTree;
algorithm 
  outRTree:=
  matchcontinue (inStmt,inRTree)
    local
      RTree recs1,recs2,recs3,recs0,recs;
      FCode.Ty ty;
      FCode.Exp exp1,exp2,exp;
      list<FCode.Exp> exps;
      FCode.Stmt stmt,stmt1,stmt2;
    case (FCode.STORE(ty,exp1,exp2),recs0)
      equation 
        recs1 = tyRecs(ty, recs0);
        recs2 = expRecs(exp1, recs1);
        recs3 = expRecs(exp2, recs2);
      then
        recs3;
    case (FCode.PCALL(_,exps),recs0)
      equation 
        recs1 = expsRecs(exps, recs0);
      then
        recs1;
    case (FCode.RETURN(NONE),recs) then recs; 
    case (FCode.RETURN(SOME((_,exp))),recs0)
      equation 
        recs1 = expRecs(exp, recs0);
      then
        recs1;
    case (FCode.WHILE(exp,stmt),recs0)
      equation 
        recs1 = expRecs(exp, recs0);
        recs2 = stmtRecs(stmt, recs1);
      then
        recs2;
    case (FCode.IF(exp,stmt1,stmt2),recs0)
      equation 
        recs1 = expRecs(exp, recs0);
        recs2 = stmtRecs(stmt1, recs1);
        recs3 = stmtRecs(stmt2, recs2);
      then
        recs3;
    case (FCode.SEQ(stmt1,stmt2),recs0)
      equation 
        recs1 = stmtRecs(stmt1, recs0);
        recs2 = stmtRecs(stmt2, recs1);
      then
        recs2;
    case (FCode.SKIP(),recs) then recs; 
  end matchcontinue;
end stmtRecs;

protected function blockOptRecs
  input Option<FCode.Block> inFCodeBlockOption;
  input RTree inRTree;
  output RTree outRTree;
algorithm 
  outRTree:=
  matchcontinue (inFCodeBlockOption,inRTree)
    local
      replaceable type Type_a subtypeof Any;
      Type_a recs;
      RTree recs1,recs2,recs0;
      FCode.Record r;
      FCode.Stmt stmt;
    case (NONE,recs) then recs; 
    case (SOME(FCode.BLOCK(_,r,stmt)),recs0)
      equation 
        recs1 = insert(r, recs0);
        recs2 = stmtRecs(stmt, recs1);
      then
        recs2;
  end matchcontinue;
end blockOptRecs;

protected function procRecs
  input FCode.Proc inProc;
  input RTree inRTree;
  output RTree outRTree;
algorithm 
  outRTree:=
  matchcontinue (inProc,inRTree)
    local
      RTree recs1,recs2,recs3,recs0;
      list<FCode.Var> formals;
      Option<FCode.Ty> ty_opt;
      Option<FCode.Block> block_opt;
    case (FCode.PROC(_,formals,ty_opt,block_opt),recs0)
      equation 
        recs1 = varsRecs(formals, recs0);
        recs2 = tyOptRecs(ty_opt, recs1);
        recs3 = blockOptRecs(block_opt, recs2);
      then
        recs3;
  end matchcontinue;
end procRecs;

protected function procsRecs
  input list<FCode.Proc> inFCodeProcLst;
  input RTree inRTree;
  output RTree outRTree;
algorithm 
  outRTree:=
  matchcontinue (inFCodeProcLst,inRTree)
    local
      replaceable type Type_a subtypeof Any;
      Type_a recs;
      RTree recs1,recs2,recs0;
      FCode.Proc proc;
      list<FCode.Proc> procs;
    case ({},recs) then recs; 
    case ((proc :: procs),recs0)
      equation 
        recs1 = procRecs(proc, recs0);
        recs2 = procsRecs(procs, recs1);
      then
        recs2;
  end matchcontinue;
end procsRecs;

protected function emitRecordDefns
  input list<FCode.Proc> procs;
  RTree recs;
algorithm 
  recs := procsRecs(procs, EMPTY());
  emitRecTree(recs);
end emitRecordDefns;

public function emit "
  PROGRAMS
"
  input FCode.Prog inProg;
algorithm 
  _:=
  matchcontinue (inProg)
    local
      list<FCode.Proc> procs;
      String id;
    case (FCode.PROG(procs,id))
      equation 
        print("#include \"petrol.h\"\nvoid *display[16];\n");
        emitRecordDefns(procs);
        foreach(emitProcDecl, procs);
        foreach(emitProcDefn, procs);
        print("int main(void)\n{\n\t");
        print(id);
        print("();\n\treturn 0;\n}\n");
      then
        ();
  end matchcontinue;
end emit;
end FCEmit;

