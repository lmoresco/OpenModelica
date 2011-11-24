/*
 * This file is part of OpenModelica.
 *
 * Copyright (c) 1998-CurrentYear, Link�ping University,
 * Department of Computer and Information Science,
 * SE-58183 Link�ping, Sweden.
 *
 * All rights reserved.
 *
 * THIS PROGRAM IS PROVIDED UNDER THE TERMS OF GPL VERSION 3 
 * AND THIS OSMC PUBLIC LICENSE (OSMC-PL). 
 * ANY USE, REPRODUCTION OR DISTRIBUTION OF THIS PROGRAM CONSTITUTES RECIPIENT'S  
 * ACCEPTANCE OF THE OSMC PUBLIC LICENSE.
 *
 * The OpenModelica software and the Open Source Modelica
 * Consortium (OSMC) Public License (OSMC-PL) are obtained
 * from Link�ping University, either from the above address,
 * from the URLs: http://www.ida.liu.se/projects/OpenModelica or  
 * http://www.openmodelica.org, and in the OpenModelica distribution. 
 * GNU version 3 is obtained from: http://www.gnu.org/copyleft/gpl.html.
 *
 * This program is distributed WITHOUT ANY WARRANTY; without
 * even the implied warranty of  MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE, EXCEPT AS EXPRESSLY SET FORTH
 * IN THE BY RECIPIENT SELECTED SUBSIDIARY LICENSE CONDITIONS
 * OF OSMC-PL.
 *
 * See the full OSMC Public License conditions for more details.
 *
 */

encapsulated package Algorithm
"
  file:         Algorithm.mo
  package:     Algorithm
  description: Algorithm datatypes

  RCS: $Id$

  This file contains data types and functions for managing
  algorithm sections. The algorithms in the AST are analyzed by the `Inst\'
  module (Inst.mo) which uses this module to represent the algorithms. No
  processing of any kind, except for building the datastructure is
  done in this module.

  It is used primarily by Inst.mo which both provides its input data
  and uses its \"output\" data.

"

public import Absyn;
public import DAE;
public import SCode;

public
type Ident = String;

public type Algorithm = DAE.Algorithm;
public type Statement = DAE.Statement;
public type Else = DAE.Else;

protected import ComponentReference;
protected import Config;
protected import DAEUtil;
protected import Debug;
protected import Error;
protected import Expression;
protected import ExpressionDump;
protected import Flags;
protected import List;
protected import SCodeDump;
protected import Types;
protected import Util;

public function algorithmEmpty "Returns true if algorithm is empty, i.e. no statements"
  input Algorithm alg;
  output Boolean empty;
algorithm
  empty := matchcontinue(alg)
    case(DAE.ALGORITHM_STMTS({})) then true;
    case(_) then false;
  end matchcontinue;
end algorithmEmpty;

public function isReinitStatement "returns true if statement is a reinit"
  input Statement stmt;
  output Boolean res;
algorithm
  res := matchcontinue(stmt)
    case(DAE.STMT_REINIT(var = _)) then true;
    case(_) then false;
  end matchcontinue;
end isReinitStatement;

public function isNotAssertStatement "returns true if statement is NOT an assert"
  input Statement stmt;
  output Boolean res;
algorithm
  res := matchcontinue(stmt)
    case(DAE.STMT_ASSERT(cond = _)) then false;
    case(_) then true;
  end matchcontinue;
end isNotAssertStatement;

public function splitReinits ""
  input list<Algorithm> inAlgs;
  output list<Algorithm> reinits;
  output list<Statement> rest;
algorithm (reinits,rest) := matchcontinue(inAlgs)
  local
    Statement a;
    list<Statement> al;
  case({}) then ({},{});
  case(DAE.ALGORITHM_STMTS(al as {a as DAE.STMT_REINIT(var = _)})::inAlgs)
    equation
      (reinits,rest) = splitReinits(inAlgs);
    then
      (DAE.ALGORITHM_STMTS({a})::reinits,rest);
  case(DAE.ALGORITHM_STMTS(al as {a})::inAlgs)
    equation
      (reinits,rest) = splitReinits(inAlgs);
    then
      (reinits,a::rest);
  case( DAE.ALGORITHM_STMTS((a::al)):: inAlgs )
    equation
      inAlgs = listAppend({DAE.ALGORITHM_STMTS({a}),DAE.ALGORITHM_STMTS(al)},inAlgs);
      (reinits,rest) = splitReinits(inAlgs);
    then
      (reinits,rest);
end matchcontinue;
end splitReinits;

public function makeAssignment
"function: makeAssignment
  This function creates an `DAE.STMT_ASSIGN\' construct, and checks that the
  assignment is semantically valid, which means that the component
  being assigned is not constant, and that the types match.
  LS: Added call to getPropType and isPropAnyConst instead of
  having PROP in the rules. Otherwise rules must be repeated because of
  combinations with PROP_TUPLE"
  input DAE.Exp inExp1;
  input DAE.Properties inProperties2;
  input DAE.Exp inExp3;
  input DAE.Properties inProperties4;
  input DAE.Attributes inAttributes;
  input SCode.Initial initial_;
  input DAE.ElementSource source;
  output Statement outStatement;
