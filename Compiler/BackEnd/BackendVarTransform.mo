/*
 * This file is part of OpenModelica.
 *
 * Copyright (c) 1998-CurrentYear, Linköping University,
 * Department of Computer and Information Science,
 * SE-58183 Linköping, Sweden.
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
 * from Linköping University, either from the above address,
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

encapsulated package BackendVarTransform
" file:         BackendVarTransform.mo
  package:     BackendVarTransform
  description: BackendVarTransform contains a Binary Tree representation of variable replacements.

  RCS: $Id$

  This module contain a Binary tree representation of variable replacements
  along with some functions for performing replacements of variables in equations"

public import BackendDAE;
public import DAE;
public import VarTransform;

protected import Absyn;
protected import BackendDAEOptimize;
protected import Debug;
protected import Expression;
protected import ExpressionDump;
protected import ExpressionSimplify;
protected import Util;

public function replaceEquationsPartial
"function: replaceEquations
  This function takes a list of equations and a set of variable
  replacements and applies the replacements on all equations.
  The function returns the updated list of equations"
  input list<BackendDAE.Equation> inBackendDAEEquationLst;
  input DAE.ComponentRef inVariableReplacements;
  output list<BackendDAE.Equation> outBackendDAEEquationLst;
algorithm
  outBackendDAEEquationLst:=
  match (inBackendDAEEquationLst,inVariableReplacements)
    local
      DAE.Exp e1_1,e2_1,e1_2,e2_2,e1,e2,e_1,e_2,e;
      list<BackendDAE.Equation> es_1,es;
      DAE.ComponentRef repl;
      BackendDAE.Equation a;
      DAE.ComponentRef cr;
      Integer indx;
      list<DAE.Exp> expl,expl1,expl2;
      BackendDAE.WhenEquation whenEqn,whenEqn1;
      DAE.ElementSource source "the origin of the element";
      String str;

    case ({},_) then {};
/*
    case ((BackendDAE.ARRAY_EQUATION(indx,expl,source)::es),repl)
      equation
        ((expl1,_)) = Util.listMap1(expl,Expression.traverseExp,repl);
        expl2 = Util.listMap(expl1,ExpressionSimplify.simplify);
        es_1 = replaceEquationsPartial(es,repl);
      then
         (BackendDAE.ARRAY_EQUATION(indx,expl2,source)::es_1);
*/
    case ((BackendDAE.EQUATION(exp = e1,scalar = e2,source = source) :: es),repl)
      equation
        ((e1_1,_)) = Expression.traverseExpTopDown(e1,replaceExpPartial, repl);
        //print("*** VarTransform.replaceExp : " +& ExpressionDump.printExpStr(e1) +& " | " +& ExpressionDump.printExpStr(e1_1) +&"\n");
        ((e2_1,_)) = Expression.traverseExpTopDown(e2,replaceExpPartial, repl);
        //print("*** VarTransform.replaceExp : " +& ExpressionDump.printExpStr(e2) +& " | " +& ExpressionDump.printExpStr(e2_1) +&"\n");
        e1_2 = ExpressionSimplify.simplify(e1_1);
        e2_2 = ExpressionSimplify.simplify(e2_1);
        es_1 = replaceEquationsPartial(es, repl);
      then
        (BackendDAE.EQUATION(e1_2,e2_2,source) :: es_1);

    case (((BackendDAE.ALGORITHM(index=indx,in_=expl,out=expl1,source = source)) :: es),repl)
      equation
        // original algorithm is done by replaceAlgorithms
        // inputs and ouputs are updated from DEALow.updateAlgorithmInputsOutputs       
        es_1 = replaceEquationsPartial(es, repl);
      then
        (BackendDAE.ALGORITHM(indx,expl,expl1,source) :: es_1);

    case ((BackendDAE.SOLVED_EQUATION(componentRef = cr,exp = e,source = source) :: es),repl)
      equation
        ((e_1,_)) = Expression.traverseExpTopDown(e,replaceExpPartial, repl);
        e_2 = ExpressionSimplify.simplify(e_1);
        es_1 = replaceEquationsPartial(es, repl);
      then
        (BackendDAE.SOLVED_EQUATION(cr,e_2,source) :: es_1);

    case ((BackendDAE.RESIDUAL_EQUATION(exp = e,source = source) :: es),repl)
      equation
        ((e_1,_)) = Expression.traverseExpTopDown(e,replaceExpPartial, repl);
        e_2 = ExpressionSimplify.simplify(e_1);
        es_1 = replaceEquationsPartial(es, repl);
      then
        (BackendDAE.RESIDUAL_EQUATION(e_2,source) :: es_1);

    case ((a :: es),repl)
      equation
        print("blub");
        es_1 = replaceEquationsPartial(es, repl);
      then
        (a :: es_1);
  end match;
