encapsulated package SimCodeDump

public import Tpl;

public import SimCode;
public import BackendDAE;
public import System;
public import Absyn;
public import DAE;
public import ClassInf;
public import SCode;
public import Util;
public import ComponentReference;
public import Expression;
public import ExpressionDump;
public import RTOpts;
public import Settings;
public import Patternm;
public import Error;
public import Values;
public import ValuesUtil;
public import BackendQSS;
public import DAEDump;
public import Algorithm;
public import SimCodeC;

public function dumpSimCode
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_code;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_code)
    local
      Tpl.Text txt;
      list<SimCode.SimEqSystem> i_sc_allEquations;
      list<SimCode.SimVar> i_vars_constVars;
      list<SimCode.SimVar> i_vars_jacobianVars;
      list<SimCode.SimVar> i_vars_extObjVars;
      list<SimCode.SimVar> i_vars_stringAliasVars;
      list<SimCode.SimVar> i_vars_stringParamVars;
      list<SimCode.SimVar> i_vars_stringAlgVars;
      list<SimCode.SimVar> i_vars_boolParamVars;
      list<SimCode.SimVar> i_vars_intParamVars;
      list<SimCode.SimVar> i_vars_paramVars;
      list<SimCode.SimVar> i_vars_boolAliasVars;
      list<SimCode.SimVar> i_vars_intAliasVars;
      list<SimCode.SimVar> i_vars_aliasVars;
      list<SimCode.SimVar> i_vars_outputVars;
      list<SimCode.SimVar> i_vars_inputVars;
      list<SimCode.SimVar> i_vars_boolAlgVars;
      list<SimCode.SimVar> i_vars_intAlgVars;
      list<SimCode.SimVar> i_vars_algVars;
      list<SimCode.SimVar> i_vars_derivativeVars;
      list<SimCode.SimVar> i_vars_stateVars;
      Absyn.Path i_mi_name;

    case ( txt,
           SimCode.SIMCODE(modelInfo = SimCode.MODELINFO(vars = SimCode.SIMVARS(stateVars = i_vars_stateVars, derivativeVars = i_vars_derivativeVars, algVars = i_vars_algVars, intAlgVars = i_vars_intAlgVars, boolAlgVars = i_vars_boolAlgVars, inputVars = i_vars_inputVars, outputVars = i_vars_outputVars, aliasVars = i_vars_aliasVars, intAliasVars = i_vars_intAliasVars, boolAliasVars = i_vars_boolAliasVars, paramVars = i_vars_paramVars, intParamVars = i_vars_intParamVars, boolParamVars = i_vars_boolParamVars, stringAlgVars = i_vars_stringAlgVars, stringParamVars = i_vars_stringParamVars, stringAliasVars = i_vars_stringAliasVars, extObjVars = i_vars_extObjVars, jacobianVars = i_vars_jacobianVars, constVars = i_vars_constVars), name = i_mi_name), allEquations = i_sc_allEquations) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("SimCode: "));
        txt = SimCodeC.dotPath(txt, i_mi_name);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_stateVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_derivativeVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_algVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_intAlgVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_boolAlgVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_inputVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_outputVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_aliasVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_intAliasVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_boolAliasVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_paramVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_intParamVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_boolParamVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_stringAlgVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_stringParamVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_stringAliasVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_extObjVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_jacobianVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_constVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpEqs(txt, i_sc_allEquations);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end dumpSimCode;