algorithm
  outStatement := matchcontinue (inExp1,inProperties2,inExp3,inProperties4,inAttributes,initial_,source)
    local
      Ident lhs_str,rhs_str,lt_str,rt_str;
      DAE.Exp lhs,rhs;
      DAE.Properties lprop,rprop,lhprop,rhprop;
      DAE.ComponentRef cr;
      DAE.Type lt,rt;
      Absyn.Direction direction;

    // assign to parameter in algorithm okay if record
    case ((lhs as DAE.CREF(componentRef=cr)),lhprop,rhs,rhprop,_,SCode.NON_INITIAL(),source)
      equation
        DAE.C_PARAM() = Types.propAnyConst(lhprop);
        true = ComponentReference.isRecord(cr);
        outStatement = makeAssignment2(lhs,lhprop,rhs,rhprop,source);
      then outStatement;

    // assign to parameter in algorithm produce error
    case (lhs,lprop,rhs,rprop,_,SCode.NON_INITIAL(),source)
      equation
        DAE.C_PARAM() = Types.propAnyConst(lprop);
        lhs_str = ExpressionDump.printExpStr(lhs);
        rhs_str = ExpressionDump.printExpStr(rhs);
        Error.addSourceMessage(Error.ASSIGN_PARAM_ERROR, {lhs_str,rhs_str}, DAEUtil.getElementSourceFileInfo(source));
      then
        fail();
    
    // assignment to a constant, report error
    case (lhs,_,rhs,_,DAE.ATTR(variability = SCode.CONST()),_,source)
      equation
        lhs_str = ExpressionDump.printExpStr(lhs);
        Error.addSourceMessage(Error.ASSIGN_READONLY_ERROR, {"constant",lhs_str}, DAEUtil.getElementSourceFileInfo(source));
      then
        fail();

    // assignment to an input, report error - but keep going anyway; bootstrapping needs this :(
    case (lhs,_,rhs,_,DAE.ATTR(direction=Absyn.INPUT()),_,source)
      equation
        false = Config.acceptMetaModelicaGrammar();
        lhs_str = ExpressionDump.printExpStr(lhs);
        Error.addSourceMessage(Error.ASSIGN_READONLY_ERROR, {"input",lhs_str}, DAEUtil.getElementSourceFileInfo(source));
      then
        fail();

    // assignment to parameter ok in initial algorithm
    case (lhs,lhprop,rhs,rhprop,_,SCode.INITIAL(),source)
      equation
        DAE.C_PARAM() = Types.propAnyConst(lhprop);
        outStatement = makeAssignment2(lhs,lhprop,rhs,rhprop,source);
      then outStatement;

    case (lhs,lhprop,rhs,rhprop,DAE.ATTR(direction=direction),_,source)
      equation
        DAE.C_VAR() = Types.propAnyConst(lhprop);
        true = Config.acceptMetaModelicaGrammar() or (not valueEq(Absyn.INPUT(),direction));
        outStatement = makeAssignment2(lhs,lhprop,rhs,rhprop,source);
      then outStatement;

    /* report an error */
    case (lhs,lprop,rhs,rprop,_,_,source)
      equation
        lt = Types.getPropType(lprop);
        rt = Types.getPropType(rprop);
        false = Types.equivtypes(lt, rt);
        lhs_str = ExpressionDump.printExpStr(lhs);
        rhs_str = ExpressionDump.printExpStr(rhs);
        lt_str = Types.unparseType(lt);
        rt_str = Types.unparseType(rt);
        Error.addSourceMessage(Error.ASSIGN_TYPE_MISMATCH_ERROR,
          {lhs_str,rhs_str,lt_str,rt_str}, DAEUtil.getElementSourceFileInfo(source));
      then
        fail();

     /* failing */
    case (lhs,lprop,rhs,rprop,_,_,source)
      equation
        true = Flags.isSet(Flags.FAILTRACE);
        Debug.traceln("- Algorithm.makeAssignment failed");
        Debug.trace("    ");
        Debug.trace(ExpressionDump.printExpStr(lhs));
        Debug.trace(" := ");
        Debug.traceln(ExpressionDump.printExpStr(rhs));
      then
        fail();
  end matchcontinue;