end replaceEquationsPartial;

public function replaceExpPartial "function: replaceExp

  Takes a set of replacement rules and an expression and a function
  giving a boolean value for an expression.
  The function replaces all variables in the expression using
  the replacement rules, if the boolean value is true children of the
  expression is visited (including the expression itself). If it is false,
  no replacemet is performed."
  input tuple<DAE.Exp,DAE.ComponentRef> inTpl;
  output tuple<DAE.Exp,Boolean,DAE.ComponentRef> outTpl;
algorithm
  outTpl:=
  match (inTpl)
    local
      DAE.ComponentRef cr,cr1,cr_repl;
      DAE.Exp e,e1,e2;
            
    case ((e as DAE.PARTIALDERIVATIVE(Var= cr1,wrtVar=cr),cr_repl))
      equation
        //print("*** VarTransform.replaceExp : " +& ExpressionDump.printExpStr(e) +& "\n");
        cr = BackendDAEOptimize.differentiateVarWithRespectToX(cr1,cr_repl);
      then
        ((DAE.CREF(cr,DAE.ET_REAL()),true,cr_repl));
        
    case ((e,cr_repl))
      equation
        //print("#### VarTransform.replaceExp : " +& ExpressionDump.printExpStr(e) +& "\n");
        //Debug.fprintln("failtrace", "- VarTransform.replaceExp failed on: " +& ExpressionDump.printExpStr(e));
      then ((e,true,cr_repl));
  end match;
end replaceExpPartial;

public function replaceEquations
"function: replaceEquations
  This function takes a list of equations and a set of variable
  replacements and applies the replacements on all equations.
  The function returns the updated list of equations"
  input list<BackendDAE.Equation> inBackendDAEEquationLst;
  input VarTransform.VariableReplacements inVariableReplacements;
  input Option<FuncTypeExp_ExpToBoolean> inFuncTypeExpExpToBooleanOption;
  partial function FuncTypeExp_ExpToBoolean
    input DAE.Exp inExp;
    output Boolean outBoolean;
  end FuncTypeExp_ExpToBoolean;  
  output list<BackendDAE.Equation> outBackendDAEEquationLst;
algorithm
  outBackendDAEEquationLst:=
  matchcontinue (inBackendDAEEquationLst,inVariableReplacements,inFuncTypeExpExpToBooleanOption)
    local
      DAE.Exp e1_1,e2_1,e1_2,e2_2,e1,e2,e_1,e_2,e;
      list<BackendDAE.Equation> es_1,es;
      VarTransform.VariableReplacements repl;
      BackendDAE.Equation a;
      DAE.ComponentRef cr;
      Integer indx;
      list<DAE.Exp> expl,expl1,expl2;
      BackendDAE.WhenEquation whenEqn,whenEqn1;
      DAE.ElementSource source "the origin of the element";
      Option<FuncTypeExp_ExpToBoolean> condfunc;

    case ({},_,_) then {};
    case ((BackendDAE.ARRAY_EQUATION(indx,expl,source)::es),repl,condfunc)
      equation
        expl1 = Util.listMap2(expl,VarTransform.replaceExp,repl,condfunc);
        expl2 = Util.listMap(expl1,ExpressionSimplify.simplify);
        es_1 = replaceEquations(es,repl, condfunc);
      then
         (BackendDAE.ARRAY_EQUATION(indx,expl2,source)::es_1);

    case ((BackendDAE.EQUATION(exp = e1,scalar = e2,source = source) :: es),repl, condfunc)
      equation
        e1_1 = VarTransform.replaceExp(e1, repl,condfunc);
        e2_1 = VarTransform.replaceExp(e2, repl,condfunc);
        e1_2 = ExpressionSimplify.simplify(e1_1);
        e2_2 = ExpressionSimplify.simplify(e2_1);
        es_1 = replaceEquations(es, repl, condfunc);
      then
        (BackendDAE.EQUATION(e1_2,e2_2,source) :: es_1);

    case (((BackendDAE.ALGORITHM(index=indx,in_=expl,out=expl1,source = source)) :: es),repl, condfunc)
      equation
        // original algorithm is done by replaceAlgorithms
        // inputs and ouputs are updated from DEALow.updateAlgorithmInputsOutputs       
        es_1 = replaceEquations(es, repl, condfunc);
      then
        (BackendDAE.ALGORITHM(indx,expl,expl1,source) :: es_1);

    case ((BackendDAE.SOLVED_EQUATION(componentRef = cr,exp = e,source = source) :: es),repl, condfunc)
      equation
        e_1 = VarTransform.replaceExp(e, repl,condfunc);
        e_2 = ExpressionSimplify.simplify(e_1);
        es_1 = replaceEquations(es, repl, condfunc);
      then
        (BackendDAE.SOLVED_EQUATION(cr,e_2,source) :: es_1);

    case ((BackendDAE.RESIDUAL_EQUATION(exp = e,source = source) :: es),repl, condfunc)
      equation
        e_1 = VarTransform.replaceExp(e, repl,condfunc);
        e_2 = ExpressionSimplify.simplify(e_1);
        es_1 = replaceEquations(es, repl, condfunc);
      then
        (BackendDAE.RESIDUAL_EQUATION(e_2,source) :: es_1);

    case ((BackendDAE.WHEN_EQUATION(whenEqn,source) :: es),repl, condfunc)
      equation
        whenEqn1 = replaceWhenEquation(whenEqn,repl, condfunc);
        es_1 = replaceEquations(es, repl, condfunc);
      then
        (BackendDAE.WHEN_EQUATION(whenEqn1,source) :: es_1);

    case ((a :: es),repl, condfunc)
      equation
        es_1 = replaceEquations(es, repl, condfunc);
      then
        (a :: es_1);
  end matchcontinue;
