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

encapsulated package BackendDAECreate
" file:         BackendDAECreate.mo
  package:     BackendDAECreate
  description:  This file contains all functions for transforming the DAE structure 
                to the BackendDAE. 
  
  RCS: $Id$

"

public import Absyn;
public import BackendDAE;
public import DAE;

protected import Algorithm;
protected import BackendDAEUtil;
protected import BackendDAEOptimize;
protected import BackendEquation;
protected import BackendVariable;
protected import ComponentReference;
protected import ClassInf;
protected import DAEDump;
protected import DAEUtil;
protected import Debug;
protected import Derive;
protected import Error;
protected import Expression;
protected import ExpressionSimplify;
protected import ExpressionDump;
protected import Inline;
protected import OptManager;
protected import RTOpts;
protected import SCode;
protected import Util;


public function lower
"function: lower
  This function translates a DAE, which is the result from instantiating a
  class, into a more precise form, called BackendDAE.BackendDAE defined in this module.
  The BackendDAE.BackendDAE representation splits the DAE into equations and variables
  and further divides variables into known and unknown variables and the
  equations into simple and nonsimple equations.
  The variables are inserted into a hash table. This gives a lookup cost of
  O(1) for finding a variable. The equations are put in an expandable
  array. Where adding a new equation can be done in O(1) time if space
  is available.
  inputs:  daeList: DAE.DAElist, simplify: bool)
  outputs: BackendDAE.BackendDAE"
  input DAE.DAElist lst;
  input DAE.FunctionTree functionTree;
  input Boolean addDummyDerivativeIfNeeded;
  input Boolean simplify;
//  input Boolean removeTrivEqs "temporal input, for legacy purposes; doesn't add trivial equations to removed equations";
  output BackendDAE.BackendDAE outBackendDAE;
algorithm
  outBackendDAE := match(lst, functionTree, addDummyDerivativeIfNeeded, simplify)
    local
      BackendDAE.BinTree s;
      BackendDAE.Variables vars,knvars,vars_1,extVars;
      BackendDAE.AliasVariables aliasVars "hash table with alias vars' replacements (a=b or a=-b)";
      list<BackendDAE.Equation> eqns,reqns,ieqns,algeqns,algeqns1,ialgeqns,multidimeqns,imultidimeqns,eqns_1;
      list<BackendDAE.MultiDimEquation> aeqns,aeqns1,iaeqns;
      list<DAE.Algorithm> algs,algs_1,ialgs;
      list<BackendDAE.WhenClause> whenclauses,whenclauses_1;
      list<BackendDAE.ZeroCrossing> zero_crossings;
      BackendDAE.EquationArray eqnarr,reqnarr,ieqnarr;
      array<BackendDAE.MultiDimEquation> arr_md_eqns;
      array<DAE.Algorithm> algarr;
      BackendDAE.ExternalObjectClasses extObjCls;
      Boolean daeContainsNoStates, shouldAddDummyDerivative;
      BackendDAE.EventInfo einfo;
      list<DAE.Element> elems;

    case(lst, functionTree, addDummyDerivativeIfNeeded, true) // simplify by default
      equation
        (DAE.DAE(elems),functionTree) = processDelayExpressions(lst,functionTree);
        s = states(elems, BackendDAE.emptyBintree);
        vars = BackendDAEUtil.emptyVars();
        knvars = BackendDAEUtil.emptyVars();
        extVars = BackendDAEUtil.emptyVars();
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses,extObjCls,s) = lower2(listReverse(elems), functionTree, vars, knvars, extVars, {}, {}, {}, {}, {}, {}, {}, {}, {}, s);

        daeContainsNoStates = hasNoStates(s); // check if the DAE has states
        // adrpo: add the dummy derivative state ONLY IF the DAE contains
        //        no states AND ONLY if addDummyDerivative is set to true!
        shouldAddDummyDerivative =  boolAnd(addDummyDerivativeIfNeeded, daeContainsNoStates);
        (vars,eqns) = addDummyState(vars, eqns, shouldAddDummyDerivative);
        
        (aeqns,vars) = addFunctionRetVar(aeqns,vars);
        ((aeqns,eqns)) = Util.listFold(aeqns,splitArrayEqn,({},eqns));        
        ((iaeqns,ieqns)) = Util.listFold(iaeqns,splitArrayEqn,({},ieqns));         
        whenclauses_1 = listReverse(whenclauses);
        (algeqns,algeqns1,ialgeqns) = lowerAlgorithms(vars, algs, ialgs);
        (multidimeqns,imultidimeqns) = lowerMultidimeqns(vars, aeqns, iaeqns);
        eqns = listAppend(algeqns, eqns);
        eqns = listAppend(multidimeqns, eqns);
        ieqns = listAppend(ialgeqns, ieqns);
        ieqns = listAppend(imultidimeqns, ieqns);
        aeqns = listAppend(aeqns,iaeqns);
        algs = listAppend(algs,ialgs);
        reqns = listAppend(algeqns1, reqns);
        (vars,knvars,eqns,reqns,ieqns,aeqns1,algs_1,aliasVars) = BackendDAEOptimize.removeSimpleEquations(vars, knvars, eqns, reqns, ieqns, aeqns, algs, s);
        vars_1 = detectImplicitDiscrete(vars, eqns);
        vars_1 = detectImplicitDiscreteAlgs(vars_1,knvars, algs_1);
        eqns_1 = sortEqn(eqns);
        (eqns_1,ieqns,aeqns1,algs,vars_1) = expandDerOperator(vars_1,eqns_1,ieqns,aeqns1,algs_1,functionTree);
        (zero_crossings,eqns_1,aeqns1,whenclauses_1,algs) = findZeroCrossings(vars_1,knvars,eqns_1,aeqns1,whenclauses_1,algs);
        eqnarr = BackendDAEUtil.listEquation(eqns_1);
        reqnarr = BackendDAEUtil.listEquation(reqns);
        ieqnarr = BackendDAEUtil.listEquation(ieqns);
        arr_md_eqns = listArray(aeqns1);
        algarr = listArray(algs);
        einfo = Inline.inlineEventInfo(BackendDAE.EVENT_INFO(whenclauses_1,zero_crossings),(SOME(functionTree),{DAE.NORM_INLINE()}));
        BackendDAEUtil.checkBackendDAEWithErrorMsg(BackendDAE.DAE(vars_1,knvars,extVars,aliasVars,eqnarr,reqnarr,ieqnarr,arr_md_eqns,algarr,einfo,extObjCls));
      then BackendDAE.DAE(vars_1,knvars,extVars,aliasVars,eqnarr,reqnarr,ieqnarr,arr_md_eqns,algarr,einfo,extObjCls);

    case(lst, functionTree, addDummyDerivativeIfNeeded, false) // do not simplify
      equation
        (DAE.DAE(elems),functionTree)  = processDelayExpressions(lst,functionTree);
        s = states(elems, BackendDAE.emptyBintree);
        vars = BackendDAEUtil.emptyVars();
        knvars = BackendDAEUtil.emptyVars();
        extVars = BackendDAEUtil.emptyVars();
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses,extObjCls,s) = lower2(listReverse(elems), functionTree, vars, knvars, extVars, {}, {}, {}, {}, {}, {}, {}, {}, {}, s);

        daeContainsNoStates = hasNoStates(s); // check if the DAE has states
        // adrpo: add the dummy derivative state ONLY IF the DAE contains
        //        no states AND ONLY if addDummyDerivative is set to true!
        shouldAddDummyDerivative =  boolAnd(addDummyDerivativeIfNeeded, daeContainsNoStates);
        (vars,eqns) = addDummyState(vars, eqns, shouldAddDummyDerivative);

        (aeqns,vars) = addFunctionRetVar(aeqns,vars);
        ((aeqns,eqns)) = Util.listFold(aeqns,splitArrayEqn,({},eqns));        
        ((iaeqns,ieqns)) = Util.listFold(iaeqns,splitArrayEqn,({},ieqns));        
        whenclauses_1 = listReverse(whenclauses);
        (algeqns,algeqns1,ialgeqns) = lowerAlgorithms(vars, algs, ialgs);
       (multidimeqns,imultidimeqns) = lowerMultidimeqns(vars, aeqns, iaeqns);
        eqns = listAppend(algeqns, eqns);
        eqns = listAppend(multidimeqns, eqns);
        ieqns = listAppend(ialgeqns, ieqns);
        ieqns = listAppend(imultidimeqns, ieqns);
        aeqns = listAppend(aeqns,iaeqns);
        algs = listAppend(algs,ialgs);        
        reqns = listAppend(algeqns1, reqns);
        // no simplify (vars,knvars,eqns,reqns,ieqns,aeqns1,algs_1,aliasVars) = BackendDAEOptimize.removeSimpleEquations(vars, knvars, eqns, reqns, ieqns, aeqns, algs, s);
        aliasVars = BackendDAEUtil.emptyAliasVariables();
        vars_1 = detectImplicitDiscrete(vars, eqns);
        vars_1 = detectImplicitDiscreteAlgs(vars_1,knvars, algs);
        eqns_1 = sortEqn(eqns);
        // no simplify (eqns_1,ieqns,aeqns1,algs,vars_1) = expandDerOperator(vars_1,eqns_1,ieqns,aeqns1,algs_1,functionTree);
        (zero_crossings,eqns_1,aeqns,whenclauses_1,algs) = findZeroCrossings(vars_1,knvars,eqns_1,aeqns,whenclauses_1,algs);
        eqnarr = BackendDAEUtil.listEquation(eqns_1);
        reqnarr = BackendDAEUtil.listEquation(reqns);
        ieqnarr = BackendDAEUtil.listEquation(ieqns);
        arr_md_eqns = listArray(aeqns);
        algarr = listArray(algs);
        einfo = Inline.inlineEventInfo(BackendDAE.EVENT_INFO(whenclauses_1,zero_crossings),(SOME(functionTree),{DAE.NORM_INLINE()}));        
        BackendDAEUtil.checkBackendDAEWithErrorMsg(BackendDAE.DAE(vars_1,knvars,extVars,aliasVars,eqnarr,reqnarr,ieqnarr,arr_md_eqns,algarr,einfo,extObjCls));        
      then BackendDAE.DAE(vars_1,knvars,extVars,aliasVars,eqnarr,reqnarr,ieqnarr,arr_md_eqns,algarr,einfo,extObjCls);
  end match;
end lower;

protected function lower2
  "Helper function to lower."
  input list<DAE.Element> inElements "input is in reverse order. this is faster than reversing all accumulators at the end";
  input DAE.FunctionTree functionTree;
  input BackendDAE.Variables inVariables;
  input BackendDAE.Variables inKnownVariables;
  input BackendDAE.Variables inExternalVariables;
  input list<BackendDAE.Equation> inEquationLst3;
  input list<BackendDAE.Equation> inEquationLst4;
  input list<BackendDAE.Equation> inEquationLst5;
  input list<BackendDAE.MultiDimEquation> inMultiDimEquationLst6;
  input list<BackendDAE.MultiDimEquation> inMultiDimEquationLst7;
  input list<DAE.Algorithm> inAlgorithmAlgorithmLst8;
  input list<DAE.Algorithm> inAlgorithmAlgorithmLst9;
  input list<BackendDAE.WhenClause> inWhenClauseLst10;
  input BackendDAE.ExternalObjectClasses inExtObjClasses;
  input BackendDAE.BinTree inStatesBinTree;
  output BackendDAE.Variables outVariables;
  output BackendDAE.Variables outKnownVariables;
  output BackendDAE.Variables outExternalVariables;
  output list<BackendDAE.Equation> outEquationLst3;
  output list<BackendDAE.Equation> outEquationLst4;
  output list<BackendDAE.Equation> outEquationLst5;
  output list<BackendDAE.MultiDimEquation> outMultiDimEquationLst6;
  output list<BackendDAE.MultiDimEquation> outMultiDimEquationLst7;
  output list<DAE.Algorithm> outAlgorithmAlgorithmLst8;
  output list<DAE.Algorithm> outAlgorithmAlgorithmLst9;
  output list<BackendDAE.WhenClause> outWhenClauseLst10;
  output BackendDAE.ExternalObjectClasses outExtObjClasses;
  output BackendDAE.BinTree outStatesBinTree;
algorithm
  (outVariables,outKnownVariables,outExternalVariables,outEquationLst3,outEquationLst4,outEquationLst5,
   outMultiDimEquationLst6,outMultiDimEquationLst7,outAlgorithmAlgorithmLst8,outAlgorithmAlgorithmLst9,outWhenClauseLst10,outExtObjClasses,outStatesBinTree):=
   match (inElements,functionTree,inVariables,inKnownVariables,inExternalVariables,inEquationLst3,inEquationLst4,inEquationLst5,
      inMultiDimEquationLst6,inMultiDimEquationLst7,inAlgorithmAlgorithmLst8,inAlgorithmAlgorithmLst9,inWhenClauseLst10,inExtObjClasses,inStatesBinTree)
    local
      BackendDAE.Variables vars,knvars,extVars;
      list<BackendDAE.WhenClause> whenclauses;
      list<BackendDAE.Equation> eqns,reqns,ieqns;
      list<BackendDAE.MultiDimEquation> aeqns,iaeqns;
      list<DAE.Algorithm> algs,ialgs;
      BackendDAE.ExternalObjectClasses extObjCls;
      DAE.Element daeEl;
      list<DAE.Element> daeLstRest;
      BackendDAE.BinTree states;
      
    // the empty case 
    case ({},functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses,extObjCls,states)
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses,extObjCls,states);

    case (daeEl::daeLstRest,functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses,extObjCls,states)
      equation
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses,extObjCls,states) =
        lower3(daeEl,functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses,extObjCls,states);

        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses,extObjCls,states) =
        lower2(daeLstRest,functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses,extObjCls,states);
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses,extObjCls,states);
  end match;
end lower2;

protected function lower3
  "Helper function to lower."
  input DAE.Element inElement;
  input DAE.FunctionTree functionTree;
  input BackendDAE.Variables inVariables;
  input BackendDAE.Variables inKnownVariables;
  input BackendDAE.Variables inExternalVariables;
  input list<BackendDAE.Equation> inEquationLst3;
  input list<BackendDAE.Equation> inEquationLst4;
  input list<BackendDAE.Equation> inEquationLst5;
  input list<BackendDAE.MultiDimEquation> inMultiDimEquationLst6;
  input list<BackendDAE.MultiDimEquation> inMultiDimEquationLst7;
  input list<DAE.Algorithm> inAlgorithmAlgorithmLst8;
  input list<DAE.Algorithm> inAlgorithmAlgorithmLst9;
  input list<BackendDAE.WhenClause> inWhenClauseLst10;
  input BackendDAE.ExternalObjectClasses inExtObjClasses;
  input BackendDAE.BinTree inStatesBinTree;

  output BackendDAE.Variables outVariables;
  output BackendDAE.Variables outKnownVariables;
  output BackendDAE.Variables outExternalVariables;
  output list<BackendDAE.Equation> outEquationLst3;
  output list<BackendDAE.Equation> outEquationLst4;
  output list<BackendDAE.Equation> outEquationLst5;
  output list<BackendDAE.MultiDimEquation> outMultiDimEquationLst6;
  output list<BackendDAE.MultiDimEquation> outMultiDimEquationLst7;
  output list<DAE.Algorithm> outAlgorithmAlgorithmLst8;
  output list<DAE.Algorithm> outAlgorithmAlgorithmLst9;
  output list<BackendDAE.WhenClause> outWhenClauseLst10;
  output BackendDAE.ExternalObjectClasses outExtObjClasses;
  output BackendDAE.BinTree outStatesBinTree;