protected function lm_24
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.AliasVariable i_v_aliasvar;
      String i_v_comment;
      DAE.ComponentRef i_v_name;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           SimCode.SIMVAR(name = i_v_name, comment = i_v_comment, aliasvar = i_v_aliasvar) :: rest )
      equation
        txt = SimCodeC.crefStr(txt, i_v_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
        txt = Tpl.writeStr(txt, i_v_comment);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
        txt = dumpAlias(txt, i_v_aliasvar);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = lm_24(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_24(txt, rest);
      then txt;
  end matchcontinue;
end lm_24;

public function dumpVars
  input Tpl.Text txt;
  input list<SimCode.SimVar> a_vars;

  output Tpl.Text out_txt;
algorithm
  out_txt := lm_24(txt, a_vars);
end dumpVars;

public function dumpAlias
  input Tpl.Text in_txt;
  input SimCode.AliasVariable in_a_alias;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_alias)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_varName;

    case ( txt,
           SimCode.ALIAS(varName = i_varName) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("alias of "));
        txt = SimCodeC.crefStr(txt, i_varName);
      then txt;

    case ( txt,
           SimCode.NEGATEDALIAS(varName = i_varName) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("alias of -"));
        txt = SimCodeC.crefStr(txt, i_varName);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end dumpAlias;

protected function lm_27
  input Tpl.Text in_txt;
  input list<DAE.Statement> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<DAE.Statement> rest;
      DAE.Statement i_stmt;
      DAE.ElementSource ret_1;
      String ret_0;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_stmt :: rest )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("statement: "));
        ret_0 = DAEDump.ppStmtStr(i_stmt, 2);
        txt = Tpl.writeStr(txt, ret_0);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        ret_1 = Algorithm.getStatementSource(i_stmt);
        txt = dumpElementSource(txt, ret_1);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = Tpl.popBlock(txt);
        txt = lm_27(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_27(txt, rest);
      then txt;
  end matchcontinue;
end lm_27;

protected function lm_28
  input Tpl.Text in_txt;
  input list<DAE.ComponentRef> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<DAE.ComponentRef> rest;
      DAE.ComponentRef i_cr;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_cr :: rest )
      equation
        txt = SimCodeC.crefStr(txt, i_cr);
        txt = lm_28(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_28(txt, rest);
      then txt;
  end matchcontinue;
end lm_28;

protected function fun_29
  input Tpl.Text in_txt;
  input SimCode.SimEqSystem in_a_eq;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_eq)
    local
      Tpl.Text txt;
      DAE.Exp i_e_right;
      DAE.ComponentRef i_e_left;
      list<SimCode.SimEqSystem> i_e_eqs;
      list<DAE.ComponentRef> i_e_crefs;
      list<DAE.Statement> i_e_statements;
      DAE.ComponentRef i_e_cref;
      DAE.ElementSource i_e_source;
      DAE.Exp i_e_exp;
      String ret_2;
      String ret_1;
      String ret_0;

    case ( txt,
           SimCode.SES_RESIDUAL(exp = i_e_exp, source = i_e_source) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("residual: "));
        ret_0 = ExpressionDump.printExpStr(i_e_exp);
        txt = Tpl.writeStr(txt, ret_0);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE(";\n"));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = dumpElementSource(txt, i_e_source);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           SimCode.SES_SIMPLE_ASSIGN(cref = i_e_cref, exp = i_e_exp, source = i_e_source) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("eq: "));
        txt = SimCodeC.crefStr(txt, i_e_cref);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" = "));
        ret_1 = ExpressionDump.printExpStr(i_e_exp);
        txt = Tpl.writeStr(txt, ret_1);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE(";\n"));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = dumpElementSource(txt, i_e_source);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           SimCode.SES_ARRAY_CALL_ASSIGN(componentRef = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("SES_ARRAY_CALL_ASSIGN"));
      then txt;

    case ( txt,
           SimCode.SES_ALGORITHM(statements = {}) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("empty algorithm"));
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
      then txt;

    case ( txt,
           SimCode.SES_ALGORITHM(statements = i_e_statements) )
      equation
        txt = lm_27(txt, i_e_statements);
      then txt;

    case ( txt,
           SimCode.SES_LINEAR(index = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("SES_LINEAR"));
      then txt;

    case ( txt,
           SimCode.SES_NONLINEAR(crefs = i_e_crefs, eqs = i_e_eqs) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("nonlinear: "));
        txt = lm_28(txt, i_e_crefs);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = dumpEqs(txt, i_e_eqs);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           SimCode.SES_MIXED(index = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("SES_MIXED"));
      then txt;

    case ( txt,
           SimCode.SES_WHEN(left = i_e_left, right = i_e_right, source = i_e_source) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("when: conditions\n"));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = SimCodeC.crefStr(txt, i_e_left);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" = "));
        ret_2 = ExpressionDump.printExpStr(i_e_right);
        txt = Tpl.writeStr(txt, ret_2);
        txt = Tpl.softNewLine(txt);
        txt = dumpElementSource(txt, i_e_source);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("UNKNOWN"));
      then txt;
  end matchcontinue;