end replaceEquations;

protected function replaceWhenEquation "Replaces variables in a when equation"
  input BackendDAE.WhenEquation whenEqn;
  input VarTransform.VariableReplacements repl;
  input Option<FuncTypeExp_ExpToBoolean> inFuncTypeExpExpToBooleanOption;
  partial function FuncTypeExp_ExpToBoolean
    input DAE.Exp inExp;
    output Boolean outBoolean;
  end FuncTypeExp_ExpToBoolean;  
  output BackendDAE.WhenEquation outWhenEqn;
algorithm
  outWhenEqn := matchcontinue(whenEqn,repl,inFuncTypeExpExpToBooleanOption)
  local Integer i;
    DAE.ComponentRef cr,cr1;
    DAE.Exp e,e1,e2;
    DAE.ExpType tp;
    BackendDAE.WhenEquation elsePart,elsePart2;
    Option<FuncTypeExp_ExpToBoolean> condfunc;

    case (BackendDAE.WHEN_EQ(i,cr,e,NONE()), repl, condfunc) equation
        e1 = VarTransform.replaceExp(e, repl,condfunc);
        e2 = ExpressionSimplify.simplify(e1);
        DAE.CREF(cr1,_) = VarTransform.replaceExp(Expression.crefExp(cr),repl,condfunc);
    then 
      BackendDAE.WHEN_EQ(i,cr1,e2,NONE());

    // Replacements makes cr negative, a = -b
    case (BackendDAE.WHEN_EQ(i,cr,e,NONE()), repl, condfunc) equation
        DAE.UNARY(DAE.UMINUS(tp),DAE.CREF(cr1,_)) = VarTransform.replaceExp(Expression.crefExp(cr),repl,condfunc);
        e1 = VarTransform.replaceExp(e, repl,condfunc);
        e2 = ExpressionSimplify.simplify(DAE.UNARY(DAE.UMINUS(tp),e1));
    then 
      BackendDAE.WHEN_EQ(i,cr1,e2,NONE());

    case (BackendDAE.WHEN_EQ(i,cr,e,SOME(elsePart)), repl, condfunc) equation
        elsePart2 = replaceWhenEquation(elsePart, repl, condfunc);
        e1 = VarTransform.replaceExp(e, repl,condfunc);
        e2 = ExpressionSimplify.simplify(e1);
        DAE.CREF(cr1,_) = VarTransform.replaceExp(Expression.crefExp(cr),repl,condfunc);
    then BackendDAE.WHEN_EQ(i,cr1,e2,SOME(elsePart2));

    // Replacements makes cr negative, a = -b
    case (BackendDAE.WHEN_EQ(i,cr,e,SOME(elsePart)), repl, condfunc) equation
        elsePart2 = replaceWhenEquation(elsePart, repl, condfunc);
        DAE.UNARY(DAE.UMINUS(tp),DAE.CREF(cr1,_)) = VarTransform.replaceExp(Expression.crefExp(cr),repl,condfunc);
        e1 = VarTransform.replaceExp(e, repl,condfunc);
        e2 = ExpressionSimplify.simplify(DAE.UNARY(DAE.UMINUS(tp),e1));
    then BackendDAE.WHEN_EQ(i,cr1,e2,SOME(elsePart2));

  end matchcontinue;