end makeAssignment;

protected function makeAssignment2
"Help function to makeAssignment"
  input DAE.Exp lhs;
  input DAE.Properties lhprop;
  input DAE.Exp rhs;
  input DAE.Properties rhprop;
  input DAE.ElementSource source;
  output Statement outStatement;
algorithm
  outStatement := matchcontinue(lhs,lhprop,rhs,rhprop,source)
    local
      DAE.ComponentRef c;
      DAE.ExpType crt,t;
      DAE.Exp rhs_1,e3,e1;
      DAE.Type ty;
      list<DAE.Exp> ea2;
    
    case (lhs as DAE.CREF(componentRef = c,ty = crt),lhprop,rhs,rhprop,source)
      equation
        (rhs_1,_) = Types.matchProp(rhs, rhprop, lhprop, true);
        false = Types.isPropArray(lhprop);
        t = getPropExpType(lhprop);
      then
        DAE.STMT_ASSIGN(t,lhs,rhs_1,source);
        /* TODO: Use this when we have fixed states in BackendDAE .lower(...)
        case (e1 as DAE.CALL(Absyn.IDENT("der"),{DAE.CREF(_,_)},_,_,_),lhprop,rhs,rhprop)
      equation
        (rhs_1,_) = Types.matchProp(rhs, rhprop, lhprop);
        false = Types.isPropArray(lhprop);
        t = getPropExpType(lhprop);
      then
        DAE.STMT_ASSIGN(t,e1,rhs_1);
      */
    case (DAE.CREF(componentRef = c,ty = crt),lhprop,rhs,rhprop,source)
      equation
        (rhs_1,_) = Types.matchProp(rhs, rhprop, lhprop, false /* Don't duplicate errors */);
        true = Types.isPropArray(lhprop);
        ty = Types.getPropType(lhprop);
        t = Types.elabType(ty);
      then
        DAE.STMT_ASSIGN_ARR(t,c,rhs_1,source);

    case(e3 as DAE.ASUB(e1,ea2),lhprop,rhs,rhprop,source)
      equation
        (rhs_1,_) = Types.matchProp(rhs, rhprop, lhprop, true);
        //false = Types.isPropArray(lhprop);
        t = getPropExpType(lhprop);
      then
        DAE.STMT_ASSIGN(t,e3,rhs_1,source);
  end matchcontinue;
end makeAssignment2;

public function makeAssignmentsList
  input list<DAE.Exp> lhsExps;
  input list<DAE.Properties> lhsProps;
  input list<DAE.Exp> rhsExps;
  input list<DAE.Properties> rhsProps;
  input DAE.Attributes attributes;
  input SCode.Initial initial_;
  input DAE.ElementSource source;
  output list<Statement> assignments;
algorithm
  assignments := match(lhsExps, lhsProps, rhsExps, rhsProps, attributes, initial_, source)
    local
      DAE.Exp lhs, rhs;
      list<DAE.Exp> rest_lhs, rest_rhs;
      DAE.Properties lhs_prop, rhs_prop;
      list<DAE.Properties> rest_lhs_prop, rest_rhs_prop;
      DAE.Statement ass;
      list<DAE.Statement> rest_ass;
    case ({}, {}, {}, {}, _, _, _) then {};
    case (lhs :: rest_lhs, lhs_prop :: rest_lhs_prop, 
          rhs :: rest_rhs, rhs_prop :: rest_rhs_prop, _, _, _)
      equation
        ass = makeAssignment(lhs, lhs_prop, rhs, rhs_prop, attributes, initial_, source);
        rest_ass = makeAssignmentsList(rest_lhs, rest_lhs_prop, rest_rhs, rest_rhs_prop, attributes, initial_, source);
      then
        ass :: rest_ass;
  end match;