end fun_29;

protected function lm_30
  input Tpl.Text in_txt;
  input list<SimCode.SimEqSystem> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimEqSystem> rest;
      SimCode.SimEqSystem i_eq;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_eq :: rest )
      equation
        txt = fun_29(txt, i_eq);
        txt = lm_30(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_30(txt, rest);
      then txt;
  end matchcontinue;
end lm_30;

public function dumpEqs
  input Tpl.Text txt;
  input list<SimCode.SimEqSystem> a_eqs;

  output Tpl.Text out_txt;
algorithm
  out_txt := lm_30(txt, a_eqs);
end dumpEqs;

public function dumpWithin
  input Tpl.Text in_txt;
  input Absyn.Within in_a_w;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_w)
    local
      Tpl.Text txt;
      Absyn.Path i_path;

    case ( txt,
           Absyn.TOP() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("within ;"));
      then txt;

    case ( txt,
           Absyn.WITHIN(path = i_path) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("within "));
        txt = SimCodeC.dotPath(txt, i_path);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end dumpWithin;

protected function lm_33
  input Tpl.Text in_txt;
  input list<Absyn.Within> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<Absyn.Within> rest;
      Absyn.Within i_w;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_w :: rest )
      equation
        txt = dumpWithin(txt, i_w);
        txt = lm_33(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_33(txt, rest);
      then txt;
  end matchcontinue;
end lm_33;

protected function lm_34
  input Tpl.Text in_txt;
  input list<Option<DAE.ComponentRef>> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<Option<DAE.ComponentRef>> rest;
      DAE.ComponentRef i_cr;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           SOME(i_cr) :: rest )
      equation
        txt = SimCodeC.crefStr(txt, i_cr);
        txt = lm_34(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_34(txt, rest);
      then txt;
  end matchcontinue;
end lm_34;

protected function lm_35
  input Tpl.Text in_txt;
  input list<Option<tuple<DAE.ComponentRef, DAE.ComponentRef>>> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<Option<tuple<DAE.ComponentRef, DAE.ComponentRef>>> rest;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("w"));
        txt = lm_35(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_35(txt, rest);
      then txt;
  end matchcontinue;
end lm_35;

protected function lm_36
  input Tpl.Text in_txt;
  input list<Absyn.Path> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<Absyn.Path> rest;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("w"));
        txt = lm_36(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_36(txt, rest);
      then txt;
  end matchcontinue;
end lm_36;

protected function lm_37
  input Tpl.Text in_txt;
  input list<DAE.SymbolicOperation> in_items;
  input Absyn.Info in_a_s_info;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items, in_a_s_info)
    local
      Tpl.Text txt;
      list<DAE.SymbolicOperation> rest;
      Absyn.Info a_s_info;
      DAE.SymbolicOperation i_op;

    case ( txt,
           {},
           _ )
      then txt;

    case ( txt,
           i_op :: rest,
           a_s_info )
      equation
        txt = dumpOperation(txt, i_op, a_s_info);
        txt = lm_37(txt, rest, a_s_info);
      then txt;

    case ( txt,
           _ :: rest,
           a_s_info )
      equation
        txt = lm_37(txt, rest, a_s_info);
      then txt;
  end matchcontinue;
end lm_37;