end replaceWhenEquation;

/*
public function replaceEquations "function: replaceEquations

  This function takes a list of equations ana a set of variable replacements
  and applies the replacements on all equations.
  The function returns the updated list of equations
"
  input list<BackendDAE.Equation> inBackendDAEEquationLst;
  input VarTransform.VariableReplacements inVariableReplacements;
  output list<BackendDAE.Equation> outBackendDAEEquationLst;
algorithm
  outBackendDAEEquationLst:=
  matchcontinue (inBackendDAEEquationLst,inVariableReplacements)
    local
      DAE.Exp e1_1,e2_1,e1_2,e2_2,e1,e2,e_1,e_2,e;
      list<BackendDAE.Equation> es_1,es;
      VarTransform.VariableReplacements repl;
      BackendDAE.Equation a;
      DAE.ComponentRef cr,cr1,cr2;
      Integer indx;
      list<DAE.Exp> expl,expl1,expl2;
      BackendDAE.WhenEquation whenEqn,whenEqn1;
    case ({},_) then {};
    case ((BackendDAE.ARRAY_EQUATION(indx,expl)::es),repl)
      equation
        expl1 = Util.listMap2(expl,VarTransform.replaceExp,repl,NONE());
        expl2 = Util.listMap(expl1,ExpressionSimplify.simplify);
        es_1 = replaceEquations(es,repl);
      then
         (BackendDAE.ARRAY_EQUATION(indx,expl2)::es_1);
    case ((BackendDAE.EQUATION(exp = e1,scalar = e2) :: es),repl)
      equation
        e1_1 = VarTransform.replaceExp(e1, repl,NONE());
        e2_1 = VarTransform.replaceExp(e2, repl,NONE());
        e1_2 = ExpressionSimplify.simplify(e1_1);
        e2_2 = ExpressionSimplify.simplify(e2_1);
        es_1 = replaceEquations(es, repl);
      then
        (BackendDAE.EQUATION(e1_2,e2_2) :: es_1);
     case ((BackendDAE.EQUEQUATION(cr1,cr2) :: es),repl)
      equation
        DAE.CREF(cr1,_) = VarTransform.replaceExp(Expression.crefExp(cr1), repl,NONE());
        DAE.CREF(cr2,_) = VarTransform.replaceExp(Expression.crefExp(cr2), repl,NONE());
        es_1 = replaceEquations(es, repl);
      then
        (BackendDAE.EQUEQUATION(cr1,cr2) :: es_1);
    case (((a as BackendDAE.ALGORITHM(index = id,in_ = expl1,out = expl2)) :: es),repl)
      local Integer id;
      equation
        expl1 = Util.listMap2(expl1,VarTransform.replaceExp,repl,NONE());
        expl1 = Util.listMap(expl1,ExpressionSimplify.simplify);
        expl2 = Util.listMap2(expl2,VarTransform.replaceExp,repl,NONE());
        expl2 = Util.listMap(expl2,ExpressionSimplify.simplify);
        es_1 = replaceEquations(es, repl);
      then
        (BackendDAE.ALGORITHM(id,expl1,expl2) :: es_1);
    case ((BackendDAE.SOLVED_EQUATION(componentRef = cr,exp = e) :: es),repl)
      equation
        e_1 = VarTransform.replaceExp(e, repl,NONE());
        e_2 = ExpressionSimplify.simplify(e_1);
        es_1 = replaceEquations(es, repl);
      then
        (BackendDAE.SOLVED_EQUATION(cr,e_2) :: es_1);
    case ((BackendDAE.RESIDUAL_EQUATION(exp = e) :: es),repl)
      equation
        e_1 = VarTransform.replaceExp(e, repl,NONE());
        e_2 = ExpressionSimplify.simplify(e_1);
        es_1 = replaceEquations(es, repl);
      then
        (BackendDAE.RESIDUAL_EQUATION(e_2) :: es_1);

    case ((BackendDAE.WHEN_EQUATION(whenEqn) :: es),repl)
      equation
        whenEqn1 = replaceWhenEquation(whenEqn,repl);
        es_1 = replaceEquations(es, repl);
      then
        (BackendDAE.WHEN_EQUATION(whenEqn1) :: es_1);

   case ((BackendDAE.IF_EQUATION(indx,eindx,expl) :: es),repl)
     local Integer indx,eindx;
      equation
        expl1 = Util.listMap2(expl,VarTransform.replaceExp,repl,NONE());
        expl2 = Util.listMap(expl1,ExpressionSimplify.simplify);
        es_1 = replaceEquations(es, repl);
      then
        (BackendDAE.IF_EQUATION(indx,eindx,expl2) :: es_1);

    case ((a :: es),repl)
      equation
        es_1 = replaceEquations(es, repl);
      then
        (a :: es_1);
  end matchcontinue;
end replaceEquations;
*/
/*
protected function replaceWhenEquation "Replaces variables in a when equation"
  input BackendDAE.WhenEquation whenEqn;
  input VarTransform.VariableReplacements repl;
  output BackendDAE.WhenEquation outWhenEqn;
algorithm
  outWhenEqn := matchcontinue(whenEqn,repl)
  local Integer i;
    DAE.Exp e,e1,e2,cond;
    BackendDAE.WhenEquation elsePart,elsePart2;
    BackendDAE.Equation eq;
    case (BackendDAE.WHEN_EQ(i,_,cond,eq,NONE()),repl)
      equation
        {eq as BackendDAE.EQUATION(e1,e2)} = replaceEquations({eq},repl);
        (e1,e2) = shiftUnaryMinusToRHS(e1,e2);
    then BackendDAE.WHEN_EQ(i,cond,BackendDAE.EQUATION(e1,e2),NONE());
    case (BackendDAE.WHEN_EQ(i,cond,eq,SOME(elsePart)),repl) equation
        elsePart2 = replaceWhenEquation(elsePart,repl);
      {eq as BackendDAE.EQUATION(e1,e2)} = replaceEquations({eq},repl);
      (e1,e2) = shiftUnaryMinusToRHS(e1,e2);
    then BackendDAE.WHEN_EQ(i,cond,BackendDAE.EQUATION(e1,e2),SOME(elsePart2));
  end matchcontinue;
end replaceWhenEquation;
*/