end makeAssignmentsList;

public function makeTupleAssignment "function: makeTupleAssignment
  This function creates an `DAE.STMT_TUPLE_ASSIGN\' construct, and checks that the
  assignment is semantically valid, which means that the component
  being assigned is not constant, and that the types match."
  input list<DAE.Exp> inExpExpLst;
  input list<DAE.Properties> inTypesPropertiesLst;
  input DAE.Exp inExp;
  input DAE.Properties inProperties;
  input SCode.Initial initial_;
  input DAE.ElementSource source;
  output Statement outStatement;
algorithm
  outStatement := matchcontinue (inExpExpLst,inTypesPropertiesLst,inExp,inProperties,initial_,source)
    local
      list<DAE.Const> bvals;
      list<Ident> sl;
      Ident s,lhs_str,rhs_str,str1,str2,strInitial;
      list<DAE.Exp> lhs,expl;
      list<DAE.Properties> lprop,lhprops;
      DAE.Exp rhs;
      DAE.Properties rprop;
      list<DAE.Type> lhrtypes,tpl;
      list<DAE.TupleConst> clist;
      
    case (lhs,lprop,rhs,rprop,initial_,source)
      equation
        bvals = List.map(lprop, Types.propAnyConst);
        DAE.C_CONST() = List.reduce(bvals, Types.constOr);
        sl = List.map(lhs, ExpressionDump.printExpStr);
        s = stringDelimitList(sl, ", ");
        lhs_str = stringAppendList({"(",s,")"});
        rhs_str = ExpressionDump.printExpStr(rhs);
        Error.addSourceMessage(Error.ASSIGN_CONSTANT_ERROR, {lhs_str,rhs_str}, DAEUtil.getElementSourceFileInfo(source));
      then
        fail();
    case (lhs,lprop,rhs,rprop,SCode.NON_INITIAL(),source)
      equation
        bvals = List.map(lprop, Types.propAnyConst);
        DAE.C_PARAM() = List.reduce(bvals, Types.constOr);
        sl = List.map(lhs, ExpressionDump.printExpStr);
        s = stringDelimitList(sl, ", ");
        lhs_str = stringAppendList({"(",s,")"});
        rhs_str = ExpressionDump.printExpStr(rhs);
        Error.addSourceMessage(Error.ASSIGN_PARAM_ERROR, {lhs_str,rhs_str}, DAEUtil.getElementSourceFileInfo(source));
      then
        fail();
    // a normal prop in rhs that contains a T_TUPLE!
    case (expl,lhprops,rhs,DAE.PROP(type_ = (DAE.T_TUPLE(tupleType = tpl),_)),_,source)
      equation
        bvals = List.map(lhprops, Types.propAnyConst);
        DAE.C_VAR() = List.reduce(bvals, Types.constOr);
        lhrtypes = List.map(lhprops, Types.getPropType);
        Types.matchTypeTupleCall(rhs, tpl, lhrtypes);
         /* Don\'t use new rhs\', since type conversions of 
            several output args are not clearly defined. */ 
      then
        DAE.STMT_TUPLE_ASSIGN(DAE.ET_OTHER(),expl,rhs,source);
    // a tuple in rhs        
    case (expl,lhprops,rhs,DAE.PROP_TUPLE(type_ = (DAE.T_TUPLE(tupleType = tpl),_),tupleConst = DAE.TUPLE_CONST(tupleConstLst = clist)),_,source)
      equation
        bvals = List.map(lhprops, Types.propAnyConst);
        DAE.C_VAR() = List.reduce(bvals, Types.constOr);
        lhrtypes = List.map(lhprops, Types.getPropType);
        Types.matchTypeTupleCall(rhs, tpl, lhrtypes);
         /* Don\'t use new rhs\', since type conversions of several output args are not clearly defined. */
      then
        DAE.STMT_TUPLE_ASSIGN(DAE.ET_OTHER(),expl,rhs,source);
    case (lhs,lprop,rhs,rprop,initial_,source)
      equation
        true = Flags.isSet(Flags.FAILTRACE);
        sl = List.map(lhs, ExpressionDump.printExpStr);
        s = stringDelimitList(sl, ", ");
        lhs_str = stringAppendList({"(",s,")"});
        rhs_str = ExpressionDump.printExpStr(rhs);
        str1 = stringDelimitList(List.map(lprop, Types.printPropStr), ", ");
        str2 = Types.printPropStr(rprop);
        strInitial = SCodeDump.printInitialStr(initial_);
        Debug.traceln("- Algorithm.makeTupleAssignment failed on: \n\t" +& 
          lhs_str +& " = " +& rhs_str +& 
          "\n\tprops lhs: (" +& str1 +& ") =  props rhs: " +& str2 +&
          "\n\tin " +& strInitial +& " section");
      then
        fail();
  end matchcontinue;
end makeTupleAssignment;

protected function getPropExpType "function: getPropExpType
  Returns the expression type for a given Properties by calling
  getTypeExpType. Used by makeAssignment."
  input DAE.Properties p;
  output DAE.ExpType t;
protected
  DAE.Type ty;
algorithm
  ty := Types.getPropType(p);
  t := Types.elabType(ty);
end getPropExpType;

public function makeIf "function: makeIf
  This function creates an `DAE.STMT_IF\' construct, checking that the types
  of the parts are correct. Else part is generated using the makeElse
  function."
  input DAE.Exp inExp1;
  input DAE.Properties inProperties2;
  input list<Statement> inStatementLst3;
  input list<tuple<DAE.Exp, DAE.Properties, list<Statement>>> inTplExpExpTypesPropertiesStatementLstLst4;
  input list<Statement> inStatementLst5;
  input DAE.ElementSource source;
  output list<Statement> outStatements;