algorithm
  (outVariables,outKnownVariables,outExternalVariables,outEquationLst3,outEquationLst4,outEquationLst5,
   outMultiDimEquationLst6,outMultiDimEquationLst7,outAlgorithmAlgorithmLst8,outAlgorithmAlgorithmLst9,outWhenClauseLst10,outExtObjClasses,outStatesBinTree):=
   matchcontinue (inElement,functionTree,inVariables,inKnownVariables,inExternalVariables,inEquationLst3,inEquationLst4,inEquationLst5,
   inMultiDimEquationLst6,inMultiDimEquationLst7,inAlgorithmAlgorithmLst8,inAlgorithmAlgorithmLst9,inWhenClauseLst10,inExtObjClasses,inStatesBinTree)
    local
      BackendDAE.Variables vars,knvars,extVars;
      list<BackendDAE.WhenClause> whenclauses,whenclauses_1,whenclauses_2;
      list<BackendDAE.Equation> eqns,reqns,ieqns,eqns2,re,eqsComplex;
      list<BackendDAE.MultiDimEquation> aeqns,aeqns1,aeqns2,iaeqns,iaeqns1,iaeqns2;
      list<DAE.Algorithm> algs,ialgs;
      BackendDAE.ExternalObjectClasses extObjCls;
      BackendDAE.ExternalObjectClass extObjCl;
      DAE.Element daeEl;
      BackendDAE.BinTree states;
      BackendDAE.Equation  backendEq1, backendEq2;
      DAE.Exp e1,e2,c;
      BackendDAE.Value count,count_1;
      DAE.Algorithm a,a1,a2;
      DAE.ComponentRef cr;
      DAE.ElementSource source,eq_source;
      list<DAE.Element> daeElts;
      Absyn.Info info;
      Absyn.Path path;
      DAE.Function constr,destr;
      list<DAE.Exp> targets;
      list<DAE.Exp> sources;
      DAE.Exp e_11,e_21;
      list<DAE.Exp> ea1,ea2;
      list<tuple<DAE.Exp,DAE.Exp>> ealst; 
      BackendDAE.MultiDimEquation backendMultiDimEq;
      list<Option<BackendDAE.Equation>> opteqlst;
      BackendDAE.Var backendVar1,backendVar2;
      DAE.Exp cond,msg;
      Absyn.Path func_name;
      list<DAE.Exp> args;
      DAE.Statement s;
      Boolean b1, b2;
      String str;      
      
    // adrpo: should we ignore OUTER vars?!
    //case (((v as DAE.VAR(innerOuter=io)) :: xs),states,vars,knvars,extVars,whenclauses)
    //  equation
    //    DAEUtil.isOuterVar(v);
    //    (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,algs,whenclauses_1,extObjCls) =
    //    lower2(xs, states, vars, knvars, extVars, whenclauses);
    //  then
    //    (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,algs,whenclauses_1,extObjCls);

    
    // external object variables
    case (daeEl as DAE.VAR(componentRef = _),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        backendVar1 = lowerExtObjVar(daeEl);
        SOME(backendVar2) = Inline.inlineVarOpt(SOME(backendVar1),(SOME(functionTree),{DAE.NORM_INLINE()}));
        extVars = BackendVariable.addVar(backendVar2, extVars);
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states);

    // class for external object
    case (DAE.EXTOBJECTCLASS(path,constr,destr,source),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        {extObjCl} = Inline.inlineExtObjClasses({BackendDAE.EXTOBJCLASS(path,constr,destr,source)},(SOME(functionTree),{DAE.NORM_INLINE()}));
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCl::extObjCls,states);
    
    // variables: states and algebraic variables with binding equation
    case (daeEl as DAE.VAR(componentRef = cr, source = source),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        // adrpo 2009-09-07 - according to MathCore
        // add the binding as an equation and remove the binding from variable!
        true = isStateOrAlgvar(daeEl);
        (backendVar1,SOME(e1),states) = lowerVar(daeEl, states);
        SOME(backendVar2) = Inline.inlineVarOpt(SOME(backendVar1),(SOME(functionTree),{DAE.NORM_INLINE()}));
        e2 = Inline.inlineExp(e1,(SOME(functionTree),{DAE.NORM_INLINE()}));
        vars = BackendVariable.addVar(backendVar2, vars);
        e1 = Expression.crefExp(cr);
      then
        (vars,knvars,extVars,BackendDAE.EQUATION(e1, e2, source)::eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states);
    
    // variables: states and algebraic variables with NO binding equation
    case (daeEl as DAE.VAR(componentRef = cr, source = source),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        true = isStateOrAlgvar(daeEl);
        (backendVar1,NONE(),states) = lowerVar(daeEl, states);
        SOME(backendVar2) = Inline.inlineVarOpt(SOME(backendVar1),(SOME(functionTree),{DAE.NORM_INLINE()}));
        vars = BackendVariable.addVar(backendVar2, vars);
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states);
    
    // known variables: parameters and constants
    case (daeEl as DAE.VAR(componentRef = _),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        backendVar1 = lowerKnownVar(daeEl) "in previous rule, lower_var failed." ;
        SOME(backendVar2) = Inline.inlineVarOpt(SOME(backendVar1),(SOME(functionTree),{DAE.NORM_INLINE()}));
        knvars = BackendVariable.addVar(backendVar2, knvars);
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states);
    
    // tuple equations are rewritten to algorihm tuple assign.
    case (daeEl as DAE.EQUATION(exp = e1,scalar = e2),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        a = lowerTupleEquation(daeEl);
        a1 = Inline.inlineAlgorithm(a,(SOME(functionTree),{DAE.NORM_INLINE()}));
        a2 = extendAlgorithm(a1,SOME(functionTree));
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,a2::algs,ialgs,whenclauses_1,extObjCls,states);
    
    // tuple-tuple assignments are split into one equation for each tuple
    // element, i.e. (i1, i2) = (4, 6) => i1 = 4; i2 = 6; 
    case (DAE.EQUATION(DAE.TUPLE(targets), DAE.TUPLE(sources), source = eq_source),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        eqns2 = lowerTupleAssignment(targets, sources, eq_source, functionTree);
        eqns = listAppend(eqns2, eqns);
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states);
    
    // scalar equations
    case (daeEl as DAE.EQUATION(exp = e1,scalar = e2),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        backendEq1 = lowerEqn(daeEl);
        SOME(backendEq2) = Inline.inlineEqOpt(SOME(backendEq1),(SOME(functionTree),{DAE.NORM_INLINE()}));
      then
        (vars,knvars,extVars,backendEq2 :: eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states);
    
    // effort variable equality equations
    case (daeEl as DAE.EQUEQUATION(cr1 = _),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        backendEq1 = lowerEqn(daeEl);
        SOME(backendEq2) = Inline.inlineEqOpt(SOME(backendEq1),(SOME(functionTree),{DAE.NORM_INLINE()}));
      then
        (vars,knvars,extVars,backendEq2 :: eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states);
    
    // a solved equation 
    case (daeEl as DAE.DEFINE(componentRef = _),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        backendEq1 = lowerEqn(daeEl);
        SOME(backendEq2) = Inline.inlineEqOpt(SOME(backendEq1),(SOME(functionTree),{DAE.NORM_INLINE()}));
      then
        (vars,knvars,extVars,backendEq2 :: eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states);
    
    // complex equations
    case (daeEl as DAE.COMPLEX_EQUATION(lhs = e1,rhs = e2),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        (eqsComplex,aeqns1) = lowerComplexEqn(daeEl, functionTree);
        eqns = listAppend(eqsComplex, eqns);
        aeqns2 = listAppend(aeqns, aeqns1);
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns2,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states);
    
    // complex initial equations
    case (daeEl as DAE.INITIAL_COMPLEX_EQUATION(lhs = e1,rhs = e2),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        (eqsComplex,iaeqns1) = lowerComplexEqn(daeEl, functionTree);
        ieqns = listAppend(eqsComplex, ieqns);
        iaeqns2 = listAppend(iaeqns, iaeqns1);
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns2,algs,ialgs,whenclauses_1,extObjCls,states);
       
    // array equations
    case (daeEl as DAE.ARRAY_EQUATION(dimension = _,exp = e1,array = e2),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        backendMultiDimEq = lowerArrEqn(daeEl,functionTree);
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,backendMultiDimEq :: aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states);
        
    // initial array equations
    case (daeEl as DAE.INITIAL_ARRAY_EQUATION(dimension = _, exp = e1, array = e2),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        backendMultiDimEq = lowerArrEqn(daeEl,functionTree);
      then
        (vars, knvars, extVars, eqns, reqns, ieqns, aeqns,backendMultiDimEq :: iaeqns, algs,ialgs, whenclauses_1, extObjCls,states);
    
    // when equations
    case (daeEl as DAE.WHEN_EQUATION(condition = c),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        count = listLength(whenclauses_1);
        (eqns2,count_1,whenclauses_2) = lowerWhenEqn(daeEl, count, whenclauses_1);
        opteqlst = Util.listMap(eqns2,Util.makeOption);
        opteqlst = Util.listMap1(opteqlst,Inline.inlineEqOpt,(SOME(functionTree),{DAE.NORM_INLINE()}));
        eqns2 = Util.listMap(opteqlst,Util.getOption);
        eqns = listAppend(eqns, eqns2);
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_2,extObjCls,states);
    
    // initial equations
    case (daeEl as DAE.INITIALEQUATION(exp1 = e1,exp2 = e2),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        backendEq1 = lowerEqn(daeEl);
        SOME(backendEq2) = Inline.inlineEqOpt(SOME(backendEq1),(SOME(functionTree),{DAE.NORM_INLINE()}));
      then
        (vars,knvars,extVars,eqns,reqns,backendEq2 :: ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states);
    
    // algorithm
    case (DAE.ALGORITHM(algorithm_ = a),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        a1 = Inline.inlineAlgorithm(a,(SOME(functionTree),{DAE.NORM_INLINE()})); 
        a2 = extendAlgorithm(a1,SOME(functionTree));
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,a1 :: algs,ialgs,whenclauses_1,extObjCls,states);
    
    // flat class / COMP
    case (DAE.COMP(dAElist = daeElts),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses,extObjCls,states)
      equation
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses,extObjCls,states) = lower2(listReverse(daeElts),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses,extObjCls,states);
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses,extObjCls,states);
    
    // assert in equation section is converted to ALGORITHM
    case (DAE.ASSERT(cond,msg,source),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        checkAssertCondition(cond,msg);
        a = Inline.inlineAlgorithm(DAE.ALGORITHM_STMTS({DAE.STMT_ASSERT(cond,msg,source)}),(SOME(functionTree),{DAE.NORM_INLINE()}));
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,a::algs,ialgs,whenclauses_1,extObjCls,states);
    
    // terminate in equation section is converted to ALGORITHM
    case (DAE.TERMINATE(message = msg, source = source),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        a = Inline.inlineAlgorithm(DAE.ALGORITHM_STMTS({DAE.STMT_TERMINATE(msg,source)}),(SOME(functionTree),{DAE.NORM_INLINE()}));
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,a::algs,ialgs,whenclauses_1,extObjCls,states);
    
    case (DAE.NORETCALL(functionName = func_name, functionArgs = args, source = source),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        // make sure is not constrain as we don't support it, see below.
        b1 = boolNot(Util.isEqual(func_name, Absyn.IDENT("constrain")));
        // constrain is fine when we do check model!
        b2 = OptManager.getOption("checkModel");
        true = boolOr(b1, b2);
        
        s = DAE.STMT_NORETCALL(DAE.CALL(func_name, args, false, false, DAE.ET_NORETCALL(), DAE.NORM_INLINE()),source);
        a = Inline.inlineAlgorithm(DAE.ALGORITHM_STMTS({s}),(SOME(functionTree),{DAE.NORM_INLINE()}));
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,a::algs,ialgs,whenclauses_1,extObjCls,states);

    // initial algorithm
    case (daeEl as DAE.INITIALALGORITHM(algorithm_ = a, source = DAE.SOURCE(info=info)),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
       a1 = Inline.inlineAlgorithm(a,(SOME(functionTree),{DAE.NORM_INLINE()})); 
       a2 = extendAlgorithm(a1,SOME(functionTree));
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,a2 ::ialgs,whenclauses_1,extObjCls,states);       

    // when running checkModel ignore some of the unsupported features as we only want to see nr eqs/vars
    // if equation that cannot be translated to if expression but have initial() as condition
    case (daeEl as DAE.IF_EQUATION(condition1 = {DAE.CALL(path=Absyn.IDENT("initial"))}, source = DAE.SOURCE(info = info)),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        true = OptManager.getOption("checkModel");
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states);
    
    // when running checkModel ignore some of the unsupported features as we only want to see nr eqs/vars
    // initial if equation that cannot be translated to if expression 
    case (daeEl as DAE.INITIAL_IF_EQUATION(condition1 = _, source = DAE.SOURCE(info = info)),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        true = OptManager.getOption("checkModel");
      then
        (vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states);
    
    // when running checkModel ignore some of the unsupported features as we only want to see nr eqs/vars
    // error reporting from now on
    
    // if equation that cannot be translated to if expression
    case (daeEl as DAE.IF_EQUATION(condition1 = _, source = DAE.SOURCE(info = info)),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        str = DAEDump.dumpElementsStr({daeEl});
        str = stringAppend("rewrite equations using if-expressions: ",str);
        Error.addSourceMessage(Error.UNSUPPORTED_LANGUAGE_FEATURE, {"if-equations",str}, info);
      then
        fail();
    
    // initial if equation that cannot be translated to if expression 
    case (daeEl as DAE.INITIAL_IF_EQUATION(condition1 = _, source = DAE.SOURCE(info = info)),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        str = DAEDump.dumpElementsStr({daeEl});
        str = stringAppend("rewrite equations using if-expressions: ",str);
        Error.addSourceMessage(Error.UNSUPPORTED_LANGUAGE_FEATURE, {"if-equations",str}, info);
      then
        fail();
    
    // constrain is not a standard Modelica function, but used in old libraries such as the old Multibody library.
    // The OpenModelica backend does not support constrain, but the frontend does (Mathcore needs it for their backend).
    // To get a meaningful error message when constrain is used we catch it here, instead of silently failing. 
    // User-defined functions should have fully qualified names here, so Absyn.IDENT should only match the builtin constrain function.        
    case (daeEl as DAE.NORETCALL(functionName = Absyn.IDENT(name = "constrain"), source = DAE.SOURCE(info=info)),functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        str = DAEDump.dumpElementsStr({daeEl});
        str = stringAppend("rewrite code without using constrain",str);        
        Error.addSourceMessage(Error.UNSUPPORTED_LANGUAGE_FEATURE,{"constrain function",str}, info);
      then
        fail();
        
    case (daeEl,functionTree,vars,knvars,extVars,eqns,reqns,ieqns,aeqns,iaeqns,algs,ialgs,whenclauses_1,extObjCls,states)
      equation
        // show only on failtrace!
        true = RTOpts.debugFlag("failtrace");
        Debug.fprintln("failtrace", "- BackendDAECreate.lower2 failed on: " +& DAEDump.dumpElementsStr({daeEl}));
      then
        fail();
  end matchcontinue;  
end lower3;

/*
 *  lower all variables
 */

protected function lowerVar
"function: lowerVar
  Transforms a DAE variable to DAE variable.
  Includes changing the ComponentRef name to a simpler form
  \'a\'.\'b\'{2}\'c\'{5} becomes
  \'a.b{2}.c\' (as CREF_IDENT(\"a.b.c\",{2}) )
  inputs: (DAE.Element, BackendDAE.BinTree /* states */)
  outputs: Var"
  input DAE.Element inElement;
  input BackendDAE.BinTree inBinTree;
  output BackendDAE.Var outVar;
  output Option<DAE.Exp> outBinding;
  output BackendDAE.BinTree outBinTree;
algorithm
  (outVar,outBinding,outBinTree) := match (inElement,inBinTree)
    local
      list<DAE.Subscript> dims;
      DAE.ComponentRef name;
      BackendDAE.VarKind kind_1;
      Option<DAE.Exp> bind;
      DAE.VarKind kind;
      DAE.VarDirection dir;
      BackendDAE.Type tp;
      DAE.Flow flowPrefix;
      DAE.Stream streamPrefix;
      DAE.ElementSource source "origin of equation";
      Option<DAE.VariableAttributes> dae_var_attr;
      Option<SCode.Comment> comment;
      BackendDAE.BinTree states;
      DAE.Type t;

    case (DAE.VAR(componentRef = name,
                  kind = kind,
                  direction = dir,
                  ty = t,
                  binding = bind,
                  dims = dims,
                  flowPrefix = flowPrefix,
                  streamPrefix = streamPrefix,
                  source = source,
                  variableAttributesOption = dae_var_attr,
                  absynCommentOption = comment),states)
      equation
        (kind_1,states) = lowerVarkind(kind, t, name, dir, flowPrefix, streamPrefix, states, dae_var_attr);
        tp = lowerType(t);
      then
        (BackendDAE.VAR(name,kind_1,dir,tp,NONE(),NONE(),dims,-1,source,dae_var_attr,comment,flowPrefix,streamPrefix), bind, states);
  end match;
end lowerVar;

protected function lowerKnownVar
"function: lowerKnownVar
  Helper function to lower2"
  input DAE.Element inElement;
  output BackendDAE.Var outVar;
algorithm
  outVar := matchcontinue (inElement)
    local
      list<DAE.Subscript> dims;
      DAE.ComponentRef name;
      BackendDAE.VarKind kind_1;
      Option<DAE.Exp> bind;
      DAE.VarKind kind;
      DAE.VarDirection dir;
      BackendDAE.Type tp;
      DAE.Flow flowPrefix;
      DAE.Stream streamPrefix;
      DAE.ElementSource source "origin of equation";
      Option<DAE.VariableAttributes> dae_var_attr;
      Option<SCode.Comment> comment;
      DAE.Type t;

    case (DAE.VAR(componentRef = name,
                  kind = kind,
                  direction = dir,
                  ty = t,
                  binding = bind,
                  dims = dims,
                  flowPrefix = flowPrefix,
                  streamPrefix = streamPrefix,
                  source = source,
                  variableAttributesOption = dae_var_attr,
                  absynCommentOption = comment))
      equation
        kind_1 = lowerKnownVarkind(kind, name, dir, flowPrefix);
        bind = fixParameterStartBinding(bind,dae_var_attr,kind_1);
        tp = lowerType(t);
      then
        BackendDAE.VAR(name,kind_1,dir,tp,bind,NONE(),dims,-1,source,dae_var_attr,comment,flowPrefix,streamPrefix);

    case (_)
      equation
        print("-BackendDAECreat.lowerKnownVar failed\n");
      then
        fail();
  end matchcontinue;
end lowerKnownVar;

protected function fixParameterStartBinding
  input Option<DAE.Exp> bind;
  input Option<DAE.VariableAttributes> attr;
  input BackendDAE.VarKind kind;
  output Option<DAE.Exp> outBind;
algorithm
  outBind := matchcontinue (bind,attr,kind)
    local
      DAE.Exp exp;
    case (NONE(),attr,BackendDAE.PARAM())
      equation
        exp = DAEUtil.getStartAttr(attr); 
      then SOME(exp);
    else bind;
  end matchcontinue;
end fixParameterStartBinding;

protected function lowerVarkind
"function: lowerVarkind
  Helper function to lowerVar.
  inputs: (DAE.VarKind,
           Type,
           DAE.ComponentRef,
           DAE.VarDirection, /* input/output/bidir */
           DAE.Flow,
           DAE.Stream,
           BackendDAE.BinTree /* states */)
  outputs  VarKind
  NOTE: Fails for not states that are not algebraic
        variables, e.g. parameters and constants"
  input DAE.VarKind inVarKind;
  input DAE.Type inType;
  input DAE.ComponentRef inComponentRef;
  input DAE.VarDirection inVarDirection;
  input DAE.Flow inFlow;
  input DAE.Stream inStream;
  input BackendDAE.BinTree inBinTree;
  input Option<DAE.VariableAttributes> daeAttr;
  output BackendDAE.VarKind outVarKind;
  output BackendDAE.BinTree outBinTree;
algorithm
  (outVarKind,outBinTree) := matchcontinue (inVarKind,inType,inComponentRef,inVarDirection,inFlow,inStream,inBinTree,daeAttr)
    local
      DAE.ComponentRef v,cr;
      BackendDAE.BinTree states;
      DAE.VarDirection dir;
      DAE.Flow flowPrefix;
    // States appear differentiated among equations
    case (DAE.VARIABLE(),_,v,_,_,_,states,daeAttr)
      equation
        _ = BackendDAEUtil.treeGet(states, v);
      then
        (BackendDAE.STATE(),states);
    // Or states have StateSelect.always
    case (DAE.VARIABLE(),_,v,_,_,_,states,SOME(DAE.VAR_ATTR_REAL(stateSelectOption = SOME(DAE.ALWAYS()))))
      equation
      states = BackendDAEUtil.treeAdd(states, v, 0);  
    then (BackendDAE.STATE(),states);

    // Or states have StateSelect.prefer
    case (DAE.VARIABLE(),_,v,_,_,_,states,SOME(DAE.VAR_ATTR_REAL(stateSelectOption = SOME(DAE.PREFER()))))
      equation
      states = BackendDAEUtil.treeAdd(states, v, 0);  
    then (BackendDAE.STATE(),states);

    case (DAE.VARIABLE(),(DAE.T_BOOL(_),_),cr,dir,flowPrefix,_,states,_)
      equation
        failure(BackendVariable.topLevelInput(cr, dir, flowPrefix));
      then
        (BackendDAE.DISCRETE(),states);

    case (DAE.DISCRETE(),(DAE.T_BOOL(_),_),cr,dir,flowPrefix,_,states,_)
      equation
        failure(BackendVariable.topLevelInput(cr, dir, flowPrefix));
      then
        (BackendDAE.DISCRETE(),states);

    case (DAE.VARIABLE(),(DAE.T_INTEGER(_),_),cr,dir,flowPrefix,_,states,_)
      equation
        failure(BackendVariable.topLevelInput(cr, dir, flowPrefix));
      then
        (BackendDAE.DISCRETE(),states);

    case (DAE.DISCRETE(),(DAE.T_INTEGER(_),_),cr,dir,flowPrefix,_,states,_)
      equation
        failure(BackendVariable.topLevelInput(cr, dir, flowPrefix));
      then
        (BackendDAE.DISCRETE(),states);

    case (DAE.VARIABLE(),_,cr,dir,flowPrefix,_,states,_)
      equation
        failure(BackendVariable.topLevelInput(cr, dir, flowPrefix));
      then
        (BackendDAE.VARIABLE(),states);

    case (DAE.DISCRETE(),_,cr,dir,flowPrefix,_,states,_)
      equation
        failure(BackendVariable.topLevelInput(cr, dir, flowPrefix));
      then
        (BackendDAE.DISCRETE(),states);
  end matchcontinue;
end lowerVarkind;

protected function lowerKnownVarkind
"function: lowerKnownVarkind
  Helper function to lowerKnownVar.
  NOTE: Fails for everything but parameters and constants and top level inputs"
  input DAE.VarKind inVarKind;
  input DAE.ComponentRef inComponentRef;
  input DAE.VarDirection inVarDirection;
  input DAE.Flow inFlow;
  output BackendDAE.VarKind outVarKind;
algorithm
  outVarKind := matchcontinue (inVarKind,inComponentRef,inVarDirection,inFlow)
    local
      DAE.ComponentRef cr;
      DAE.VarDirection dir;
      DAE.Flow flowPrefix;
    case (DAE.PARAM(),_,_,_) then BackendDAE.PARAM();
    case (DAE.CONST(),_,_,_) then BackendDAE.CONST();
    case (DAE.VARIABLE(),cr,dir,flowPrefix)
      equation
        BackendVariable.topLevelInput(cr, dir, flowPrefix);
      then
        BackendDAE.VARIABLE();
    // adrpo: topLevelInput might fail!
    // case (DAE.VARIABLE(),cr,dir,flowPrefix)
    //  then
    //    BackendDAE.VARIABLE();
    case (_,_,_,_)
      equation
        print("lower_known_varkind failed\n");
      then
        fail();
  end matchcontinue;
end lowerKnownVarkind;

protected function lowerType
"Transforms a DAE.Type to Type
"
  input  DAE.Type inType;
  output BackendDAE.Type outType;
algorithm
  outType := matchcontinue(inType)
    local
      list<String> strLst;
      Absyn.Path path;
    case ((DAE.T_REAL(_),_)) then BackendDAE.REAL();
    case ((DAE.T_INTEGER(_),_)) then BackendDAE.INT();
    case ((DAE.T_BOOL(_),_)) then BackendDAE.BOOL();
    case ((DAE.T_STRING(_),_)) then BackendDAE.STRING();
    case ((DAE.T_ENUMERATION(names = strLst),_)) then BackendDAE.ENUMERATION(strLst);
    case ((DAE.T_COMPLEX(complexClassType = ClassInf.EXTERNAL_OBJ(path)),_)) then BackendDAE.EXT_OBJECT(path);
    else equation print("lowerType failed\n"); then fail();
  end matchcontinue;
end lowerType;


protected function lowerExtObjVar
" Helper function to lower2
  Fails for all variables except external object instances."
  input DAE.Element inElement;
  output BackendDAE.Var outVar;
algorithm
  outVar:=
  match (inElement)
    local
      list<DAE.Subscript> dims;
      DAE.ComponentRef name;
      BackendDAE.VarKind kind_1;
      Option<DAE.Exp> bind;
      DAE.VarKind kind;
      DAE.VarDirection dir;
      BackendDAE.Type tp;
      DAE.Flow flowPrefix;
      DAE.Stream streamPrefix;
      DAE.ElementSource source;
      Option<DAE.VariableAttributes> dae_var_attr;
      Option<SCode.Comment> comment;
      DAE.Type t;

    case (DAE.VAR(componentRef = name,
                  kind = kind,
                  direction = dir,
                  ty = t,
                  binding = bind,
                  dims = dims,
                  flowPrefix = flowPrefix,
                  streamPrefix = streamPrefix,
                  source = source,
                  variableAttributesOption = dae_var_attr,
                  absynCommentOption = comment))
      equation
        kind_1 = lowerExtObjVarkind(t);
        tp = lowerType(t);
      then
        BackendDAE.VAR(name,kind_1,dir,tp,bind,NONE(),dims,-1,source,dae_var_attr,comment,flowPrefix,streamPrefix);
  end match;
end lowerExtObjVar;

protected function lowerExtObjVarkind
" Helper function to lowerExtObjVar.
  NOTE: Fails for everything but External objects"
  input DAE.Type inType;
  output BackendDAE.VarKind outVarKind;
algorithm
  outVarKind:=
  match (inType)
    local Absyn.Path path;
    case ((DAE.T_COMPLEX(complexClassType = ClassInf.EXTERNAL_OBJ(path)),_)) then BackendDAE.EXTOBJ(path);
  end match;
end lowerExtObjVarkind;


/*
 *  lower all equation types
 */

protected function lowerEqn
"function: lowerEqn
  Helper function to lower2.
  Transforms a DAE.Element to Equation."
  input DAE.Element inElement;
  output BackendDAE.Equation outEquation;
algorithm
  outEquation :=  match (inElement)
    local
      DAE.Exp e1,e2;
      DAE.ComponentRef cr1,cr2;
      DAE.ElementSource source "the element source";

    case (DAE.EQUATION(exp = e1,scalar = e2,source = source))
      equation
        e1 = ExpressionSimplify.simplify(e1);
        e2 = ExpressionSimplify.simplify(e2);
      then
        BackendDAE.EQUATION(e1,e2,source);

    case (DAE.INITIALEQUATION(exp1 = e1,exp2 = e2,source = source))
      equation
        e1 = ExpressionSimplify.simplify(e1);
        e2 = ExpressionSimplify.simplify(e2);
      then
        BackendDAE.EQUATION(e1,e2,source);

    case (DAE.EQUEQUATION(cr1 = cr1, cr2 = cr2,source = source))
      equation
        e1 = ExpressionSimplify.simplify(Expression.crefExp(cr1));
        e2 = ExpressionSimplify.simplify(Expression.crefExp(cr2));
      then
        BackendDAE.EQUATION(e1,e2,source);

    case (DAE.DEFINE(componentRef = cr1, exp = e2, source = source))
      equation
        e1 = Expression.crefExp(cr1);
        e1 = ExpressionSimplify.simplify(e1);
        e2 = ExpressionSimplify.simplify(e2);
      then
        BackendDAE.EQUATION(e1,e2,source);

    case (DAE.INITIALDEFINE(componentRef = cr1, exp = e2, source = source))
      equation
        e1 = Expression.crefExp(cr1);
        e1 = ExpressionSimplify.simplify(e1);
        e2 = ExpressionSimplify.simplify(e2);
      then
        BackendDAE.EQUATION(e1,e2,source);
  end match;
end lowerEqn;

protected function lowerArrEqn
"function: lowerArrEqn
  Helper function to lower2.
  Transform a DAE.Element to MultiDimEquation."
  input DAE.Element inElement;
  input DAE.FunctionTree funcs;
  output BackendDAE.MultiDimEquation outMultiDimEquation;
algorithm
  outMultiDimEquation := match (inElement,funcs)
    local
      DAE.Exp e1,e2,e1_1,e2_1,e1_2,e2_2,e1_3,e2_3;
      list<BackendDAE.Value> ds;
      list<DAE.Dimension> dims;
      DAE.ElementSource source;

    case (DAE.ARRAY_EQUATION(dimension = dims, exp = e1, array = e2, source = source),funcs)
      equation
        e1_1 = Inline.inlineExp(e1,(SOME(funcs),{DAE.NORM_INLINE()}));
        e2_1 = Inline.inlineExp(e2,(SOME(funcs),{DAE.NORM_INLINE()}));
        ((e1_2,_)) = extendArrExp((e1_1,SOME(funcs)));
        ((e2_2,_)) = extendArrExp((e2_1,SOME(funcs)));
        e1_3 = ExpressionSimplify.simplify(e1_2);
        e2_3 = ExpressionSimplify.simplify(e2_2);
        ds = Expression.dimensionsSizes(dims);
      then
        BackendDAE.MULTIDIM_EQUATION(ds,e1_3,e2_3,source);

    case (DAE.INITIAL_ARRAY_EQUATION(dimension = dims, exp = e1, array = e2, source = source),funcs)
      equation
        e1_1 = Inline.inlineExp(e1,(SOME(funcs),{DAE.NORM_INLINE()}));
        e2_1 = Inline.inlineExp(e2,(SOME(funcs),{DAE.NORM_INLINE()}));
        ((e1_2,_)) = extendArrExp((e1_1,SOME(funcs)));
        ((e2_2,_)) = extendArrExp((e2_1,SOME(funcs)));
        e1_3 = ExpressionSimplify.simplify(e1_2);
        e2_3 = ExpressionSimplify.simplify(e2_2);
        ds = Expression.dimensionsSizes(dims);
      then
        BackendDAE.MULTIDIM_EQUATION(ds,e1_3,e2_3,source);
  end match;
end lowerArrEqn;

protected function splitArrayEqn"
Author: Frenkel TUD 2011-02"
  input  BackendDAE.MultiDimEquation inAEqn;
  input  tuple<list<BackendDAE.MultiDimEquation>,list<BackendDAE.Equation>> inTpl;
  output tuple<list<BackendDAE.MultiDimEquation>,list<BackendDAE.Equation>> outTpl;
algorithm
  outTpl := 
  matchcontinue (inAEqn,inTpl)
    local
      BackendDAE.MultiDimEquation aeqn;
      list<BackendDAE.MultiDimEquation> aeqs;
      list<BackendDAE.Equation> eqns,eqns1,re;
      DAE.ElementSource source; 
      DAE.Exp e1,e2;
      list<DAE.Exp> ea1,ea2;
      list<tuple<DAE.Exp,DAE.Exp>> ealst; 
    case (BackendDAE.MULTIDIM_EQUATION(left=e1,right=e2,source=source),(aeqs,eqns))
      equation
        true = Expression.isArray(e1) or Expression.isMatrix(e1);
        true = Expression.isArray(e2) or Expression.isMatrix(e2);
        ea1 = Expression.flattenArrayExpToList(e1);
        ea2 = Expression.flattenArrayExpToList(e2);          
        ealst = Util.listThreadTuple(ea1,ea2);
        re = Util.listMap1(ealst,BackendEquation.generateEQUATION,source);
        eqns1 = listAppend(eqns,re);
      then
        ((aeqs,eqns1));
    case (aeqn,(aeqs,eqns)) then ((aeqn::aeqs,eqns));
  end matchcontinue;
end splitArrayEqn;

public function addFunctionRetVar"
Author: Frenkel TUD 2011-02"
  input list<BackendDAE.MultiDimEquation> inAEqs;
  input BackendDAE.Variables inVars;
  output list<BackendDAE.MultiDimEquation> outAEqs;
  output BackendDAE.Variables outVars;
algorithm
  (outAEqs,outVars):=
  matchcontinue (inAEqs,inVars)
    local
      list<BackendDAE.MultiDimEquation> aeqs,raeqs;
      BackendDAE.Variables vars;
    case (aeqs,vars)
      equation
        // traverse algorithms and add an equation tmp = func() and replace func with tmp
        (raeqs,vars,_) = addFunctionRetVar1(aeqs,vars,1,{}); 
      then
        (raeqs,vars);
    case (aeqs,vars) then (aeqs,vars);
  end matchcontinue;
end addFunctionRetVar;

public function addFunctionRetVar1"
Author: Frenkel TUD 2011-02"
  input list<BackendDAE.MultiDimEquation> inAEqs;
  input BackendDAE.Variables inVars;
  input Integer inI;
  input list<BackendDAE.MultiDimEquation> inAEqsAcc;
  output list<BackendDAE.MultiDimEquation> outAEqs;
  output BackendDAE.Variables outVars;
  output Integer outI;
algorithm
  (outAEqs,outVars,outI) := match(inAEqs, inVars, inI, inAEqsAcc)
    local
      list<BackendDAE.MultiDimEquation> rest,l,result;
      BackendDAE.MultiDimEquation hd;
      BackendDAE.Variables vars;
      Integer i;
    case ({}, vars, i, l) then (listReverse(l),vars,i);
    case (hd::rest, vars, i, l)
      equation
        (l,vars,i) = addFunctionRetVar2(hd,vars,i,l);
        (result,vars,i) = addFunctionRetVar1(rest, vars, i, l);
    then
        (result,vars,i);
  end match;
end addFunctionRetVar1;

public function addFunctionRetVar2"
Author: Frenkel TUD 2011-02"
  input BackendDAE.MultiDimEquation inAEq;
  input BackendDAE.Variables inVars;
  input Integer inI;
  input list<BackendDAE.MultiDimEquation> inAEqsAcc;
  output list<BackendDAE.MultiDimEquation> outAEqs;
  output BackendDAE.Variables outVars;
  output Integer outI;
algorithm
  (outAEqs,outVars,outI) := matchcontinue(inAEq, inVars, inI, inAEqsAcc)
    local
      list<BackendDAE.MultiDimEquation> l,result;
      BackendDAE.MultiDimEquation hd;
      BackendDAE.Variables vars;
      Integer i;
      list<Integer> dimSize;
      DAE.Exp left,right;
      DAE.ElementSource source;
      Boolean b1,b2;
    case (BackendDAE.MULTIDIM_EQUATION(dimSize=dimSize,left=left,right=right,source=source), vars, i, l)
      equation
        ((_,b1)) = Expression.traverseExpTopDown(left, traversingBinaryFinder, false);
        ((_,b2)) = Expression.traverseExpTopDown(right, traversingBinaryFinder, false);
        true = b1 or b2;
        ((left,(vars,i,l,_))) = Expression.traverseExp(left,addFunctionRetVar3,(vars,i,l,source));
        ((right,(vars,i,l,_))) = Expression.traverseExp(right,addFunctionRetVar3,(vars,i,l,source));
        left = ExpressionSimplify.simplify(left);
        right = ExpressionSimplify.simplify(right);
        result = BackendDAE.MULTIDIM_EQUATION(dimSize,left,right,source)::l;
    then
        (result,vars,i);
    case (hd, vars, i, l) then (hd::l, vars, i);
  end matchcontinue;
end addFunctionRetVar2;

protected function traversingBinaryFinder "
Author: Frenkel 2011-02"
  input tuple<DAE.Exp, Boolean > inExp;
  output tuple<DAE.Exp, Boolean, Boolean > outExp;
algorithm 
  outExp := matchcontinue(inExp)
    local
      DAE.Exp e;      
      Boolean b; 
    case((e as DAE.BINARY(exp1=_), _))
      then ((e,false,true));
  case((e,b)) then ((e,not b,b));    
  end matchcontinue;
end traversingBinaryFinder;

protected function addFunctionRetVar3
"Help function to e.g. addFunctionRetVar"
  input tuple<DAE.Exp,tuple<BackendDAE.Variables,Integer,list<BackendDAE.MultiDimEquation>,DAE.ElementSource>> tpl;
  output tuple<DAE.Exp,tuple<BackendDAE.Variables,Integer,list<BackendDAE.MultiDimEquation>,DAE.ElementSource>> outTpl;
algorithm
  outTpl := matchcontinue(tpl)
    local
      BackendDAE.Variables vars,vars_1;
      DAE.Exp e1,left,left1;
      DAE.ExpType ty,tp,tp1;
      Integer i;
      list<BackendDAE.MultiDimEquation> aeqs;
      list<Integer> dimSize;
      DAE.ElementSource source;
      Absyn.Path path;
      DAE.ComponentRef cr,id;
      list<DAE.Dimension> ad;
      list<list<DAE.Subscript>> subslst,subslst1;
      list<DAE.ComponentRef> crlst;
      list<BackendDAE.Var> varlst;
      BackendDAE.Type btp;
    case((e1 as DAE.CALL(path=path,ty=ty as DAE.ET_ARRAY(arrayDimensions=ad,ty=tp)),(vars,i,aeqs,source)))
     equation
      dimSize = Util.listMap(ad, Expression.dimensionSize);
      cr = ComponentReference.pathToCref(path);
      id = ComponentReference.makeCrefIdent(intString(i),ty,{});
      cr = ComponentReference.joinCrefs(cr,id);
      left = Expression.makeCrefExp(cr,ty);
      subslst = BackendDAEUtil.dimensionsToRange(ad);
      subslst1 = BackendDAEUtil.rangesToSubscripts(subslst);
      crlst = Util.listMap1r(subslst1,ComponentReference.subscriptCref,cr);
      tp1 = Expression.unliftArray(tp);
      btp = expTypeToBackendType(tp1);
      varlst = Util.listMap1(crlst,makeVariable,btp);
      vars_1 = BackendVariable.addVars(varlst, vars);      
      ((left1,_)) = BackendDAEUtil.extendArrExp((left,NONE()));
    then ((left1,(vars_1,i+1,BackendDAE.MULTIDIM_EQUATION(dimSize,left,e1,source)::aeqs,source)));
    case tpl then tpl;
  end matchcontinue;
end addFunctionRetVar3;

protected function makeVariable "function: makeVariable
  author: Frenkel TUD 2011-02"
  input DAE.ComponentRef inCref;
  input BackendDAE.Type inType;
  output BackendDAE.Var outVar;
algorithm
  outVar:= BackendDAE.VAR(inCref, BackendDAE.VARIABLE(),DAE.BIDIR(),inType,NONE(),NONE(),{},-1,
                            DAE.emptyElementSource,
                            NONE(),NONE(),DAE.NON_CONNECTOR(),DAE.NON_STREAM());
end makeVariable;

protected function expTypeToBackendType
"Transforms a DAE.ExpType to BackendDAE.Type
"
  input  DAE.ExpType inType;
  output BackendDAE.Type outType;
algorithm
  outType := match(inType)
    local
      list<String> strLst;
      Absyn.Path path;
    case DAE.ET_INT() then BackendDAE.INT();
    case DAE.ET_REAL() then BackendDAE.REAL();
    case DAE.ET_BOOL() then BackendDAE.BOOL();
    case DAE.ET_STRING() then BackendDAE.STRING();
    case DAE.ET_ENUMERATION(names = strLst) then BackendDAE.ENUMERATION(strLst);
    case DAE.ET_COMPLEX(complexClassType = ClassInf.EXTERNAL_OBJ(path)) then BackendDAE.EXT_OBJECT(path);
    case (_) then fail();
  end match;
end expTypeToBackendType;

protected function lowerComplexEqn
"function: lowerComplexEqn
  Helper function to lower2.
  Transform a DAE.Element to ComplexEquation."
  input DAE.Element inElement;
  input DAE.FunctionTree funcs;
  output list<BackendDAE.Equation> outComplexEquations;
  output list<BackendDAE.MultiDimEquation> outMultiDimEquations;  
algorithm
  (outComplexEquations,outMultiDimEquations) := matchcontinue (inElement, funcs)
    local
      DAE.Exp e1,e2,e1_1,e2_1;
      DAE.ExpType ty;
      Integer i;
      list<BackendDAE.Equation> complexEqs;
      list<BackendDAE.MultiDimEquation> arreqns;
      DAE.ElementSource source;

    // normal first try to inline function calls and extend the equations
    case (DAE.COMPLEX_EQUATION(lhs = e1, rhs = e2,source = source),funcs)
      equation
        e1 = ExpressionSimplify.simplify(e1);
        e2 = ExpressionSimplify.simplify(e2);
        ty = Expression.typeof(e1);
        i = Expression.sizeOf(ty);
        // inline 
        e1_1 = Inline.inlineExp(e1,(SOME(funcs),{DAE.NORM_INLINE()}));
        e2_1 = Inline.inlineExp(e2,(SOME(funcs),{DAE.NORM_INLINE()}));
        // extend      
        ((complexEqs,arreqns)) = extendRecordEqns(BackendDAE.COMPLEX_EQUATION(-1,e1_1,e2_1,source),funcs);
      then
        (complexEqs,arreqns);
    case (DAE.COMPLEX_EQUATION(lhs = e1, rhs = e2,source = source),funcs)
      equation
        e1 = ExpressionSimplify.simplify(e1);
        e2 = ExpressionSimplify.simplify(e2);
        // create as many equations as the dimension of the record
        ty = Expression.typeof(e1);
        i = Expression.sizeOf(ty);
        complexEqs = Util.listFill(BackendDAE.COMPLEX_EQUATION(-1,e1,e2,source), i);
      then
        (complexEqs,{});
    // initial first try to inline function calls and extend the equations
    case (DAE.INITIAL_COMPLEX_EQUATION(lhs = e1, rhs = e2,source = source),funcs)
      equation
        e1 = ExpressionSimplify.simplify(e1);
        e2 = ExpressionSimplify.simplify(e2);
        ty = Expression.typeof(e1);
        i = Expression.sizeOf(ty);
        // inline 
        e1_1 = Inline.inlineExp(e1,(SOME(funcs),{DAE.NORM_INLINE()}));
        e2_1 = Inline.inlineExp(e2,(SOME(funcs),{DAE.NORM_INLINE()}));
        // extend      
        ((complexEqs,arreqns)) = extendRecordEqns(BackendDAE.COMPLEX_EQUATION(-1,e1_1,e2_1,source),funcs);
      then
        (complexEqs,arreqns);
    case (DAE.INITIAL_COMPLEX_EQUATION(lhs = e1, rhs = e2,source = source),funcs)
      equation
        e1 = ExpressionSimplify.simplify(e1);
        e2 = ExpressionSimplify.simplify(e2);
        // create as many equations as the dimension of the record
        ty = Expression.typeof(e1);
        i = Expression.sizeOf(ty);
        complexEqs = Util.listFill(BackendDAE.COMPLEX_EQUATION(-1,e1,e2,source), i);
      then
        (complexEqs,{});
    case (_,_)
      equation
        print("- BackendDAECreate.lowerComplexEqn failed!\n");
      then ({},{});
  end matchcontinue;
end lowerComplexEqn;

protected function lowerWhenEqn
"function lowerWhenEqn
  This function lowers a when clause. The condition expresion is put in the
  BackendDAE.WhenClause list and the equations inside are put in the equation list.
  For each equation in the clause a new entry in the BackendDAE.WhenClause list is generated
  and one extra for all the reinit statements.
  inputs:  (DAE.Element, int /* when-clause index */, BackendDAE.WhenClause list)
  outputs: (Equation list, BackendDAE.Variables, int /* when-clause index */, BackendDAE.WhenClause list)"
  input DAE.Element inElement;
  input Integer inWhenClauseIndex;
  input list<BackendDAE.WhenClause> inWhenClauseLst;
  output list<BackendDAE.Equation> outEquationLst;
  output Integer outWhenClauseIndex;
  output list<BackendDAE.WhenClause> outWhenClauseLst;
algorithm
  (outEquationLst,outWhenClauseIndex,outWhenClauseLst):=
  matchcontinue (inElement,inWhenClauseIndex,inWhenClauseLst)
    local
      list<BackendDAE.Equation> res, res1;
      list<BackendDAE.Equation> trueEqnLst, elseEqnLst;
      list<BackendDAE.WhenOperator> reinit;
      Integer equation_count,reinit_count,extra,tot_count,i_1,i,nextWhenIndex;
      Boolean hasReinit;
      list<BackendDAE.WhenClause> whenClauseList1,whenClauseList2,whenClauseList3,whenClauseList4,whenList,elseClauseList;
      DAE.Exp cond;
      list<DAE.Element> eqnl;
      DAE.Element elsePart;
      String scond;

    case (DAE.WHEN_EQUATION(condition = cond,equations = eqnl,elsewhen_ = NONE()),i,whenList)
      equation
        (res,reinit) = lowerWhenEqn2(eqnl, i);
        equation_count = listLength(res);
        reinit_count = listLength(reinit);
        hasReinit = (reinit_count > 0);
        extra = Util.if_(hasReinit, 1, 0);
        tot_count = equation_count + extra;
        i_1 = i + tot_count;
        whenClauseList1 = makeWhenClauses(equation_count, cond, {});
        whenClauseList2 = makeWhenClauses(extra, cond, reinit);
        whenClauseList3 = listAppend(whenClauseList2, whenClauseList1);
        whenClauseList4 = listAppend(whenClauseList3, whenList);
      then
        (res,i_1,whenClauseList4);

    case (DAE.WHEN_EQUATION(condition = cond,equations = eqnl,elsewhen_ = SOME(elsePart)),i,whenList)
      equation
        (elseEqnLst,nextWhenIndex,elseClauseList) = lowerWhenEqn(elsePart,i,whenList);
        (trueEqnLst,reinit) = lowerWhenEqn2(eqnl, nextWhenIndex);
        equation_count = listLength(trueEqnLst);
        reinit_count = listLength(reinit);
        hasReinit = (reinit_count > 0);
        extra = Util.if_(hasReinit, 1, 0);
        tot_count = equation_count + extra;
        whenClauseList1 = makeWhenClauses(equation_count, cond, {});
        whenClauseList2 = makeWhenClauses(extra, cond, reinit);
        whenClauseList3 = listAppend(whenClauseList2, whenClauseList1);
        (res1,i_1,whenClauseList4) = mergeClauses(trueEqnLst,elseEqnLst,whenClauseList3,
          elseClauseList,nextWhenIndex + tot_count);
      then
        (res1,i_1,whenClauseList4);

    case (DAE.WHEN_EQUATION(condition = cond),_,_)
      equation
        scond = ExpressionDump.printExpStr(cond);
        print("- BackendDAECreate.lowerWhenEqn: Error in lowerWhenEqn. \n when ");
        print(scond);
        print(" ... \n");
      then fail();
  end matchcontinue;
end lowerWhenEqn;

protected function lowerWhenEqn2
"function lowerWhenEqn2
  Helper function to lowerWhenEqn. Lowers the equations inside a when clause"
  input list<DAE.Element> inDAEElementLst "The List of equations inside a when clause";
  input Integer inWhenClauseIndex;
  output list<BackendDAE.Equation> outEquationLst;
  output list<BackendDAE.WhenOperator> outReinitStatementLst;
algorithm
  (outEquationLst,outReinitStatementLst):=
  matchcontinue (inDAEElementLst,inWhenClauseIndex)
    local
      BackendDAE.Value i;
      list<BackendDAE.Equation> eqnl;
      list<BackendDAE.WhenOperator> reinit;
      DAE.Exp cre,e,cond;
      DAE.ComponentRef cr;
      list<DAE.Element> xs;
      DAE.Element el;
      DAE.ElementSource source "the element source";

    case ({},_) then ({},{});
    case ((DAE.EQUATION(exp = (cre as DAE.CREF(componentRef = cr)),scalar = e, source = source) :: xs),i)
      equation
        (eqnl,reinit) = lowerWhenEqn2(xs, i + 1);
      then
        ((BackendDAE.WHEN_EQUATION(BackendDAE.WHEN_EQ(i,cr,e,NONE()),source) :: eqnl),reinit);

    case ((DAE.COMPLEX_EQUATION(lhs = (cre as DAE.CREF(componentRef = cr)),rhs = e,source = source) :: xs),i)
      equation
        (eqnl,reinit) = lowerWhenEqn2(xs, i + 1);
      then
        ((BackendDAE.WHEN_EQUATION(BackendDAE.WHEN_EQ(i,cr,e,NONE()),source) :: eqnl),reinit);

    case ((DAE.ASSERT(condition=cond,message = e,source = source) :: xs),i)
      equation
        (eqnl,reinit) = lowerWhenEqn2(xs, i);
      then
        (eqnl,(BackendDAE.ASSERT(cond,e,source) :: reinit));

    case ((DAE.REINIT(componentRef = cr,exp = e,source = source) :: xs),i)
      equation
        (eqnl,reinit) = lowerWhenEqn2(xs, i);
      then
        (eqnl,(BackendDAE.REINIT(cr,e,source) :: reinit));

    case ((DAE.TERMINATE(message = e,source = source) :: xs),i)
      equation
        (eqnl,reinit) = lowerWhenEqn2(xs, i);
      then
        (eqnl,(BackendDAE.TERMINATE(e,source) :: reinit));
    
    case ((DAE.ARRAY_EQUATION(exp = (cre as DAE.CREF(componentRef = cr)),array = e,source = source) :: xs),i)
      equation
        (eqnl,reinit) = lowerWhenEqn2(xs, i + 1);
      then
        ((BackendDAE.WHEN_EQUATION(BackendDAE.WHEN_EQ(i,cr,e,NONE()),source) :: eqnl),reinit);    
    
    // failure  
    case ((el::xs), i)
      equation
        true = RTOpts.debugFlag("failtrace");
        Debug.fprintln("failtrace", "- BackendDAECreate.lowerWhenEqn2 failed on:" +& DAEDump.dumpElementsStr({el}));
      then 
        fail();
    
    // adrpo: 2010-09-26
    // allow to continue when checking the model
    // just ignore this equation.
    case ((el::xs), i)
      equation
        true = OptManager.getOption("checkModel");
        (eqnl,reinit) = lowerWhenEqn2(xs, i + 1);
      then
        (eqnl, reinit);
  end matchcontinue;
end lowerWhenEqn2;


protected function lowerTupleAssignment
  "Used by lower2 to split a tuple-tuple assignment into one equation for each
  tuple-element"
  input list<DAE.Exp> target_expl;
  input list<DAE.Exp> source_expl;
  input DAE.ElementSource eq_source;
  input DAE.FunctionTree funcs;
  output list<BackendDAE.Equation> eqns;
algorithm
  eqns := match(target_expl, source_expl, eq_source,funcs)
    local
      DAE.Exp target, source;
      list<DAE.Exp> rest_targets, rest_sources;
      DAE.Element e;
      BackendDAE.Equation eq,eq1;
      list<BackendDAE.Equation> new_eqns;
    case ({}, {}, _, funcs) then {};
    case (target :: rest_targets, source :: rest_sources, _, funcs)
      equation
        new_eqns = lowerTupleAssignment(rest_targets, rest_sources, eq_source, funcs);
        e = DAE.EQUATION(target, source, eq_source);
        eq = lowerEqn(e);
        SOME(eq1) = Inline.inlineEqOpt(SOME(eq),(SOME(funcs),{DAE.NORM_INLINE()}));
      then eq :: new_eqns;
  end match;
end lowerTupleAssignment;

protected function lowerTupleEquation
"Lowers a tuple equation, e.g. (a,b) = foo(x,y)
 by transforming it to an algorithm (TUPLE_ASSIGN), e.g. (a,b) := foo(x,y);
 author: PA"
  input DAE.Element eqn;
  output DAE.Algorithm alg;
algorithm
  alg := match(eqn)
    local
      DAE.ElementSource source;
      DAE.Exp e2;
      list<DAE.Exp> expl;
      /* Only succeds for tuple equations, i.e. (a,b,c) = foo(x,y,z) or foo(x,y,z) = (a,b,c) */
    case(DAE.EQUATION(DAE.TUPLE(expl),e2 as DAE.CALL(path =_),source))
    then DAE.ALGORITHM_STMTS({DAE.STMT_TUPLE_ASSIGN(DAE.ET_OTHER(),expl,e2,source)});

    case(DAE.EQUATION(e2 as DAE.CALL(path =_),DAE.TUPLE(expl),source))
    then DAE.ALGORITHM_STMTS({DAE.STMT_TUPLE_ASSIGN(DAE.ET_OTHER(),expl,e2,source)});
  end match;
end lowerTupleEquation;

protected function lowerMultidimeqns
"function: lowerMultidimeqns
  author: PA

  Lowers MultiDimEquations by creating ARRAY_EQUATION nodes that points
  to the array equation, stored in a BackendDAE.MultiDimEquation array.
  each BackendDAE.MultiDimEquation has as many ARRAY_EQUATION nodes as it has array
  elements. This to ensure correct sorting using BLT.
  inputs:  (Variables, /* vars */
              BackendDAE.MultiDimEquation list)
  outputs: BackendDAE.Equation list"
  input BackendDAE.Variables vars;
  input list<BackendDAE.MultiDimEquation> algs;
  input list<BackendDAE.MultiDimEquation> ialgs;
  output list<BackendDAE.Equation> eqns;
  output list<BackendDAE.Equation> ieqns;
protected
  Integer indx;  
algorithm
  (eqns,indx) := lowerMultidimeqns2(vars, algs, 0);
  (ieqns,_) := lowerMultidimeqns2(vars, ialgs, indx);
end lowerMultidimeqns;

protected function lowerMultidimeqns2
"function: lowerMultidimeqns2
  Helper function to lower_multidimeqns. To handle indexes in BackendDAE.Equation nodes
  for multidimensional equations to indentify the corresponding
  MultiDimEquation
  inputs:  (Variables, /* vars */
              BackendDAE.MultiDimEquation list,
              int /* index */)
  outputs: (Equation list,
      int) /* updated index */"
  input BackendDAE.Variables inVariables;
  input list<BackendDAE.MultiDimEquation> inMultiDimEquationLst;
  input Integer inInteger;
  output list<BackendDAE.Equation> outEquationLst;
  output Integer outInteger;
algorithm
  (outEquationLst,outInteger) := matchcontinue (inVariables,inMultiDimEquationLst,inInteger)
    local
      BackendDAE.Variables vars;
      BackendDAE.Value aindx;
      list<BackendDAE.Equation> eqns,eqns2,res;
      BackendDAE.MultiDimEquation a;
      list<BackendDAE.MultiDimEquation> algs;
      DAE.Exp e1,e2;
      list<DAE.Exp> a1,a2,an;
      list<tuple<DAE.Exp,DAE.Exp>> ealst;
      list<list<tuple<DAE.Exp, Boolean>>> al1,al2;
      list<tuple<DAE.Exp, Boolean>> ebl1,ebl2;
      DAE.ElementSource source;      
    case (vars,{},aindx) then ({},aindx);
    case (vars,((a as BackendDAE.MULTIDIM_EQUATION(left=DAE.ARRAY(array=a1),right=DAE.ARRAY(array=a2),source=source)) :: algs),aindx)
      equation
        ealst = Util.listThreadTuple(a1,a2);
        eqns = Util.listMap1(ealst,BackendEquation.generateEQUATION,source);
        aindx = aindx + 1;
        (eqns2,aindx) = lowerMultidimeqns2(vars, algs, aindx);
        res = listAppend(eqns, eqns2);
      then
        (res,aindx);
    case (vars,((a as BackendDAE.MULTIDIM_EQUATION(left=DAE.UNARY(exp=DAE.ARRAY(array=a1)),right=DAE.ARRAY(array=a2),source=source)) :: algs),aindx)
      equation
        an = Util.listMap(a1,Expression.negate);
        ealst = Util.listThreadTuple(an,a2);
        eqns = Util.listMap1(ealst,BackendEquation.generateEQUATION,source);
        aindx = aindx + 1;
        (eqns2,aindx) = lowerMultidimeqns2(vars, algs, aindx);
        res = listAppend(eqns, eqns2);
      then
        (res,aindx);              
    case (vars,((a as BackendDAE.MULTIDIM_EQUATION(left=DAE.ARRAY(array=a1),right=DAE.UNARY(exp=DAE.ARRAY(array=a2)),source=source)) :: algs),aindx)
      equation
        an = Util.listMap(a2,Expression.negate);
        ealst = Util.listThreadTuple(a1,an);
        eqns = Util.listMap1(ealst,BackendEquation.generateEQUATION,source);
        aindx = aindx + 1;
        (eqns2,aindx) = lowerMultidimeqns2(vars, algs, aindx);
        res = listAppend(eqns, eqns2);
      then
        (res,aindx);
    case (vars,((a as BackendDAE.MULTIDIM_EQUATION(left=DAE.MATRIX(scalar=al1),right=DAE.MATRIX(scalar=al2),source=source)) :: algs),aindx)
      equation
        ebl1 = Util.listFlatten(al1);
        ebl2 = Util.listFlatten(al2);
        a1 = Util.listMap(ebl1,Util.tuple21);
        a2 = Util.listMap(ebl2,Util.tuple21);
        ealst = Util.listThreadTuple(a1,a2);
        eqns = Util.listMap1(ealst,BackendEquation.generateEQUATION,source);
        aindx = aindx + 1;
        (eqns2,aindx) = lowerMultidimeqns2(vars, algs, aindx);
        res = listAppend(eqns, eqns2);
      then
        (res,aindx);  
    case (vars,((a as BackendDAE.MULTIDIM_EQUATION(left=DAE.UNARY(exp=DAE.MATRIX(scalar=al1)),right=DAE.MATRIX(scalar=al2),source=source)) :: algs),aindx)
      equation
        ebl1 = Util.listFlatten(al1);
        ebl2 = Util.listFlatten(al2);
        a1 = Util.listMap(ebl1,Util.tuple21);
        a2 = Util.listMap(ebl2,Util.tuple21);        
        an = Util.listMap(a1,Expression.negate);
        ealst = Util.listThreadTuple(an,a2);
        eqns = Util.listMap1(ealst,BackendEquation.generateEQUATION,source);
        aindx = aindx + 1;
        (eqns2,aindx) = lowerMultidimeqns2(vars, algs, aindx);
        res = listAppend(eqns, eqns2);
      then
        (res,aindx);              
    case (vars,((a as BackendDAE.MULTIDIM_EQUATION(left=DAE.MATRIX(scalar=al1),right=DAE.UNARY(exp=DAE.MATRIX(scalar=al2)),source=source)) :: algs),aindx)
      equation
        ebl1 = Util.listFlatten(al1);
        ebl2 = Util.listFlatten(al2);
        a1 = Util.listMap(ebl1,Util.tuple21);
        a2 = Util.listMap(ebl2,Util.tuple21);        
        an = Util.listMap(a2,Expression.negate);
        ealst = Util.listThreadTuple(a1,an);
        eqns = Util.listMap1(ealst,BackendEquation.generateEQUATION,source);
        aindx = aindx + 1;
        (eqns2,aindx) = lowerMultidimeqns2(vars, algs, aindx);
        res = listAppend(eqns, eqns2);
      then
        (res,aindx);              
    case (vars,((a as BackendDAE.MULTIDIM_EQUATION(left=e1,right=e2,source=source)) :: algs),aindx)
      equation
        eqns = lowerMultidimeqn(vars, a, aindx);
        aindx = aindx + 1;
        (eqns2,aindx) = lowerMultidimeqns2(vars, algs, aindx);
        res = listAppend(eqns, eqns2);
      then
        (res,aindx);
  end matchcontinue;
end lowerMultidimeqns2;

protected function lowerMultidimeqn
"function: lowerMultidimeqn
  Lowers a BackendDAE.MultiDimEquation by creating an equation for each array
  index, such that BLT can be run correctly.
  inputs:  (Variables, /* vars */
              MultiDimEquation,
              int) /* indx */
  outputs:  BackendDAE.Equation list"
  input BackendDAE.Variables inVariables;
  input BackendDAE.MultiDimEquation inMultiDimEquation;
  input Integer inInteger;
  output list<BackendDAE.Equation> outEquationLst;
algorithm
  outEquationLst := match (inVariables,inMultiDimEquation,inInteger)
    local
      list<DAE.Exp> expl1,expl2,expl;
      BackendDAE.Value numnodes,aindx;
      list<BackendDAE.Equation> lst;
      BackendDAE.Variables vars;
      list<BackendDAE.Value> ds;
      DAE.Exp e1,e2;
      DAE.ElementSource source "the element source";

    case (vars,BackendDAE.MULTIDIM_EQUATION(dimSize = ds,left = e1,right = e2,source = source),aindx)
      equation
        expl1 = BackendDAEUtil.statesAndVarsExp(e1, vars);
        expl2 = BackendDAEUtil.statesAndVarsExp(e2, vars);
        expl = listAppend(expl1, expl2);
        numnodes = Util.listReduce(ds, intMul);
        lst = lowerMultidimeqn2(expl, numnodes, aindx, source);
      then
        lst;
  end match;
end lowerMultidimeqn;

protected function lowerMultidimeqn2
"function: lower_multidimeqns2
  Helper function to lower_multidimeqns
  Creates numnodes BackendDAE.Equation nodes so BLT can be run correctly.
  inputs:  (DAE.Exp list, int /* numnodes */, int /* indx */)
  outputs: BackendDAE.Equation list ="
  input list<DAE.Exp> inExpExpLst1;
  input Integer inInteger2;
  input Integer inInteger3;
  input DAE.ElementSource source "the element source";
  output list<BackendDAE.Equation> outEquationLst;
algorithm
  outEquationLst := matchcontinue (inExpExpLst1,inInteger2,inInteger3,source)
    local
      list<DAE.Exp> expl;
      BackendDAE.Value numnodes_1,numnodes,indx;
      list<BackendDAE.Equation> res;
    case (expl,0,_,_) then {};
    case (expl,numnodes,indx,source)
      equation
        numnodes_1 = numnodes - 1;
        res = lowerMultidimeqn2(expl, numnodes_1, indx, source);
      then
        (BackendDAE.ARRAY_EQUATION(indx,expl,source) :: res);
  end matchcontinue;
end lowerMultidimeqn2;

/*
 *   lower algorithms
 */


protected function lowerAlgorithms
"function: lowerAlgorithms
  This function lowers algorithm sections by generating a list
  of ALGORITHMS nodes for the BLT sorting, which are put in
  the equation list.
  An algorithm that calculates n variables will get n  ALGORITHM nodes
  such that the BLT sorting can be done correctly.
  inputs:  (Variables /* vars */, DAE.Algorithm list)
  outputs: BackendDAE.Equation list"
  input BackendDAE.Variables vars;
  input list<DAE.Algorithm> algs;
  input list<DAE.Algorithm> ialgs;
  output list<BackendDAE.Equation> eqns;
  output list<BackendDAE.Equation> eqns1 "algorithms with no outputs will be moved to known equations";
  output list<BackendDAE.Equation> ieqns;
protected
  Integer indx;  
  list<BackendDAE.Equation> ie1,ie2;
algorithm
  (eqns,eqns1,indx) := lowerAlgorithms2(vars, algs, 0);
  (ie1,ie2,_) := lowerAlgorithms2(vars, ialgs, indx);
  ieqns := listAppend(ie1,ie2);
end lowerAlgorithms;

protected function lowerAlgorithms2
"function: lowerAlgorithms2
  Helper function to lowerAlgorithms. To handle indexes in BackendDAE.Equation nodes
  for algorithms to indentify the corresponding algorithm.
  inputs:  (Variables /* vars */, DAE.Algorithm list, int /* algindex*/ )
  outputs: (Equation list, int /* updated algindex */ ) ="
  input BackendDAE.Variables inVariables;
  input list<DAE.Algorithm> inAlgorithmAlgorithmLst;
  input Integer inInteger;
  output list<BackendDAE.Equation> outEquationLst;
  output list<BackendDAE.Equation> outEquationLst1 "algorithms with no outputs will be moved to known equations";
  output Integer outInteger;
algorithm
  (outEquationLst,outEquationLst1,outInteger) := match (inVariables,inAlgorithmAlgorithmLst,inInteger)
    local
      BackendDAE.Variables vars;
      BackendDAE.Value aindx;
      list<BackendDAE.Equation> eqns,eqns_1,eqns1,eqns1_1,res,res1;
      DAE.Algorithm a;
      list<DAE.Algorithm> algs;
    case (vars,{},aindx) then ({},{},aindx);
    case (vars,(a :: algs),aindx)
      equation
        (eqns,eqns1) = lowerAlgorithm(vars, a, aindx);
        aindx = aindx + 1;
        (eqns_1,eqns1_1,aindx) = lowerAlgorithms2(vars, algs, aindx);
        res = listAppend(eqns_1, eqns);
        res1 = listAppend(eqns1_1, eqns1);
      then
        (res,res1,aindx);
  end match;
end lowerAlgorithms2;

protected function lowerAlgorithm
"function: lowerAlgorithm
  Lowers a single algorithm. Creates n ALGORITHM nodes for blt sorting.
  inputs:  (Variables, /* vars */
              DAE.Algorithm,
              int /* algindx */)
  outputs: BackendDAE.Equation list"
  input BackendDAE.Variables vars;
  input DAE.Algorithm a;
  input Integer aindx;
  output list<BackendDAE.Equation> lst;
  output list<BackendDAE.Equation> lst1 "algorithms with no outputs will be moved to known equations";
protected
  list<DAE.Exp> inputs,outputs;
  BackendDAE.Value numnodes;
algorithm
  ((inputs,outputs)) := lowerAlgorithmInputsOutputs(vars, a);
  numnodes := listLength(outputs);
  (lst,lst1) := lowerAlgorithm2(inputs, outputs, numnodes, aindx);
end lowerAlgorithm;

protected function lowerAlgorithm2
"function: lowerAlgorithm2
  Helper function to lower_algorithm
  inputs:  (DAE.Exp list /* inputs   */,
              DAE.Exp list /* outputs  */,
              int          /* numnodes */,
              int          /* aindx    */)
  outputs:  (Equation list)"
  input list<DAE.Exp> inExpExpLst1;
  input list<DAE.Exp> inExpExpLst2;
  input Integer inInteger3;
  input Integer inInteger4;
  output list<BackendDAE.Equation> outEquationLst;
  output list<BackendDAE.Equation> outEquationLst1 "algorithms with no outputs will be moved to known equations";
algorithm
  (outEquationLst,outEquationLst1) := matchcontinue (inExpExpLst1,inExpExpLst2,inInteger3,inInteger4)
    local
      BackendDAE.Value numnodes_1,numnodes,aindx;
      list<BackendDAE.Equation> res,res1;
      list<DAE.Exp> inputs,outputs;
    case (inputs as (_::_),{},0,aindx)
      then
        ({},{BackendDAE.ALGORITHM(aindx,inputs,{},DAE.emptyElementSource)});
    case (_,_,0,_) then ({},{});
    case (inputs,outputs,numnodes,aindx)
      equation
        numnodes_1 = numnodes - 1;
        (res,res1) = lowerAlgorithm2(inputs, outputs, numnodes_1, aindx);
      then
        (BackendDAE.ALGORITHM(aindx,inputs,outputs,DAE.emptyElementSource) :: res,res1);
  end matchcontinue;
end lowerAlgorithm2;

public function lowerAlgorithmInputsOutputs
"function: lowerAlgorithmInputsOutputs
  This function finds the inputs and the outputs of an algorithm.
  An input is all values that are reffered on the right hand side of any
  statement in the algorithm and an output is a variables belonging to the
  variables that are assigned a value in the algorithm. If a variable is an 
  input and an output it will be treated as an output."
  input BackendDAE.Variables inVariables;
  input DAE.Algorithm inAlgorithm;
  output tuple<list<DAE.Exp>,list<DAE.Exp>> outTplExpExpLst;
algorithm
  outTplExpExpLst := match (inVariables,inAlgorithm)
    local
      list<DAE.Exp> inputs1,outputs1,inputs2,outputs2,inputs,outputs;
      BackendDAE.Variables vars;
      Algorithm.Statement s;
      list<Algorithm.Statement> ss;
    case (_,DAE.ALGORITHM_STMTS(statementLst = {})) then (({},{}));
    case (vars,DAE.ALGORITHM_STMTS(statementLst = (s :: ss)))
      equation
        (inputs1,outputs1) = lowerStatementInputsOutputs(vars, s);
        ((inputs2,outputs2)) = lowerAlgorithmInputsOutputs(vars, DAE.ALGORITHM_STMTS(ss));
        inputs = Util.listUnionOnTrue(inputs1, inputs2, Expression.expEqual);
        outputs = Util.listUnionOnTrue(outputs1, outputs2, Expression.expEqual);
        inputs = Util.listFold1(outputs,Util.listRemoveOnTrue,Expression.expEqual,inputs);
      then
        ((inputs,outputs));
  end match;
end lowerAlgorithmInputsOutputs;

protected function lowerStatementInputsOutputs
"function: lowerStatementInputsOutputs
  Helper relatoin to lowerAlgorithmInputsOutputs
  Investigates single statements. Returns DAE.Exp list
  instead of DAE.ComponentRef list because derivatives must
  be handled as well.
  inputs:  (Variables, /* vars */
              Algorithm.Statement)
  outputs: (DAE.Exp list, /* inputs, CREF or der(CREF)  */
              DAE.Exp list  /* outputs, CREF or der(CREF) */)"
  input BackendDAE.Variables inVariables;
  input Algorithm.Statement inStatement;
  output list<DAE.Exp> outExpExpLst1;
  output list<DAE.Exp> outExpExpLst2;
algorithm
  (outExpExpLst1,outExpExpLst2) := matchcontinue (inVariables,inStatement)
    local
      BackendDAE.Variables vars;
      DAE.ExpType tp;
      DAE.ComponentRef cr;
      DAE.Exp e, exp1, e1, e2;
      list<Algorithm.Statement> statements;
      Algorithm.Statement stmt;
      list<Algorithm.Statement> stmts;
      Algorithm.Else elsebranch;
      list<DAE.Exp> expl,inputs,inputs1,inputs2,inputs3,outputs,outputs1,outputs2;
      DAE.Ident iteratorName;
      DAE.Exp iteratorExp;
      list<DAE.Exp> arrayVars, nonArrayVars;
      list<list<DAE.Exp>> arrayElements;
      list<DAE.Exp> flattenedElements;
      DAE.ComponentRef cref_;
            
      // a := expr;
    case (vars,DAE.STMT_ASSIGN(type_ = tp,exp1 = exp1,exp = e))
      equation
        inputs = BackendDAEUtil.statesAndVarsExp(e, vars);
        outputs =  BackendDAEUtil.statesAndVarsExp(exp1, vars);
      then
        (inputs,outputs);
      // (a,b,c) := foo(...)
    case (vars,DAE.STMT_TUPLE_ASSIGN(type_ = tp, expExpLst = expl, exp = e))
      equation
        inputs = BackendDAEUtil.statesAndVarsExp(e,vars);
        outputs = Util.listFlatten(Util.listMap1(expl,BackendDAEUtil.statesAndVarsExp,vars));
      then
        (inputs,outputs);     
    // v := expr   where v is array.
    case (vars,DAE.STMT_ASSIGN_ARR(type_ = tp, componentRef = cr, exp = e))
      equation
        inputs = BackendDAEUtil.statesAndVarsExp(e,vars);  
        outputs =  BackendDAEUtil.statesAndVarsExp(Expression.makeCrefExp(cr,tp), vars);          
      then (inputs,outputs);      
    case(vars,DAE.STMT_IF(exp = e, statementLst = stmts, else_ = elsebranch))
      equation
        ((inputs1,outputs1)) = lowerAlgorithmInputsOutputs(vars,DAE.ALGORITHM_STMTS(stmts));
        (inputs2,outputs2) = lowerElseAlgorithmInputsOutputs(vars,elsebranch);
        inputs3 = BackendDAEUtil.statesAndVarsExp(e,vars);
        inputs = Util.listListUnionOnTrue({inputs1, inputs2,inputs3}, Expression.expEqual);
        outputs = Util.listUnionOnTrue(outputs1, outputs2, Expression.expEqual);
      then (inputs,outputs);
   case(vars, DAE.STMT_FOR(type_= tp, iter = iteratorName, range = e, statementLst = stmts))
      equation
        ((inputs1,outputs1)) = lowerAlgorithmInputsOutputs(vars, DAE.ALGORITHM_STMTS(stmts));
        inputs2 = BackendDAEUtil.statesAndVarsExp(e, vars);
        // Split the output variables into variables that depend on the loop
        // variable and variables that don't.
        cref_ = ComponentReference.makeCrefIdent(iteratorName, tp, {});
        iteratorExp = Expression.crefExp(cref_);
        (arrayVars, nonArrayVars) = Util.listSplitOnTrue1(outputs1, BackendDAEUtil.isLoopDependent, iteratorExp);
        arrayVars = Util.listMap(arrayVars, BackendDAEUtil.devectorizeArrayVar);
        // Explode array variables into their array elements.
        // I.e. var[i] => var[1], var[2], var[3] etc.
        arrayElements = Util.listMap3(arrayVars, BackendDAEUtil.explodeArrayVars, iteratorExp, e, vars);
        flattenedElements = Util.listFlatten(arrayElements);
        inputs = Util.listListUnionOnTrue({inputs1, inputs2}, Expression.expEqual);
        outputs = Util.listListUnionOnTrue({nonArrayVars, flattenedElements}, Expression.expEqual);
      then (inputs, outputs);
    case(vars, DAE.STMT_WHILE(exp = e, statementLst = stmts))
      equation
        ((inputs1,outputs)) = lowerAlgorithmInputsOutputs(vars, DAE.ALGORITHM_STMTS(stmts));
        inputs2 = BackendDAEUtil.statesAndVarsExp(e, vars);
        inputs =  Util.listListUnionOnTrue({inputs1, inputs2}, Expression.expEqual);
      then (inputs, outputs);
    case (vars,DAE.STMT_WHEN(exp = e,statementLst = statements,elseWhen = NONE()))
      equation
        ((inputs1,outputs)) = lowerAlgorithmInputsOutputs(vars,DAE.ALGORITHM_STMTS(statements));
        inputs2 = BackendDAEUtil.statesAndVarsExp(e, vars);
        inputs =  Util.listListUnionOnTrue({inputs1, inputs2}, Expression.expEqual);
      then
        (inputs,outputs);
    case (vars,DAE.STMT_WHEN(exp = e,statementLst = statements,elseWhen = SOME(stmt)))
      equation
        (inputs1, outputs1) = lowerStatementInputsOutputs(vars,stmt);
        ((inputs2,outputs2)) = lowerAlgorithmInputsOutputs(vars,DAE.ALGORITHM_STMTS(statements));
        inputs3 = BackendDAEUtil.statesAndVarsExp(e, vars);
        inputs =  Util.listListUnionOnTrue({inputs1, inputs2, inputs3}, Expression.expEqual);
        outputs = Util.listListUnionOnTrue({outputs1, outputs2}, Expression.expEqual);
      then
        (inputs,outputs);
    case(vars,DAE.STMT_ASSERT(cond = e1,msg=e2))
      equation
        inputs1 = BackendDAEUtil.statesAndVarsExp(e1,vars);
        inputs2 = BackendDAEUtil.statesAndVarsExp(e1,vars);
        inputs = Util.listListUnionOnTrue({inputs1, inputs2}, Expression.expEqual);
     then (inputs,{});
    case(vars, DAE.STMT_TERMINATE(msg = _)) then ({}, {});
    case(vars, DAE.STMT_REINIT(var = e as DAE.CREF(componentRef = _), value = e2))
      equation
        inputs = BackendDAEUtil.statesAndVarsExp(e2, vars);
      then
        (inputs, {});        
    case(vars, DAE.STMT_NORETCALL(exp = e))
      equation
        inputs = BackendDAEUtil.statesAndVarsExp(e, vars);
      then
        (inputs, {});
    case(vars, DAE.STMT_RETURN(_)) then ({}, {});
    // MetaModelica extension. KS  
    case(vars, DAE.STMT_FAILURE(body = statements))
      equation
        ((inputs,outputs)) = lowerAlgorithmInputsOutputs(vars,DAE.ALGORITHM_STMTS(statements));
      then (inputs,outputs);
     case(vars, DAE.STMT_TRY(tryBody = statements))
      equation
        ((inputs,outputs)) = lowerAlgorithmInputsOutputs(vars,DAE.ALGORITHM_STMTS(statements));
      then (inputs,outputs);
     case(vars, DAE.STMT_CATCH(catchBody = statements))
      equation
        ((inputs,outputs)) = lowerAlgorithmInputsOutputs(vars,DAE.ALGORITHM_STMTS(statements));
      then (inputs,outputs);    
     case(vars, DAE.STMT_CATCH(catchBody = statements))
      equation
        ((inputs,outputs)) = lowerAlgorithmInputsOutputs(vars,DAE.ALGORITHM_STMTS(statements));
      then (inputs,outputs);                    
    case(vars, DAE.STMT_THROW(source=_)) then ({}, {});
    case(_, _)
      equation
        Debug.fprintln("failtrace", "- BackendDAECreate.lowerStatementInputsOutputs failed\n");
      then 
        fail();
  end matchcontinue;
end lowerStatementInputsOutputs;

protected function lowerElseAlgorithmInputsOutputs
"Helper function to lowerStatementInputsOutputs"
  input BackendDAE.Variables vars;
  input Algorithm.Else elseBranch;
  output list<DAE.Exp> inputs;
  output list<DAE.Exp> outputs;
algorithm
  (inputs,outputs) := match (vars,elseBranch)
    local
      list<Algorithm.Statement> stmts;
      list<DAE.Exp> inputs1,inputs2,inputs3,outputs1,outputs2;
      DAE.Exp e;

    case(vars,DAE.NOELSE()) then ({},{});

    case(vars,DAE.ELSEIF(e,stmts,elseBranch))
      equation
        (inputs1, outputs1) = lowerElseAlgorithmInputsOutputs(vars,elseBranch);
        ((inputs2, outputs2)) = lowerAlgorithmInputsOutputs(vars,DAE.ALGORITHM_STMTS(stmts));
        inputs3 = BackendDAEUtil.statesAndVarsExp(e,vars);
        inputs = Util.listListUnionOnTrue({inputs1, inputs2, inputs3}, Expression.expEqual);
        outputs = Util.listUnionOnTrue(outputs1, outputs2, Expression.expEqual);
      then (inputs,outputs);

    case(vars,DAE.ELSE(stmts))
      equation
        ((inputs, outputs)) = lowerAlgorithmInputsOutputs(vars,DAE.ALGORITHM_STMTS(stmts));
      then (inputs,outputs);
  end match;
end lowerElseAlgorithmInputsOutputs;

/*
 *     other helping functions
 */


protected function states
"function: states
  Returns a BackendDAE.BinTree of all states in the DAE.
  This function is used by the lower function."
  input list<DAE.Element> inElems;
  input BackendDAE.BinTree inBinTree;
  output BackendDAE.BinTree outBinTree;
algorithm
  outBinTree:=
  matchcontinue (inElems,inBinTree)
    local
      BackendDAE.BinTree bt;

    case (inElems,bt)
      equation
        (_,bt) = DAEUtil.traverseDAE2(inElems,statesExp, bt);
      then
        bt;
    case (_,bt) then bt;
  end matchcontinue;
end states;

protected function statesExp
"function: statesExp
  Helper function to states."
  input tuple<DAE.Exp,BackendDAE.BinTree> itpl;
  output tuple<DAE.Exp,BackendDAE.BinTree> otpl;
algorithm
  otpl := matchcontinue itpl
    local
      DAE.Exp e;
      BackendDAE.BinTree bt;
    case ((e,bt)) then Expression.traverseExp(e,traversingstatesExpFinder,bt);
    case ((e,bt)) then ((e,bt));
  end matchcontinue;
end statesExp;

public function traversingstatesExpFinder "
helper for statesExp
"
  input tuple<DAE.Exp, BackendDAE.BinTree > inExp;
  output tuple<DAE.Exp, BackendDAE.BinTree > outExp;
algorithm outExp := matchcontinue(inExp)
  local
    DAE.ComponentRef cr;
    BackendDAE.BinTree bt;
    DAE.Exp e;
  case ((e as DAE.CALL(path = Absyn.IDENT(name = "der"),expLst = {DAE.CREF(componentRef = cr)}),bt))
    equation
      bt = BackendDAEUtil.treeAdd(bt, cr, 0);
    then
      ((e,bt));
  case(inExp) then inExp;
end matchcontinue;
end traversingstatesExpFinder;

protected function processDelayExpressions
"Assign each call to delay() with a unique id argument"
  input DAE.DAElist inDAE;
  input DAE.FunctionTree functionTree;
  output DAE.DAElist outDAE;
  output DAE.FunctionTree outTree;
algorithm
  (outDAE,outTree) := match(inDAE,functionTree)
    local
      DAE.DAElist dae;
    case (dae,functionTree)
      equation
        (dae,functionTree,_) = DAEUtil.traverseDAE(dae, functionTree, transformDelayExpressions, 0);
      then
        (dae,functionTree);
  end match;
end processDelayExpressions;

protected function transformDelayExpressions
"Helper for processDelayExpressions()"
  input tuple<DAE.Exp,Integer> itpl;
  output tuple<DAE.Exp,Integer> otpl;
protected
  DAE.Exp e;
  Integer i;
algorithm
  (e,i) := itpl;
  otpl := Expression.traverseExp(e, transformDelayExpression, i);
end transformDelayExpressions;

protected function transformDelayExpression
"Insert a unique index into the arguments of a delay() expression.
Repeat delay as maxDelay if not present."
  input tuple<DAE.Exp, Integer> inTuple;
  output tuple<DAE.Exp, Integer> outTuple;
algorithm
  outTuple := matchcontinue(inTuple)
    local
      DAE.Exp e, e1, e2, e3;
      Integer i;
      Boolean t, b;
      DAE.ExpType ty;
      DAE.InlineType it;
    case ((DAE.CALL(Absyn.IDENT("delay"), {e1, e2}, t, b, ty, it), i))
      then ((DAE.CALL(Absyn.IDENT("delay"), {DAE.ICONST(i), e1, e2, e2}, t, b, ty, it), i + 1));
    case ((DAE.CALL(Absyn.IDENT("delay"), {e1, e2, e3}, t, b, ty, it), i))
      then ((DAE.CALL(Absyn.IDENT("delay"), {DAE.ICONST(i), e1, e2, e3}, t, b, ty, it), i + 1));
    case ((e, i)) then ((e, i));
  end matchcontinue;
end transformDelayExpression;

protected function hasNoStates
"@author: adrpo
 this function tells if there are NO states in the binary tree"
  input BackendDAE.BinTree states;
  output Boolean out;
algorithm
  out := matchcontinue (states)
    // if the tree is empty then there are no states
    case (BackendDAE.TREENODE(NONE(),NONE(),NONE())) then true;
    case (_) then false;
  end matchcontinue;
end hasNoStates;

protected function addDummyState
"function: addDummyState
  In order for the solver to work correctly at least one state variable
  must exist in the equation system. This function therefore adds a
  dummy state variable and an equation for that variable.
  inputs:  (vars: Variables, eqns: BackendDAE.Equation list, bool)
  outputs: (Variables, BackendDAE.Equation list)"
  input BackendDAE.Variables inVariables;
  input list<BackendDAE.Equation> inEquationLst;
  input Boolean inBoolean;
  output BackendDAE.Variables outVariables;
  output list<BackendDAE.Equation> outEquationLst;
algorithm
  (outVariables,outEquationLst):=
  match (inVariables,inEquationLst,inBoolean)
    local
      BackendDAE.Variables v,vars_1,vars;
      list<BackendDAE.Equation> e,eqns;
      DAE.ComponentRef cref_;
      DAE.Exp exp;
      
    case (v,e,false) then (v,e);
    case (vars,eqns,true) /* TODO::The dummy variable must be fixed */
      equation
        cref_ = ComponentReference.makeCrefIdent("$dummy",DAE.ET_REAL(),{});
        vars_1 = BackendVariable.addVar(BackendDAE.VAR(cref_, BackendDAE.STATE(),DAE.BIDIR(),BackendDAE.REAL(),NONE(),NONE(),{},-1,
                            DAE.emptyElementSource,
                            SOME(DAE.VAR_ATTR_REAL(NONE(),NONE(),NONE(),(NONE(),NONE()),NONE(),SOME(DAE.BCONST(true)),NONE(),NONE(),NONE(),NONE(),NONE())),
                            NONE(),DAE.NON_CONNECTOR(),DAE.NON_STREAM()), vars);
        exp = Expression.crefExp(cref_);
      then
        /*
         * adrpo: after a bit of talk with Francesco Casella & Peter Aronsson we will add der($dummy) = 0;
         */
        (vars_1,(BackendDAE.EQUATION(DAE.CALL(Absyn.IDENT("der"),
                          {exp},false,true,DAE.ET_REAL(),DAE.NO_INLINE()),
                          DAE.RCONST(0.0), DAE.emptyElementSource)  :: eqns));

  end match;
end addDummyState;

protected function detectImplicitDiscrete
"function: detectImplicitDiscrete
  This function updates the variable kind to discrete
  for variables set in when equations."
  input BackendDAE.Variables inVariables;
  input list<BackendDAE.Equation> inEquationLst;
  output BackendDAE.Variables outVariables;
algorithm
  outVariables := matchcontinue (inVariables,inEquationLst)
    local
      BackendDAE.Variables v,v_1,v_2;
      DAE.ComponentRef cr;
      list<BackendDAE.Equation> xs;
      BackendDAE.Var var;
    case (v,{}) then v;
    case (v,(BackendDAE.WHEN_EQUATION(whenEquation = BackendDAE.WHEN_EQ(left = cr)) :: xs))
      equation
        ((var :: _),_) = BackendVariable.getVar(cr, v);
        var = BackendVariable.setVarKind(var,BackendDAE.DISCRETE());
        v_1 = BackendVariable.addVar(var, v);
        v_2 = detectImplicitDiscrete(v_1, xs);
      then
        v_2;
    case (v,(_ :: xs))
      equation
        v_1 = detectImplicitDiscrete(v, xs);
      then
        v_1;
  end matchcontinue;
end detectImplicitDiscrete;

protected function detectImplicitDiscreteAlgs
"function: detectImplicitDiscreteAlgs
  This function updates the variable kind to discrete
  for variables set in when equations."
  input BackendDAE.Variables inVariables;
  input BackendDAE.Variables inKnVariables;
  input list<DAE.Algorithm> inAlgsLst;
  output BackendDAE.Variables outVariables;
algorithm
  outVariables := matchcontinue (inVariables,inKnVariables,inAlgsLst)
    local
      BackendDAE.Variables v,v_1,v_2,knv;
      list<DAE.Statement> statementLst;
      list<DAE.Algorithm> xs;
    case (v,_,{}) then v;   
    case (v,knv,(DAE.ALGORITHM_STMTS(statementLst = statementLst) :: xs))
      equation
        v_1 = detectImplicitDiscreteAlgsStatemens(v,knv,statementLst,false);
        v_2 = detectImplicitDiscreteAlgs(v_1,knv, xs);
      then
        v_2;
    case (v,knv,(_ :: xs))
      equation
        v_1 = detectImplicitDiscreteAlgs(v,knv, xs);
      then
        v_1;
  end matchcontinue;
end detectImplicitDiscreteAlgs;

protected function detectImplicitDiscreteAlgsStatemens
"function: detectImplicitDiscreteAlgsStatemens
  This function updates the variable kind to discrete
  for variables set in when equations."
  input BackendDAE.Variables inVariables;
  input BackendDAE.Variables inKnVariables;
  input list<DAE.Statement> inStatementLst;
  input Boolean insideWhen "true if its called from a when statement";
  output BackendDAE.Variables outVariables;
algorithm
  outVariables := matchcontinue (inVariables,inKnVariables,inStatementLst,insideWhen)
    local
      BackendDAE.Variables v,v_1,v_2,v_3,knv;
      DAE.ComponentRef cr;
      list<DAE.Statement> xs,statementLst;
      BackendDAE.Var var;
      list<BackendDAE.Var> vars;
      DAE.Statement statement;
      Boolean b;
      DAE.ExpType tp;
      DAE.Ident iteratorName;
      DAE.Exp e,iteratorExp;
      list<DAE.Exp> iteratorexps;
    case (v,_,{},_) then v;
    case (v,knv,(DAE.STMT_ASSIGN(exp1 =DAE.CREF(componentRef = cr)) :: xs),true)
      equation
        ((var :: _),_) = BackendVariable.getVar(cr, v);
        var = BackendVariable.setVarKind(var,BackendDAE.DISCRETE());
        v_1 = BackendVariable.addVar(var, v);
        v_2 = detectImplicitDiscreteAlgsStatemens(v_1,knv, xs,true);
      then
        v_2; 
    case (v,knv,(DAE.STMT_ASSIGN_ARR(componentRef = cr) :: xs),true)
      equation
        (vars,_) = BackendVariable.getVar(cr, v);
        vars = Util.listMap1(vars,BackendVariable.setVarKind,BackendDAE.DISCRETE());
        v_1 = BackendVariable.addVars(vars,v);
        v_2 = detectImplicitDiscreteAlgsStatemens(v_1,knv, xs,true);
      then
        v_2; 
    case (v,knv,(DAE.STMT_IF(statementLst = statementLst) :: xs),true)
      equation
        v_1 = detectImplicitDiscreteAlgsStatemens(v,knv,statementLst,true);
        v_2 = detectImplicitDiscreteAlgsStatemens(v_1,knv, xs,true);
      then
        v_2;          
    case (v,knv,(DAE.STMT_FOR(type_= tp, iter = iteratorName, range = e,statementLst = statementLst) :: xs),true)
      equation
        /* use the range for the componentreferences */
        cr = ComponentReference.makeCrefIdent(iteratorName, tp, {});
        iteratorExp = Expression.crefExp(cr);   
        iteratorexps = extendRange(e,knv);
        v_1 = detectImplicitDiscreteAlgsStatemensFor(iteratorExp,iteratorexps,v,knv,statementLst,true);
        v_2 = detectImplicitDiscreteAlgsStatemens(v_1,knv, xs,true);
      then
        v_2; 
    case (v,knv,(DAE.STMT_WHEN(statementLst = statementLst,elseWhen = NONE()) :: xs),_)
      equation
        v_1 = detectImplicitDiscreteAlgsStatemens(v,knv,statementLst,true);
        v_2 = detectImplicitDiscreteAlgsStatemens(v_1,knv, xs,false);
      then
        v_2;
    case (v,knv,(DAE.STMT_WHEN(statementLst = statementLst,elseWhen = SOME(statement)) :: xs),_)
      equation
        v_1 = detectImplicitDiscreteAlgsStatemens(v,knv,statementLst,true);
        v_2 = detectImplicitDiscreteAlgsStatemens(v_1,knv,{statement},true);
        v_3 = detectImplicitDiscreteAlgsStatemens(v_2,knv, xs,false);
      then
        v_3;        
    case (v,knv,(_ :: xs),b)
      equation
        v_1 = detectImplicitDiscreteAlgsStatemens(v,knv, xs,b);
      then
        v_1;
  end matchcontinue;
end detectImplicitDiscreteAlgsStatemens;

protected function detectImplicitDiscreteAlgsStatemensFor
"function: detectImplicitDiscreteAlgsStatemensFor
  "
  input DAE.Exp inIteratorExp;
  input list<DAE.Exp> inExplst;
  input BackendDAE.Variables inVariables;
  input BackendDAE.Variables inKnVariables;
  input list<DAE.Statement> inStatementLst;
  input Boolean insideWhen "true if its called from a when statement";
  output BackendDAE.Variables outVariables;
algorithm
  outVariables := matchcontinue (inIteratorExp,inExplst,inVariables,inKnVariables,inStatementLst,insideWhen)
    local
      BackendDAE.Variables v,v_1,v_2,knv;
      list<DAE.Statement> statementLst,statementLst1;
      Boolean b;
      DAE.Exp e,ie;
      list<DAE.Exp> rest;
    case (_,{},v,_,_,_) then v;
    case (ie,e::rest,v,knv,statementLst,b)
      equation
        (statementLst1,_) = DAEUtil.traverseDAEEquationsStmts(statementLst,replaceExp,((ie,e)));
        v_1 = detectImplicitDiscreteAlgsStatemens(v,knv,statementLst1,true);
        v_2 = detectImplicitDiscreteAlgsStatemensFor(ie,rest,v_1,knv,statementLst,b);
      then
        v_2;
    case (_,_,_,_,_,_)
      equation
        print("BackendDAECreate.detectImplicitDiscreteAlgsStatemensFor failed \n");
      then
        fail();
  end matchcontinue;
end detectImplicitDiscreteAlgsStatemensFor;

protected function replaceExp
"Help function to e.g. detectImplicitDiscreteAlgsStatemensFor"
  input tuple<DAE.Exp,tuple<DAE.Exp,DAE.Exp>> tpl;
  output tuple<DAE.Exp,tuple<DAE.Exp,DAE.Exp>> outTpl;
algorithm
  outTpl := matchcontinue(tpl)
    local
      DAE.Exp e,e1,s,t;
    case((e,(s,t))) equation
      (e1,_) = Expression.replaceExp(e,s,t);
    then ((e1,(s,t)));
    case tpl then tpl;
  end matchcontinue;
end replaceExp;

protected function extendRange
"function: extendRange
  "
  input DAE.Exp rangeExp;
  input BackendDAE.Variables inKnVariables;  
  output list<DAE.Exp> outExpLst;
algorithm
  outExpLst:=
  matchcontinue (rangeExp,inKnVariables)
    local 
      list<DAE.Exp> explst;
      DAE.ExpType tp;
      DAE.Exp startvalue,stopvalue,stepvalue;
      Option<DAE.Exp> stepvalueopt;
      BackendDAE.Variables knv;
      Integer istart,istop,istep;
      list<Integer> ilst;
    case (DAE.RANGE(ty=tp,exp=startvalue,expOption=stepvalueopt,range=stopvalue),knv)
      equation
        stepvalue = Util.getOptionOrDefault(stepvalueopt,DAE.ICONST(1));
        istart = expInt(startvalue,knv);
        istep = expInt(stepvalue,knv);
        istop = expInt(stopvalue,knv);
        ilst = Util.listIntRange3(istart,istop,istep);
        explst = Util.listMap(ilst,Expression.makeIntegerExp);
      then
        explst;
    case (_,_)
      equation
        print("BackendDAECreate.extendRange failed \n");
      then
        fail();
  end matchcontinue;
end extendRange;

protected function expInt "returns the int value of an expression"
  input DAE.Exp exp;
  input BackendDAE.Variables inKnVariables;  
  output Integer i;
algorithm
  i := match(exp,inKnVariables)
 local 
   Integer i2;
   DAE.ComponentRef cr;
   BackendDAE.Variables knv;
   DAE.Exp e;
    case (DAE.ICONST(integer = i2),_) then i2;
    case (DAE.ENUM_LITERAL(index = i2),_) then i2;
    case (DAE.CREF(componentRef=cr),knv)
      equation
        ((BackendDAE.VAR(bindExp=SOME(e)):: _),_) = BackendVariable.getVar(cr, knv); 
        i2 = expInt(e,knv);  
      then
        i2;
  end match;
end expInt;

protected function sortEqn
"function: sortEqn
  This function sorts the equation. It puts first the algebraic eqns
  and last the differentiated eqns"
  input list<BackendDAE.Equation> inEquationLst;
  output list<BackendDAE.Equation> outEquationLst;
algorithm
  outEquationLst:=
  matchcontinue (inEquationLst)
    local list<BackendDAE.Equation> algEqns,diffEqns,res,eqns,resArrayEqns;
    case (eqns)
      equation
        (algEqns,diffEqns,resArrayEqns) = extractAlgebraicAndDifferentialEqn(eqns);
        res = Util.listFlatten({algEqns, diffEqns,resArrayEqns});
      then
        res;
    case (eqns)
      equation
        print("BackendDAECreate.sort_eqn failed \n");
      then
        fail();
  end matchcontinue;
end sortEqn;

protected function extractAlgebraicAndDifferentialEqn
"function: extractAlgebraicAndDifferentialEqn

  Splits the equation list into two lists. One that only contain differential
  equations and one that only contain algebraic equations."
  input list<BackendDAE.Equation> inEquationLst;
  output list<BackendDAE.Equation> outEquationLst1;
  output list<BackendDAE.Equation> outEquationLst2;
  output list<BackendDAE.Equation> outEquationLst3;
algorithm
  (outEquationLst1,outEquationLst2,outEquationLst3):= matchcontinue (inEquationLst)
    local
      list<BackendDAE.Equation> resAlgEqn,resDiffEqn,rest,resArrayEqns;
      BackendDAE.Equation eqn,alg;
      DAE.Exp exp1,exp2;
      BackendDAE.Value indx;
      list<DAE.Exp> expl;
    case ({}) then ({},{},{});  /* algebraic equations differential equations */
    case (((eqn as BackendDAE.EQUATION(exp = exp1,scalar = exp2)) :: rest)) /* scalar equation */
      equation
        true = isAlgebraic(exp1);
        true = isAlgebraic(exp2);
        (resAlgEqn,resDiffEqn,resArrayEqns) = extractAlgebraicAndDifferentialEqn(rest);
      then
        ((eqn :: resAlgEqn),resDiffEqn,resArrayEqns);
    case (((eqn as BackendDAE.COMPLEX_EQUATION(lhs = exp1,rhs = exp2)) :: rest)) /* complex equation */
      equation
        true = isAlgebraic(exp1);
        true = isAlgebraic(exp2);
        (resAlgEqn,resDiffEqn,resArrayEqns) = extractAlgebraicAndDifferentialEqn(rest);
      then
        ((eqn :: resAlgEqn),resDiffEqn,resArrayEqns);
    case (((eqn as BackendDAE.ARRAY_EQUATION(index = indx,crefOrDerCref = expl)) :: rest)) /* array equation */
      equation
        // fails if not all call results are true
        true = Util.listMapAllValue(expl, isAlgebraic, true);
        (resAlgEqn,resDiffEqn,resArrayEqns) = extractAlgebraicAndDifferentialEqn(rest);
      then
        (resAlgEqn,resDiffEqn,(eqn :: resArrayEqns));
    case (((eqn as BackendDAE.EQUATION(exp = exp1,scalar = exp2)) :: rest))
      equation
        (resAlgEqn,resDiffEqn,resArrayEqns) = extractAlgebraicAndDifferentialEqn(rest);
      then
        (resAlgEqn,(eqn :: resDiffEqn),resArrayEqns);
    case (((eqn as BackendDAE.COMPLEX_EQUATION(lhs = exp1,rhs = exp2)) :: rest))
      equation
        (resAlgEqn,resDiffEqn,resArrayEqns) = extractAlgebraicAndDifferentialEqn(rest);
      then
        (resAlgEqn,(eqn :: resDiffEqn),resArrayEqns);
    case (((eqn as BackendDAE.ARRAY_EQUATION(index = _)) :: rest))
      equation
        (resAlgEqn,resDiffEqn,resArrayEqns) = extractAlgebraicAndDifferentialEqn(rest);
      then
        (resAlgEqn,(eqn :: resDiffEqn),resArrayEqns);
    case ((alg :: rest))
      equation
        (resAlgEqn,resDiffEqn,resArrayEqns) = extractAlgebraicAndDifferentialEqn(rest) "Put algorithms in algebraic equations" ;
      then
        ((alg :: resAlgEqn),resDiffEqn,resArrayEqns);
  end matchcontinue;
end extractAlgebraicAndDifferentialEqn;

public function isAlgebraic "function: isDiscreteExp
  This function returns true if an expression is purely algebraic, i.e. not
  containing any derivatives
  Otherwise it returns false.
"
  input DAE.Exp inExp;
  output Boolean outBoolean;
algorithm
  outBoolean := match(inExp)
    local 
      Boolean b;
  case(inExp)
    equation
      ((_,b)) = Expression.traverseExpTopDown(inExp, traversingisAlgebraicFinder, true);
      then
        b;
  end match;
end isAlgebraic;

protected function traversingisAlgebraicFinder "function: traversingisAlgebraicFinder
Author: Frenkel TUD 2010-11
Helper for isAlgebraic"
  input tuple<DAE.Exp, Boolean> inTpl;
  output tuple<DAE.Exp, Boolean, Boolean> outTpl;
algorithm
  outTpl:=
  matchcontinue (inTpl)
    local
      DAE.Exp e;
      Boolean b;
    case ((e as DAE.CALL(path = Absyn.IDENT(name = "der")),_)) then ((e,false,false));
    case ((e,b)) then ((e,b,b));
  end matchcontinue;
end traversingisAlgebraicFinder;

protected function expandDerOperator
"function expandDerOperator
  expands der(expr) using Derive.differentiteExpTime.
  This can not be done in Static, since we need all time-
  dependent variables, which is only available in BackendDAE."
  input BackendDAE.Variables vars;
  input list<BackendDAE.Equation> eqns;
  input list<BackendDAE.Equation> ieqns;
  input list<BackendDAE.MultiDimEquation> aeqns;
  input list<DAE.Algorithm> algs;
  input DAE.FunctionTree functions;

  output list<BackendDAE.Equation> outEqns;
  output list<BackendDAE.Equation> outIeqns;
  output list<BackendDAE.MultiDimEquation> outAeqns;
  output list<DAE.Algorithm> outAlgs;
  output BackendDAE.Variables outVars;
algorithm
  (outEqns, outIeqns,outAeqns,outAlgs,outVars) := match(vars,eqns,ieqns,aeqns,algs,functions)
    case(vars,eqns,ieqns,aeqns,algs,functions)
      equation
        (eqns,(vars,_)) = BackendEquation.traverseBackendDAEExpsEqnList(eqns,traverserexpandDerExp,(vars,functions));
        (ieqns,(vars,_)) = BackendEquation.traverseBackendDAEExpsEqnList(ieqns,traverserexpandDerExp,(vars,functions));
        (aeqns,(vars,_)) = expandDerOperatorArrEqns(aeqns,(vars,functions));
        (algs,(vars,_)) = expandDerOperatorAlgs(algs,(vars,functions));
      then(eqns,ieqns,aeqns,algs,vars);
  end match;
end expandDerOperator;

protected function expandDerOperatorAlgs
"Help function to expandDerOperator"
  input list<DAE.Algorithm> algs;
  input tuple<BackendDAE.Variables,DAE.FunctionTree> vars;
  output list<DAE.Algorithm> outAlgs;
  output tuple<BackendDAE.Variables,DAE.FunctionTree> outVars;
algorithm
  (outAlgs,outVars) := matchcontinue(algs,vars)
    local
      DAE.Algorithm a;
    case({},vars) then ({},vars);
    case(a::algs,vars)
      equation
        (a,vars) = expandDerOperatorAlg(a,vars);
        (algs,vars)  = expandDerOperatorAlgs(algs,vars);
      then (a::algs,vars);

    case (_,_)
      equation
        Debug.fprint("failtrace", "-BackendDAECreate.expandDerOperatorAlgs failed\n");
      then fail();

  end matchcontinue;
end expandDerOperatorAlgs;

protected function expandDerOperatorAlg
"Help function to to expandDerOperator, handles Algorithms"
  input DAE.Algorithm alg;
  input tuple<BackendDAE.Variables,DAE.FunctionTree> vars;
  output DAE.Algorithm outAlg;
  output tuple<BackendDAE.Variables,DAE.FunctionTree> outVars;
algorithm
  (outAlg,outVars) := match(alg,vars)
    local
      list<Algorithm.Statement> stmts;
    case(DAE.ALGORITHM_STMTS(stmts),vars)
      equation
        (stmts,vars) = DAEUtil.traverseDAEEquationsStmts(stmts,traverserexpandDerExp,vars);
      then (DAE.ALGORITHM_STMTS(stmts),vars);
  end match;
end expandDerOperatorAlg;

protected function expandDerOperatorArrEqns
"Help function to expandDerOperator"
  input list<BackendDAE.MultiDimEquation> eqns;
  input tuple<BackendDAE.Variables,DAE.FunctionTree> vars;
  output list<BackendDAE.MultiDimEquation> outEqns;
  output tuple<BackendDAE.Variables,DAE.FunctionTree> outVars;
algorithm
  (outEqns,outVars) := matchcontinue(eqns,vars)
    local
      BackendDAE.MultiDimEquation e;
    case({},vars) then ({},vars);
    case(e::eqns,vars)
      equation
        (e,vars) = expandDerOperatorArrEqn(e,vars);
        (eqns,vars)  = expandDerOperatorArrEqns(eqns,vars);
      then (e::eqns,vars);

    else
      equation
        Debug.fprint("failtrace", "-BackendDAECreate.expandDerOperatorArrEqns failed\n");
      then fail();
  end matchcontinue;
end expandDerOperatorArrEqns;

protected function expandDerOperatorArrEqn
"Help function to to expandDerOperator, handles Array equations"
  input BackendDAE.MultiDimEquation arrEqn;
  input tuple<BackendDAE.Variables,DAE.FunctionTree> vars;
  output BackendDAE.MultiDimEquation outArrEqn;
  output tuple<BackendDAE.Variables,DAE.FunctionTree> outVars;
algorithm
  (outArrEqn,outVars) := match (arrEqn,vars)
    local
      list<Integer> dims; DAE.Exp e1,e2;
      DAE.ElementSource source "the element source";

    case(BackendDAE.MULTIDIM_EQUATION(dims,e1,e2,source),vars) equation
      ((e1,vars)) = traverserexpandDerExp((e1,vars));
      ((e2,vars)) = traverserexpandDerExp((e2,vars));
    then (BackendDAE.MULTIDIM_EQUATION(dims,e1,e2,source),vars);
  end match;
end expandDerOperatorArrEqn;

protected function traverserexpandDerExp
  "Help function to e.g. traverserexpandDerExp"
  input tuple<DAE.Exp,tuple<BackendDAE.Variables,DAE.FunctionTree>> tpl;
  output tuple<DAE.Exp,tuple<BackendDAE.Variables,DAE.FunctionTree>> outTpl;
algorithm
  outTpl := match (tpl)
    local 
      DAE.Exp e,e1;
      tuple<BackendDAE.Variables,DAE.FunctionTree> ext_arg, ext_art1;
    case((e,ext_arg))
      equation
        ((e1,ext_art1)) = Expression.traverseExp(e,expandDerExp,ext_arg);
      then ((e1,ext_art1));
  end match;
end traverserexpandDerExp;

protected function expandDerExp
"Help function to e.g. expandDerOperatorEqn"
  input tuple<DAE.Exp,tuple<BackendDAE.Variables,DAE.FunctionTree>> tpl;
  output tuple<DAE.Exp,tuple<BackendDAE.Variables,DAE.FunctionTree>> outTpl;
algorithm
  outTpl := matchcontinue(tpl)
    local
      BackendDAE.Variables vars;
      BackendDAE.BinTree bt;
      DAE.FunctionTree funcs;
      DAE.Exp e1;
      list<DAE.ComponentRef> newStates;
    case((DAE.CALL(Absyn.IDENT(name = "der"),{e1},tuple_ = false,builtin = true),(vars,funcs))) equation
      e1 = Derive.differentiateExpTime(e1,(vars,funcs));
      e1 = ExpressionSimplify.simplify(e1);
      ((_,bt)) = statesExp((e1,BackendDAE.emptyBintree));
      (newStates,_) = BackendDAEUtil.bintreeToList(bt);
      vars = updateStatesVars(vars,newStates);
    then ((e1,(vars,funcs)));
    case tpl then tpl;
  end matchcontinue;
end expandDerExp;

protected function updateStatesVars
"Help function to expandDerExp"
  input BackendDAE.Variables vars;
  input list<DAE.ComponentRef> newStates;
  output BackendDAE.Variables outVars;
algorithm
  outVars := matchcontinue(vars,newStates)
    local
      DAE.ComponentRef cr;
      BackendDAE.Var var;

    case(vars,{}) then vars;
    case(vars,cr::newStates)
      equation
        ((var :: _),_) = BackendVariable.getVar(cr, vars);
        var = BackendVariable.setVarKind(var,BackendDAE.STATE());
        vars = BackendVariable.addVar(var, vars);
        vars = updateStatesVars(vars,newStates);
      then vars;
    case(vars,cr::newStates)
      equation
        print("Internal error, variable ");print(ComponentReference.printComponentRefStr(cr));print("not found in variables.\n");
        vars = updateStatesVars(vars,newStates);
      then vars;
  end matchcontinue;
end updateStatesVars;


protected function zeroCrossingEquations
"Returns the list of equations (indices) from a ZeroCrossing"
  input BackendDAE.ZeroCrossing zc;
  output list<Integer> lst;
algorithm
  lst := match (zc)
    case(BackendDAE.ZERO_CROSSING(_,lst,_)) then lst;
  end match;
end zeroCrossingEquations;

protected function mergeZeroCrossings
"function: mergeZeroCrossings
  Takes a list of zero crossings and if more than one have identical
  function expressions they are merged into one zerocrossing.
  In the resulting list all zerocrossing have uniq function expressions."
  input list<BackendDAE.ZeroCrossing> inZeroCrossingLst;
  output list<BackendDAE.ZeroCrossing> outZeroCrossingLst;
algorithm
  outZeroCrossingLst:=
  matchcontinue (inZeroCrossingLst)
    local
      BackendDAE.ZeroCrossing zc,same_1;
      list<BackendDAE.ZeroCrossing> samezc,diff,diff_1,xs;
    case {} then {};
    case {zc} then {zc};
    case (zc :: xs)
      equation
        samezc = Util.listSelect1(xs, zc, sameZeroCrossing);
        diff = Util.listSelect1(xs, zc, differentZeroCrossing);
        diff_1 = mergeZeroCrossings(diff);
        same_1 = Util.listFold(samezc, mergeZeroCrossing, zc);
      then
        (same_1 :: diff_1);
  end matchcontinue;
end mergeZeroCrossings;

protected function mergeZeroCrossing "function: mergeZeroCrossing

  Merges two zero crossings into one by makeing the union of the lists of
  equaions and when clauses they appear in.
  modified: 2011-01 by wbraun
  merge to ZeroCrosssing with the lowest index 
"
  input BackendDAE.ZeroCrossing inZeroCrossing1;
  input BackendDAE.ZeroCrossing inZeroCrossing2;
  output BackendDAE.ZeroCrossing outZeroCrossing;
algorithm
  outZeroCrossing:=
  matchcontinue (inZeroCrossing1,inZeroCrossing2)
    local
      list<BackendDAE.Value> eq,wc,eq1,wc1,eq2,wc2;
      DAE.Exp e1,e2;
      Integer index1,index2;
      String s1,s2;
    case (BackendDAE.ZERO_CROSSING(relation_ = e1 as DAE.RELATION(index=index1),occurEquLst = eq1,occurWhenLst = wc1),BackendDAE.ZERO_CROSSING(relation_ = e2 as DAE.RELATION(index=index2),occurEquLst = eq2,occurWhenLst = wc2))
      equation
        true = intLt(index1,index2);
        eq = Util.listUnion(eq1, eq2);
        wc = Util.listUnion(wc1, wc2);
      then
        BackendDAE.ZERO_CROSSING(e1,eq,wc);
    case (BackendDAE.ZERO_CROSSING(relation_ = e1 as DAE.RELATION(index=index1),occurEquLst = eq1,occurWhenLst = wc1),BackendDAE.ZERO_CROSSING(relation_ = e2 as DAE.RELATION(index=index2),occurEquLst = eq2,occurWhenLst = wc2))
      equation
        eq = Util.listUnion(eq1, eq2);
        wc = Util.listUnion(wc1, wc2);
      then BackendDAE.ZERO_CROSSING(e2,eq,wc);
    case (BackendDAE.ZERO_CROSSING(relation_ = e1 as DAE.RELATION(index=index1),occurEquLst = eq1,occurWhenLst = wc1),BackendDAE.ZERO_CROSSING(relation_ = e2 as DAE.RELATION(index=index2),occurEquLst = eq2,occurWhenLst = wc2))
      equation
        true = RTOpts.debugFlag("failtrace");
        Debug.fprintln("failtrace", "- BackendDAECreate.mergeZeroCrossing failed!");
      then
        fail();
  end matchcontinue;
end mergeZeroCrossing;

protected function sameZeroCrossing "function: sameZeroCrossing

  Returns true if both zero crossings have the same function expression
"
  input BackendDAE.ZeroCrossing inZeroCrossing1;
  input BackendDAE.ZeroCrossing inZeroCrossing2;
  output Boolean outBoolean;
algorithm
  outBoolean := match (inZeroCrossing1,inZeroCrossing2)
    local
      Boolean res;
      DAE.Exp e1,e2;
    case (BackendDAE.ZERO_CROSSING(relation_ = e1),BackendDAE.ZERO_CROSSING(relation_ = e2))
      equation
        res = Expression.expEqual(e1, e2);
      then res;
  end match;
end sameZeroCrossing;

protected function differentZeroCrossing "function: differentZeroCrossing

  Return true if the realation expressions differ.
"
  input BackendDAE.ZeroCrossing zc1;
  input BackendDAE.ZeroCrossing zc2;
  output Boolean res_1;
protected
  Boolean res;
algorithm
  res := sameZeroCrossing(zc1, zc2);
  res_1 := boolNot(res);
end differentZeroCrossing;

public function findZeroCrossings "function: findZeroCrossings

  This function finds all zerocrossings in the list of equations and
  the list of when clauses. Used in lower2.
"
  input BackendDAE.Variables vars;
  input BackendDAE.Variables knvars;
  input list<BackendDAE.Equation> eq;
  input list<BackendDAE.MultiDimEquation> multiDimEqs;
  input list<BackendDAE.WhenClause> wc;
  input list<DAE.Algorithm> algs;
  output list<BackendDAE.ZeroCrossing> res_1;
  output list<BackendDAE.Equation> outEquationLst;
  output list<BackendDAE.MultiDimEquation> outMultiDimEqs;
  output list<BackendDAE.WhenClause> outWhenClauseLst;
  output list<DAE.Algorithm> outAlgs;
algorithm
  (res_1,outEquationLst,outMultiDimEqs,outWhenClauseLst,outAlgs) := findZeroCrossings2(vars, knvars,eq,multiDimEqs,0, wc, 0, algs,0,{},0);
end findZeroCrossings;

protected function findZeroCrossings2 "function: findZeroCrossings2

  Helper function to find_zero_crossing.
  modified: 2011-01 by wbraun
"
  input BackendDAE.Variables inVariables1;
  input BackendDAE.Variables knvars;
  input list<BackendDAE.Equation> inEquationLst2;
  input list<BackendDAE.MultiDimEquation> inMultiDimEqs;
  input Integer inInteger3;
  input list<BackendDAE.WhenClause> inWhenClauseLst4;
  input Integer inInteger5;
  input list<DAE.Algorithm> inAlgorithm;
  input Integer inIndex;
  input list<BackendDAE.ZeroCrossing> inZeroCrossingLst;
  input Integer inInteger7;
  
  output list<BackendDAE.ZeroCrossing> outZeroCrossingLst;
  output list<BackendDAE.Equation> outEquationLst;
  output list<BackendDAE.MultiDimEquation> outMultiDimEqs;
  output list<BackendDAE.WhenClause> outWhenClauseLst;
  output list<DAE.Algorithm> outAlgs;
algorithm
  (outZeroCrossingLst, outEquationLst, outMultiDimEqs, outWhenClauseLst, outAlgs) :=
  matchcontinue (inVariables1,knvars,inEquationLst2,inMultiDimEqs,inInteger3,inWhenClauseLst4,inInteger5,inAlgorithm,inIndex,inZeroCrossingLst,inInteger7)
    local
      BackendDAE.Variables v;
      list<DAE.Exp> rellst1,rellst2,rel;
      list<BackendDAE.ZeroCrossing> zcs,zcs1,res,res1;
      BackendDAE.MultiDimEquation mdeq;
      list<BackendDAE.MultiDimEquation> mdeqs,mdeqs_res1,mdeqs_res2;
      BackendDAE.Value eq_count_1,eq_count,wc_count_1,wc_count;
      BackendDAE.Equation e,eq_res1,eq_res2;
      list<BackendDAE.Equation> eq_reslst;
      DAE.Exp e1,e2, eres1, eres2;
      list<BackendDAE.Equation> xs,el;
      BackendDAE.WhenClause wc;
      list<BackendDAE.WhenClause> wc_reslst;
      Integer ind;
      DAE.ElementSource source "the element source";
      list<DAE.Statement> stmts,stmts_1;
      DAE.Exp daeExp;
      list<BackendDAE.WhenClause> xsWhen;
      DAE.ComponentRef cref;
      DAE.ElementSource source_;
      list<BackendDAE.WhenOperator> whenOperations;
      list<DAE.Algorithm> algs,algs_res;
      Option<Integer> elseClause_;
      Integer index_;
      Integer countZC, alg_indx;
      list<Integer> dimsize;
      
    case (_,_,{},mdeqs,_,{},_,{},_,res,_) then (res,{},mdeqs,{},{});
    
    // all algorithm stmts are processed firstly
    case (v,knvars,el,mdeqs,eq_count,xsWhen,wc_count,(DAE.ALGORITHM_STMTS(stmts)::algs),countZC,zcs,alg_indx)
      equation
        ((stmts_1,(_,_,_,(res,countZC),(_,_,_,_)))) = traverseStmtsExps(stmts, collectZCAlgs, (DAE.RCONST(0.0),{},DAE.RCONST(0.0),(zcs,countZC),(alg_indx,v,knvars,el)),knvars);
        alg_indx = alg_indx + 1;
        (res1,eq_reslst,mdeqs_res1,wc_reslst,algs_res) = findZeroCrossings2(v, knvars,el,mdeqs,eq_count, xsWhen, wc_count,algs,countZC,res,alg_indx);
      then
        (res1,eq_reslst,mdeqs_res1,wc_reslst,DAE.ALGORITHM_STMTS(stmts_1)::algs_res);
    
    // then all when clauses are processed 
    case (v,knvars,el,mdeqs,eq_count,((wc as BackendDAE.WHEN_CLAUSE(condition = daeExp,reinitStmtLst=whenOperations , elseClause = elseClause_ )) :: xsWhen),wc_count,{},countZC,zcs,_)
      equation
        wc_count = wc_count + 1;
        (eres1,countZC,res) = findZeroCrossings3(daeExp,zcs,countZC,-1,wc_count,v,knvars);
        (res1,eq_reslst,mdeqs_res1,wc_reslst,algs) = findZeroCrossings2(v, knvars,el,mdeqs,eq_count, xsWhen, wc_count,{},countZC,res,0);
      then
        (res1,eq_reslst,mdeqs_res1,BackendDAE.WHEN_CLAUSE(eres1,whenOperations,elseClause_)::wc_reslst,algs);
      
    // after all algorithms and when clauses are processed, all equations are processed 
    case (v,knvars,((e as BackendDAE.EQUATION(exp = e1,scalar = e2, source= source_)) :: xs),mdeqs,eq_count,{},_,{},countZC,zcs,_)
      equation
        eq_count = eq_count + 1;
        (eres1,countZC,zcs1) = findZeroCrossings3(e1,zcs,countZC,eq_count,-1,v,knvars);
        (eres2,countZC,res) = findZeroCrossings3(e2,zcs1,countZC,eq_count,-1,v,knvars);
        (res1,eq_reslst,mdeqs_res1,wc_reslst,algs) = findZeroCrossings2(v, knvars,xs,mdeqs,eq_count, {}, 0,{},countZC,res,0);
      then
        (res1,BackendDAE.EQUATION(eres1,eres2,source_)::eq_reslst,mdeqs_res1,wc_reslst,algs);
    case (v,knvars,((e as BackendDAE.COMPLEX_EQUATION(index= index_,lhs = e1,rhs = e2, source= source_)) :: xs),mdeqs,eq_count,{},_,{},countZC,zcs,_)
      equation
        eq_count = eq_count + 1;
        (eres1,countZC,zcs1) = findZeroCrossings3(e1,zcs,countZC,eq_count,-1,v,knvars);
        (eres2,countZC,res) = findZeroCrossings3(e2,zcs1,countZC,eq_count,-1,v,knvars);
        (res1,eq_reslst,mdeqs_res1,wc_reslst,algs) = findZeroCrossings2(v, knvars,xs,mdeqs,eq_count, {}, 0,{},countZC,res,0);
      then
        (res1,BackendDAE.COMPLEX_EQUATION(index_,eres1,eres2,source_)::eq_reslst,mdeqs_res1,wc_reslst,algs);
    case (v,knvars,((e as BackendDAE.ARRAY_EQUATION(index = ind)) :: xs),mdeqs,eq_count,{},_,{},countZC,zcs,_)
      equation
        // Find the correct multidim equation from the index
        BackendDAE.MULTIDIM_EQUATION(dimSize=dimsize,left=e1,right=e2,source=source) = listNth(mdeqs,ind);
        eq_count = eq_count + 1;
        (eres1,countZC,zcs1) = findZeroCrossings3(e1,zcs,countZC,eq_count,-1,v,knvars);
        (eres2,countZC,res) = findZeroCrossings3(e2,zcs1,countZC,eq_count,-1,v,knvars);
        mdeq = BackendDAE.MULTIDIM_EQUATION(dimsize,eres1,eres2,source);
        mdeqs = Util.listReplaceAt(mdeq,ind,mdeqs);
        (res1,eq_reslst,mdeqs_res1,wc_reslst,algs) = findZeroCrossings2(v, knvars,xs,mdeqs,eq_count, {}, 0,{},countZC,res,0);
      then
        (res1,e::eq_reslst,mdeqs_res1,wc_reslst,algs);
    case (v,knvars,((e as BackendDAE.SOLVED_EQUATION(componentRef = cref,exp = e1,source= source_)) :: xs),mdeqs,eq_count,{},_,{},countZC,zcs,_)
      equation
        eq_count_1 = eq_count + 1;
        (eres1,countZC,res) = findZeroCrossings3(e1,zcs,countZC,eq_count,-1,v,knvars);
        (res1,eq_reslst,mdeqs_res1,wc_reslst,algs) = findZeroCrossings2(v, knvars,xs,mdeqs,eq_count, {}, 0,{},countZC,res,0);
      then
        (res1,BackendDAE.SOLVED_EQUATION(cref,eres1,source_)::eq_reslst,mdeqs_res1,wc_reslst,algs);
    case (v,knvars,((e as BackendDAE.RESIDUAL_EQUATION(exp = e1,source= source_)) :: xs),mdeqs,eq_count,{},_,{},countZC,zcs,_)
      equation
        eq_count = eq_count + 1;
        (eres1,countZC,res) = findZeroCrossings3(e1,zcs,countZC,eq_count,-1,v,knvars);
        (res1,eq_reslst,mdeqs_res1,wc_reslst,algs) = findZeroCrossings2(v, knvars,xs,mdeqs,eq_count, {}, 0,{},countZC,res,0);
      then
        (res1,BackendDAE.RESIDUAL_EQUATION(eres1,source_)::eq_reslst,mdeqs_res1,wc_reslst,algs);
        
    // let when equation pass they are discrete and can't contain ZeroCrossings 
    case (v,knvars,(e :: xs),mdeqs,eq_count,{},_,{},countZC,res,_)
      equation
        eq_count = eq_count + 1;
        (res1,eq_reslst,mdeqs_res1,wc_reslst,algs) = findZeroCrossings2(v, knvars,xs,mdeqs,eq_count, {}, 0,{},countZC,res,0);
      then
        (res1,e::eq_reslst,mdeqs_res1,wc_reslst,algs);
   end matchcontinue;
end findZeroCrossings2;

protected function findZeroCrossings3
"function: findZeroCrossings3
  Helper function to findZeroCrossing."
  input DAE.Exp e;
  input list<BackendDAE.ZeroCrossing> inZeroCrossings;
  input Integer incountZC;
  input Integer counteq;
  input Integer countwc;
  input BackendDAE.Variables vars;
  input BackendDAE.Variables knvars;
  output DAE.Exp eres;
  output Integer outcountZC;
  output list<BackendDAE.ZeroCrossing> outZeroCrossings;
algorithm
  ((eres,((outZeroCrossings,outcountZC),(_,_,_,_)))) := Expression.traverseExpTopDown(e, collectZC, ((inZeroCrossings,incountZC),(counteq,countwc,vars,knvars)));
end findZeroCrossings3;

protected function collectZC "function: collectZeroCrossings

  Collects zero crossings in equations
  modified: 2011-01 by wbraun
"
  input tuple<DAE.Exp, tuple<tuple<list<BackendDAE.ZeroCrossing>,Integer>, tuple<Integer,Integer,BackendDAE.Variables,BackendDAE.Variables>>> inTplExpExpTplExpExpLstVariables;
  output tuple<DAE.Exp,  Boolean, tuple<tuple<list<BackendDAE.ZeroCrossing>,Integer>, tuple<Integer,Integer,BackendDAE.Variables,BackendDAE.Variables>>> outTplExpExpTplExpExpLstVariables;
algorithm
  outTplExpExpTplExpExpLstVariables:=
  matchcontinue (inTplExpExpTplExpExpLstVariables)
    local
      DAE.Exp e,e1,e2,e_1,eres;
      BackendDAE.Variables vars,knvars;
      list<BackendDAE.ZeroCrossing> zeroCrossings,zc;
      DAE.Operator op;
      Integer indx,eq_count,wc_count,itmp;
      list<Integer> eqs;
      String s1;
      
    case (((e as DAE.CALL(path = Absyn.IDENT(name = "noEvent"))),((zeroCrossings,indx),(eq_count,wc_count,vars,knvars))))
    then ((e,false,((zeroCrossings,indx),(eq_count,wc_count,vars,knvars))));
    case (((e as DAE.CALL(path = Absyn.IDENT(name = "sample"))),((zeroCrossings,indx),(eq_count,wc_count,vars,knvars))))
      equation
        zc = makeZeroCrossings({e}, {eq_count}, {wc_count});
        zc = listAppend(zeroCrossings, zc);
        zc = mergeZeroCrossings(zc);
        indx = indx + (listLength(zc) - listLength(zeroCrossings));  
      then ((e,true,((zc,indx),(eq_count,wc_count,vars,knvars))));
    // function with discrete expressions generate no zerocrossing
    case (((e as DAE.RELATION(exp1 = e1,operator = op,exp2 = e2)),((zeroCrossings,indx),(eq_count,wc_count,vars,knvars)))) 
      equation
        true = BackendDAEUtil.isDiscreteExp(e1, vars,knvars);
        true = BackendDAEUtil.isDiscreteExp(e2, vars,knvars);
      then
        ((e,true,((zeroCrossings,indx),(eq_count,wc_count,vars,knvars))));
    // All other functions generate zerocrossing.
    case (((e as DAE.RELATION(exp1 = e1,operator = op,exp2 = e2)),((zeroCrossings,indx),(eq_count,wc_count,vars,knvars))))
      equation
        e_1 = DAE.RELATION(e1,op,e2,indx,NONE());
        zc = makeZeroCrossings({e_1}, {eq_count}, {wc_count});
        zc = listAppend(zeroCrossings, zc);
        zc = mergeZeroCrossings(zc);
        itmp = (listLength(zc)-listLength(zeroCrossings));
        eres = Util.if_((itmp>0),e_1,e);
        indx = indx + itmp;
      then ((eres,true,((zc,indx),(eq_count,wc_count,vars,knvars))));  
    case ((e,((zeroCrossings,indx),(eq_count,wc_count,vars,knvars)))) then ((e,true,((zeroCrossings,indx),(eq_count,wc_count,vars,knvars))));
  end matchcontinue;
end collectZC;


protected function collectZCAlgs "function: collectZeroCrossings

  Collects zero crossings in algorithms stamts, beside for loops those are
  processed by collectZCAlgsFor
  
  modified: 2011-01 by wbraun 
"
  input tuple<DAE.Exp, tuple<DAE.Exp, list<DAE.Exp>,DAE.Exp, tuple<list<BackendDAE.ZeroCrossing>,Integer>, tuple<Integer,BackendDAE.Variables,BackendDAE.Variables,list<BackendDAE.Equation>>>> inTplExpExpTplExpExpLstVariables;
  output tuple<DAE.Exp, Boolean, tuple<DAE.Exp, list<DAE.Exp>, DAE.Exp, tuple<list<BackendDAE.ZeroCrossing>,Integer>, tuple<Integer,BackendDAE.Variables,BackendDAE.Variables,list<BackendDAE.Equation>>>> outTplExpExpTplExpExpLstVariables;
algorithm
  outTplExpExpTplExpExpLstVariables:=
  matchcontinue (inTplExpExpTplExpExpLstVariables)
    local
      DAE.Exp e,e1,e2,e_1,eres,iterator,range;
      list<DAE.Exp> le;
      list<DAE.Statement> stmts;
      BackendDAE.Variables vars,knvars;
      list<BackendDAE.Equation> eqns;
      list<BackendDAE.ZeroCrossing> zeroCrossings,zc;
      DAE.Operator op;
      Integer indx,alg_indx,itmp;
      list<Integer> eqs;
      String s1;
      
    case (((e as DAE.CALL(path = Absyn.IDENT(name = "noEvent"))),(iterator,le,range,(zeroCrossings,indx),(alg_indx,vars,knvars,eqns))))
    then ((e,false,(iterator,le,range,(zeroCrossings,indx),(alg_indx,vars,knvars,eqns))));
    case (((e as DAE.CALL(path = Absyn.IDENT(name = "sample"))),(iterator,le,range,(zeroCrossings,indx),(alg_indx,vars,knvars,eqns))))
      equation
        eqs = BackendEquation.equationAlgorithmEqnsNr(eqns,alg_indx,0);
        zc = makeZeroCrossings({e}, eqs, {});
        zc = listAppend(zeroCrossings, zc);
        zc = mergeZeroCrossings(zc);
        indx = indx + (listLength(zc) - listLength(zeroCrossings));
      then ((e,true,(iterator,le,range,(zc,indx),(alg_indx,vars,knvars,eqns))));
    // function with discrete expressions generate no zerocrossing
    case (((e as DAE.RELATION(exp1 = e1,operator = op,exp2 = e2)),(iterator,le,range,(zeroCrossings,indx),(alg_indx,vars,knvars,eqns)))) 
      equation
        true = BackendDAEUtil.isDiscreteExp(e1, vars,knvars);
        true = BackendDAEUtil.isDiscreteExp(e2, vars,knvars);
      then ((e,true,(iterator,le,range,(zeroCrossings,indx),(alg_indx,vars,knvars,eqns))));
    // All other functions generate zerocrossing.
    case (((e as DAE.RELATION(exp1 = e1,operator = op,exp2 = e2)),(iterator,le,range,(zeroCrossings,indx),(alg_indx,vars,knvars,eqns))))
      equation
        e_1 = DAE.RELATION(e1,op,e2,indx,NONE());  
        eqs = BackendEquation.equationAlgorithmEqnsNr(eqns,alg_indx,0);
        zc = makeZeroCrossings({e_1}, eqs, {});
        zc = listAppend(zeroCrossings, zc);
        zc = mergeZeroCrossings(zc);
        itmp = (listLength(zc)-listLength(zeroCrossings));
        eres = Util.if_((itmp>0),e_1,e);
        indx = indx + itmp;
      then ((eres,true,(iterator,le,range,(zc,indx),(alg_indx,vars,knvars,eqns))));
    case ((e,(iterator,le,range,(zeroCrossings,indx),(alg_indx,vars,knvars,eqns)))) then ((e,true,(iterator,le,range,(zeroCrossings,indx),(alg_indx,vars,knvars,eqns))));
  end matchcontinue;
end collectZCAlgs;

protected function traverseStmtsExps "function: traverseStmtExps
  Handles the traversing of list<DAE.Statement>.
  Works with the help of Expression.traverseExpTopDown to find 
  ZeroCrossings in algorithm statements
  modified: 2011-01 by wbraun"
  input list<DAE.Statement> inStmts;
  input FuncExpType func;
  input tuple<DAE.Exp, list<DAE.Exp>, DAE.Exp, tuple<list<BackendDAE.ZeroCrossing>,Integer>, tuple<Integer,BackendDAE.Variables,BackendDAE.Variables,list<BackendDAE.Equation>>> extraArg;
  input BackendDAE.Variables knvars;
  output tuple<list<DAE.Statement>, tuple<DAE.Exp, list<DAE.Exp>, DAE.Exp, tuple<list<BackendDAE.ZeroCrossing>,Integer>, tuple<Integer,BackendDAE.Variables,BackendDAE.Variables,list<BackendDAE.Equation>>>> outTplStmtTypeA;
  partial function FuncExpType 
    input tuple<DAE.Exp,tuple<DAE.Exp, list<DAE.Exp>, DAE.Exp, tuple<list<BackendDAE.ZeroCrossing>,Integer>, tuple<Integer,BackendDAE.Variables,BackendDAE.Variables,list<BackendDAE.Equation>>>> arg; 
    output tuple<DAE.Exp, Boolean, tuple<DAE.Exp, list<DAE.Exp>, DAE.Exp, tuple<list<BackendDAE.ZeroCrossing>,Integer>, tuple<Integer,BackendDAE.Variables,BackendDAE.Variables,list<BackendDAE.Equation>>>> oarg; 
  end FuncExpType;
algorithm
  (outTplStmtTypeA) := match(inStmts,func,extraArg,knvars)
    local
      DAE.Exp e_1,e_2,e,e2,iteratorExp;
      Integer le;
      list<DAE.Exp> expl1,expl2,iteratorexps;
      DAE.ComponentRef cr_1,cr;
      list<DAE.Statement> xs_1,xs,stmts,stmts2;
      DAE.ExpType tp,tt;
      DAE.Statement x,ew,ew_1;
      Boolean b1;
      String id1,str;
      list<Integer> li;
      DAE.ElementSource source;
      Algorithm.Else algElse;
      Absyn.Path fnName;
      Absyn.MatchType matchType;
      DAE.Pattern pattern;
      
      BackendDAE.Variables vars,knvars;
      
    case ({},_,extraArg,knvars) then (({},extraArg));
      
    case ((DAE.STMT_ASSIGN(type_ = tp,exp1 = e2,exp = e, source = source) :: xs),func, extraArg, knvars)
      equation
        ((e_1,extraArg)) = Expression.traverseExpTopDown(e, func, extraArg);
        ((e_2,extraArg)) = Expression.traverseExpTopDown(e2, func, extraArg);
        ((xs_1,extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((DAE.STMT_ASSIGN(tp,e_2,e_1,source) :: xs_1,extraArg));
        
    case ((DAE.STMT_TUPLE_ASSIGN(type_ = tp,expExpLst = expl1, exp = e, source = source) :: xs),func, extraArg, knvars)
      equation
        ((e_1,extraArg)) = Expression.traverseExpTopDown(e, func, extraArg);
        ((expl2, extraArg)) = Expression.traverseExpListTopDown(expl1,func,extraArg);
        ((xs_1, extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((DAE.STMT_TUPLE_ASSIGN(tp,expl2,e_1,source) :: xs_1,extraArg));
        
    case ((DAE.STMT_ASSIGN_ARR(type_ = tp,componentRef = cr, exp = e, source = source) :: xs),func, extraArg, knvars)
      equation
        ((e_1,extraArg)) = Expression.traverseExpTopDown(e, func, extraArg);
        ((e_2 as DAE.CREF(cr_1,_),_, extraArg)) = func((Expression.crefExp(cr), extraArg));
        ((xs_1, extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((DAE.STMT_ASSIGN_ARR(tp,cr_1,e_1,source) :: xs_1,extraArg));
        
    case (((x as DAE.STMT_ASSIGN_ARR(type_ = tp,componentRef = cr, exp = e, source = source)) :: xs),func, extraArg, knvars)
      equation
        ((e_1,extraArg)) = Expression.traverseExpTopDown(e, func, extraArg);
        failure(((DAE.CREF(_,_),_,_)) = func((Expression.crefExp(cr), extraArg)));
        true = RTOpts.debugFlag("failtrace");
        print(DAEDump.ppStatementStr(x));
        print("Warning, not allowed to set the componentRef to a expression in BackendDAECreate.traverseStmtsExps for ZeroCrosssing\n");  
        ((xs_1, extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((DAE.STMT_ASSIGN_ARR(tp,cr,e_1,source) :: xs_1,extraArg));
        
    case (((x as DAE.STMT_IF(exp=e,statementLst=stmts,else_ = algElse, source = source)) :: xs), func, extraArg, knvars)
      equation
        ((algElse,extraArg)) = traverseStmtsElseExps(algElse, func, extraArg, knvars);
        ((stmts2,extraArg)) = traverseStmtsExps(stmts, func, extraArg, knvars);
        ((e_1,extraArg)) = Expression.traverseExpTopDown(e, func, extraArg);
        ((xs_1,extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((DAE.STMT_IF(e_1,stmts2,algElse,source) :: xs_1,extraArg));
        
    case (((x as DAE.STMT_FOR(type_=tp,iterIsArray=b1,iter=id1,range=e,statementLst=stmts, source = source)) :: xs),func, extraArg, knvars)
      equation
        cr = ComponentReference.makeCrefIdent(id1, tp, {});
        iteratorExp = Expression.crefExp(cr);
        iteratorexps = extendRange(e,knvars);
        ((stmts2, extraArg)) = traverseStmtsForExps(iteratorExp, iteratorexps,e, stmts, knvars, func, extraArg);
        ((xs_1, extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((DAE.STMT_FOR(tp,b1,id1,e,stmts2,source) :: xs_1,extraArg));
        
    case (((x as DAE.STMT_WHILE(exp = e,statementLst=stmts, source = source)) :: xs),func, extraArg, knvars)
      equation
        ((stmts2, extraArg)) = traverseStmtsExps(stmts,func, extraArg, knvars);
        ((e_1,extraArg)) = Expression.traverseExpTopDown(e, func, extraArg);
        ((xs_1, extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((DAE.STMT_WHILE(e_1,stmts2,source) :: xs_1,extraArg));
        
    case (((x as DAE.STMT_WHEN(exp = e,statementLst=stmts,elseWhen=NONE(),helpVarIndices=li, source = source)) :: xs),func, extraArg, knvars)
      equation
        ((stmts2, extraArg)) = traverseStmtsExps(stmts,func, extraArg, knvars);
        ((e_1,extraArg)) = Expression.traverseExpTopDown(e, func, extraArg);
        ((xs_1, extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((DAE.STMT_WHEN(e_1,stmts2,NONE(),li,source) :: xs_1,extraArg));
        
    case (((x as DAE.STMT_WHEN(exp = e,statementLst=stmts,elseWhen=SOME(ew),helpVarIndices=li, source = source)) :: xs),func, extraArg, knvars)
      equation
        (({ew_1}, extraArg)) = traverseStmtsExps({ew},func, extraArg, knvars);
        ((stmts2, extraArg)) = traverseStmtsExps(stmts,func, extraArg, knvars);
        ((e_1,extraArg)) = Expression.traverseExpTopDown(e, func, extraArg);
        ((xs_1, extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((DAE.STMT_WHEN(e_1,stmts2,SOME(ew),li,source) :: xs_1,extraArg));
        
    case (((x as DAE.STMT_ASSERT(cond = e, msg=e2, source = source)) :: xs),func, extraArg, knvars)
      equation
        ((xs_1, extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((x :: xs_1,extraArg));
        
    case (((x as DAE.STMT_TERMINATE(msg = e, source = source)) :: xs),func, extraArg, knvars)
      equation
        ((xs_1, extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((x :: xs_1,extraArg));
        
    case (((x as DAE.STMT_REINIT(var = e,value=e2, source = source)) :: xs),func, extraArg, knvars)
      equation
        ((xs_1, extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((x :: xs_1,extraArg));
        
    case (((x as DAE.STMT_NORETCALL(exp = e, source = source)) :: xs),func, extraArg, knvars)
      equation
        ((e_1,extraArg)) = Expression.traverseExpTopDown(e, func, extraArg);
        ((xs_1, extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((DAE.STMT_NORETCALL(e_1,source) :: xs_1,extraArg));
        
    case (((x as DAE.STMT_RETURN(source = source)) :: xs),func, extraArg, knvars)
      equation
        ((xs_1, extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((x :: xs_1,extraArg));
        
    case (((x as DAE.STMT_BREAK(source = source)) :: xs),func, extraArg, knvars)
      equation
        ((xs_1, extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((x :: xs_1,extraArg));
        
        // MetaModelica extension. KS
    case (((x as DAE.STMT_FAILURE(body=stmts, source = source)) :: xs),func, extraArg, knvars)
      equation
        ((stmts2, extraArg)) = traverseStmtsExps(stmts,func, extraArg, knvars);
        ((xs_1, extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((DAE.STMT_FAILURE(stmts2,source) :: xs_1,extraArg));
        
    case (((x as DAE.STMT_TRY(tryBody=stmts, source = source)) :: xs),func, extraArg, knvars)
      equation
        ((stmts2, extraArg)) = traverseStmtsExps(stmts,func, extraArg, knvars);
        ((xs_1, extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((DAE.STMT_TRY(stmts2,source) :: xs_1,extraArg));
        
    case (((x as DAE.STMT_CATCH(catchBody=stmts, source = source)) :: xs),func, extraArg, knvars)
      equation
        ((stmts2, extraArg)) = traverseStmtsExps(stmts,func, extraArg, knvars);
        ((xs_1, extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((DAE.STMT_CATCH(stmts2,source) :: xs_1,extraArg));
        
    case (((x as DAE.STMT_THROW(source = source)) :: xs),func, extraArg, knvars)
      equation
        ((xs_1, extraArg)) = traverseStmtsExps(xs, func, extraArg, knvars);
      then ((x :: xs_1,extraArg));
        
    case ((x :: xs),func, extraArg, knvars)
      equation
        str = DAEDump.ppStatementStr(x);
        str = "Algorithm.traverseStmtsExps not implemented correctly: " +& str;
        Error.addMessage(Error.INTERNAL_ERROR, {str});
      then fail();
  end match;
end traverseStmtsExps;

protected function traverseStmtsElseExps "
Author: BZ, 2008-12
Helper function for traverseStmtsExps
to find ZeroCrosssings in algorithm Else statements
modified: 2011-01 by wbraun"
  input Algorithm.Else inElse;
  input FuncExpType func;
  input tuple<DAE.Exp, list<DAE.Exp>, DAE.Exp, tuple<list<BackendDAE.ZeroCrossing>,Integer>, tuple<Integer,BackendDAE.Variables,BackendDAE.Variables,list<BackendDAE.Equation>>> extraArg;
  input BackendDAE.Variables knvars;
  output tuple<Algorithm.Else, tuple<DAE.Exp, list<DAE.Exp>, DAE.Exp, tuple<list<BackendDAE.ZeroCrossing>,Integer>, tuple<Integer,BackendDAE.Variables,BackendDAE.Variables,list<BackendDAE.Equation>>>> outTplStmtTypeA;
  partial function FuncExpType 
    input tuple<DAE.Exp,tuple<DAE.Exp, list<DAE.Exp>, DAE.Exp, tuple<list<BackendDAE.ZeroCrossing>,Integer>, tuple<Integer,BackendDAE.Variables,BackendDAE.Variables,list<BackendDAE.Equation>>>> arg; 
    output tuple<DAE.Exp,Boolean, tuple<DAE.Exp, list<DAE.Exp>, DAE.Exp, tuple<list<BackendDAE.ZeroCrossing>,Integer>, tuple<Integer,BackendDAE.Variables,BackendDAE.Variables,list<BackendDAE.Equation>>>> oarg;
  end FuncExpType;
algorithm
  outTplStmtTypeA := matchcontinue(inElse,func,extraArg,knvars)
    local
      DAE.Exp e,e_1;
      list<DAE.Statement> st,st_1;
      Algorithm.Else el,el_1;
    case(DAE.NOELSE(),_,extraArg,knvars) then ((DAE.NOELSE(),extraArg));
    case(DAE.ELSEIF(e,st,el),func,extraArg,knvars)
      equation
        ((el_1,extraArg)) = traverseStmtsElseExps(el,func,extraArg,knvars);
        ((st_1,extraArg)) = traverseStmtsExps(st,func,extraArg,knvars);
        ((e_1,extraArg)) = Expression.traverseExpTopDown(e, func, extraArg);
      then ((DAE.ELSEIF(e_1,st_1,el_1),extraArg));
    case(DAE.ELSE(st),func,extraArg,knvars)
      equation
        ((st_1,extraArg)) = traverseStmtsExps(st,func,extraArg,knvars);
      then ((DAE.ELSE(st_1),extraArg));
  end matchcontinue;
end traverseStmtsElseExps;


protected function collectZCAlgsFor "function: collectZeroCrossings

  Collects zero crossings in for loops  
  added: 2011-01 by wbraun 
"
  input tuple<DAE.Exp, tuple<DAE.Exp, list<DAE.Exp>, DAE.Exp, tuple<list<BackendDAE.ZeroCrossing>,Integer>, tuple<Integer,BackendDAE.Variables,BackendDAE.Variables,list<BackendDAE.Equation>>>> inTplExpExpTplExpExpLstVariables;
  output tuple<DAE.Exp, Boolean, tuple<DAE.Exp, list<DAE.Exp>, DAE.Exp, tuple<list<BackendDAE.ZeroCrossing>,Integer>, tuple<Integer,BackendDAE.Variables,BackendDAE.Variables,list<BackendDAE.Equation>>>> outTplExpExpTplExpExpLstVariables;
algorithm
  outTplExpExpTplExpExpLstVariables:=
  matchcontinue (inTplExpExpTplExpExpLstVariables)
    local
      DAE.Exp e,e1,e2,e_1,eres, iterator, iterator1, range;
      list<DAE.Exp> inExpLst,explst;
      BackendDAE.Variables vars,knvars;
      list<BackendDAE.ZeroCrossing> zeroCrossings,zc;
      DAE.Operator op;
      Integer indx,alg_indx,itmp;
      list<Integer> eqs;
      list<BackendDAE.Equation> eqns;
      list<DAE.Statement> stmts;
      Boolean b1,b2;
      String s1;
      DAE.Exp startvalue,stepvalue;
      Option<DAE.Exp> stepvalueopt;
      Integer istart,istep;
    case (((e as DAE.CALL(path = Absyn.IDENT(name = "noEvent"))),(iterator,inExpLst,range,(zeroCrossings,indx),(alg_indx,vars,knvars,eqns))))
    then ((e,false,(iterator,inExpLst,range,(zeroCrossings,indx),(alg_indx,vars,knvars,eqns))));
    case (((e as DAE.CALL(path = Absyn.IDENT(name = "sample"))),(iterator,inExpLst,range,(zeroCrossings,indx),(alg_indx,vars,knvars,eqns))))
      equation
        eqs = BackendEquation.equationAlgorithmEqnsNr(eqns,alg_indx,0);
        zc = makeZeroCrossings({e}, eqs, {});
        zc = listAppend(zeroCrossings, zc);
        zc = mergeZeroCrossings(zc);
        indx = indx + (listLength(zc) - listLength(zeroCrossings));  
      then ((e,true,(iterator,inExpLst,range,(zc,indx),(alg_indx,vars,knvars,eqns))));
    // function with discrete expressions generate no zerocrossing.
    case (((e as DAE.RELATION(exp1 = e1,operator = op,exp2 = e2)),(iterator,inExpLst,range,(zeroCrossings,indx),(alg_indx,vars,knvars,eqns)))) 
      equation
        true = BackendDAEUtil.isDiscreteExp(e1, vars,knvars);
        true = BackendDAEUtil.isDiscreteExp(e2, vars,knvars);
      then ((e,true,(iterator,inExpLst,range,(zeroCrossings,indx),(alg_indx,vars,knvars,eqns))));
    // All other functions generate zerocrossing.
    case (((e as DAE.RELATION(exp1 = e1,operator = op,exp2 = e2)),(iterator,inExpLst,range as DAE.RANGE(exp=startvalue,expOption=stepvalueopt),(zeroCrossings,indx),(alg_indx,vars,knvars,eqns))))
      equation
        b1 = Expression.expContains(e1,iterator);
        b2 = Expression.expContains(e2,iterator);
        true = Util.boolOrList({b1,b2});
        stepvalue = Util.getOptionOrDefault(stepvalueopt,DAE.ICONST(1));
        istart = expInt(startvalue,knvars);
        istep = expInt(stepvalue,knvars);
        e_1 = DAE.RELATION(e1,op,e2,indx,SOME((iterator,istart,istep)));
        (explst,indx) = replaceIteratorwithStaticValues(e,iterator,inExpLst,indx); 
        eqs = BackendEquation.equationAlgorithmEqnsNr(eqns,alg_indx,0);
        zc = makeZeroCrossings(explst, eqs, {});
        zc = listAppend(zeroCrossings, zc);
        zc = mergeZeroCrossings(zc);
        itmp = (listLength(zc)-listLength(zeroCrossings));
        eres = Util.if_((itmp>0),e_1,e); 
      then ((eres,true,(iterator,inExpLst,range,(zc,indx),(alg_indx,vars,knvars,eqns))));
    // All other functions generate zerocrossing.  
    case (((e as DAE.RELATION(exp1 = e1,operator = op,exp2 = e2)),(iterator,inExpLst,range,(zeroCrossings,indx),(alg_indx,vars,knvars,eqns))))
      equation
        b1 = Expression.expContains(e1,iterator);
        b2 = Expression.expContains(e2,iterator);
        false = Util.boolOrList({b1,b2});
        e_1 = DAE.RELATION(e1,op,e2,indx,NONE());
        eqs = BackendEquation.equationAlgorithmEqnsNr(eqns,alg_indx,0);
        zc = makeZeroCrossings({e_1}, eqs, {});
        zc = listAppend(zeroCrossings, zc);
        zc = mergeZeroCrossings(zc);
        itmp = (listLength(zc)-listLength(zeroCrossings));
        indx = indx + itmp;
        eres = Util.if_((itmp>0),e_1,e);
      then ((eres,true,(iterator,inExpLst,range,(zc,indx),(alg_indx,vars,knvars,eqns))));     
    case ((e,(iterator,inExpLst,range,(zeroCrossings,indx),(alg_indx,vars,knvars,eqns)))) then ((e,true,(iterator,inExpLst,range,(zeroCrossings,indx),(alg_indx,vars,knvars,eqns))));
  end matchcontinue;
end collectZCAlgsFor;


protected function replaceIteratorwithStaticValues
" Helper function for collectZCAlgFor "
  input DAE.Exp inExp;
  input DAE.Exp inIterator;
  input list<DAE.Exp> inExpLst;
  input Integer inIndex;
  output list<DAE.Exp> outZeroCrossings;
  output Integer outIndex;
algorithm 
  (outZeroCrossings,outIndex) := matchcontinue(inExp,inIterator,inExpLst,inIndex)
    local
      DAE.Exp e,e1,e2,i,exp,res1,e_1;
      DAE.Operator op;
      list<DAE.Exp> rest,res2;
      Integer index;
    case (_,_,{},inIndex) then ({},inIndex);
    case (exp as DAE.RELATION(exp1 = e1,operator = op,exp2 = e2),i,e::rest,index) 
      equation
        e_1 = DAE.RELATION(e1,op,e2,index,NONE());
        ((res1,(_,_))) = replaceExp((e_1,(i,e)));
        (res2,index) = replaceIteratorwithStaticValues(exp,i,rest,index+1);
        res2 = listAppend({res1},res2);
      then (res2,index);
    case (_,_,_,_)
      equation
        print("BackendDAECreate.replaceIteratorwithStaticValues failed \n");
      then
        fail();
  end matchcontinue;
end replaceIteratorwithStaticValues;


protected function traverseStmtsForExps
"Helper function for traverseStmtsExps
 to processed for loops to search ZeroCrosssings 
 modified: 2011-01 by wbraun"
  input DAE.Exp inIteratorExp;
  input list<DAE.Exp> inExplst;
  input DAE.Exp inRange;
  input list<DAE.Statement> inStmts;
  input BackendDAE.Variables knvars;
  input FuncExpType func;
  input tuple<DAE.Exp, list<DAE.Exp>, DAE.Exp,tuple<list<BackendDAE.ZeroCrossing>,Integer>, tuple<Integer,BackendDAE.Variables,BackendDAE.Variables,list<BackendDAE.Equation>>> extraArg;
  output tuple<list<DAE.Statement>, tuple<DAE.Exp, list<DAE.Exp>, DAE.Exp, tuple<list<BackendDAE.ZeroCrossing>,Integer>, tuple<Integer,BackendDAE.Variables,BackendDAE.Variables,list<BackendDAE.Equation>>>> outTplStmtTypeA;
  partial function FuncExpType 
    input tuple<DAE.Exp, tuple<DAE.Exp, list<DAE.Exp>, DAE.Exp,tuple<list<BackendDAE.ZeroCrossing>,Integer>, tuple<Integer,BackendDAE.Variables,BackendDAE.Variables,list<BackendDAE.Equation>>>> arg; 
    output tuple<DAE.Exp, Boolean, tuple<DAE.Exp, list<DAE.Exp>, DAE.Exp,tuple<list<BackendDAE.ZeroCrossing>,Integer>, tuple<Integer,BackendDAE.Variables,BackendDAE.Variables,list<BackendDAE.Equation>>>> oarg;
  end FuncExpType;
algorithm
  outTplStmtTypeA := matchcontinue (inIteratorExp,inExplst,inRange,inStmts,knvars,func,extraArg)
    local
      list<DAE.Statement> statementLst,statementLst1,statementLst2,statementLst3,statementLst4;
      DAE.Exp e,ie,range;
      Integer le;
      list<DAE.Exp> inExplst;
      BackendDAE.Variables v,kn;
      list<BackendDAE.Equation> eq,eqn;
      list<BackendDAE.ZeroCrossing> zcl,zcs;
      Integer idx,alg_idx;
      String s1;
    case (_,{},_,statementLst,knvars,_,extraArg) then ((statementLst,extraArg));
    case (ie,inExplst,range,statementLst,knvars,func,(_,_,_,(zcs,idx),(alg_idx,v,kn,eqn)))
      equation
        ((statementLst, extraArg )) = traverseStmtsExps(statementLst, collectZCAlgsFor, (ie,inExplst,range,(zcs,idx),(alg_idx,v,kn,eqn)), knvars);
      then
        ((statementLst ,extraArg));
    case (_,_,_,_,_,_,_)
      equation
        print("BackendDAECreate.traverseAlgStmtsFor failed \n");
      then
        fail();
  end matchcontinue;
end traverseStmtsForExps;


public function zeroCrossingsEquations
"Returns a list of all equations (by their index) that contain a zero crossing
 Used e.g. to find out which discrete equations are not part of a zero crossing"
  input BackendDAE.BackendDAE dae;
  output list<Integer> eqns;
algorithm
  eqns := match (dae)
    local
      list<BackendDAE.ZeroCrossing> zcLst;
      list<list<Integer>> zcEqns;
      list<Integer> wcEqns;
      BackendDAE.EquationArray eqnArr;  
    case (BackendDAE.DAE(eventInfo=BackendDAE.EVENT_INFO(zeroCrossingLst = zcLst),orderedEqs=eqnArr)) 
      equation
        zcEqns = Util.listMap(zcLst,zeroCrossingEquations);
        wcEqns = whenEquationsIndices(eqnArr);
        eqns = Util.listListUnion(listAppend(zcEqns,{wcEqns}));
      then eqns;
  end match;
end zeroCrossingsEquations;

protected function makeZeroCrossing
"function: makeZeroCrossing
  Constructs a BackendDAE.ZeroCrossing from an expression and lists of equation indices
  and when clause indices."
  input DAE.Exp inExp1;
  input list<Integer> eq_ind;
  input list<Integer> wc_ind;
  output BackendDAE.ZeroCrossing outZeroCrossing;
algorithm
  outZeroCrossing := BackendDAE.ZERO_CROSSING(inExp1,eq_ind,wc_ind);
end makeZeroCrossing;

protected function makeZeroCrossings
"function: makeZeroCrossings
  Constructs a list of ZeroCrossings from a list expressions
  and lists of equation indices and when clause indices.
  Each Zerocrossing gets the same lists of indicies."
  input list<DAE.Exp> inExpExpLst1;
  input list<Integer> inIntegerLst2;
  input list<Integer> inIntegerLst3;
  output list<BackendDAE.ZeroCrossing> outZeroCrossingLst;
algorithm
  outZeroCrossingLst := match (inExpExpLst1,inIntegerLst2,inIntegerLst3)
    local
      BackendDAE.ZeroCrossing res;
      list<BackendDAE.ZeroCrossing> resx;
      DAE.Exp e;
      list<DAE.Exp> xs;
      list<BackendDAE.Value> eq_ind,wc_ind;
      String s1;
    case ({},_,_) then {};
    case ((e :: xs),{-1},wc_ind)
      equation
        resx = makeZeroCrossings(xs, {}, wc_ind);
        res = makeZeroCrossing(e, {}, wc_ind);
      then
        (res :: resx);
    case ((e :: xs),eq_ind,{-1})
      equation
        resx = makeZeroCrossings(xs, eq_ind, {});
        res = makeZeroCrossing(e, eq_ind, {});
      then
        (res :: resx);  
    case ((e :: xs),eq_ind,wc_ind)
      equation
        resx = makeZeroCrossings(xs, eq_ind, wc_ind);
        res = makeZeroCrossing(e, eq_ind, wc_ind);
      then
        (res :: resx);
  end match;
end makeZeroCrossings;

protected function makeWhenClauses
"function: makeWhenClauses
  Constructs a list of identical BackendDAE.WhenClause elements
  Arg1: Number of elements to construct
  Arg2: condition expression of the when clause
  outputs: (WhenClause list)"
  input Integer n           "Number of copies to make.";
  input DAE.Exp inCondition "the condition expression";
  input list<BackendDAE.WhenOperator> inReinitStatementLst;
  output list<BackendDAE.WhenClause> outWhenClauseLst;
algorithm
  outWhenClauseLst:=
  matchcontinue (n,inCondition,inReinitStatementLst)
    local
      BackendDAE.Value i_1,i;
      list<BackendDAE.WhenClause> res;
      DAE.Exp cond;
      list<BackendDAE.WhenOperator> reinit;

    case (0,_,_) then {};
    case (i,cond,reinit)
      equation
        i_1 = i - 1;
        res = makeWhenClauses(i_1, cond, reinit);
      then
        (BackendDAE.WHEN_CLAUSE(cond,reinit,NONE()) :: res);
  end matchcontinue;
end makeWhenClauses;

protected function mergeClauses
"function mergeClauses
   merges the true part end the elsewhen part of a set of when equations.
   For each equation in trueEqnList, find an equation in elseEqnList solving
   the same variable and put it in the else elseWhenPart of the first equation."
  input list<BackendDAE.Equation> trueEqnList "List of equations in the true part of the when clause.";
  input list<BackendDAE.Equation> elseEqnList "List of equations in the elsewhen part of the when clause.";
  input list<BackendDAE.WhenClause> trueClauses "List of when clauses from the true part.";
  input list<BackendDAE.WhenClause> elseClauses "List of when clauses from the elsewhen part.";
  input Integer nextWhenClauseIndex  "Next available when clause index.";
  output list<BackendDAE.Equation> outEquationLst;
  output Integer outWhenClauseIndex;
  output list<BackendDAE.WhenClause> outWhenClauseLst;
algorithm
  (outEquationLst,outWhenClauseIndex,outWhenClauseLst) :=
  matchcontinue (trueEqnList, elseEqnList, trueClauses, elseClauses, nextWhenClauseIndex)
    local
      DAE.ComponentRef cr;
      DAE.Exp rightSide;
      Integer ind;
      BackendDAE.Equation res;
      list<BackendDAE.Equation> trueEqns;
      list<BackendDAE.Equation> elseEqns;
      list<BackendDAE.WhenClause> trueCls;
      list<BackendDAE.WhenClause> elseCls;
      Integer nextInd;
      list<BackendDAE.Equation> resRest;
      Integer outNextIndex;
      list<BackendDAE.WhenClause> outClauseList;
      BackendDAE.WhenEquation foundEquation;
      list<BackendDAE.Equation> elseEqnsRest;
      DAE.ElementSource source "the element source";

    case (BackendDAE.WHEN_EQUATION(BackendDAE.WHEN_EQ(index = ind,left = cr,right=rightSide),source)::trueEqns, elseEqns,trueCls,elseCls,nextInd)
      equation
        (foundEquation, elseEqnsRest) = getWhenEquationFromVariable(cr,elseEqns);
        res = BackendDAE.WHEN_EQUATION(BackendDAE.WHEN_EQ(ind,cr,rightSide,SOME(foundEquation)),source);
        (resRest, outNextIndex, outClauseList) = mergeClauses(trueEqns,elseEqnsRest,trueCls, elseCls,nextInd);
      then (res::resRest, outNextIndex, outClauseList);

    case ({},{},trueCls,elseCls,nextInd) then ({},nextInd,listAppend(trueCls,elseCls));

    else
      equation
        Error.addMessage(Error.INTERNAL_ERROR, {"BackendDAECreate.mergeClauses: Error in mergeClauses."});
      then fail();
  end matchcontinue;
end mergeClauses;

protected function getWhenEquationFromVariable
"Finds the when equation solving the variable given by inCr among equations in inEquations
 the found equation is then taken out of the list."
  input DAE.ComponentRef inCr;
  input list<BackendDAE.Equation> inEquations;
  output BackendDAE.WhenEquation outEquation;
  output list<BackendDAE.Equation> outEquations;
algorithm
  (outEquation, outEquations) := matchcontinue(inCr,inEquations)
    local
      DAE.ComponentRef cr1,cr2;
      BackendDAE.WhenEquation eq;
      BackendDAE.Equation eq2;
      list<BackendDAE.Equation> rest, rest2;

    case (cr1,BackendDAE.WHEN_EQUATION(eq as BackendDAE.WHEN_EQ(left=cr2),_)::rest)
      equation
        true = ComponentReference.crefEqualNoStringCompare(cr1,cr2);
      then (eq, rest);

    case (cr1,(eq2 as BackendDAE.WHEN_EQUATION(BackendDAE.WHEN_EQ(left=cr2),_))::rest)
      equation
        false = ComponentReference.crefEqualNoStringCompare(cr1,cr2);
        (eq,rest2) = getWhenEquationFromVariable(cr1,rest);
      then (eq, eq2::rest2);

    case (_,{})
      equation
        Error.addMessage(Error.DIFFERENT_VARIABLES_SOLVED_IN_ELSEWHEN, {});
      then
        fail();
  end matchcontinue;
end getWhenEquationFromVariable;

protected function extendRecordEqns "
Author: Frenkel TUD 2010-05"
  input BackendDAE.Equation inEqn;
  input DAE.FunctionTree inFuncs;
  output tuple<list<BackendDAE.Equation>,list<BackendDAE.MultiDimEquation>> outTuplEqnLst;
algorithm 
  outTuplEqnLst := match(inEqn,inFuncs)
  local
    DAE.FunctionTree funcs;
    DAE.ComponentRef cr1,cr2;
    list<DAE.Exp> e1lst,e2lst;
    list<DAE.ExpVar> varLst;
    Integer i;
    list<tuple<list<BackendDAE.Equation>,list<BackendDAE.MultiDimEquation>>> compmultilistlst,compmultilistlst1;
    list<list<BackendDAE.MultiDimEquation>> multiEqsLst,multiEqsLst1;
    list<list<BackendDAE.Equation>> complexEqsLst,complexEqsLst1;
    list<BackendDAE.MultiDimEquation> multiEqs,multiEqs1,multiEqs2;  
    list<BackendDAE.Equation> complexEqs,complexEqs1;  
    DAE.ElementSource source;  
    Absyn.Path path,fname;
    list<DAE.Exp> expLst;
    list<tuple<DAE.Exp,DAE.Exp>> exptpllst;
  // a=b
  case (BackendDAE.COMPLEX_EQUATION(index=i,lhs = DAE.CREF(componentRef=cr1,ty= DAE.ET_COMPLEX(varLst=varLst,complexClassType=ClassInf.RECORD(_))), rhs = DAE.CREF(componentRef=cr2),source = source),funcs)
    equation
      // create as many equations as the dimension of the record
      e1lst = Util.listMap1(varLst,Expression.generateCrefsExpFromExpVar,cr1);
      e2lst = Util.listMap1(varLst,Expression.generateCrefsExpFromExpVar,cr2);
      exptpllst = Util.listThreadTuple(e1lst,e2lst);
      compmultilistlst = Util.listMap2(exptpllst,generateextendedRecordEqn,source,funcs);
      complexEqsLst = Util.listMap(compmultilistlst,Util.tuple21);
      multiEqsLst = Util.listMap(compmultilistlst,Util.tuple22);
      complexEqs = Util.listFlatten(complexEqsLst);
      multiEqs = Util.listFlatten(multiEqsLst);
      // nested Records
      compmultilistlst1 = Util.listMap1(complexEqs,extendRecordEqns,funcs);
      complexEqsLst1 = Util.listMap(compmultilistlst1,Util.tuple21);
      multiEqsLst1 = Util.listMap(compmultilistlst1,Util.tuple22);
      complexEqs1 = Util.listFlatten(complexEqsLst1);
      multiEqs1 = Util.listFlatten(multiEqsLst1);
      multiEqs2 = listAppend(multiEqs,multiEqs1);
    then
      ((complexEqs1,multiEqs2)); 
  // a=Record()
  case (BackendDAE.COMPLEX_EQUATION(index=i,lhs = DAE.CREF(componentRef=cr1,ty= DAE.ET_COMPLEX(varLst=varLst,complexClassType=ClassInf.RECORD(_))), rhs = DAE.CALL(path=path,expLst=expLst),source = source),funcs)
    equation
      SOME(DAE.RECORD_CONSTRUCTOR(path=fname)) = DAEUtil.avlTreeGet(funcs,path);
      // create as many equations as the dimension of the record
      e1lst = Util.listMap1(varLst,Expression.generateCrefsExpFromExpVar,cr1);
      exptpllst = Util.listThreadTuple(e1lst,expLst);
      compmultilistlst = Util.listMap2(exptpllst,generateextendedRecordEqn,source,funcs);
      complexEqsLst = Util.listMap(compmultilistlst,Util.tuple21);
      multiEqsLst = Util.listMap(compmultilistlst,Util.tuple22);
      complexEqs = Util.listFlatten(complexEqsLst);
      multiEqs = Util.listFlatten(multiEqsLst);
      // nested Records
      compmultilistlst1 = Util.listMap1(complexEqs,extendRecordEqns,funcs);
      complexEqsLst1 = Util.listMap(compmultilistlst1,Util.tuple21);
      multiEqsLst1 = Util.listMap(compmultilistlst1,Util.tuple22);
      complexEqs1 = Util.listFlatten(complexEqsLst1);
      multiEqs1 = Util.listFlatten(multiEqsLst1);
      multiEqs2 = listAppend(multiEqs,multiEqs1);
    then
      ((complexEqs1,multiEqs2)); 
end match;
end extendRecordEqns;

protected function generateextendedRecordEqn "
Author: Frenkel TUD 2010-05"
  input tuple<DAE.Exp,DAE.Exp> inExp;
  input DAE.ElementSource Source;
  input DAE.FunctionTree inFuncs;
  output tuple<list<BackendDAE.Equation>,list<BackendDAE.MultiDimEquation>> outTuplEqnLst;
algorithm 
  outTuplEqnLst := matchcontinue(inExp,Source,inFuncs)
  local
    DAE.Exp e1,e2,e1_1,e2_1,e2_2;
    DAE.ElementSource source;
    DAE.ComponentRef cr1;
    BackendDAE.Equation eqn;
    Expression.Type tp;
    list<DAE.Dimension> ad;
    list<Integer> ds;
  // array types to array equations  
  case ((e1 as DAE.CREF(componentRef=cr1,ty=DAE.ET_ARRAY(arrayDimensions=ad)),e2),source,inFuncs)
    equation 
      ((e1_1,_)) = extendArrExp((e1,SOME(inFuncs)));
      ((e2_1,_)) = extendArrExp((e2,SOME(inFuncs)));
      e2_2 = ExpressionSimplify.simplify(e2_1);
      ds = Util.listMap(ad, Expression.dimensionSize);
    then
      (({},{BackendDAE.MULTIDIM_EQUATION(ds,e1_1,e2_2,source)}));
  // other types  
  case ((e1 as DAE.CREF(componentRef=cr1),e2),source,inFuncs)
    equation 
      tp = Expression.typeof(e1);
      false = DAEUtil.expTypeComplex(tp);
      ((e1_1,_)) = extendArrExp((e1,SOME(inFuncs)));
      ((e2_1,_)) = extendArrExp((e2,SOME(inFuncs)));
      e2_2 = ExpressionSimplify.simplify(e2_1);
      eqn = BackendEquation.generateEQUATION((e1_1,e2_2),source);
    then
      (({eqn},{}));    
  // complex type
  case ((e1,e2),source,inFuncs)
    equation 
      tp = Expression.typeof(e1);
      true = DAEUtil.expTypeComplex(tp);
    then
      (({BackendDAE.COMPLEX_EQUATION(-1,e1,e2,source)},{}));    
 end matchcontinue;
end generateextendedRecordEqn;

protected function isStateOrAlgvar
  "@author adrpo
   check if this variable is a state or algebraic"
  input DAE.Element e;
  output Boolean out;
algorithm
  out := match (e)
    case (DAE.VAR(kind = DAE.VARIABLE())) then true;
    case (DAE.VAR(kind = DAE.DISCRETE())) then true;
    else false;
  end match;
end isStateOrAlgvar;

protected function extendAlgorithm "
Author: Frenkel TUD 2010-07"
  input DAE.Algorithm inAlg;
  input Option<DAE.FunctionTree> funcs;  
  output DAE.Algorithm outAlg;
algorithm 
  outAlg := matchcontinue(inAlg,funcs)
    local list<DAE.Statement> statementLst;
    case(inAlg,funcs)
      equation
        // Don't extend array?
        false = RTOpts.splitArrays();        
      then inAlg;        
    case(DAE.ALGORITHM_STMTS(statementLst=statementLst),funcs)
      equation
        (statementLst,_) = DAEUtil.traverseDAEEquationsStmts(statementLst, BackendDAEUtil.extendArrExp, funcs);
      then
        DAE.ALGORITHM_STMTS(statementLst);
    case(inAlg,funcs) then inAlg;        
  end matchcontinue;
end extendAlgorithm;

protected function extendArrExp "
Author: Frenkel TUD 2010-12"
  input tuple<DAE.Exp,Option<DAE.FunctionTree>> itpl;
  output tuple<DAE.Exp,Option<DAE.FunctionTree>> otpl;
algorithm 
  otpl := matchcontinue itpl
    local
    case (itpl)
      equation
        // Don't extend array?
        false = RTOpts.splitArrays();      
      then itpl;
    case (itpl) then BackendDAEUtil.extendArrExp(itpl);
  end matchcontinue;
end extendArrExp;

protected function checkAssertCondition "Succeds if condition of assert is not constant false"
  input DAE.Exp cond;
  input DAE.Exp message;
algorithm
  _ := matchcontinue(cond,message)
    local 
      String messageStr;
    case(_, _)
      equation
        // Don't check assertions when checking models
        true = OptManager.getOption("checkModel");
      then ();
    case(cond,message) equation
      false = Expression.isConstFalse(cond);
      then ();
    case(cond,message)
      equation
        true = Expression.isConstFalse(cond);
        messageStr = ExpressionDump.printExpStr(message);
        Error.addMessage(Error.ASSERT_CONSTANT_FALSE_ERROR,{messageStr});
      then fail();
  end matchcontinue;
end checkAssertCondition;

protected function whenEquationsIndices "Returns all equation-indices that contain a when clause"
  input BackendDAE.EquationArray eqns;
  output list<Integer> res;
algorithm
   res := match (eqns)
     case(eqns) equation
         res=whenEquationsIndices2(1,BackendDAEUtil.equationSize(eqns),eqns);
       then res;
   end match;
end whenEquationsIndices;

protected function whenEquationsIndices2
"Help function"
  input Integer i;
  input Integer size;
  input BackendDAE.EquationArray eqns;
  output list<Integer> eqnLst;
algorithm
  eqnLst := matchcontinue(i,size,eqns)
    case(i,size,eqns)
      equation
        true = (i > size );
      then {};
    case(i,size,eqns)
      equation
        BackendDAE.WHEN_EQUATION(whenEquation = _) = BackendDAEUtil.equationNth(eqns,i-1);
        eqnLst = whenEquationsIndices2(i+1,size,eqns);
      then i::eqnLst;
    case(i,size,eqns)
      equation
        eqnLst=whenEquationsIndices2(i+1,size,eqns);
      then eqnLst;
  end matchcontinue;
end whenEquationsIndices2;

end BackendDAECreate;