protected function shiftUnaryMinusToRHS "
Author: BZ, 2008-09
Helper function for replaceWhenEquation, moves possible unary minus from lefthand side to right hand side.
"
  input DAE.Exp lhs;
  input DAE.Exp rhs;
  output DAE.Exp lhsFixed,rhsFixed;
algorithm (lhsFixed,rhsFixed) := matchcontinue(lhs,rhs)
  local
    DAE.ExpType tp;
    DAE.Exp e1,e2;
  case((e1 as DAE.CREF(_,_)),e2) then (e1,e2);
  case(DAE.UNARY(DAE.UMINUS(tp),e1),e2)
    equation
      e2 = ExpressionSimplify.simplify(DAE.UNARY(DAE.UMINUS(tp),e2));
    then
      (e1,e2);
end matchcontinue;
end shiftUnaryMinusToRHS;

/*
public function replaceIfEquations "This function takes a list of if-equations and a set of
variable replacement sand applies the replacements on all if-equations.
The function returns the updated list of if-equations."
  input list<BackendDAE.IfEquation> ifeqns;
  input VarTransform.VariableReplacements repl;
  output list<BackendDAE.IfEquation> outIfeqns;
algorithm
  outIfeqns := matchcontinue(ifeqns,repl)
  local list<DAE.Exp> conds,conds1;
    list<BackendDAE.Equation> fb,fb1;
    list<list<BackendDAE.Equation>> tbs,tbs1;
    list<BackendDAE.IfEquation> es;
    case ({},_) then {};

    case(BackendDAE.IFEQUATION(conds,tbs,fb) :: es,repl) equation
       conds1 = Util.listMap2(conds, VarTransform.replaceExp, repl,NONE());
        tbs1 = Util.listMap1(tbs,replaceEquations,repl);
        fb1 = replaceEquations(fb,repl);
        es = replaceIfEquations(es,repl);
     then BackendDAE.IFEQUATION(conds1, tbs1,fb1)::es;

    case(_,_) equation
      Debug.fprint("failtrace","replaceIfEquations failed\n");
    then fail();

  end matchcontinue;
end replaceIfEquations;
*/