algorithm
  outStatements :=
  matchcontinue (inExp1,inProperties2,inStatementLst3,inTplExpExpTypesPropertiesStatementLstLst4,inStatementLst5,source)
    local
      Else else_;
      DAE.Exp e;
      list<Statement> tb,fb;
      list<tuple<DAE.Exp, DAE.Properties, list<Statement>>> eib;
      Ident e_str,t_str;
      DAE.Type t;
      DAE.Properties prop;
    case (DAE.BCONST(true),_,tb,eib,fb,source)
      then tb;
    case (DAE.BCONST(false),_,_,{},fb,source)
      then fb;
    case (DAE.BCONST(false),_,_,(e,prop,tb)::eib,fb,source)
      then makeIf(e,prop,tb,eib,fb,source);
    case (e,DAE.PROP(type_ = t),tb,eib,fb,source)
      equation
        (e,_) = Types.matchType(e,t,DAE.T_BOOL_DEFAULT,true);
        else_ = makeElse(eib, fb);
      then
        {DAE.STMT_IF(e,tb,else_,source)};
    case (e,DAE.PROP(type_ = t),_,_,_,source)
      equation
        e_str = ExpressionDump.printExpStr(e);
        t_str = Types.unparseType(t);
        Error.addSourceMessage(Error.IF_CONDITION_TYPE_ERROR, {e_str,t_str}, DAEUtil.getElementSourceFileInfo(source));
      then
        fail();
  end matchcontinue;
end makeIf;

public function optimizeIf
  "Every time we re-create/walk an if-statement, we optimize a bit :)"
  input DAE.Exp cond;
  input list<Statement> stmts;
  input DAE.Else els;
  input DAE.ElementSource source;
  output list<Statement> ostmts "can be empty or selected branch";
algorithm
  ostmts := match (cond,stmts,els,source)
    case (DAE.BCONST(true),stmts,_,source) then stmts;
    case (DAE.BCONST(false),stmts,DAE.NOELSE(),source) then {};
    case (DAE.BCONST(false),_,DAE.ELSE(stmts),source) then stmts;
    case (DAE.BCONST(false),_,DAE.ELSEIF(cond,stmts,els),source) then optimizeIf(cond,stmts,els,source);
    else DAE.STMT_IF(cond,stmts,els,source)::{};
  end match;