public function dumpElementSource
  input Tpl.Text in_txt;
  input DAE.ElementSource in_a_source;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_source)
    local
      Tpl.Text txt;
      list<DAE.SymbolicOperation> i_s_operations;
      list<Absyn.Path> i_s_typeLst;
      list<Option<tuple<DAE.ComponentRef, DAE.ComponentRef>>> i_s_connectEquationOptLst;
      list<Option<DAE.ComponentRef>> i_s_instanceOptLst;
      list<Absyn.Within> i_s_partOfLst;
      Absyn.Info i_s_info;
      String ret_0;

    case ( txt,
           DAE.SOURCE(info = i_s_info, partOfLst = i_s_partOfLst, instanceOptLst = i_s_instanceOptLst, connectEquationOptLst = i_s_connectEquationOptLst, typeLst = i_s_typeLst, operations = i_s_operations) )
      equation
        ret_0 = Error.infoStr(i_s_info);
        txt = Tpl.writeStr(txt, ret_0);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("partOfLst: "));
        txt = lm_33(txt, i_s_partOfLst);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("instanceOptLst: "));
        txt = lm_34(txt, i_s_instanceOptLst);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("connectEquationOptLst: "));
        txt = lm_35(txt, i_s_connectEquationOptLst);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("typeLst: "));
        txt = lm_36(txt, i_s_typeLst);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("operations: "));
        txt = lm_37(txt, i_s_operations, i_s_info);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end dumpElementSource;

protected function lm_39
  input Tpl.Text in_txt;
  input list<DAE.Exp> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<DAE.Exp> rest;
      DAE.Exp i_cond;
      String ret_0;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_cond :: rest )
      equation
        ret_0 = ExpressionDump.printExpStr(i_cond);
        txt = Tpl.writeStr(txt, ret_0);
        txt = Tpl.nextIter(txt);
        txt = lm_39(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_39(txt, rest);
      then txt;
  end matchcontinue;
end lm_39;

public function dumpOperation
  input Tpl.Text in_txt;
  input DAE.SymbolicOperation in_a_op;
  input Absyn.Info in_a_info;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_op, in_a_info)
    local
      Tpl.Text txt;
      Absyn.Info a_info;
      list<DAE.Exp> i_op_assertConds;
      DAE.Exp i_op_res;
      DAE.ComponentRef i_op_cr;
      DAE.Exp i_op_exp2;
      DAE.Exp i_op_exp1;
      DAE.Exp i_target;
      DAE.Exp i_source;
      DAE.Exp i_after;
      DAE.Exp i_before;
      String ret_6;
      String ret_5;
      String ret_4;
      String ret_3;
      String ret_2;
      String ret_1;
      String ret_0;

    case ( txt,
           DAE.SIMPLIFY(before = i_before, after = i_after),
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("  simplify: "));
        ret_0 = ExpressionDump.printExpStr(i_before);
        txt = Tpl.writeStr(txt, ret_0);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" => "));
        ret_1 = ExpressionDump.printExpStr(i_after);
        txt = Tpl.writeStr(txt, ret_1);
      then txt;

    case ( txt,
           DAE.SUBSTITUTION(source = i_source, target = i_target),
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("  subst: "));
        ret_2 = ExpressionDump.printExpStr(i_source);
        txt = Tpl.writeStr(txt, ret_2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" => "));
        ret_3 = ExpressionDump.printExpStr(i_target);
        txt = Tpl.writeStr(txt, ret_3);
      then txt;

    case ( txt,
           DAE.SOLVE(exp1 = i_op_exp1, exp2 = i_op_exp2, cr = i_op_cr, res = i_op_res, assertConds = i_op_assertConds),
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\n",
                                    "  solve:\n"
                                }, true));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(4));
        ret_4 = ExpressionDump.printExpStr(i_op_exp1);
        txt = Tpl.writeStr(txt, ret_4);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" = "));
        ret_5 = ExpressionDump.printExpStr(i_op_exp2);
        txt = Tpl.writeStr(txt, ret_5);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("=>\n"));
        txt = SimCodeC.crefStr(txt, i_op_cr);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" = "));
        ret_6 = ExpressionDump.printExpStr(i_op_res);
        txt = Tpl.writeStr(txt, ret_6);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("  added assertions:\n"));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(4));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_39(txt, i_op_assertConds);
        txt = Tpl.popIter(txt);
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _,
           a_info )
      equation
        Tpl.addSourceTemplateError("Unknown operation", a_info);
      then txt;
  end matchcontinue;
end dumpOperation;

end SimCodeDump;