public function replaceMultiDimEquations "function: replaceMultiDimEquations

  This function takes a list of equations ana a set of variable replacements
  and applies the replacements on all array equations.
  The function returns the updated list of array equations
"
  input list<BackendDAE.MultiDimEquation> inBackendDAEEquationLst;
  input VarTransform.VariableReplacements inVariableReplacements;
  output list<BackendDAE.MultiDimEquation> outBackendDAEEquationLst;
algorithm
  outBackendDAEEquationLst:=
  match (inBackendDAEEquationLst,inVariableReplacements)
    local
      DAE.Exp e1_1,e2_1,e1,e2,e1_2,e2_2;
      list<BackendDAE.MultiDimEquation> es_1,es;
      VarTransform.VariableReplacements repl;
      list<Integer> dims;
      DAE.ElementSource source "the origin of the element";

    case ({},_) then {};
    case ((BackendDAE.MULTIDIM_EQUATION(left = e1,right = e2,dimSize = dims,source=source) :: es),repl)
      equation
        e1_1 = VarTransform.replaceExp(e1, repl,NONE());
        e2_1 = VarTransform.replaceExp(e2, repl,NONE());
        e1_2 = ExpressionSimplify.simplify(e1_1);
        e2_2 = ExpressionSimplify.simplify(e2_1);
        es_1 = replaceMultiDimEquations(es, repl);
      then
        (BackendDAE.MULTIDIM_EQUATION(dims,e1_2,e2_2,source) :: es_1);
  end match;
end replaceMultiDimEquations;

public function replaceAlgorithms "function: replaceAlgorithms

  This function takes a list of algorithms ana a set of variable replacements
  and applies the replacements on all array equations.
  The function returns the updated list of array equations
"
  input list<DAE.Algorithm> inAlgorithmLst;
  input VarTransform.VariableReplacements inVariableReplacements;
  output list<DAE.Algorithm> outAlgorithmLst;
algorithm
  outAlgorithmLst:=
  match (inAlgorithmLst,inVariableReplacements)
    local
      VarTransform.VariableReplacements repl;
      list<DAE.Statement> statementLst,statementLst_1;
      list<DAE.Algorithm> es,es_1;
    case ({},_) then {};
    case ((DAE.ALGORITHM_STMTS(statementLst=statementLst) :: es),repl)
      equation
        statementLst_1 = replaceStatementLst(statementLst,repl);
        es_1 = replaceAlgorithms(es,repl);
      then
        (DAE.ALGORITHM_STMTS(statementLst_1)  :: es_1);
  end match;
end replaceAlgorithms;

protected function replaceStatementLst "function: replaceStatementLst

  Helper for replaceMultiDimEquations.
"
  input list<DAE.Statement> inStatementLst;
  input VarTransform.VariableReplacements inVariableReplacements;
  output list<DAE.Statement> outStatementLst;