end optimizeIf;

public function optimizeElseIf
  "Every time we re-create/walk an if-statement, we optimize a bit :)"
  input DAE.Exp cond;
  input list<Statement> stmts;
  input DAE.Else els;
  output DAE.Else oelse;
algorithm
  oelse := match (cond,stmts,els)
    case (DAE.BCONST(true),stmts,_) then DAE.ELSE(stmts);
    case (DAE.BCONST(false),stmts,els) then els;
    else DAE.ELSEIF(cond,stmts,els);
  end match;
end optimizeElseIf;

protected function makeElse "function: makeElse
  This function creates the ELSE part of the DAE.STMT_IF and checks if is correct."
  input list<tuple<DAE.Exp, DAE.Properties, list<Statement>>> inTplExpExpTypesPropertiesStatementLstLst;
  input list<Statement> inStatementLst;
  output Else outElse;
algorithm
  outElse:=
  matchcontinue (inTplExpExpTypesPropertiesStatementLstLst,inStatementLst)
    local
      list<Statement> fb,b;
      Else else_;
      DAE.Exp e;
      list<tuple<DAE.Exp, DAE.Properties, list<Statement>>> xs;
      Ident e_str,t_str;
      DAE.Type t;
    case ({},{}) then DAE.NOELSE();  /* This removes empty else branches */
    case ({},fb) then DAE.ELSE(fb);
    case (((DAE.BCONST(true),DAE.PROP(type_ = t),b) :: xs),fb) then DAE.ELSE(b);
    case (((DAE.BCONST(false),DAE.PROP(type_ = t),b) :: xs),fb) then makeElse(xs,fb);
    case (((e,DAE.PROP(type_ = t),b) :: xs),fb)
      equation
        (e,_) = Types.matchType(e,t,DAE.T_BOOL_DEFAULT,true);
        else_ = makeElse(xs, fb);
      then
        DAE.ELSEIF(e,b,else_);
    case (((e,DAE.PROP(type_ = t),_) :: _),_)
      equation
        e_str = ExpressionDump.printExpStr(e);
        t_str = Types.unparseType(t);
        Error.addMessage(Error.IF_CONDITION_TYPE_ERROR, {e_str,t_str});
      then
        fail();
  end matchcontinue;
end makeElse;

public function makeFor "function: makeFor
  This function creates a DAE.STMT_FOR construct, checking
  that the types of the parts are correct."
  input Ident inIdent;
  input DAE.Exp inExp;
  input DAE.Properties inProperties;
  input list<Statement> inStatementLst;
  input DAE.ElementSource source;
  output Statement outStatement;
algorithm
  outStatement:=
  matchcontinue (inIdent,inExp,inProperties,inStatementLst,source)
    local
      Boolean array;
      DAE.ExpType et;
      Ident i,e_str,t_str;
      DAE.Exp e;
      DAE.Type t;
      list<Statement> stmts;
    case (i,e,DAE.PROP(type_ = (DAE.T_ARRAY(arrayType = t),_)),stmts,source)
      equation
        array = Types.isArray(t);
        et = Types.elabType(t);
      then
        DAE.STMT_FOR(et,array,i,e,stmts,source);
    case (_,e,DAE.PROP(type_ = t),_,source)
      equation
        e_str = ExpressionDump.printExpStr(e);
        t_str = Types.unparseType(t);
        Error.addSourceMessage(Error.FOR_EXPRESSION_TYPE_ERROR, {e_str,t_str}, DAEUtil.getElementSourceFileInfo(source));
      then
        fail();
  end matchcontinue;
end makeFor;

public function makeWhile "function: makeWhile
  This function creates a DAE.STMT_WHILE construct, checking that the types
  of the parts are correct."
  input DAE.Exp inExp;
  input DAE.Properties inProperties;
  input list<Statement> inStatementLst;
  input DAE.ElementSource source;
  output Statement outStatement;