algorithm
  outStatementLst:=
  matchcontinue (inStatementLst,inVariableReplacements)
    local
      VarTransform.VariableReplacements repl;
      list<DAE.Statement> es,es_1,statementLst,statementLst_1;
      DAE.Statement statement,statement_1;
      DAE.ExpType type_;
      DAE.Exp e1_1,e2_1,e1,e2,e1_2,e2_2;
      list<DAE.Exp> expExpLst,expExpLst_1;
      DAE.Else else_,else_1;
      DAE.ElementSource source;
      DAE.ComponentRef cr; 
      Boolean iterIsArray;
      DAE.Ident ident;
      list<Integer> helpVarIndices;
          
    case ({},_) then {};
    
    case ((DAE.STMT_ASSIGN(type_=type_,exp1=e1,exp=e2,source=source)::es),repl)
      equation
        e1_1 = VarTransform.replaceExp(e1, repl,NONE());
        e2_1 = VarTransform.replaceExp(e2, repl,NONE());
        e1_2 = ExpressionSimplify.simplify(e1_1);
        e2_2 = ExpressionSimplify.simplify(e2_1);
        es_1 = replaceStatementLst(es, repl);
      then
        (DAE.STMT_ASSIGN(type_,e1_2,e2_2,source):: es_1);
    
    case ((DAE.STMT_TUPLE_ASSIGN(type_=type_,expExpLst=expExpLst,exp=e2,source=source)::es),repl)
      equation
        expExpLst_1 = Util.listMap2(expExpLst,VarTransform.replaceExp,repl,NONE());
        e2_1 = VarTransform.replaceExp(e2, repl,NONE());
        e2_2 = ExpressionSimplify.simplify(e2_1);
        es_1 = replaceStatementLst(es, repl);
      then
        (DAE.STMT_TUPLE_ASSIGN(type_,expExpLst_1,e2_2,source):: es_1);
    
    case ((DAE.STMT_ASSIGN_ARR(type_=type_,componentRef=cr,exp=e1,source=source)::es),repl)
      equation
        e1_1 = VarTransform.replaceExp(e1, repl,NONE());
        e1_2 = ExpressionSimplify.simplify(e1_1);
        es_1 = replaceStatementLst(es, repl);
      then
        (DAE.STMT_ASSIGN_ARR(type_,cr,e1_2,source):: es_1);        
    
    case ((DAE.STMT_IF(exp=e1,statementLst=statementLst,else_=else_,source=source)::es),repl)
      equation
        statementLst_1 = replaceStatementLst(statementLst, repl);
        e1_1 = VarTransform.replaceExp(e1, repl,NONE());
        e1_2 = ExpressionSimplify.simplify(e1_1);
        else_1 = replaceElse(else_,repl);
        es_1 = replaceStatementLst(es, repl);
      then
        (DAE.STMT_IF(e1_2,statementLst_1,else_1,source):: es_1);
    
    case ((DAE.STMT_FOR(type_=type_,iterIsArray=iterIsArray,iter=ident,range=e1,statementLst=statementLst,source=source)::es),repl)
      equation
        statementLst_1 = replaceStatementLst(statementLst, repl);
        e1_1 = VarTransform.replaceExp(e1, repl,NONE());
        e1_2 = ExpressionSimplify.simplify(e1_1);
        es_1 = replaceStatementLst(es, repl);
      then
        (DAE.STMT_FOR(type_,iterIsArray,ident,e1_2,statementLst_1,source):: es_1);        
    
    case ((DAE.STMT_WHILE(exp=e1,statementLst=statementLst,source=source)::es),repl)
      equation
        statementLst_1 = replaceStatementLst(statementLst, repl);
        e1_1 = VarTransform.replaceExp(e1, repl,NONE());
        e1_2 = ExpressionSimplify.simplify(e1_1);
        es_1 = replaceStatementLst(es, repl);
      then
        (DAE.STMT_WHILE(e1_2,statementLst_1,source):: es_1);
    
    case ((DAE.STMT_WHEN(exp=e1,statementLst=statementLst,elseWhen=NONE(),helpVarIndices=helpVarIndices,source=source)::es),repl)
      equation
        statementLst_1 = replaceStatementLst(statementLst, repl);
        e1_1 = VarTransform.replaceExp(e1, repl,NONE());
        e1_2 = ExpressionSimplify.simplify(e1_1);
        es_1 = replaceStatementLst(es, repl);
      then
        (DAE.STMT_WHEN(e1_2,statementLst_1,NONE(),helpVarIndices,source):: es_1);
    
    case ((DAE.STMT_WHEN(exp=e1,statementLst=statementLst,elseWhen=SOME(statement),helpVarIndices=helpVarIndices,source=source)::es),repl)
      equation
        statementLst_1 = replaceStatementLst(statementLst, repl);
        statement_1::{} = replaceStatementLst({statement}, repl);
        e1_1 = VarTransform.replaceExp(e1, repl,NONE());
        e1_2 = ExpressionSimplify.simplify(e1_1);
        es_1 = replaceStatementLst(es, repl);
      then
        (DAE.STMT_WHEN(e1_2,statementLst_1,SOME(statement_1),helpVarIndices,source):: es_1);
    
    case ((DAE.STMT_ASSERT(cond=e1,msg=e2,source=source)::es),repl)
      equation
        e1_1 = VarTransform.replaceExp(e1, repl,NONE());
        e2_1 = VarTransform.replaceExp(e2, repl,NONE());
        e1_2 = ExpressionSimplify.simplify(e1_1);
        e2_2 = ExpressionSimplify.simplify(e2_1);
        es_1 = replaceStatementLst(es, repl);
      then
        (DAE.STMT_ASSERT(e1_2,e2_2,source):: es_1);
    
    case ((DAE.STMT_TERMINATE(msg=e1,source=source)::es),repl)
      equation
        e1_1 = VarTransform.replaceExp(e1, repl,NONE());
        e1_2 = ExpressionSimplify.simplify(e1_1);
        es_1 = replaceStatementLst(es, repl);
      then
        (DAE.STMT_TERMINATE(e1_2,source):: es_1);
    
    case ((DAE.STMT_REINIT(var=e1,value=e2,source=source)::es),repl)
      equation
        e1_1 = VarTransform.replaceExp(e1, repl,NONE());
        e2_1 = VarTransform.replaceExp(e2, repl,NONE());
        e1_2 = ExpressionSimplify.simplify(e1_1);
        e2_2 = ExpressionSimplify.simplify(e2_1);
        es_1 = replaceStatementLst(es, repl);
      then
        (DAE.STMT_REINIT(e1_2,e2_2,source):: es_1);
    
    case ((DAE.STMT_NORETCALL(exp=e1,source=source)::es),repl)
      equation
        e1_1 = VarTransform.replaceExp(e1, repl,NONE());
        e1_2 = ExpressionSimplify.simplify(e1_1);
        es_1 = replaceStatementLst(es, repl);
      then
        (DAE.STMT_NORETCALL(e1_2,source):: es_1);
    
    case ((DAE.STMT_RETURN(source=source)::es),repl) 
      equation
        es_1 = replaceStatementLst(es, repl);
      then
        (DAE.STMT_RETURN(source):: es_1);      
    
    case ((DAE.STMT_BREAK(source=source)::es),repl) 
      equation
        es_1 = replaceStatementLst(es, repl);
      then
        (DAE.STMT_BREAK(source):: es_1);      
    
    // MetaModelica extension. KS
    case ((DAE.STMT_FAILURE(body=statementLst,source=source)::es),repl)
      equation
        statementLst_1 = replaceStatementLst(statementLst, repl);
        es_1 = replaceStatementLst(es, repl);
      then
        (DAE.STMT_FAILURE(statementLst_1,source):: es_1);
    
    case ((DAE.STMT_TRY(tryBody=statementLst,source=source)::es),repl)
      equation
        statementLst_1 = replaceStatementLst(statementLst, repl);
        es_1 = replaceStatementLst(es, repl);
      then
        (DAE.STMT_TRY(statementLst_1,source):: es_1);
    
    case ((DAE.STMT_CATCH(catchBody=statementLst,source=source)::es),repl)
      equation
        statementLst_1 = replaceStatementLst(statementLst, repl);
        es_1 = replaceStatementLst(es, repl);
      then
        (DAE.STMT_CATCH(statementLst_1,source):: es_1);
    
    case ((DAE.STMT_THROW(source=source)::es),repl) 
      equation
        es_1 = replaceStatementLst(es, repl);
      then
        (DAE.STMT_THROW(source):: es_1); 
    
    case ((statement::es),repl) 
      equation
        es_1 = replaceStatementLst(es, repl);
      then
        (statement:: es_1);        
  end matchcontinue;