algorithm
  outStatement:=
  matchcontinue (inExp,inProperties,inStatementLst,source)
    local
      DAE.Exp e;
      list<Statement> stmts;
      Ident e_str,t_str;
      DAE.Type t;
    case (e,DAE.PROP(type_ = (DAE.T_BOOL(varLstBool = _),_)),stmts,source) then DAE.STMT_WHILE(e,stmts,source);
    case (e,DAE.PROP(type_ = t),_,source)
      equation
        e_str = ExpressionDump.printExpStr(e);
        t_str = Types.unparseType(t);
        Error.addSourceMessage(Error.WHILE_CONDITION_TYPE_ERROR, {e_str,t_str}, DAEUtil.getElementSourceFileInfo(source));
      then
        fail();
  end matchcontinue;
end makeWhile;

public function makeWhenA "function: makeWhenA
  This function creates a DAE.STMT_WHEN algorithm construct,
  checking that the types of the parts are correct."
  input DAE.Exp inExp;
  input DAE.Properties inProperties;
  input list<Statement> inStatementLst;
  input Option<Statement> elseWhenStmt;
  input DAE.ElementSource source;
  output Statement outStatement;
algorithm
  outStatement:=
  matchcontinue (inExp,inProperties,inStatementLst,elseWhenStmt,source)
    local
      DAE.Exp e;
      list<Statement> stmts;
      Option<Statement> elsew;
      Ident e_str,t_str;
      DAE.Type t;
    case (e,DAE.PROP(type_ = (DAE.T_BOOL(varLstBool = _),_)),stmts,elsew,source) then DAE.STMT_WHEN(e,stmts,elsew,{},source);
    case (e,DAE.PROP(type_ = (DAE.T_ARRAY(arrayType = (DAE.T_BOOL(varLstBool = _),_)),_)),stmts,elsew,source) then DAE.STMT_WHEN(e,stmts,elsew,{},source);
    case (e,DAE.PROP(type_ = t),_,_,source)
      equation
        e_str = ExpressionDump.printExpStr(e);
        t_str = Types.unparseType(t);
        Error.addSourceMessage(Error.WHEN_CONDITION_TYPE_ERROR, {e_str,t_str}, DAEUtil.getElementSourceFileInfo(source));
      then
        fail();
  end matchcontinue;
end makeWhenA;

public function makeReinit "function: makeReinit
 creates a reinit statement in an algorithm
 statement, only valid in when algorithm sections."
  input DAE.Exp inExp1;
  input DAE.Exp inExp2;
  input DAE.Properties inProperties3;
  input DAE.Properties inProperties4;
  input DAE.ElementSource source;
  output Statement outStatement;
algorithm
  outStatement:=
  matchcontinue (inExp1,inExp2,inProperties3,inProperties4,source)
    local DAE.Exp var,val,var_1,val_1; DAE.Properties prop1,prop2;
      DAE.Type tp1,tp2;
    case (var as DAE.CREF(_,_),val,DAE.PROP(tp1,_),DAE.PROP(tp2,_),source)
      equation
        (val_1,_) = Types.matchType(val,tp2,DAE.T_REAL_DEFAULT,true);
        (var_1,_) = Types.matchType(var,tp1,DAE.T_REAL_DEFAULT,true);
      then DAE.STMT_REINIT(var_1,val_1,source);

   case (_,_,prop1,prop2,source)  equation
      Error.addSourceMessage(Error.INTERNAL_ERROR,{"reinit called with wrong args"},DAEUtil.getElementSourceFileInfo(source));
    then fail();

    // TODO: Add checks for reinit here. 1. First argument must be variable. 2. Expressions must be real.
  end matchcontinue;
end makeReinit;

public function makeAssert "function: makeAssert
  Creates an assert statement from two expressions.
"
  input DAE.Exp cond "condition";
  input DAE.Exp msg "message";
  input DAE.Properties inProperties3;
  input DAE.Properties inProperties4;
  input DAE.ElementSource source;
  output list<Statement> outStatement;
algorithm
  outStatement := match (cond,msg,inProperties3,inProperties4,source)
    local
      String str;
      Absyn.Info info;
    case (DAE.BCONST(true),_,_,_,source)
      then {};
    /* Do not evaluate all assertions. These may or may not be evaluated during runtime...
    case (DAE.BCONST(false),DAE.SCONST(str),_,_,DAE.SOURCE(info=info))
      equation
        Error.addSourceMessage(Error.ASSERT_CONSTANT_FALSE_ERROR,{str},info);
      then fail();
    case (DAE.BCONST(false),_,_,_,DAE.SOURCE(info=info))
      equation
        Error.addSourceMessage(Error.ASSERT_CONSTANT_FALSE_ERROR,{"Message was not constant and could not be evaluated"},info);
      then fail();
    */
    case (cond,msg,DAE.PROP(type_ = (DAE.T_BOOL(varLstBool = _),_)),DAE.PROP(type_ = (DAE.T_STRING(varLstString = _),_)),source)
      then {DAE.STMT_ASSERT(cond,msg,source)};
  end match;