end replaceStatementLst;

protected function replaceElse "function: replaceElse

  Helper for replaceStatementLst.
"
  input DAE.Else inElse;
  input VarTransform.VariableReplacements inVariableReplacements;
  output DAE.Else outElse;
algorithm
  outElse:=
  match (inElse,inVariableReplacements)
    local
      VarTransform.VariableReplacements repl;
      list<DAE.Statement> statementLst,statementLst_1;
      DAE.Exp e1,e1_1,e1_2;
      DAE.Else else_,else_1;
    case (DAE.NOELSE(),_) then DAE.NOELSE();
    case (DAE.ELSEIF(exp=e1,statementLst=statementLst,else_=else_),repl)
      equation
        statementLst_1 = replaceStatementLst(statementLst, repl);
        e1_1 = VarTransform.replaceExp(e1, repl,NONE());
        e1_2 = ExpressionSimplify.simplify(e1_1);
        else_1 = replaceElse(else_,repl);
      then
        DAE.ELSEIF(e1_2,statementLst_1,else_1);
    case (DAE.ELSE(statementLst=statementLst),repl) 
      equation
        statementLst_1 = replaceStatementLst(statementLst, repl);
      then
        DAE.ELSE(statementLst_1);      
  end match;
end replaceElse;

end BackendVarTransform;