end makeAssert;

public function makeTerminate "
  Creates a terminate statement from message expression.
"
  input DAE.Exp msg "message";
  input DAE.Properties props;
  input DAE.ElementSource source;
  output Statement outStatement;
algorithm
  outStatement := match (msg,props,source)
    case (msg,DAE.PROP(type_ = (DAE.T_STRING(varLstString = _),_)),source) then DAE.STMT_TERMINATE(msg,source);
  end match;
end makeTerminate;

public function getCrefFromAlg "Returns all crefs from an algorithm"
input Algorithm alg;
output list<DAE.ComponentRef> crs;
algorithm
  crs := List.unionOnTrueList(List.map(getAllExps(alg),Expression.extractCrefsFromExp),ComponentReference.crefEqual);
end getCrefFromAlg;


public function getAllExps "function: getAllExps

  This function goes through the Algorithm structure and finds all the
  expressions and returns them in a list
"
  input Algorithm inAlgorithm;
  output list<DAE.Exp> outExpExpLst;
algorithm
  outExpExpLst:=
  matchcontinue (inAlgorithm)
    local
      list<DAE.Exp> exps;
      list<Statement> stmts;
    case DAE.ALGORITHM_STMTS(statementLst = stmts)
      equation
        exps = getAllExpsStmts(stmts);
      then
        exps;
  end matchcontinue;
end getAllExps;

public function getAllExpsStmts "function: getAllExpsStmts

  This function takes a list of statements and returns all expressions and subexpressions
  in all statements.
"
  input list<Statement> stmts;
  output list<DAE.Exp> exps;
algorithm
  (_,exps) := DAEUtil.traverseDAEEquationsStmts(stmts,getAllExpsStmtsCollector,{});
end getAllExpsStmts;

function getAllExpsStmtsCollector
  input tuple<DAE.Exp,list<DAE.Exp>> itpl;
  output tuple<DAE.Exp,list<DAE.Exp>> otpl;
algorithm
  otpl := matchcontinue itpl
    local
      DAE.Exp exp;
      list<DAE.Exp> inExps;
    case ((exp,inExps)) then Expression.traverseExp(exp,Expression.expressionCollector,inExps);
  end matchcontinue;
end getAllExpsStmtsCollector;

public function getStatementSource
  input Statement stmt;
  output DAE.ElementSource source;
algorithm
  source := match stmt
    case DAE.STMT_ASSIGN(source=source) then source;
    case DAE.STMT_TUPLE_ASSIGN(source=source) then source;
    case DAE.STMT_ASSIGN_ARR(source=source) then source;
    case DAE.STMT_IF(source=source) then source;
    case DAE.STMT_FOR(source=source) then source;
    case DAE.STMT_WHILE(source=source) then source;
    case DAE.STMT_WHEN(source=source) then source;
    case DAE.STMT_ASSERT(source=source) then source;
    case DAE.STMT_TERMINATE(source=source) then source;
    case DAE.STMT_REINIT(source=source) then source;
    case DAE.STMT_NORETCALL(source=source) then source;
    case DAE.STMT_RETURN(source=source) then source;
    case DAE.STMT_BREAK(source=source) then source;
    case DAE.STMT_FAILURE(source=source) then source;
    case DAE.STMT_TRY(source=source) then source;
    case DAE.STMT_CATCH(source=source) then source;
    case DAE.STMT_THROW(source=source) then source;
    else
      equation
        Error.addMessage(Error.INTERNAL_ERROR, {"Algorithm.getStatementSource"});
      then fail();
  end match;
end getStatementSource;

public function getAssertCond
  input Statement stmt;
  output DAE.Exp cond;
algorithm
  DAE.STMT_ASSERT(cond=cond) := stmt;
end getAssertCond;

end Algorithm;
