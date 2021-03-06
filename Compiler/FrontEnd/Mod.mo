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

encapsulated package Mod
" file:        Mod.mo
  package:     Mod
  description: Modification handling

  RCS: $Id$

  Modifications are simply the same kind of modifications used in the Absyn module.

  This module contains functions for handling DAE.Mod, which is very similar to
  SCode.Mod. The main difference is that it uses DAE.Exp for the expressions.
  Expressions stored here are prefixed and typechecked.
"


public import Absyn;
public import DAE;
public import Env;
public import Prefix;
public import SCode;
public import InnerOuter;
public import ComponentReference;

public 
type Ident = String;
type InstanceHierarchy = InnerOuter.InstHierarchy "an instance hierarchy";

protected import Ceval;
protected import ClassInf;
protected import Config;
protected import Dump;
protected import Debug;
protected import Error;
protected import Expression;
protected import ExpressionDump;
protected import ExpressionSimplify;
protected import Flags;
protected import Inst;
protected import List;
protected import PrefixUtil;
protected import Print;
protected import Static;
protected import Types;
protected import Util;
protected import Values;
protected import ValuesUtil;
protected import System;
protected import SCodeDump;

protected 
uniontype FullMod "used for error reporting"
  record MOD "the fully qualified cref and the mod, only used for redeclare"
    DAE.ComponentRef cref;
    DAE.Mod mod;
  end MOD;
  
  record SUB_MOD "the fully qualified cref and the sub mod for all other mods"
    DAE.ComponentRef cref;
    DAE.SubMod subMod;
  end SUB_MOD;
end FullMod;

public type SubMod = DAE.SubMod;
public type EqMod = DAE.EqMod;

public function elabMod "
  This function elaborates on the expressions in a modification and
  turns them into global expressions.  This is done because the
  expressions in modifications must be elaborated on in the context
  they are provided in, and not the context they are used in."
  input Env.Cache inCache;
  input Env.Env inEnv;
  input InstanceHierarchy inIH;
  input Prefix.Prefix inPrefix;
  input SCode.Mod inMod;
  input Boolean inBoolean;
  input Absyn.Info info;
  output Env.Cache outCache;
  output DAE.Mod outMod;
algorithm
  (outCache,outMod) := match (inCache,inEnv,inIH,inPrefix,inMod,inBoolean,info)
    local
      Boolean impl;
      SCode.Final finalPrefix;
      list<DAE.SubMod> subs_1;
      list<Env.Frame> env;
      Prefix.Prefix pre;
      SCode.Mod m;
      SCode.Each each_;
      list<SCode.SubMod> subs;
      DAE.Exp e_1,e_2;
      DAE.Properties prop;
      Option<Values.Value> e_val;
      Absyn.Exp e;
      tuple<SCode.Element, DAE.Mod> el_mod;
      SCode.Element elem;
      Env.Cache cache;
      InstanceHierarchy ih;

    // no modifications
    case (cache,_,_,_,SCode.NOMOD(),impl,_) then (cache,DAE.NOMOD());

    // no top binding
    case (cache,env,ih,pre,(m as SCode.MOD(finalPrefix = finalPrefix,eachPrefix = each_,subModLst = subs,binding = NONE())),impl,info)
      equation
        (cache,subs_1) = elabSubmods(cache, env, ih, pre, subs, impl,info);
      then
        (cache,DAE.MOD(finalPrefix,each_,subs_1,NONE()));

    // Only elaborate expressions with non-delayed type checking, see SCode.MOD.
    case (cache,env,ih,pre,(m as SCode.MOD(finalPrefix = finalPrefix,eachPrefix = each_,subModLst = subs,binding = SOME((e,false)))),impl,info)
      equation
        (cache,subs_1) = elabSubmods(cache, env, ih, pre, subs, impl,info);
        // print("Mod.elabMod: calling elabExp on mod exp: " +& Dump.printExpStr(e) +& " in env: " +& Env.printEnvPathStr(env) +& "\n");
        (cache,e_1,prop,_) = Static.elabExp(cache, env, e, impl, NONE(), Config.splitArrays(), pre, info); // Vectorize only if arrays are expanded
        (cache, e_1, prop) = Ceval.cevalIfConstant(cache, env, e_1, prop, impl, info);
        (cache,e_val) = elabModValue(cache, env, e_1, prop, info);
        (cache,e_2) = PrefixUtil.prefixExp(cache, env, ih, e_1, pre)
        "Bug: will cause elaboration of parameters without value to fail,
         But this can be ok, since a modifier is present, giving it a value from outer modifications.." ;
      then
        (cache,DAE.MOD(finalPrefix,each_,subs_1,SOME(DAE.TYPED(e_2,e_val,prop,SOME(e)))));

    // Delayed type checking
    case (cache,env,ih,pre,(m as SCode.MOD(finalPrefix = finalPrefix,eachPrefix = each_,subModLst = subs,binding = SOME((e,true)))),impl,info)
      equation
        // print("Mod.elabMod: delayed mod : " +& Dump.printExpStr(e) +& " in env: " +& Env.printEnvPathStr(env) +& "\n");
        (cache,subs_1) = elabSubmods(cache, env, ih, pre, subs, impl, info);
      then
        (cache,DAE.MOD(finalPrefix,each_,subs_1,SOME(DAE.UNTYPED(e))));

    // redeclarations
    case (cache,env,ih,pre,(m as SCode.REDECL(finalPrefix = finalPrefix, eachPrefix = each_, element = elem)),impl,info)
      equation
        //elist_1 = Inst.addNomod(elist);
        (el_mod) = elabModRedeclareElement(cache,env,ih,pre,finalPrefix,elem,impl,info);
      then
        (cache,DAE.REDECL(finalPrefix,each_,{el_mod}));

    // failure
    /*
    case (cache,env,ih,pre,mod,impl,info)
      equation
        Debug.fprint(Flags.FAILTRACE, "#-- elab_mod ");
        str = SCodeDump.printModStr(mod);
        Debug.fprint(Flags.FAILTRACE, str);
        Debug.fprint(Flags.FAILTRACE, " failed\n");
        print("elab mod failed, mod:");print(str);print("\n");
        print("env:");print(Env.printEnvStr(env));print("\n");
        elab mod can fail?
      then
        fail();
    */
  end match;
end elabMod;

public function elabModForBasicType "
  Same as elabMod, but if a named Mod is not part of a basic type, fail instead."
  input Env.Cache inCache;
  input Env.Env inEnv;
  input InstanceHierarchy inIH;
  input Prefix.Prefix inPrefix;
  input SCode.Mod inMod;
  input Boolean inBoolean;
  input Absyn.Info info;
  output Env.Cache outCache;
  output DAE.Mod outMod;
algorithm
  (outCache,outMod) := match (inCache,inEnv,inIH,inPrefix,inMod,inBoolean,info)
    case (inCache,inEnv,inIH,inPrefix,inMod,inBoolean,info)
      equation
        checkIfModsAreBasicTypeMods(inMod);
        (outCache,outMod) = elabMod(inCache,inEnv,inIH,inPrefix,inMod,inBoolean,info);
      then (outCache,outMod);
  end match;
end elabModForBasicType;

protected function checkIfModsAreBasicTypeMods "
  Verifies that a list of submods only have named modifications that could be
  used for basic types."
  input SCode.Mod mod;
algorithm
  _ := match mod
    local
      list<SCode.SubMod> subs;
    case SCode.NOMOD() then ();
    case SCode.MOD(subModLst = subs)
      equation
        checkIfSubmodsAreBasicTypeMods(subs);
      then ();
  end match;
end checkIfModsAreBasicTypeMods;

protected function checkIfSubmodsAreBasicTypeMods "
  Verifies that a list of submods only have named modifications that could be
  used for basic types."
  input list<SCode.SubMod> inSubs;
algorithm
  _ := match inSubs
    local
      SCode.Mod mod;
      String ident;
      list<SCode.SubMod> subs;
      
    case {} then ();
    case SCode.NAMEMOD(ident = ident)::subs
      equation
        true = ClassInf.isBasicTypeComponentName(ident);
        checkIfSubmodsAreBasicTypeMods(subs);
      then ();
    case SCode.IDXMOD(an = mod)::subs
      equation
        checkIfModsAreBasicTypeMods(mod);
        checkIfSubmodsAreBasicTypeMods(subs);
      then ();
  end match;
end checkIfSubmodsAreBasicTypeMods;

protected function elabModRedeclareElement
  input Env.Cache inCache;
  input Env.Env inEnv;
  input InstanceHierarchy inIH;
  input Prefix.Prefix inPrefix;
  input SCode.Final finalPrefix;
  input SCode.Element inElt;
  input Boolean impl;
  input Absyn.Info info;
  output tuple<SCode.Element, DAE.Mod> modElts "the elaborated modifiers";
algorithm
  modElts := match(inCache,inEnv,inIH,inPrefix,finalPrefix,inElt,impl,info)
    local
      Env.Cache cache; Env.Env env; Prefix.Prefix pre;
      SCode.Final f,fi;
      SCode.Replaceable repl;
      SCode.Partial p;
      SCode.Encapsulated enc;
      SCode.Visibility vis;
      SCode.Redeclare redecl;
      Absyn.InnerOuter io;
      SCode.Ident cn,cn2,compname;
      Option<SCode.Comment> cmt;
      SCode.Restriction restr;
      Absyn.TypeSpec tp,tp1;
      DAE.Mod emod;
      SCode.Attributes attr;
      SCode.Mod mod;
      Option<Absyn.Exp> cond;
      Option<Absyn.ConstrainClass> cc;
      Absyn.Info i;
      InstanceHierarchy ih;
      SCode.Attributes attr1;
      list<SCode.Enum> enumLst;
      Option<SCode.Comment> comment;
      SCode.Element element;

    // Only derived classdefinitions supported in redeclares for now. 
    // TODO: What is allowed according to spec? adrpo: 2011-06-28: is not decided yet, 
    //       but i think only derived even if in the Modelica.Media we have redeclare-as-element 
    //       replacing entire functions with PARTS and everything, so i added the case below
    case(cache,env,ih,pre,f,
      SCode.CLASS(cn,
        SCode.PREFIXES(vis,redecl,fi,io,repl),enc,p,restr,SCode.DERIVED(tp,mod,attr1,cmt),i),impl,info)
      equation
       (cache,emod) = elabMod(cache,env,ih,pre,mod,impl,info);
       (cache,tp1) = elabModQualifyTypespec(cache,env,tp);
      then 
        ((SCode.CLASS(cn,SCode.PREFIXES(vis,redecl,fi,io,repl),enc,p,restr,SCode.DERIVED(tp1,mod,attr1,cmt),i),emod));

    // replaceable type E=enumeration(e1,...,en), E=enumeration(:)
    case(cache,env,ih,pre,f,
      SCode.CLASS(cn,
        SCode.PREFIXES(vis,redecl,fi,io,repl),enc,p,restr,SCode.ENUMERATION(enumLst,comment),i),impl,info)
      then 
        ((SCode.CLASS(cn,SCode.PREFIXES(vis,redecl,fi,io,repl),enc,p,restr,SCode.ENUMERATION(enumLst,comment),i),DAE.NOMOD()));

    // redeclare of component declaration
    case(cache,env,ih,pre,f,SCode.COMPONENT(compname,SCode.PREFIXES(vis,redecl,fi,io,repl),attr,tp,mod,cmt,cond,i),impl,info) 
      equation
        (cache,emod) = elabMod(cache,env,ih,pre,mod,impl,info);
        (cache,tp1) = elabModQualifyTypespec(cache,env,tp);
      then 
        ((SCode.COMPONENT(compname,SCode.PREFIXES(vis,redecl,fi,io,repl),attr,tp1,mod,cmt,cond,i),emod));

    // redeclare failure?
    case(cache,env,ih,pre,f,element,impl,info)
      equation
        //print("Unhandled element redeclare (we keep it as it is!): " +& SCodeDump.unparseElementStr(element) +& "\n");
      then
        ((element,DAE.NOMOD()));
  end match;
end elabModRedeclareElement;

protected function elabModQualifyTypespec
"Help function to elabModRedeclareElements.
 This function makes sure that type specifiers, i.e. class names, in redeclarations are looked up in the correct environment.
 This is achieved by making them fully qualified."
  input Env.Cache inCache;
  input Env.Env inEnv;
  input Absyn.TypeSpec tp;
  output Env.Cache outCache;
  output Absyn.TypeSpec outTp;
algorithm
  (outCache,outTp) := match(inCache,inEnv,tp)
      local
        Env.Cache cache; Env.Env env;
        Option<Absyn.ArrayDim> ad;
        Absyn.Path p,p1;
    case (cache, env,Absyn.TPATH(p,ad)) equation
      (cache,p1) = Inst.makeFullyQualified(cache,env,p);
    then (cache,Absyn.TPATH(p1,ad));

  end match;
end elabModQualifyTypespec;

protected function elabModValue
"function: elabModValue
  author: PA
  Helper function to elabMod. Builds values from modifier expressions if possible.
  Tries to Constant evaluate an expressions an create a Value option for it."
  input Env.Cache inCache;
  input Env.Env inEnv;
  input DAE.Exp inExp;
  input DAE.Properties inProp;
  input Absyn.Info inInfo;
  output Env.Cache outCache;
  output Option<Values.Value> outValuesValueOption;
algorithm
  (outCache,outValuesValueOption) := 
  matchcontinue (inCache,inEnv,inExp,inProp, inInfo)
    local
      Values.Value v;
      Ceval.Msg msg;
      Env.Cache cache;
      DAE.Const c;
    case (_,_,_,_,_)
      equation
        c = Types.propAllConst(inProp);
        // Don't ceval variables.
        false = Types.constIsVariable(c);
        // Show error messages from ceval only if the expression is a constant.
        msg = Util.if_(Types.constIsConst(c), Ceval.MSG(inInfo), Ceval.NO_MSG());
        (cache,v,_) = Ceval.ceval(inCache, inEnv, inExp, false,NONE(), msg);
      then
        (inCache /*Yeah; this makes sense :)*/,SOME(v));
    // Constant evaluation failed, return no value.
    else (inCache,NONE());
  end matchcontinue;
end elabModValue;

public function unelabMod
"function: unelabMod
  Transforms Mod back to SCode.Mod, loosing type information."
  input DAE.Mod inMod;
  output SCode.Mod outMod;
algorithm
  outMod:=
  matchcontinue (inMod)
    local
      list<SCode.SubMod> subs_1;
      DAE.Mod m,mod;
      SCode.Final finalPrefix;
      SCode.Each each_;
      list<DAE.SubMod> subs;
      Absyn.Exp e,e_1,absynExp;
      DAE.Properties p;
      SCode.Element elem;
      DAE.Exp dexp;
      String str;
      
    case (DAE.NOMOD()) then SCode.NOMOD();
    case ((m as DAE.MOD(finalPrefix = finalPrefix,eachPrefix = each_,subModLst = subs,eqModOption = NONE())))
      equation
        subs_1 = unelabSubmods(subs);
      then
        SCode.MOD(finalPrefix,each_,subs_1,NONE(),Absyn.dummyInfo);
    case ((m as DAE.MOD(finalPrefix = finalPrefix,eachPrefix = each_,subModLst = subs,eqModOption = SOME(DAE.UNTYPED(e)))))
      equation
        subs_1 = unelabSubmods(subs);
      then
        SCode.MOD(finalPrefix,each_,subs_1,SOME((e,false)),Absyn.dummyInfo); // Default type checking non-delayed

    case ((m as DAE.MOD(finalPrefix = finalPrefix,eachPrefix = each_,subModLst = subs,
                        eqModOption = SOME(DAE.TYPED(_,_,p,SOME(absynExp))))))
      equation
        //es = ExpressionDump.printExpStr(e);
        subs_1 = unelabSubmods(subs);
        e_1 = absynExp; //Expression.unelabExp(e);
      then
        SCode.MOD(finalPrefix,each_,subs_1,SOME((e_1,false)),Absyn.dummyInfo); // default typechecking non-delayed

    case ((m as DAE.MOD(finalPrefix = finalPrefix,eachPrefix = each_,subModLst = subs,
                        eqModOption = SOME(DAE.TYPED(dexp,_,p,NONE())))))
      equation
        //es = ExpressionDump.printExpStr(e);
        subs_1 = unelabSubmods(subs);
        (dexp,_) = ExpressionSimplify.simplify1(dexp);
        e_1 = Expression.unelabExp(dexp);
      then
        SCode.MOD(finalPrefix,each_,subs_1,SOME((e_1,false)),Absyn.dummyInfo); // default typechecking non-delayed

    case ((m as DAE.REDECL(finalPrefix = finalPrefix,eachPrefix = each_,tplSCodeElementModLst = {(elem, _)})))
      then
        SCode.REDECL(finalPrefix,each_,elem);

    case (mod)
      equation
        str = "Mod.elabUntypedMod failed: " +& printModStr(mod) +& "\n";
        Error.addMessage(Error.INTERNAL_ERROR, {str});
      then
        fail();
  end matchcontinue;
end unelabMod;

protected function unelabSubmods
"function: unelabSubmods
  Helper function to unelabMod."
  input list<DAE.SubMod> inTypesSubModLst;
  output list<SCode.SubMod> outSCodeSubModLst;
algorithm
  outSCodeSubModLst:=
  match (inTypesSubModLst)
    local
      list<SCode.SubMod> x_1,xs_1,res;
      DAE.SubMod x;
      list<DAE.SubMod> xs;
    case ({}) then {};
    case ((x :: xs))
      equation
        x_1 = unelabSubmod(x);
        xs_1 = unelabSubmods(xs);
        res = listAppend(x_1, xs_1);
      then
        res;
  end match;
end unelabSubmods;

protected function unelabSubmod
"function: unelabSubmod
  This function unelaborates on a submodification."
  input DAE.SubMod inSubMod;
  output list<SCode.SubMod> outSCodeSubModLst;
algorithm
  outSCodeSubModLst:=
  match (inSubMod)
    local
      SCode.Mod m_1;
      Ident i;
      DAE.Mod m;
      list<Absyn.Subscript> ss_1;
      list<Integer> ss;
    case (DAE.NAMEMOD(ident = i,mod = m))
      equation
        m_1 = unelabMod(m);
      then
        {SCode.NAMEMOD(i,m_1)};
    case (DAE.IDXMOD(integerLst = ss,mod = m))
      equation
        ss_1 = unelabSubscript(ss);
        m_1 = unelabMod(m);
      then
        {SCode.IDXMOD(ss_1,m_1)};
  end match;
end unelabSubmod;

protected function unelabSubscript
  input list<Integer> inIntegerLst;
  output list<SCode.Subscript> outSCodeSubscriptLst;
algorithm
  outSCodeSubscriptLst:=
  match (inIntegerLst)
    local
      list<Absyn.Subscript> xs;
      Integer i;
      list<Integer> is;
    case ({}) then {};
    case ((i :: is))
      equation
        xs = unelabSubscript(is);
      then
        (Absyn.SUBSCRIPT(Absyn.INTEGER(i)) :: xs);
  end match;
end unelabSubscript;

public function updateMod
"function: updateMod
  This function updates an untyped modification to a typed one, by looking
  up the type of the modifier in the environment and update it."
  input Env.Cache inCache;
  input Env.Env inEnv;
  input InstanceHierarchy inIH;
  input Prefix.Prefix inPrefix;
  input DAE.Mod inMod;
  input Boolean inBoolean;
  input Absyn.Info info;
  output Env.Cache outCache;
  output DAE.Mod outMod;
algorithm
  (outCache,outMod) := matchcontinue (inCache,inEnv,inIH,inPrefix,inMod,inBoolean,info)
    local
      Boolean impl;
      SCode.Final f;
      DAE.Mod m;
      list<DAE.SubMod> subs_1,subs;
      DAE.Exp e_1,e_2;
      DAE.Properties prop,p;
      Option<Values.Value> e_val;
      list<Env.Frame> env;
      Prefix.Prefix pre;
      SCode.Each each_;
      Absyn.Exp e;
      Option<Absyn.Exp> eOpt;
      Env.Cache cache;
      InstanceHierarchy ih;
      String str;
    
    case (cache,_,_,_,DAE.NOMOD(),impl,info) then (cache,DAE.NOMOD());

    case (cache,_,_,_,(m as DAE.REDECL(finalPrefix = _)),impl,info) then (cache,m);

    case (cache,env,ih,pre,(m as DAE.MOD(finalPrefix = f,eachPrefix = each_,subModLst = subs,eqModOption = SOME(DAE.UNTYPED(e)))),impl,info)
      equation
        (cache,subs_1) = updateSubmods(cache, env, ih, pre, subs, impl, info);
        (cache,e_1,prop,_) = Static.elabExp(cache, env, e, impl,NONE(), true, pre, info);
        (cache, e_1, prop) = Ceval.cevalIfConstant(cache, env, e_1, prop, impl, info);
        (cache,e_val) = elabModValue(cache,env,e_1,prop,info);
        (cache,e_2) = PrefixUtil.prefixExp(cache, env, ih, e_1, pre);
        Debug.fprint(Flags.UPDMOD, "Updated mod: ");
        Debug.fprintln(Flags.UPDMOD, Debug.fcallret1(Flags.UPDMOD, printModStr, DAE.MOD(f,each_,subs_1,SOME(DAE.TYPED(e_2,NONE(),prop,SOME(e)))),""));
      then
        (cache,DAE.MOD(f,each_,subs_1,SOME(DAE.TYPED(e_2,e_val,prop,SOME(e)))));

    case (cache,env,ih,pre,DAE.MOD(finalPrefix = f,eachPrefix = each_,subModLst = subs,eqModOption = SOME(DAE.TYPED(e_1,e_val,p,eOpt))),impl,info)
      equation
        (cache,subs_1) = updateSubmods(cache, env, ih, pre, subs, impl, info);
      then
        (cache,DAE.MOD(f,each_,subs_1,SOME(DAE.TYPED(e_1,e_val,p,eOpt))));

    case (cache,env,ih,pre,DAE.MOD(finalPrefix = f,eachPrefix = each_,subModLst = subs,eqModOption = NONE()),impl,info)
      equation
        (cache,subs_1) = updateSubmods(cache, env, ih, pre, subs, impl, info);
      then
        (cache,DAE.MOD(f,each_,subs_1,NONE()));

    /*case (cache,env,ih,pre,m,impl,info) // here silently fail, it will be caught in Inst.updateComponentInEnv
      equation
      then
        (cache,m);*/

    case (cache,env,ih,pre,m,impl,info)
      equation
        true = Flags.isSet(Flags.FAILTRACE);
        str = printModStr(m);
        Debug.traceln("- Mod.updateMod failed mod: " +& str);
      then
        fail();
  end matchcontinue;
end updateMod;

protected function updateSubmods ""
    input Env.Cache inCache;
  input Env.Env inEnv;
  input InstanceHierarchy inIH;
  input Prefix.Prefix inPrefix;
  input list<DAE.SubMod> inTypesSubModLst;
  input Boolean inBoolean;
  input Absyn.Info info;
  output Env.Cache outCache;
  output list<DAE.SubMod> outTypesSubModLst;
algorithm
  (outCache,outTypesSubModLst):=
  match (inCache,inEnv,inIH,inPrefix,inTypesSubModLst,inBoolean,info)
    local
      Boolean impl;
      list<DAE.SubMod> x_1,xs_1,res,xs;
      list<Env.Frame> env;
      Prefix.Prefix pre;
      DAE.SubMod x;
      Env.Cache cache;
      InstanceHierarchy ih;
      
    case (cache,_,ih,_,{},impl,info) then (cache,{});  /* impl */
    case (cache,env,ih,pre,(x :: xs),impl,info)
      equation
        (cache,x_1) = updateSubmod(cache, env, ih, pre, x, impl, info);
        (cache,xs_1) = updateSubmods(cache, env, ih, pre, xs, impl, info);
        res = insertSubmods(x_1, xs_1, env, pre);
      then
        (cache,res);
  end match;
end updateSubmods;

protected function updateSubmod " "
  input Env.Cache inCache;
  input Env.Env inEnv;
  input InstanceHierarchy inIH;
  input Prefix.Prefix inPrefix;
  input DAE.SubMod inSubMod;
  input Boolean inBoolean;
  input Absyn.Info info;
  output Env.Cache outCache;
  output list<DAE.SubMod> outTypesSubModLst;
algorithm
  (outCache,outTypesSubModLst):=
  match (inCache,inEnv,inIH,inPrefix,inSubMod,inBoolean,info)
    local
      DAE.Mod m_1,m;
      list<Env.Frame> env;
      Prefix.Prefix pre;
      Ident i;
      Boolean impl;
      Env.Cache cache;
      list<Integer> idxmod;
      InstanceHierarchy ih;
      
    case (cache,env,ih,pre,DAE.NAMEMOD(ident = i,mod = m),impl,info)
      equation
        (cache,m_1) = updateMod(cache, env, ih, pre, m, impl, info);
      then
        (cache,{DAE.NAMEMOD(i,m_1)});

    case (cache,env,ih,pre,DAE.IDXMOD(mod = m,integerLst=idxmod),impl,info)
      equation
        (cache,m_1) = updateMod(cache, env, ih, pre, m, impl, info) "Static.elab_subscripts (env,ss) => (ss\',true) &" ;
      then
        (cache,{DAE.IDXMOD(idxmod,m_1)});
  end match;
end updateSubmod;

public function elabUntypedMod "function elabUntypedMod
  This function is used to convert SCode.Mod into Mod, without
  adding correct type information. Instead, a undefined type will be
  given to the modification. This is used when modifications of e.g.
  elements in base classes used. For instance,
  model test extends A(x=y); end test; // both x and y are defined in A
  The modifier x=y must be merged with outer modifiers, thus it needs
  to be converted to Mod.
  Notice that the correct type information must be updated later on."
  input SCode.Mod inMod;
  input Env.Env inEnv;
  input Prefix.Prefix inPrefix;
  output DAE.Mod outMod;
algorithm
  outMod := matchcontinue (inMod,inEnv,inPrefix)
    local
      list<DAE.SubMod> subs_1;
      SCode.Mod m,mod;
      SCode.Final finalPrefix;
      SCode.Each each_;
      list<SCode.SubMod> subs;
      list<Env.Frame> env;
      Prefix.Prefix pre;
      Absyn.Exp e;
      SCode.Element elem;
      Ident s;
    case (SCode.NOMOD(),_,_) then DAE.NOMOD();
    case ((m as SCode.MOD(finalPrefix = finalPrefix,eachPrefix = each_,subModLst = subs,binding = NONE())),env,pre)
      equation
        subs_1 = elabUntypedSubmods(subs, env, pre);
      then
        DAE.MOD(finalPrefix,each_,subs_1,NONE());
    case ((m as SCode.MOD(finalPrefix = finalPrefix,eachPrefix = each_,subModLst = subs,binding = SOME((e,_)))),env,pre)
      equation
        subs_1 = elabUntypedSubmods(subs, env, pre);
      then
        DAE.MOD(finalPrefix,each_,subs_1,SOME(DAE.UNTYPED(e)));
    case ((m as SCode.REDECL(finalPrefix = finalPrefix,eachPrefix = each_, element = elem)),env,pre)
      then
        DAE.REDECL(finalPrefix,each_,{(elem, DAE.NOMOD())});
    case (mod,env,pre)
      equation
        print("- elab_untyped_mod ");
        s = SCodeDump.printModStr(mod);
        print(s);
        print(" failed\n");
      then
        fail();
  end matchcontinue;
end elabUntypedMod;

protected function elabSubmods
"function: elabSubmods
  This function helps elabMod by recusively elaborating on a list of submodifications."
    input Env.Cache inCache;
  input Env.Env inEnv;
  input InstanceHierarchy inIH;
  input Prefix.Prefix inPrefix;
  input list<SCode.SubMod> inSCodeSubModLst;
  input Boolean inBoolean;
  input Absyn.Info info;
  output Env.Cache outCache;
  output list<DAE.SubMod> outTypesSubModLst;
algorithm
  (outCache,outTypesSubModLst) :=
  match (inCache,inEnv,inIH,inPrefix,inSCodeSubModLst,inBoolean,info)
    local
      Boolean impl;
      list<DAE.SubMod> x_1,xs_1,res;
      list<Env.Frame> env;
      Prefix.Prefix pre;
      SCode.SubMod x;
      list<SCode.SubMod> xs;
      Env.Cache cache;
      InstanceHierarchy ih;

    case (cache,_,_,_,{},impl,info) then (cache,{});  /* impl */
    case (cache,env,ih,pre,(x :: xs),impl,info)
      equation
        (cache,x_1) = elabSubmod(cache, env, ih, pre, x, impl,info);
        (cache,xs_1) = elabSubmods(cache, env, ih, pre, xs, impl,info);
        res = insertSubmods(x_1, xs_1, env, pre);
      then
        (cache,res);
  end match;
end elabSubmods;

protected function elabSubmod
"function: elabSubmod
  This function elaborates on a submodification, turning an
  SCode.SubMod into one or more DAE.SubMod."
    input Env.Cache inCache;
  input Env.Env inEnv;
  input InstanceHierarchy inIH;
  input Prefix.Prefix inPrefix;
  input SCode.SubMod inSubMod;
  input Boolean inBoolean;
  input Absyn.Info info;
  output Env.Cache outCache;
  output list<DAE.SubMod> outTypesSubModLst;
algorithm
  (outCache,outTypesSubModLst) :=
  match (inCache,inEnv,inIH,inPrefix,inSubMod,inBoolean,info)
    local
      DAE.Mod m_1;
      list<Env.Frame> env;
      Prefix.Prefix pre;
      Ident i;
      SCode.Mod m;
      Boolean impl;
      list<DAE.Subscript> ss_1;
      list<DAE.SubMod> smods;
      list<Absyn.Subscript> ss;
      Env.Cache cache;
      InstanceHierarchy ih;
      
    case (cache,env,ih,pre,SCode.NAMEMOD(ident = i,A = m),impl,info)
      equation
        (cache,m_1) = elabMod(cache, env, ih, pre, m, impl, info);
      then
        (cache,{DAE.NAMEMOD(i,m_1)});
    case (cache,env,ih,pre,SCode.IDXMOD(subscriptLst = ss,an = m),impl,info)
      equation
        (cache,ss_1,DAE.C_CONST()) = Static.elabSubscripts(cache,env, ss, impl,pre,info);
        (cache,m_1) = elabMod(cache, env, ih, pre, m, impl, info);
        smods = makeIdxmods(ss_1, m_1);
      then
        (cache,smods);
  end match;
end elabSubmod;

protected function elabUntypedSubmods "function: elabUntypedSubmods

  This function helps `elab_untyped_mod\' by recusively elaborating on a list
  of submodifications.
"
  input list<SCode.SubMod> inSCodeSubModLst;
  input Env.Env inEnv;
  input Prefix.Prefix inPrefix;
  output list<DAE.SubMod> outTypesSubModLst;
algorithm
  outTypesSubModLst:=
  match (inSCodeSubModLst,inEnv,inPrefix)
    local
      list<DAE.SubMod> x_1,xs_1,res;
      SCode.SubMod x;
      list<SCode.SubMod> xs;
      list<Env.Frame> env;
      Prefix.Prefix pre;
    case ({},_,_) then {};
    case ((x :: xs),env,pre)
      equation
        x_1 = elabUntypedSubmod(x, env, pre);
        xs_1 = elabUntypedSubmods(xs, env, pre);
        res = insertSubmods(x_1, xs_1, env, pre);
      then
        res;
  end match;
end elabUntypedSubmods;

protected function elabUntypedSubmod "function: elabUntypedSubmod

  This function elaborates on a submodification, turning an
  `SCode.SubMod\' into one or more `DAE.SubMod\'s, wihtout type information.
"
  input SCode.SubMod inSubMod;
  input Env.Env inEnv;
  input Prefix.Prefix inPrefix;
  output list<DAE.SubMod> outTypesSubModLst;
algorithm
  outTypesSubModLst:=
  match (inSubMod,inEnv,inPrefix)
    local
      DAE.Mod m_1;
      Ident i;
      SCode.Mod m;
      list<Env.Frame> env;
      Prefix.Prefix pre;
      list<Absyn.Subscript> subcr;
      list<DAE.Subscript> sList;
      list<DAE.SubMod> smods;
      
    case (SCode.NAMEMOD(ident = i,A = m),env,pre)
      equation
        m_1 = elabUntypedMod(m, env, pre);
      then
        {DAE.NAMEMOD(i,m_1)};
    case (SCode.IDXMOD(subscriptLst = subcr,an = m),env,pre)
      equation
        (_,sList,DAE.C_CONST()) = Static.elabSubscripts(Env.emptyCache(), env, subcr, true,  pre, Absyn.dummyInfo);
        m_1 = elabUntypedMod(m, env, pre);
        smods = makeIdxmods(sList, m_1);     
      then
        smods;
  end match;
end elabUntypedSubmod;

protected function makeIdxmods "function: makeIdxmods
  From a list of list of integers, this function creates a list of
  sub-modifications of the IDXMOD variety."
  input list<DAE.Subscript> inExpSubscriptLst;
  input DAE.Mod inMod;
  output list<DAE.SubMod> outTypesSubModLst;
algorithm
  outTypesSubModLst := matchcontinue (inExpSubscriptLst,inMod)
    local
      Integer x;
      DAE.Mod m;
      list<DAE.SubMod> mods,mods_1;
      list<DAE.Subscript> xs;
      list<DAE.Exp> slice;
    
    // last mod
    case ({DAE.INDEX(exp = DAE.ICONST(integer = x))},m) then {DAE.IDXMOD({x},m)};
    // some more mods
    case ((DAE.INDEX(exp = DAE.ICONST(integer = x)) :: xs),m)
      equation
        mods = makeIdxmods(xs, m);
        mods_1 = prefixIdxmods(mods, x);
      then
        mods_1;
    case ((DAE.SLICE(exp = DAE.ARRAY(array = slice)) :: xs),m)
      equation
        mods = expandSlice(slice, xs, 1, m);
      then
        mods;
    case ((DAE.WHOLEDIM() :: xs),m)
      equation
        print("# Sorry, [:] slices are not handled in modifications\n");
      then
        fail();
    case(xs,m) equation
      print("Mod.makeIdxmods failed for mod:");print(printModStr(m));print("\n");
      print("subs =");print(stringDelimitList(List.map(xs,ExpressionDump.printSubscriptStr),","));
      print("\n");
    then fail();

  end matchcontinue;
end makeIdxmods;

protected function prefixIdxmods "function: prefixIdxmods
  This function adds a subscript to each DAE.IDXMOD in a list of submodifications."
  input list<DAE.SubMod> inTypesSubModLst;
  input Integer inInteger;
  output list<DAE.SubMod> outTypesSubModLst;
algorithm
  outTypesSubModLst := match (inTypesSubModLst,inInteger)
    local
      list<DAE.SubMod> mods_1,mods;
      list<Integer> l;
      DAE.Mod m;
      Integer i;
    case ({},_) then {};
    case ((DAE.IDXMOD(integerLst = l,mod = m) :: mods),i)
      equation
        mods_1 = prefixIdxmods(mods, i);
      then
        (DAE.IDXMOD((i :: l),m) :: mods_1);
  end match;
end prefixIdxmods;

protected function expandSlice "function: expandSlice
  This function goes through an array slice modification and creates
  an singly indexed modification for each index in the slice.  For
  example, x[2:3] = y is changed into x[2] = y[1] and
  x[3] = y[2]."
  input list<DAE.Exp> inExpExpLst;
  input list<DAE.Subscript> inExpSubscriptLst;
  input Integer inInteger;
  input DAE.Mod inMod;
  output list<DAE.SubMod> outTypesSubModLst;
algorithm
  outTypesSubModLst := matchcontinue (inExpExpLst,inExpSubscriptLst,inInteger,inMod)
    local
      DAE.Exp e_1,x,e,e_2;
      DAE.Type t_1,t;
      list<DAE.SubMod> mods1,mods2,mods;
      Integer n_1,n;
      list<DAE.Exp> xs;
      list<DAE.Subscript> restSubscripts;
      DAE.Mod m,mod,unfoldedMod;
      SCode.Final finalPrefix;
      SCode.Each each_;
      Option<Values.Value> e_val;
      DAE.Const const;
      Ident str;
      Values.Value val, indexVal;
      
    case ({},_,_,_) then {};
    case ({},_,_,_) then {};
      
    // try to do value indexing on e_val as SOME(val) first!
    case ((x :: xs),restSubscripts,n,(m as DAE.MOD(finalPrefix = finalPrefix,eachPrefix = each_,subModLst = {},
                                       eqModOption = SOME(DAE.TYPED(e,SOME(val),DAE.PROP(t,const),_)))))
      equation
        e_2 = DAE.ICONST(n);
        //print("FULLValue: " +& ValuesUtil.printValStr(val) +& "\n");
        // get the indexed value
        indexVal = ValuesUtil.nthArrayelt(val, n);
        // transform to exp
        e_1 = ValuesUtil.valueExp(indexVal);
        t_1 = Types.unliftArray(t);
        unfoldedMod = DAE.MOD(finalPrefix,each_,{},
                              SOME(DAE.TYPED(e_1,SOME(indexVal),DAE.PROP(t_1,const),NONE())));
        //print("IDXValue: " +& ValuesUtil.printValStr(indexVal) +& "\n");
        //print("Idx: " +& ExpressionDump.printExpStr(x) +& " mod: " +& printModStr(unfoldedMod) +& "\n");
        mods1 = makeIdxmods(DAE.INDEX(x) :: restSubscripts,unfoldedMod);
        n_1 = n + 1;
        mods2 = expandSlice(xs, restSubscripts, n_1, m);
        mods = listAppend(mods1, mods2);
      then
        mods;
    
    // value indexing didn't work, try to index DAE.EXP
    case ((x :: xs),restSubscripts,n, 
          (m as DAE.MOD(finalPrefix = finalPrefix,eachPrefix = each_,subModLst = {},
                        eqModOption = SOME(DAE.TYPED(e,e_val,DAE.PROP(t,const),_)))))
      equation
        e_2 = DAE.ICONST(n);
        //print("FULLExpression: " +& ExpressionDump.printExpStr(e) +& "\n");
        (e_1,_) = ExpressionSimplify.simplify1(Expression.makeASUB(e,{e_2}));
        t_1 = Types.unliftArray(t);
        unfoldedMod = DAE.MOD(finalPrefix,each_,{},
                              SOME(DAE.TYPED(e_1,NONE(),DAE.PROP(t_1,const),NONE())));
        //print("IDXExpression: " +& ExpressionDump.printExpStr(e_1) +& "\n");
        //print("Idx: " +& ExpressionDump.printExpStr(x) +& " mod: " +& printModStr(unfoldedMod) +& "\n");
        mods1 = makeIdxmods((DAE.INDEX(x) :: restSubscripts),unfoldedMod);
        n_1 = n + 1;
        mods2 = expandSlice(xs, restSubscripts, n_1, m);
        mods = listAppend(mods1, mods2);
      then
        mods;
    case (_,_,_,mod)
      equation
        str = printModStr(mod);
        Error.addMessage(Error.ILLEGAL_SLICE_MOD, {str});
      then
        fail();
  end matchcontinue;
end expandSlice;

protected function expandList "function: expandList
  This utility function takes a list of integer values and a list of
  list of integers, and for each integer in the first and each list
  in the second list creates a
  list with that integer as head and the second list as tail. All
  resulting lists are collected in a list and returned."
  input list<Values.Value> inValuesValueLst;
  input list<list<Integer>> inIntegerLstLst;
  output list<list<Integer>> outIntegerLstLst;
algorithm
  outIntegerLstLst := matchcontinue (inValuesValueLst,inIntegerLstLst)
    local
      list<list<Integer>> l1,l2,l,yy,ys;
      list<Values.Value> xx,xs;
      Integer x;
      list<Integer> y;
    
    case ({},_) then {};
    case (_,{}) then {};
    case ((xx as (Values.INTEGER(integer = x) :: xs)),(yy as (y :: ys)))
      equation
        l1 = expandList(xx, ys);
        l2 = expandList(xs, yy);
        l = listAppend(l1, l2);
      then
        ((x :: y) :: l);
    
  end matchcontinue;
end expandList;

protected function insertSubmods "function: insertSubmods
  This function repeatedly calls insertSubmod to incrementally
  insert several sub-modifications."
  input list<DAE.SubMod> inTypesSubModLst1;
  input list<DAE.SubMod> inTypesSubModLst2;
  input Env.Env inEnv3;
  input Prefix.Prefix inPrefix4;
  output list<DAE.SubMod> outTypesSubModLst;
algorithm
  outTypesSubModLst := match (inTypesSubModLst1,inTypesSubModLst2,inEnv3,inPrefix4)
    local
      list<DAE.SubMod> x_1,xs_1,l,xs,y;
      DAE.SubMod x;
      list<Env.Frame> env;
      Prefix.Prefix pre;
    
    case ({},_,_,_) then {};
    case ((x :: xs),y,env,pre)
      equation
        x_1 = insertSubmod(x, y, env, pre);
        xs_1 = insertSubmods(xs, y, env, pre);
        l = listAppend(x_1, xs_1);
      then
        l;
  end match;
end insertSubmods;

protected function insertSubmod "function: insertSubmod
  This function inserts a SubMod into a list of unique SubMods,
  while keeping the uniqueness, merging the submod if necessary."
  input DAE.SubMod inSubMod;
  input list<DAE.SubMod> inTypesSubModLst;
  input Env.Env inEnv;
  input Prefix.Prefix inPrefix;
  output list<DAE.SubMod> outTypesSubModLst;
algorithm
  outTypesSubModLst := matchcontinue (inSubMod,inTypesSubModLst,inEnv,inPrefix)
    local
      DAE.SubMod sub,sub1;
      list<DAE.SubMod> sub2;
    
    case (sub,{},_,_) then {sub};
    /* adrpo 2010-12-08 DO NOT MERGE SUBS as we then cannot catch duplicate modifications like: (w.start = 1, w(start = 2))  
    case (DAE.NAMEMOD(ident = n1,mod = m1),(DAE.NAMEMOD(ident = n2,mod = m2) :: tail),env,pre)
      equation
        true = stringEq(n1, n2);
        m = merge(m1, m2, env, pre);
      then
        (DAE.NAMEMOD(n1,m) :: tail);
    
    case (DAE.IDXMOD(integerLst = i1,mod = m1),(DAE.IDXMOD(integerLst = i2,mod = m2) :: tail),env,pre)
      equation
        equality(i1 = i2);
        m = merge(m1, m2, env, pre);
      then
        (DAE.IDXMOD(i1,m) :: tail);
    */
    case (sub1,sub2,_,_) then (sub1 :: sub2);
  end matchcontinue;
end insertSubmod;

// - Lookup
public function lookupModificationP "function: lookupModificationP
  This function extracts a modification from inside another
  modification, using a name to look up submodifications."
  input DAE.Mod inMod;
  input Absyn.Path inPath;
  output DAE.Mod outMod;
algorithm
  outMod := matchcontinue (inMod,inPath)
    local
      DAE.Mod mod,m,mod_1;
      Ident n;
      Absyn.Path p;
    case (m,Absyn.IDENT(name = n))
      equation
        mod = lookupCompModification(m, n);
      then
        mod;
    case (m,Absyn.FULLYQUALIFIED(p)) then lookupModificationP(m,p);
    case (m,Absyn.QUALIFIED(name = n,path = p))
      equation
        mod = lookupCompModification(m, n);
        mod_1 = lookupModificationP(mod, p);
      then
        mod_1;
    case (_,_)
      equation
        Print.printBuf("- Mod.lookupModificationP failed\n");
      then
        fail();
  end matchcontinue;
end lookupModificationP;

public function lookupCompModification "function: lookupCompModification
  This function is used to look up an identifier in a modification."
  input DAE.Mod inMod;
  input Absyn.Ident inIdent;
  output DAE.Mod outMod;
algorithm
  outMod := match (inMod,inIdent)
    local
      DAE.Mod mod,mod1,mod2;
      list<DAE.SubMod> subs;
      Ident n;
      Option<DAE.EqMod> eqMod;
      SCode.Each e;
      SCode.Final f;
    
    case (DAE.NOMOD(),_) then DAE.NOMOD();
    case (DAE.REDECL(finalPrefix = _),_) then DAE.NOMOD();
    case (DAE.MOD(finalPrefix = f,eachPrefix = e,subModLst = subs,eqModOption = eqMod),n)
      equation
        mod1 = lookupCompModification2(subs, n);
        mod2 = lookupComplexCompModification(eqMod,n,f,e);
        mod = checkDuplicateModifications(mod1,mod2);
      then
        mod;
  end match;
end lookupCompModification;

public function lookupCompModificationFromEqu "function: lookupCompModification
  This function is used to look up an identifier in a modification."
  input DAE.Mod inMod;
  input Absyn.Ident inIdent;
  output DAE.Mod outMod;
algorithm
  outMod := match (inMod,inIdent)
    local
      DAE.Mod mod,mod1,mod2;
      list<DAE.SubMod> subs;
      Ident n;
      Option<DAE.EqMod> eqMod;
      SCode.Each e;
      SCode.Final f;
    
    case (DAE.NOMOD(),_) then DAE.NOMOD();
    case (DAE.REDECL(finalPrefix = _),_) then DAE.NOMOD();
    case (DAE.MOD(finalPrefix=f,eachPrefix=e,subModLst = subs,eqModOption=eqMod),n)
      equation
        mod1 = lookupCompModification2(subs, n);
        mod2 = lookupComplexCompModification(eqMod,n,f,e);
        mod = selectEqMod(mod1, mod2);
      then
        mod;
  end match;
end lookupCompModificationFromEqu;

protected function selectEqMod
"@adrpo:
  This function selects the eqmod modifier if is not DAE.NOMOD! AND IS TYPED!
  Otherwise check for duplicates"
 input DAE.Mod subMod;
 input DAE.Mod eqMod;
 output DAE.Mod mod;
algorithm
  mod := matchcontinue(subMod, eqMod)
    // eqmod is nomod!
    case (subMod, eqMod as DAE.NOMOD()) then subMod;
    case (subMod, eqMod as DAE.MOD(eqModOption = SOME(DAE.TYPED(modifierAsExp = _)))) then eqMod;
    case (subMod, eqMod)
      equation
        mod = checkDuplicateModifications(subMod,eqMod);
      then
        mod;
  end matchcontinue;
end selectEqMod;

public function lookupCompModification12 "function: lookupCompModification
Author: BZ, 2009-07
Function for looking up modifiers on specific component.
And put it in a DAE.Mod(Types.NAMEDMOD(comp,mod)) format."
  input DAE.Mod inMod;
  input Absyn.Ident inIdent;
  output DAE.Mod outMod;
algorithm
  outMod := matchcontinue (inMod,inIdent)
    local
      DAE.Mod mod,mod1,mod2,m;
      list<DAE.SubMod> subs;
      Ident n,i;
      Option<DAE.EqMod> eqMod;
      SCode.Each e;
      SCode.Final f;
    
    case(inMod,inIdent)
      equation
        DAE.NOMOD() = lookupCompModification(inMod,inIdent);
      then
        DAE.NOMOD();
    
    case(inMod,inIdent)
      equation
        (m as DAE.MOD(_,_, {}, SOME(_))) = lookupCompModification(inMod,inIdent);
      then
        m;
    
    case(inMod,inIdent)
      equation
        m = lookupCompModification(inMod,inIdent);
      then
        DAE.MOD(SCode.NOT_FINAL(), SCode.NOT_EACH(), {DAE.NAMEMOD(inIdent,m)},NONE());
  end matchcontinue;
end lookupCompModification12;

protected function lookupComplexCompModification "Lookups a component modification from a complex constructor
(e.g. record constructor) by name."
  input Option<DAE.EqMod> eqMod;
  input Absyn.Ident n;
  input SCode.Final finalPrefix;
  input SCode.Each each_;
  output DAE.Mod outMod;
algorithm
  outMod := matchcontinue(eqMod,n,finalPrefix,each_)
    local 
      list<Values.Value> values;
      list<String> names;
      list<DAE.Var> varLst;
      DAE.Mod mod;
      DAE.Exp e;
    
    case(NONE(),_,_,_) then DAE.NOMOD();
    
    case(SOME(DAE.TYPED(e,SOME(Values.RECORD(_,values,names,-1)),
                        DAE.PROP(DAE.T_COMPLEX(varLst = varLst),_),_)),
         n,finalPrefix,each_) 
      equation
        mod = lookupComplexCompModification2(values,names,varLst,n,finalPrefix,each_);
      then mod;
    
    case(_,_,_,_) then DAE.NOMOD();
    
  end matchcontinue;
end lookupComplexCompModification;

protected function lookupComplexCompModification2 "Help function to lookupComplexCompModification"
  input list<Values.Value> inValues;
  input list<Ident> inNames;
  input list<DAE.Var> inVars;
  input String name;
  input SCode.Final finalPrefix;
  input SCode.Each each_;
  output DAE.Mod mod;
algorithm
  mod := matchcontinue(inValues,inNames,inVars,name,finalPrefix,each_)
    local 
      DAE.Type tp;
      Values.Value v; 
      String name1,name2;
      DAE.Exp e;
      list<Values.Value> values;
      list<Ident> names;
      list<DAE.Var> vars;
      
    case(v::_,name1::_,DAE.TYPES_VAR(name=name2,ty=tp)::_,name,finalPrefix,each_) 
      equation
        true = (name1 ==& name2);
        true = (name2 ==& name);
        e = ValuesUtil.valueExp(v);
      then 
        DAE.MOD(finalPrefix,each_,{},SOME(DAE.TYPED(e,SOME(v),DAE.PROP(tp,DAE.C_CONST()),NONE())));

    case(_::values,_::names,_::vars,name,finalPrefix,each_) 
      equation
        mod = lookupComplexCompModification2(values,names,vars,name,finalPrefix,each_);
      then 
        mod;

  end matchcontinue;
end lookupComplexCompModification2;

protected function checkDuplicateModifications "Checks if two modifiers are present, and in that case
print error of duplicate modifications, if not, the one modification having a value is returned"
  input DAE.Mod mod1;
  input DAE.Mod mod2;
  output DAE.Mod outMod;
algorithm
  outMod := matchcontinue(mod1,mod2)
    local 
      String s1,s2,s;

    case(DAE.NOMOD(),mod2) then mod2;
    case(mod1,DAE.NOMOD()) then mod1;
    // if they are equal, return the second one!
    case(mod1,mod2) 
      equation
        true = modEqual(mod1, mod2);
      then mod2;
    // print error message
    case(mod1,mod2) equation
      s1 = printModStr(mod1);
      s2 = printModStr(mod2);
      s = s1 +& " and " +& s2;
      Error.addMessage(Error.DUPLICATE_MODIFICATIONS,{s});
    then fail();
  end matchcontinue;
end checkDuplicateModifications;

protected function lookupNamedModifications 
"@author: adrpo
 returns a list of matching name modifications"
  input list<DAE.SubMod> inSubModLst;
  input Absyn.Ident inIdent;
  output list<DAE.SubMod> outSubModLst;
algorithm
  outSubModLst := matchcontinue (inSubModLst,inIdent)
    local
      Ident id1,id2;
      DAE.SubMod x;
      list<DAE.SubMod> rest, lst;
      
    // empty case
    case ({},_) then {};
    
    // found our modification  
    case ((x  as DAE.NAMEMOD(ident = id1)) :: rest,id2)
      equation
        true = stringEq(id1, id2);
        lst = lookupNamedModifications(rest, id2);
      then
        x :: lst;
    
    // a named modification that doesn't match, skip it 
    case ((x  as DAE.NAMEMOD(ident = id1)) :: rest,id2)
      equation
        false = stringEq(id1, id2);
        lst = lookupNamedModifications(rest, id2);
      then
        lst;

    // an index modification, skip it 
    case ((DAE.IDXMOD(integerLst=_) :: rest),id2)
      equation
        lst = lookupNamedModifications(rest, id2);
      then
        lst;
  end matchcontinue;
end lookupNamedModifications;

public function printSubsStr
"@author: adrpo
 Prints sub-mods in a string with format (sub1, sub2, sub3)"
  input list<DAE.SubMod> inSubMods;
  input Boolean addParan;
  output String s;
algorithm
  s := stringDelimitList(List.map(inSubMods, prettyPrintSubmod), ", ");
  s := Util.if_(addParan,"(","") +& s +& Util.if_(addParan,")","");
end printSubsStr;

protected function tryMergeSubMods
"@author: adrpo
  This function tries to merge the mods."
  input list<DAE.SubMod> inSubModLst;
  output DAE.Mod mod;
algorithm
  mod := matchcontinue(inSubModLst)
    local
      list<DAE.SubMod> rest;
      DAE.SubMod x;
      DAE.Mod mod1, mod2;
      list<FullMod> fullMods;
    
    case ({}) then fail();
    
    case ({DAE.NAMEMOD(mod=mod)}) then mod;
    case ({DAE.IDXMOD(mod=mod)}) then mod;
    
    case ((x as DAE.NAMEMOD(mod=mod1))::rest)
      equation
        // make sure x is not present in the rest
        fullMods = getFullModsFromSubMods(ComponentReference.makeCrefIdent("", DAE.T_UNKNOWN_DEFAULT, {}), inSubModLst);
        // print("FullModsTry: " +& stringDelimitList(List.map1(fullMods, prettyPrintFullMod, 1), " ||| ") +& "\n");
        checkDuplicatesInFullMods(fullMods, Prefix.NOPRE(), "", Absyn.dummyInfo, false);
        mod2 = tryMergeSubMods(rest);
        mod = merge(mod1, mod2, {}, Prefix.NOPRE());
      then
        mod;
    case ((x as DAE.IDXMOD(mod=mod1))::rest)
      equation
        // make sure x is not present in the rest
        fullMods = getFullModsFromSubMods(ComponentReference.makeCrefIdent("", DAE.T_UNKNOWN_DEFAULT, {}), inSubModLst);
        // print("FullModsTry: " +& stringDelimitList(List.map1(fullMods, prettyPrintFullMod, 1), " ||| ") +& "\n");
        checkDuplicatesInFullMods(fullMods, Prefix.NOPRE(), "", Absyn.dummyInfo, false);
        mod2 = tryMergeSubMods(rest);
        mod = merge(mod1, mod2, {}, Prefix.NOPRE());
      then
        mod;
  end matchcontinue;
end tryMergeSubMods;

protected function lookupCompModification2 "function: lookupCompModification2
  This function is just a helper to lookupCompModification"
  input list<DAE.SubMod> inSubModLst;
  input Absyn.Ident inIdent;
  output DAE.Mod outMod;
algorithm
  outMod := matchcontinue (inSubModLst,inIdent)
    local
      Ident id;
      DAE.Mod mod;
      list<DAE.SubMod> duplicates, tail;
      DAE.SubMod head;
      
      
    // empty case, return DAE.NOMOD()
    case ({},_) then DAE.NOMOD();
    
    // found no modifs that match, return DAE.NOMOD();
    case (inSubModLst,id)
      equation
        {} = lookupNamedModifications(inSubModLst, id);
      then
        DAE.NOMOD();
      
    // found our modification and is not duplicate, only one 
    case (inSubModLst,id)
      equation
        {DAE.NAMEMOD(mod=mod)} = lookupNamedModifications(inSubModLst, id);
      then
        mod;

    // adrpo: we need to try to merge the duplicates as they might not be duplicates at all!
    //        i.e. (r.start = 5, r.stateSelect=StateSelect.prefer), this would generate a warning!
    case (inSubModLst,id)
      equation
        duplicates = lookupNamedModifications(inSubModLst, id);
        mod = tryMergeSubMods(duplicates);
      then
        mod;
    
    // found our modification and there are more duplicates present, ignore, it will be caught later 
    case (inSubModLst,id)
      equation
        duplicates = lookupNamedModifications(inSubModLst, id);
        (head::tail) = duplicates;
        DAE.NAMEMOD(mod=mod) = head;
        /*
        s = printSubsStr(duplicates, true);
        s1 = prettyPrintSubmod(head);
        s1 = "(" +& s1 +& ")";
        s2 = printSubsStr(tail, true);
        Error.addMessage(Error.DUPLICATE_MODIFICATIONS_WARNING, {id, s, s1, s2});
        */
      then
        mod;
    
    case (inSubModLst,inIdent)
      equation
        true = Flags.isSet(Flags.FAILTRACE);
        Debug.traceln("- Mod.lookupCompModification2 failed while searching for:" +& 
          inIdent +& " inside mofifications: " +&
          printModStr(DAE.MOD(SCode.NOT_FINAL(),SCode.NOT_EACH(),inSubModLst,NONE())));
      then
        fail();
  end matchcontinue;
end lookupCompModification2;

public function lookupIdxModification "function: lookupIdxModification
  This function extracts modifications to an array element, using an
  integer to index the modification."
  input DAE.Mod inMod;
  input Integer inInteger;
  output DAE.Mod outMod;
algorithm
  outMod := matchcontinue (inMod,inInteger)
    local
      DAE.Mod mod_1,mod_2,mod_3,inmod,mod;
      list<DAE.SubMod> subs_1,subs;
      Option<DAE.EqMod> eq_1,eq;
      SCode.Final f;
      SCode.Each each_;
      Integer idx;
      Ident str,s;
    
    case (DAE.NOMOD(),_) then DAE.NOMOD();
    case (DAE.REDECL(finalPrefix = _),_) then DAE.NOMOD();
    case ((inmod as DAE.MOD(finalPrefix = f,eachPrefix = each_,subModLst = subs,eqModOption = eq)),idx)
      equation
        (mod_1,subs_1) = lookupIdxModification2(subs,idx);
        mod_2 = merge(DAE.MOD(f,each_,subs_1,NONE()), mod_1, {}, Prefix.NOPRE());
        eq_1 = indexEqmod(eq, {idx});
        mod_3 = merge(mod_2, DAE.MOD(SCode.NOT_FINAL(),each_,{},eq_1), {}, Prefix.NOPRE());
      then
        mod_3;
    case (mod,idx)
      equation
        true = Flags.isSet(Flags.FAILTRACE);
        Debug.fprint(Flags.FAILTRACE, "- Mod.lookupIdxModification(");
        str = printModStr(mod);
        Debug.fprint(Flags.FAILTRACE, str);
        Debug.fprint(Flags.FAILTRACE, ", ");
        s = intString(idx);
        Debug.fprint(Flags.FAILTRACE, s);
        Debug.fprint(Flags.FAILTRACE, ") failed\n");
      then
        fail();
  end matchcontinue;
end lookupIdxModification;

protected function lookupIdxModification2 "function: lookupIdxModification2
  This function does part of the job for lookupIdxModification."
  input list<DAE.SubMod> inTypesSubModLst;
  input Integer inInteger;
  output DAE.Mod outMod;
  output list<DAE.SubMod> outTypesSubModLst;
algorithm
  (outMod,outTypesSubModLst) := matchcontinue (inTypesSubModLst,inInteger)
    local
      list<DAE.SubMod> subs_1,subs,xs_1;
      Integer x,y,idx;
      DAE.Mod mod,mod_1,nmod_1,nmod;
      list<Integer> xs;
      Ident name;
      DAE.SubMod sm;
      list<DAE.SubMod> sms;
    
    case ({},_) then (DAE.NOMOD(),{});
    
    case ((DAE.IDXMOD(integerLst = {x},mod = mod) :: subs),y) /* FIXME: Redeclaration */
      equation
        true = intEq(x, y);
        (DAE.NOMOD(),subs_1) = lookupIdxModification2(subs,y);
      then
        (mod,subs_1);

    case ((DAE.IDXMOD(integerLst = (x :: xs),mod = mod) :: subs),y)
      equation
        true = intEq(x, y);
        (mod_1,subs_1) = lookupIdxModification2(subs,y);
      then
        (mod_1,(DAE.IDXMOD(xs,mod) :: subs_1));
    
    case ((DAE.IDXMOD(integerLst = (x :: xs),mod = mod) :: subs),y)
      equation
        false = intEq(x, y);
        (mod_1,subs_1) = lookupIdxModification2(subs,y);
      then
        (mod_1,subs_1);
    
    case ((DAE.NAMEMOD(ident = name,mod = nmod) :: subs),y)
      equation
        DAE.NOMOD() = lookupIdxModification3(nmod, y);
        (mod_1,subs_1) = lookupIdxModification2(subs,y);
      then
        (mod_1,subs_1);
    
    case ((DAE.NAMEMOD(ident = name,mod = nmod) :: subs),y)
      equation
        nmod_1 = lookupIdxModification3(nmod, y);
        (mod_1,subs_1) = lookupIdxModification2(subs,y);
      then
        (mod_1,(DAE.NAMEMOD(name,nmod_1) :: subs_1));
    
    case ((sm :: sms),idx)
      equation
        (mod,xs_1) = lookupIdxModification2(sms,idx);
      then
        (mod,(sm :: xs_1));
    
    case (_,_)
      equation
       Debug.fprint(Flags.FAILTRACE, "- Mod.lookupIdxModification2 failed\n");
      then
        fail();
  end matchcontinue;
end lookupIdxModification2;

protected function lookupIdxModification3 "function: lookupIdxModification3
  Helper function to lookup_idx_modification2.
  when looking up index of a named mod, e.g. y={1,2,3}, it should
  subscript the expression {1,2,3} to corresponding index."
  input DAE.Mod inMod;
  input Integer inInteger;
  output DAE.Mod outMod;
algorithm
  outMod := matchcontinue (inMod,inInteger)
    local
      Option<DAE.EqMod> eq_1,eq;
      SCode.Final f;
      list<DAE.SubMod> subs,subs_1;
      Integer idx;
    
    case (DAE.NOMOD(),_) then DAE.NOMOD();  /* indx */
    case (DAE.REDECL(finalPrefix = _),_) then inMod;
    case (DAE.MOD(finalPrefix = f,eachPrefix = SCode.NOT_EACH(),subModLst = subs,eqModOption = eq),idx)
      equation
        (_,subs_1) = lookupIdxModification2(subs,idx);
        eq_1 = indexEqmod(eq, {idx});
      then
        DAE.MOD(f,SCode.NOT_EACH(),subs_1,eq_1);
    case (DAE.MOD(finalPrefix = f,eachPrefix = SCode.EACH(),subModLst = subs,eqModOption = eq),idx) 
      then DAE.MOD(f,SCode.EACH(),subs,eq);
    case (inMod,idx) 
      equation
      true = Flags.isSet(Flags.FAILTRACE);
      Debug.fprintln(Flags.FAILTRACE, "- Mod.lookupIdxModification3 failed for mod: \n" +&
                     printModStr(inMod) +& "\n for index:" +& intString(idx));
    then fail();
  end matchcontinue;
end lookupIdxModification3;

protected function indexEqmod "function: indexEqmod
  If there is an equation modification, this function can subscript
  it using the provided indexing expressions.  This is used when a
  modification equates an array variable with an array expression.
  This expression will be expanded to produce one equation
  expression per array component."
  input Option<DAE.EqMod> inTypesEqModOption;
  input list<Integer> inIntegerLst;
  output Option<DAE.EqMod> outTypesEqModOption;
algorithm
  outTypesEqModOption := matchcontinue (inTypesEqModOption,inIntegerLst)
    local
      Option<DAE.EqMod> emod;
      DAE.Type t_1,t;
      DAE.Exp e,exp,exp2;
      Values.Value e_val_1,e_val;
      DAE.Const c;
      Integer x;
      list<Integer> xs;
      DAE.EqMod eq;
      String exp_str;

    case (NONE(),_) then NONE();
    case (emod,{}) then emod;

    // Subscripting empty array gives no value. This is needed in e.g. fill(1.0,0,2) 
    case (SOME(DAE.TYPED(_,SOME(Values.ARRAY(valueLst = {})),_,_)),xs) then NONE();

    // For modifiers with value, retrieve nth element
    case (SOME(DAE.TYPED(e,SOME(e_val),DAE.PROP(t,c),_)),(x :: xs))
      equation
        t_1 = Types.unliftArray(t);
        exp2 = DAE.ICONST(x);
        (exp,_) = ExpressionSimplify.simplify1(Expression.makeASUB(e,{exp2}));
        e_val_1 = ValuesUtil.nthArrayelt(e_val, x);
        emod = indexEqmod(SOME(DAE.TYPED(exp,SOME(e_val_1),DAE.PROP(t_1,c),NONE())), xs);
      then
        emod;

    // For modifiers without value, apply subscript operator
    case (SOME(DAE.TYPED(e,NONE(),DAE.PROP(t,c),_)),(x :: xs))
      equation
        t_1 = Types.unliftArray(t);
        exp2 = DAE.ICONST(x);
        (exp,_) = ExpressionSimplify.simplify1(Expression.makeASUB(e,{exp2}));
        emod = indexEqmod(SOME(DAE.TYPED(exp,NONE(),DAE.PROP(t_1,c),NONE())), xs);
      then
        emod;

    case (SOME(DAE.TYPED(modifierAsExp = exp, properties = DAE.PROP(type_ = t))), _)
      equation
        // Trying to apply a non-array modifier to an array, which isn't really
        // allowed but working anyway. Some standard Modelica libraries are
        // missing the 'each' keyword though (e.g. the DoublePendulum example),
        // and therefore relying on this behaviour, so just print a warning here.
        failure(t_1 = Types.unliftArray(t));
        exp_str = ExpressionDump.printExpStr(exp);
        Error.addMessage(Error.MODIFIER_NON_ARRAY_TYPE_WARNING, {exp_str});
      then 
        fail();

    case (SOME(eq),inIntegerLst) 
      equation
        true = Flags.isSet(Flags.FAILTRACE);
        Debug.fprintln(Flags.FAILTRACE, "- Mod.indexEqmod failed for mod:\n " +&
               Types.unparseEqMod(eq) +& "\n indexes:" +&
               stringDelimitList(List.map(inIntegerLst, intString), ", "));
      then fail();
  end matchcontinue;
end indexEqmod;

public function merge "
A mid step for merging two modifiers.
It validates that the merging is allowed(considering final modifier)."
  input DAE.Mod inModOuter "the outer mod which should overwrite the inner mod";
  input DAE.Mod inModInner "the inner mod";
  input Env.Env inEnv;
  input Prefix.Prefix inPrefix;
  output DAE.Mod outMod;
algorithm 
  outMod:= matchcontinue (inModOuter,inModInner,inEnv,inPrefix)
    local
      DAE.Mod m;
      list<DAE.SubMod> submods;
      String strPrefix, s;
      Option<Absyn.Path> p;
      
    case (DAE.NOMOD(),DAE.NOMOD(),_,_) then DAE.NOMOD();
    case (DAE.NOMOD(),m,_,_) then m;
    case (m,DAE.NOMOD(),_,_) then m;
      
    case(inModOuter,inModInner,inEnv,inPrefix)
      equation
        true = merge2(inModInner);
      then doMerge(inModOuter,inModInner,inEnv,inPrefix);

    case(inModOuter,inModInner,inEnv,inPrefix)
      equation
        true = modSubsetOrEqualOrNonOverlap(inModOuter,inModInner);
      then doMerge(inModOuter,inModInner,inEnv,inPrefix);

    // two exactly the same redeclares, return just one!
    case(inModOuter as DAE.REDECL(finalPrefix = _),inModInner  as DAE.REDECL(finalPrefix = _),inEnv,inPrefix)
      equation
        true = valueEq(inModOuter,inModInner);
      then 
        inModOuter;

    case(inModOuter,inModInner,inEnv,inPrefix)
      equation
        false = merge2(inModInner);
        false = modSubsetOrEqualOrNonOverlap(inModOuter,inModInner);
        p = Env.getEnvPath(inEnv);
        s = Absyn.optPathString(p);
        // put both modifiers in one big modifier
        strPrefix = PrefixUtil.printPrefixStrIgnoreNoPre(inPrefix);
        submods = {DAE.NAMEMOD("", inModOuter), DAE.NAMEMOD("", inModInner)};
        m = DAE.MOD(SCode.NOT_FINAL(), SCode.NOT_EACH(), submods, NONE());
        s = s +& "\n\tby using modifiers: " +&  strPrefix +& printSubsStr(submods, true) +& 
        " that do not agree.";
        
        Error.addMessage(Error.FINAL_OVERRIDE, {s}); // having a string there incase we
        // print(" final override: " +& s +& "\n ");
        // print("trying to override final while merging mod1:\n" +& printModStr(inModOuter) +& " with mod2(final):\n" +& printModStr(inModInner) +& "\n");
      then fail();
  end matchcontinue;
end merge;

public function merge2 "
This function validates that the inner modifier is not final.
Helper function for merge"
  input DAE.Mod inMod1;
  output Boolean outMod;
algorithm 
  outMod:= matchcontinue (inMod1)
    local
      case (DAE.REDECL(tplSCodeElementModLst = 
            {(SCode.COMPONENT(prefixes=SCode.PREFIXES(finalPrefix=SCode.FINAL())),_)}))
        then false;
      case(DAE.MOD(finalPrefix = SCode.FINAL()))
        then false;
      case(_) then true;
  end matchcontinue;
end merge2;

// - Merging

protected function doMerge "function: merge 
  This function merges two modifications into one.
  The first argument is the *outer* modification that 
  should take precedence over the *inner* modification."
  input DAE.Mod inModOuter "the outer mod which should overwrite the inner mod";
  input DAE.Mod inModInner "the inner mod";
  input Env.Env inEnv3;
  input Prefix.Prefix inPrefix4;
  output DAE.Mod outMod;
algorithm
  outMod := matchcontinue (inModOuter,inModInner,inEnv3,inPrefix4)
    local
      DAE.Mod m,m1_1,m2_1,m_2,mod,mods,outer_,inner_,mm1,mm2,mm3,cm,icm;
      SCode.Visibility vis;
      SCode.Final finalPrefix,f,f1,f2;
      SCode.Replaceable r;
      SCode.Redeclare redecl;
      Absyn.InnerOuter io;
      Ident id1,id2;
      SCode.Attributes attr;
      Absyn.TypeSpec tp;
      SCode.Mod m1,m2;
      Option<SCode.Comment> comment,comment2;
      list<Env.Frame> env;
      Prefix.Prefix pre;
      list<tuple<SCode.Element, DAE.Mod>> els;
      list<DAE.SubMod> subs,subs1,subs2;
      Option<DAE.EqMod> ass,ass1,ass2;
      SCode.Each each1,each2;
      Option<Absyn.Exp> cond;
      Absyn.Info info;
      SCode.Element celm,elementOne;
      SCode.ClassDef cdef;
      SCode.Encapsulated ep;
      SCode.Partial pp;
      SCode.Restriction res;
      SCode.Prefixes pf;
    
    //case (inModOuter,inModInner,_,_)
    //  equation
    //    print("Merging: " +& printModStr(inModOuter) +& " with " +& printModStr(inModInner) +& "\n");
    //  then 
    //    fail();
    
    case (m,DAE.NOMOD(),_,_) then m;
        
    // redeclaring same component
    case (DAE.REDECL(finalPrefix = f1,eachPrefix = each1, tplSCodeElementModLst =
    {(SCode.COMPONENT(name = id1,
      prefixes =  SCode.PREFIXES(vis, redecl, f, io, r),
      attributes = attr,typeSpec = tp,modifications = m1,comment=comment,condition=cond,info=info),_)}),
      DAE.REDECL(finalPrefix = f2, eachPrefix = each2, tplSCodeElementModLst =
      {(SCode.COMPONENT(
        name = id2,
        modifications = m2,
        comment = comment2),_)}),env,pre)
      equation
        true = stringEq(id1, id2);
        m1_1 = elabUntypedMod(m1, env, pre);
        m2_1 = elabUntypedMod(m2, env, pre);
        m_2 = merge(m1_1, m2_1, env, pre);
      then
        DAE.REDECL(f1,each1,{(SCode.COMPONENT(id1,SCode.PREFIXES(vis, redecl, f, io, r),attr,tp,SCode.NOMOD(),comment,cond,info),m_2)});

    // Redeclaring same class.
    case (DAE.REDECL(finalPrefix = f1, eachPrefix = each1, tplSCodeElementModLst = 
            {(SCode.CLASS(name = id1, prefixes = pf, encapsulatedPrefix = ep, 
            partialPrefix = pp, restriction = res, classDef = cdef, info = info), 
            m1_1)}), 
          DAE.REDECL(finalPrefix = f2, eachPrefix = each2, tplSCodeElementModLst = 
            {(SCode.CLASS(name = id2), m2_1)}), env, pre)
      equation
        true = stringEq(id1, id2);
        m = merge(m1_1, m2_1, env, pre);
      then
        DAE.REDECL(f1, each1, {(SCode.CLASS(id1, pf, ep, pp, res, cdef, info), m)});
      
    // luc_pop : this shoud return the first mod because it have been merged in merge_subs
    case ((mod as DAE.REDECL(finalPrefix = f1,tplSCodeElementModLst = (els as {(SCode.COMPONENT(name = id1),_)}))),(mods as DAE.MOD(subModLst = subs)),env,pre) then mod;
    
    case ((icm as DAE.MOD(subModLst = subs)),DAE.REDECL(finalPrefix = f1, eachPrefix = each1, tplSCodeElementModLst = (els as {( (celm as SCode.COMPONENT(name = id1)),cm)})),env,pre)
      equation
        cm = merge(icm,cm,env,pre);
      then
        DAE.REDECL(f1,each1,{(celm,cm)});

    // When modifiers are identical
    case (outer_,inner_,_,_)
      equation                
        // adrpo: TODO! FIXME! why isn't modEqual working here??!! 
        // true = modEqual(outer_, inner_);
        equality(outer_ = inner_);
      then
        outer_;

    case (DAE.MOD(finalPrefix = finalPrefix,eachPrefix = each1,subModLst = subs1,eqModOption = ass1),
          DAE.MOD(finalPrefix = _/* SCode.NOT_FINAL(), see case above.*/,eachPrefix = each2,subModLst = subs2,eqModOption = ass2),env,pre)
      equation
        subs = mergeSubs(subs1, subs2, env, pre);
        ass = mergeEq(ass1, ass2);
      then
        DAE.MOD(finalPrefix,each1,subs,ass);
    
    /* Case when we have a modifier on a redeclared class
     * This is of current date BZ:2008-03-04 not completly working.
     * see testcase mofiles/Modification14.mo
     */
    case (mm1 as DAE.MOD(subModLst = subs), 
          mm2 as DAE.REDECL(finalPrefix = SCode.NOT_FINAL(),eachPrefix = each1, tplSCodeElementModLst = (els as {((elementOne as SCode.CLASS(name = id1)),mm3)})),env,pre)
      equation
        mm1 = merge(mm1,mm3,env,pre );
      then DAE.REDECL(SCode.NOT_FINAL(),each1,{(elementOne,mm1)});

    case (mm2 as DAE.REDECL(finalPrefix = SCode.NOT_FINAL(),eachPrefix = each1, tplSCodeElementModLst = (els as {((elementOne as SCode.CLASS(name = id1)),mm3)})),
          mm1 as DAE.MOD(subModLst = subs),env,pre)
      equation
        mm1 = merge(mm3,mm1,env,pre );
      then 
        DAE.REDECL(SCode.NOT_FINAL(),each1,{(elementOne,mm1)});
    
  end matchcontinue;
end doMerge;

protected function mergeSubs "function: mergeSubs
  This function merges to list of DAE.SubMods."
  input list<DAE.SubMod> inTypesSubModLst1;
  input list<DAE.SubMod> inTypesSubModLst2;
  input Env.Env inEnv3;
  input Prefix.Prefix inPrefix4;
  output list<DAE.SubMod> outTypesSubModLst;
algorithm
  outTypesSubModLst := matchcontinue (inTypesSubModLst1,inTypesSubModLst2,inEnv3,inPrefix4)
    local
      list<DAE.SubMod> s1,s2,s2_new,s_rec;
      DAE.SubMod s,s_first;
      list<Env.Frame> env;
      Prefix.Prefix pre;
    
    case ({},s1,_,_) then s1;
    case (s1,{},_,_) then s1;
    case((s::s1),s2,env,pre) // outer, inner, env, pre
      equation
        (s_first,s2_new) = mergeSubs2_2(s,s2,env,pre);
        s_rec = mergeSubs(s1,s2_new,env,pre);
      then
        (s_first::s_rec);
  end matchcontinue;
end mergeSubs;

protected function mergeSubs2_2 "
Author: BZ, 2009-07
Helper function for mergeSubs, used to detect failures in Mod.merge"
  input DAE.SubMod inSubMod;
  input list<DAE.SubMod> inTypesSubModLst;
  input Env.Env inEnv;
  input Prefix.Prefix inPrefix;
  output DAE.SubMod outSubMod;
  output list<DAE.SubMod> outTypesSubModLst;
algorithm
  (outSubMod,outTypesSubModLst) := matchcontinue (inSubMod,inTypesSubModLst,inEnv,inPrefix)
    local
      DAE.SubMod sm,s,s1,s2;
      DAE.Mod m,m1,m2;
      Ident n1,n2;
      list<DAE.SubMod> ss,ss_1;
      list<Env.Frame> env;
      Prefix.Prefix pre;
      list<Integer> i1,i2;
    
    // empty list  
    case (sm,{},_,_) then (sm,{});
    
    // named mods, modifications in the list take precedence
    case (DAE.NAMEMOD(ident = n1,mod = m1),(DAE.NAMEMOD(ident = n2,mod = m2) :: ss),env,pre)      
      equation
        true = stringEq(n1, n2);
        m = merge(m1, m2, env, pre);
      then
        (DAE.NAMEMOD(n1,m),ss);
    
    // indexed mods, modifications in the list take precedence
    case (DAE.IDXMOD(integerLst = i1,mod = m1),(DAE.IDXMOD(integerLst = i2,mod = m2) :: ss),env,pre)      
      equation
        equality(i1 = i2);
        m = merge(m1, m2, env, pre);
      then
        (DAE.IDXMOD(i1,m),ss);
    
    // handle next
    case (s1,(s2::ss),env,pre)
      equation
        true = verifySubMerge(s1,s2);
        (s,ss_1) = mergeSubs2_2(s1, ss, env, pre);
      then
        (s,s2::ss_1);
  end matchcontinue;
end mergeSubs2_2;

protected function mergeSubs2 "function: mergeSubs2
  This function helps in the merging of two lists of DAE.SubMods.  
  It compares one DAE.SubMod against a list of other DAE.SubMods, 
  and if there is one with the same name, it is kept and the one 
  DAE.SubMod given in the second argument is discarded."
  input list<DAE.SubMod> inTypesSubModLst;
  input DAE.SubMod inSubMod;
  input Env.Env inEnv;
  input Prefix.Prefix inPrefix;
  output list<DAE.SubMod> outTypesSubModLst;
  output DAE.SubMod outSubMod;
algorithm
  (outTypesSubModLst,outSubMod) := matchcontinue (inTypesSubModLst,inSubMod,inEnv,inPrefix)
    local
      DAE.SubMod sm,s,s1,s2;
      DAE.Mod m,m1,m2;
      Ident n1,n2;
      list<DAE.SubMod> ss,ss_1;
      list<Env.Frame> env;
      Prefix.Prefix pre;
      list<Integer> i1,i2;
    
    // empty list
    case ({},sm,_,_) then ({},sm);
    
    // named mods, modifications in the list take precedence
    case ((DAE.NAMEMOD(ident = n1,mod = m1) :: ss),DAE.NAMEMOD(ident = n2,mod = m2),env,pre)
      equation
        true = stringEq(n1, n2);
        m = merge(m1, m2, env, pre);
      then
        (ss,DAE.NAMEMOD(n1,m));
    
    // indexed mods, modifications in the list take precedence
    case ((DAE.IDXMOD(integerLst = i1,mod = m1) :: ss),DAE.IDXMOD(integerLst = i2,mod = m2),env,pre)
      equation
        equality(i1 = i2);
        m = merge(m1, m2, env, pre);
      then
        (ss,DAE.IDXMOD(i1,m));
    
    // handle rest
    case ((s1 :: ss),s2,env,pre)
      equation
        true = verifySubMerge(s1,s2);
        (ss_1,s) = mergeSubs2(ss, s2, env, pre);
      then
        ((s1 :: ss_1),s);
  end matchcontinue;
end mergeSubs2;

protected function verifySubMerge "
function to verify that we did not fail the cases where 
we should merge subs (helper function for mergeSubs2)"
  input DAE.SubMod sub1;
  input DAE.SubMod sub2;
  output Boolean b;
algorithm 
  b := matchcontinue(sub1,sub2)
    local list<Integer> i1,i2; String n1,n2;
    
    case (DAE.NAMEMOD(ident = n1),DAE.NAMEMOD(ident = n2))
      equation 
        true = stringEq(n1, n2);
      then false;
    
    case (DAE.IDXMOD(integerLst = i1),DAE.IDXMOD(integerLst = i2))
      equation 
        equality(i1 = i2);
      then false;
    
    case(_,_) then true;
  end matchcontinue;
end verifySubMerge;

protected function mergeEq "function: mergeEq
  The outer modification, given in the first argument, 
  takes precedence over the inner modifications."
  input Option<DAE.EqMod> inTypesEqModOption1;
  input Option<DAE.EqMod> inTypesEqModOption2;
  output Option<DAE.EqMod> outTypesEqModOption;
algorithm
  outTypesEqModOption := match (inTypesEqModOption1,inTypesEqModOption2)
    local Option<DAE.EqMod> e;
    // Outer assignments take precedence
    case ((e as SOME(DAE.TYPED(modifierAsExp = _))),_) then e;
    case ((e as SOME(DAE.UNTYPED(_))),_) then e;
    case (NONE(),e) then e;
  end match;
end mergeEq;

public function modEquation "function: modEquation
  This function simply extracts the equation part of a modification."
  input DAE.Mod inMod;
  output Option<DAE.EqMod> outTypesEqModOption;
algorithm
  outTypesEqModOption := match (inMod)
    local Option<DAE.EqMod> e;
    case DAE.NOMOD() then NONE();
    case DAE.REDECL(finalPrefix = _) then NONE();
    case DAE.MOD(eqModOption = e) then e;
  end match;
end modEquation;

protected function modSubsetOrEqualOrNonOverlap "
same as modEqual with the difference that we allow:
 outer(input arg1: mod1) - modifier to be a subset of
 inner(input arg2: mod2) - modifier,
 IF the subset is cotained in mod2 and those subset matches are equal
 or if outer(expr=NONE()) with inner(expr=(SOME))"
  input DAE.Mod mod1;
  input DAE.Mod mod2;
  output Boolean equal;
algorithm
  equal := matchcontinue(mod1,mod2)
    local 
      SCode.Final f1,f2;
      SCode.Each each1,each2;
      list<DAE.SubMod> submods1,submods2;
      Option<DAE.EqMod> eqmod1,eqmod2;
      Boolean b;

    // adrpo: handle non-overlap: final parameter Real eAxis_ia[3](each final unit="1") = {1,2,3};
    //        mod1 = final each unit="1" mod2 = final = {1,2,3}
    //        otherwise we get an error as: Error: Variable eAxis_ia: trying to override final variable ...
    case(DAE.MOD(f1,each1,submods1,NONE()),DAE.MOD(f2,SCode.NOT_EACH(),{},eqmod2 as SOME(_)))
      equation
        b = valueEq(f1,f2);
      then b;

    // handle subset equal
    case(DAE.MOD(f1,each1,submods1,eqmod1),DAE.MOD(f2,each2,submods2,eqmod2))
      equation
        true = valueEq(f1,f2);
        true = SCode.eachEqual(each1,each2);
        true = subModsEqual(submods1,submods2);
        true = eqModSubsetOrEqual(eqmod1,eqmod2);
      then 
        true;
    case(DAE.REDECL(_,_,_),DAE.REDECL(_,_,_))
      then false;
    case(DAE.NOMOD(),DAE.NOMOD()) then true;
    case(mod1, mod2) then false;
    case(mod1, mod2) 
      equation
        //true = Flags.isSet(Flags.FAILTRACE);
        //Debug.traceln("- Mod.modSubsetOrEqualOrNonOverlap failed on: " +& 
        //   " mod1: " +& printModStr(mod1) +& 
        //   " mod2: " +& printModStr(mod2));
      then
        fail();
  end matchcontinue;
end modSubsetOrEqualOrNonOverlap;

protected function eqModSubsetOrEqual "
Returns true if two EqMods are equal or outer(input arg1) is NONE"
  input Option<DAE.EqMod> eqMod1;
  input Option<DAE.EqMod> eqMod2;
  output Boolean equal;
algorithm
  equal := matchcontinue(eqMod1,eqMod2)
    local 
      Absyn.Exp aexp1,aexp2;
      DAE.Exp exp1,exp2; DAE.EqMod teq;
    
    // no mods
    case(NONE(),NONE()) then true;
    
    // none vs. some (subset) mods
    case(NONE(),SOME(teq)) then true;
    
    // typed mods
    case(SOME(DAE.TYPED(modifierAsExp = exp1)),SOME(DAE.TYPED(modifierAsExp = exp2))) 
      equation
        equal = Expression.expEqual(exp1,exp2);
      then equal;
    
    // typed vs. untyped mods
    case(SOME(DAE.TYPED(exp1,_,_,SOME(aexp1))),SOME(DAE.UNTYPED(aexp2))) 
      equation
        //aexp1 = Expression.unelabExp(exp1);
        equal = Absyn.expEqual(aexp1,aexp2);
      then equal;

    case(SOME(DAE.TYPED(exp1,_,_,NONE())),SOME(DAE.UNTYPED(aexp2))) 
      equation
        aexp1 = Expression.unelabExp(exp1);
        equal = Absyn.expEqual(aexp1,aexp2);
      then equal;

    // untyped vs. typed 
    case(SOME(DAE.UNTYPED(aexp1)),SOME(DAE.TYPED(exp2,_,_,SOME(aexp2)))) 
      equation
        //aexp2 = Expression.unelabExp(exp2);
        equal = Absyn.expEqual(aexp1,aexp2);
      then equal;

    case(SOME(DAE.UNTYPED(aexp1)),SOME(DAE.TYPED(exp2,_,_,NONE()))) 
      equation
        aexp2 = Expression.unelabExp(exp2);
        equal = Absyn.expEqual(aexp1,aexp2);
      then equal;

    // untyped mods
    case(SOME(DAE.UNTYPED(aexp1)),SOME(DAE.UNTYPED(aexp2))) 
      equation
        equal = Absyn.expEqual(aexp1,aexp2);
      then equal;

    // anything else gives false
    case(_,_) then false;
  end matchcontinue;
end eqModSubsetOrEqual;

protected function subModsSubsetOrEqual "
Returns true if two submod lists are equal. Or all of the elements in subModLst1 have equalities in subModLst2.
if subModLst2 then contain more elements is not a mather."
  input list<DAE.SubMod> subModLst1;
  input list<DAE.SubMod> subModLst2;
  output Boolean equal;
algorithm
  equal := matchcontinue(subModLst1,subModLst2)
  local    DAE.Ident id1,id2;
    DAE.Mod mod1,mod2;
    Boolean b1,b2,b3;
    list<Integer> indx1,indx2;
    list<Boolean> blst1;
    
    case ({},{}) then true;
    
    case (DAE.NAMEMOD(id1,mod1)::subModLst1,DAE.NAMEMOD(id2,mod2)::subModLst2)
      equation
        true = stringEq(id1,id2);
        true = modEqual(mod1,mod2);
        true = subModsEqual(subModLst1,subModLst2);
      then 
        true;
    
    case (DAE.IDXMOD(indx1,mod1)::subModLst1,DAE.IDXMOD(indx2,mod2)::subModLst2)
      equation
        List.threadMapAllValue(indx1,indx2,intEq,true);
        true = modSubsetOrEqualOrNonOverlap(mod1,mod2);
        true = subModsSubsetOrEqual(subModLst1,subModLst2);
      then 
        true;
    
    case(subModLst1,DAE.IDXMOD(_,_)::subModLst2)
      equation
        true = subModsSubsetOrEqual(subModLst1,subModLst2);
      then 
        true;
    
    // otherwise false
    case(_,_) then false;
  end matchcontinue;
end subModsSubsetOrEqual;

public function modEqual "
Compares two DAE.Mod, returns true if equal"
  input DAE.Mod mod1;
  input DAE.Mod mod2;
  output Boolean equal;
algorithm
  equal := matchcontinue(mod1,mod2)
    local 
      SCode.Final f1,f2;
      SCode.Each each1,each2;
      list<DAE.SubMod> submods1,submods2;
      Option<DAE.EqMod> eqmod1,eqmod2;

    case(DAE.MOD(f1,each1,submods1,eqmod1),DAE.MOD(f2,each2,submods2,eqmod2)) 
      equation
        true = valueEq(f1,f2);
        true = SCode.eachEqual(each1,each2);
        true = subModsEqual(submods1,submods2);
        true = eqModEqual(eqmod1,eqmod2);
      then 
        true;
    
    case(DAE.REDECL(_,_,_),DAE.REDECL(_,_,_)) then false;
    case(DAE.NOMOD(),DAE.NOMOD()) then true;
    
    // adrpo: do not fail, return false!
    case (_, _) then false;
  end matchcontinue;
end modEqual;

protected function subModsEqual "Returns true if two submod lists are equal."
  input list<DAE.SubMod> inSubModLst1;
  input list<DAE.SubMod> inSubModLst2;
  output Boolean equal;
algorithm
  equal := matchcontinue(inSubModLst1,inSubModLst2)
    local
      DAE.Ident id1,id2;
      DAE.Mod mod1,mod2;
      list<Integer> indx1,indx2;
      list<DAE.SubMod> subModLst1, subModLst2;
      
    
    case ({},_) then true;
    
    case (DAE.NAMEMOD(id1,mod1)::subModLst1,DAE.NAMEMOD(id2,mod2)::subModLst2)
      equation
        true = stringEq(id1,id2);
        true = modEqual(mod1,mod2);
        true = subModsEqual(subModLst1,subModLst2);
      then 
        true;
    
    case (DAE.IDXMOD(indx1,mod1)::subModLst1,DAE.IDXMOD(indx2,mod2)::subModLst2)
      equation
        List.threadMapAllValue(indx1,indx2,intEq,true);
        true = modEqual(mod1,mod2);
        true = subModsEqual(subModLst1,subModLst2);
      then 
        true;
    
    // otherwise false
    case(_,_) then false;
  end matchcontinue;
end subModsEqual;

public function subModEqual "Returns true if two submod are equal."
  input DAE.SubMod subMod1;
  input DAE.SubMod subMod2;
  output Boolean equal;
algorithm
  equal := matchcontinue(subMod1,subMod2)
    local    
      DAE.Ident id1,id2;
      DAE.Mod mod1,mod2;
      Boolean b1,b2,b3;
      list<Integer> indx1,indx2;
      list<Boolean> blst1;
    
    case (DAE.NAMEMOD(id1,mod1),DAE.NAMEMOD(id2,mod2))
      equation
        true = stringEq(id1,id2);
        true = modEqual(mod1,mod2);
      then 
        true;
    
    case (DAE.IDXMOD(indx1,mod1),DAE.IDXMOD(indx2,mod2))
      equation
        List.threadMapAllValue(indx1,indx2,intEq,true);
        true = modEqual(mod1,mod2);
      then 
        true;
    
    // otherwise false
    case(_,_) then false;
  end matchcontinue;
end subModEqual;

protected function eqModEqual "Returns true if two EqMods are equal"
  input Option<DAE.EqMod> eqMod1;
  input Option<DAE.EqMod> eqMod2;
  output Boolean equal;
algorithm
  equal := matchcontinue(eqMod1,eqMod2)
    local 
      Absyn.Exp aexp1,aexp2;
      DAE.Exp exp1,exp2;

    // no equ mods
    case(NONE(),NONE()) then true;

    // typed equmods
    case(SOME(DAE.TYPED(exp1,_,_,_)),SOME(DAE.TYPED(exp2,_,_,_))) 
      equation
        equal = Expression.expEqual(exp1,exp2);
      then equal;

    // typed vs. untyped equmods
    case(SOME(DAE.TYPED(exp1,_,_,SOME(aexp1))),SOME(DAE.UNTYPED(aexp2))) 
      equation
        //aexp1 = Expression.unelabExp(exp1);
        equal = Absyn.expEqual(aexp1,aexp2);
      then equal;

    case(SOME(DAE.TYPED(exp1,_,_,NONE())),SOME(DAE.UNTYPED(aexp2))) 
      equation
        aexp1 = Expression.unelabExp(exp1);
        equal = Absyn.expEqual(aexp1,aexp2);
      then equal;

    // untyped vs. typed equmods
    case(SOME(DAE.UNTYPED(aexp1)),SOME(DAE.TYPED(exp2,_,_,SOME(aexp2)))) 
      equation
        //aexp2 = Expression.unelabExp(exp2);
        equal = Absyn.expEqual(aexp1,aexp2);
      then equal;

    case(SOME(DAE.UNTYPED(aexp1)),SOME(DAE.TYPED(exp2,_,_,NONE()))) 
      equation
        aexp2 = Expression.unelabExp(exp2);
        equal = Absyn.expEqual(aexp1,aexp2);
      then equal;

    // untyped equmods
    case(SOME(DAE.UNTYPED(aexp1)),SOME(DAE.UNTYPED(aexp2))) 
      equation
        equal = Absyn.expEqual(aexp1,aexp2);
      then equal;

    // anything else will give false
    case(_,_) then false;
  end matchcontinue;
end eqModEqual;

public function printModStr
"This function prints a modification.
 It uses a few other function to do its stuff."
  input DAE.Mod inMod;
  output String outString;
algorithm
  outString := matchcontinue (inMod)
    local
      list<SCode.Element> elist_1;
      Ident prefix,str,res,s1_1,s2;
      list<Ident> str_lst,s1;
      SCode.Final finalPrefix;
      list<tuple<SCode.Element, DAE.Mod>> elist;
      SCode.Each eachPrefix;
      list<DAE.SubMod> subs;
      Option<DAE.EqMod> eq;
    
    case (DAE.NOMOD()) then "()";
    
    case DAE.REDECL(finalPrefix = finalPrefix,eachPrefix = eachPrefix,tplSCodeElementModLst = elist)
      equation
        elist_1 = List.map(elist, Util.tuple21);
        prefix =  SCodeDump.finalStr(finalPrefix) +& SCodeDump.eachStr(eachPrefix);
        str_lst = List.map(elist_1, SCodeDump.unparseElementStr);
        str = stringDelimitList(str_lst, ", ");
        res = stringAppendList({"(",prefix,str,")"});
      then
        res;
    
    case DAE.MOD(finalPrefix = finalPrefix,eachPrefix = eachPrefix,subModLst = subs,eqModOption = eq)
      equation
        prefix =  SCodeDump.finalStr(finalPrefix) +& SCodeDump.eachStr(eachPrefix);
        s1 = printSubs1Str(subs);
        s1_1 = stringDelimitList(s1, ",");
        s1_1 = Util.if_(listLength(subs)>=1," {" +& s1_1 +& "} ",s1_1);
        s2 = printEqmodStr(eq);
        str = stringAppendList({prefix,s1_1,s2});
      then
        str;
    
    case(_) equation print(" failure in printModStr \n"); then fail();
    
  end matchcontinue;
end printModStr;

public function printMod "function: printMod
  Print a modifier on the Print buffer."
  input DAE.Mod m;
  Ident str;
algorithm
  str := printModStr(m);
  Print.printBuf(str);
end printMod;

public function prettyPrintMod "
Author BZ, 2009-07
Prints a readable format of a modifier."
  input DAE.Mod m;
  input Integer depth;
  output String str;
algorithm 
  str := matchcontinue(m,depth)
    local
      list<tuple<SCode.Element, DAE.Mod>> tup;
      list<DAE.SubMod> subs;
      String s1;
      SCode.Final fp;
      DAE.EqMod eq;

    // 0 since we are only interested in this scopes modifier.
    case(DAE.MOD(subModLst = subs, eqModOption=NONE()),depth)
      equation
        str = prettyPrintSubs(subs,depth);
      then 
        str;

    case(DAE.MOD(subModLst = subs, eqModOption=NONE()),depth) then "";

    case(DAE.MOD(finalPrefix = fp, eqModOption=SOME(eq)),depth)
      equation
        str = Util.if_(SCode.finalBool(fp),"final ","") +& Types.unparseEqMod(eq);
      then
        str;

    case(DAE.REDECL(tplSCodeElementModLst = tup),depth)
      equation
        s1 = stringDelimitList(List.map(List.map(tup,Util.tuple21),SCode.elementName),", ");
        //print(stringDelimitList(List.map(List.map(tup,Util.tuple21),SCodeDump.printElementStr),",") +& "\n");
        //s2 = stringDelimitList(List.map1(List.map(tup,Util.tuple22),prettyPrintMod,0),", ");
        //print(" (depth: " +& intString(depth) +& " (("+&s2+&")))Redeclaration of element(s): " +& s1 +& "\n");
        //print(" ok\n");
      then
        "redeclare...";
    
    case(DAE.NOMOD(),_) then "";
    case(_,_) 
      equation 
        print(" failed prettyPrintMod\n"); 
      then 
        fail();
      
  end matchcontinue;
end prettyPrintMod;

protected function prettyPrintSubs "
Author BZ
Helper function for prettyPrintMod"
  input list<DAE.SubMod> inSubs;
  input Integer depth;
  output String str;
algorithm str := matchcontinue(inSubs,depth)
  local
    String s1,s2,id;
    DAE.SubMod s;
    DAE.Mod m;
    list<Integer> li;
    list<DAE.SubMod> subs;
    
  case({},_) then "";
  case((s as DAE.NAMEMOD(id,(m as DAE.REDECL(finalPrefix=_))))::subs,depth)
    equation
      //s1 = prettyPrintSubs(subs);
      //s2  = prettyPrintMod(m,depth+1);
      //s2 = Util.if_(stringLength(s2) == 0, ""," = " +& s2);
      s2 = " redeclare(" +& id +&  "), class or component " +& id;
    then
      s2;
  case((s as DAE.NAMEMOD(id,m))::subs,depth)
    equation
      s2  = prettyPrintMod(m,depth+1);
      s2 = Util.if_(stringLength(s2) == 0, ""," = " +& s2);
      s2 = "(" +& id +& s2 +& "), class or component " +& id;
    then
      s2;
  case((s as DAE.IDXMOD(li,m))::subs,depth)
    equation
      //s1 = prettyPrintSubs(subs);
      s2  = prettyPrintMod(m,depth+1);
      s1 = "["+& stringDelimitList(List.map(li,intString),",")+&"]" +& " = " +& s2;
    then
      s1;
end matchcontinue;
end prettyPrintSubs;

public function prettyPrintSubmod "
Prints a readable format of a sub-modifier, used in error reporting for built-in classes"
  input DAE.SubMod inSub;
  output String str;
algorithm 
  str := matchcontinue(inSub)
    local
      String s1,s2,id;
      DAE.Mod m;
      list<Integer> li;
      SCode.Final fp;
      SCode.Each ep;
      list<tuple<SCode.Element, DAE.Mod>> elist;
    
    case(DAE.NAMEMOD(id,(m as DAE.REDECL(fp, ep, elist))))
      equation
        s1 = stringDelimitList(List.map(List.map(elist, Util.tuple21), SCodeDump.printElementStr), ", ");
        s2 = id +& "(redeclare " +& 
             Util.if_(SCode.eachBool(ep),"each ","") +&
             Util.if_(SCode.finalBool(fp),"final ","") +& s1 +& ")";
      then
        s2;
      
    case(DAE.NAMEMOD(id,m))
      equation
        s2  = prettyPrintMod(m,0);
        s2 = Util.if_(stringLength(s2) == 0, ""," = " +& s2);
        s2 = id +& s2;
      then
        s2;
      
    case(DAE.IDXMOD(li,m))
      equation
        s2  = prettyPrintMod(m,0);
        s1 = "["+& stringDelimitList(List.map(li,intString),",")+&"]" +& " = " +& s2;
      then
        s1;
    
  end matchcontinue;
end prettyPrintSubmod;

public function printSubs1Str "function: printSubs1Str
  Helper function to printModStr"
  input list<DAE.SubMod> inTypesSubModLst;
  output list<String> outStringLst;
algorithm
  outStringLst:=
  match (inTypesSubModLst)
    local
      Ident s1;
      list<Ident> res;
      DAE.SubMod x;
      list<DAE.SubMod> xs;
    case {} then {};
    case (x :: xs)
      equation
        s1 = printSubStr(x);
        res = printSubs1Str(xs);
      then
        (s1 :: res);
  end match;
end printSubs1Str;

protected function printSubStr "function: printSubStr
  Helper function to printSubs1Str"
  input DAE.SubMod inSubMod;
  output String outString;
algorithm
  outString := match (inSubMod)
    local
      Ident mod_str,res,n,str;
      DAE.Mod mod;
      list<Integer> ss;
    case DAE.NAMEMOD(ident = n,mod = mod)
      equation
        mod_str = printModStr(mod);
        res = stringAppend(n, mod_str);
      then
        res;
    case DAE.IDXMOD(integerLst = ss,mod = mod)
      equation
        str = printSubscriptsStr(ss);
        mod_str = printModStr(mod);
        res = stringAppend(str, mod_str);
      then
        res;
  end match;
end printSubStr;

protected function printSubscriptsStr "function: printSubscriptsStr
  Helper function to printSubStr"
  input list<Integer> inIntegerLst;
  output String outString;
algorithm
  outString := match (inIntegerLst)
    local
      Ident s,str,res;
      Integer x;
      list<Integer> xs;
    case ({}) then "[]";
    case (x :: xs)
      equation
        Print.printBuf("[");
        s = intString(x);
        str = printSubscripts2Str(xs);
        res = stringAppendList({"[",s,str,"]"});
      then
        res;
  end match;
end printSubscriptsStr;

protected function printSubscripts2Str "function: printSubscripts2Str
  Helper function to printSubscriptsStr"
  input list<Integer> inIntegerLst;
  output String outString;
algorithm
  outString := match (inIntegerLst)
    local
      Ident s,str,res;
      Integer x;
      list<Integer> xs;
    case ({}) then "";
    case (x :: xs)
      equation
        Print.printBuf(",");
        s = intString(x);
        str = printSubscripts2Str(xs);
        res = stringAppendList({",",s,str});
      then
        res;
  end match;
end printSubscripts2Str;

protected function printEqmodStr
"function: printEqmodStr
  Helper function to printModStr"
  input Option<DAE.EqMod> inTypesEqModOption;
  output String outString;
algorithm
  outString := matchcontinue (inTypesEqModOption)
    local
      Ident str,str2,e_val_str,res;
      DAE.Exp e;
      Values.Value e_val;
      DAE.Properties prop;
      Absyn.Exp ae;
    case NONE() then "";
    case SOME(DAE.TYPED(e,SOME(e_val),prop,_))
      equation
        str = ExpressionDump.printExpStr(e);
        str2 = Types.printPropStr(prop);
        e_val_str = ValuesUtil.valString(e_val);
        res = stringAppendList({" = (typed)",str," ",str2,", E_VALUE: ",e_val_str});
      then
        res;
    case SOME(DAE.TYPED(e,NONE(),prop,_))
      equation
        str = ExpressionDump.printExpStr(e);
        str2 = Types.printPropStr(prop);
        res = stringAppendList({" = (typed)",str,str2});
      then
        res;
    case SOME(DAE.UNTYPED(ae))
      equation
        str = Dump.printExpStr(ae);
        res = stringAppend(" =(untyped) ", str);
      then
        res;
    case(_) 
      equation 
        res = "---Mod.printEqmodStr FAILED---"; 
      then 
        res;
  end matchcontinue;
end printEqmodStr;

public function renameTopLevelNamedSubMod
  input DAE.Mod mod;
  input String oldIdent;
  input String newIdent;
  output DAE.Mod outMod;
algorithm
  outMod := matchcontinue (mod,oldIdent,newIdent)
    local
      SCode.Final finalPrefix;
      SCode.Each each_;
      list<DAE.SubMod> subModLst;
      Option<DAE.EqMod> eqModOption;
      
    case (DAE.MOD(finalPrefix,each_,subModLst,eqModOption),oldIdent,newIdent)
      equation
        subModLst = List.map2(subModLst, renameNamedSubMod, oldIdent, newIdent);
      then 
        DAE.MOD(finalPrefix,each_,subModLst,eqModOption);
    
    case (mod,_,_) then mod;
    
  end matchcontinue;
end renameTopLevelNamedSubMod;

public function renameNamedSubMod
  input DAE.SubMod submod;
  input String oldIdent;
  input String newIdent;
  output DAE.SubMod outMod;
algorithm
  outMod := matchcontinue (submod,oldIdent,newIdent)
    local
      DAE.Mod mod;
      String id;
    case (DAE.NAMEMOD(id,mod),oldIdent,newIdent)
      equation
        true = id ==& oldIdent;
      then DAE.NAMEMOD(newIdent,mod);
    case (submod,_,_) then submod;
  end matchcontinue;
end renameNamedSubMod;

public function emptyModOrEquality
  input DAE.Mod mod;
  output Boolean b;
algorithm
  b := matchcontinue mod
    case DAE.NOMOD() then true;
    case DAE.MOD(subModLst={}) then true;
    case _ then false;
  end matchcontinue;
end emptyModOrEquality;

protected function getAllIndexesFromIdxMods
"@author: adrpo
  Go through the entire list of submods and 
  returns a list<tuple<string,mod>> where
  string created from indexes delimited by DOT."
  input list<DAE.SubMod> inSubModLst;
  output list<tuple<String,DAE.SubMod>> indexes;
algorithm
  indexes := matchcontinue(inSubModLst)
    local 
      list<DAE.SubMod> rest;
      list<Integer> il;
      DAE.SubMod submod;
      String str;
      list<tuple<String,DAE.SubMod>> lst;
      
    // empty case
    case({}) then {};
    // index modifs
    case((submod as DAE.IDXMOD(integerLst = il))::rest)
      equation
        lst = getAllIndexesFromIdxMods(rest);
        // from an index list {1, 2} make a string such as 1.2 
        str = stringAppendList(List.map(il, intStringDot));
      then
        (str,submod)::lst;
    // ignore named modifs
    case(_::rest)
      equation
        lst = getAllIndexesFromIdxMods(rest);
      then
        lst;
  end matchcontinue;
end getAllIndexesFromIdxMods;

protected function intStringDot
  input Integer i;
  output String str;
algorithm
  str := intString(i) +& ".";
end intStringDot;

protected function isPrefixOf
  input tuple<String, DAE.SubMod> indexSubMod;
  input String idx;
  output Boolean isPrefix;
algorithm
  isPrefix := matchcontinue(indexSubMod, idx)
    local
      String i;
      Integer len1, len2;
      
    case ((i, _), idx)
      equation
        len1 = stringLength(i);
        len2 = stringLength(idx);
        // either one of them is a substring of the other
        true = boolOr(0 == System.strncmp(i, idx, len1), 0 == System.strncmp(idx, i, len2));
      then true;
    case (_, _) then false;
  end matchcontinue;
end isPrefixOf;

protected function getOverlap
  input list<tuple<String, DAE.SubMod>> indexes;
  output list<tuple<String, DAE.SubMod>> overlap;
algorithm
  overlap := match(indexes)
    local
      list<tuple<String, DAE.SubMod>> rest, lst, lst1, lst2;
      tuple<String, DAE.SubMod> t;
      String idx;
      DAE.SubMod s;
      
    // empty cases
    case ({}) then {};
    case ((t as (idx, s))::rest)
      equation
        lst1 = List.select1(rest, isPrefixOf, idx);
        lst1 = Util.if_(listLength(lst1)==0, lst1, t::lst1);
        lst2 = getOverlap(rest);
        lst = listAppend(lst1, lst2);
      then
        lst;
  end match;
end getOverlap;

public function checkIdxModsForNoOverlap
"@author: adrpo
  This function checks if idx modifications do not overlap.
  If they do an error message is printed and this function fails.
  Example:
  class A Real x[2,2]; end A;
  A a(x[2] = {1.0,3.0}, x[2,1] = 2.0);"
  input DAE.Mod inMod;
  input Prefix.Prefix inPrefix;
  input Absyn.Info info;
algorithm
  _ := matchcontinue(inMod, inPrefix, info)
    local
      list<DAE.SubMod> subModLst;
      list<tuple<String, DAE.SubMod>> indexes, overlap;
      Prefix.Prefix pre;
      String str1, str2, str3;
      DAE.EqMod eqMod;
      DAE.Properties props;
    
    // no modifications
    case(DAE.NOMOD(), _, _) then ();

    // no submodifications
    case(DAE.MOD(subModLst={}), _, _) then ();

    // one submodification with no eqmod cannot generate overlap
    case(DAE.MOD(subModLst={DAE.IDXMOD(mod=_)}, eqModOption=NONE()), _, _) then ();

    // if eqmod is an array and we have indexmods, we have overlap
    case(DAE.MOD(subModLst=subModLst, eqModOption=SOME(eqMod)), pre, info)
      equation
        // we have properties
        DAE.TYPED(properties = props) = eqMod;
        // they are an array!
        true = Types.isPropArray(props);
        // we have at least 1 index mod 
        (indexes as _::_) = getAllIndexesFromIdxMods(subModLst);
        str3 = PrefixUtil.printPrefixStrIgnoreNoPre(pre);
        // now try to read this very fast ;)        
        str1 = stringDelimitList(
                 List.map1(
                   List.map(
                     List.map(
                       indexes, 
                       Util.tuple22), 
                     prettyPrintSubmod),
                   Util.stringAppendReverse,
                   str3),  
                 ", ");
        str1 = "(" +& str1 +& ")";
        str2 = str3 +& "=" +& Types.unparseEqMod(eqMod);
        // generate a warning
        Error.addSourceMessage(Error.MODIFICATION_AND_MODIFICATION_INDEX_OVERLAP, {str1, str2, str3}, info);
      then ();

    // modifications, no overlap
    case(DAE.MOD(subModLst=subModLst), _, _)
      equation
        // now how the heck are we verifying for overlap?
        // first try: (if you know a better solution, then, BY ANY MEANS, please implement it here) 
        //  from index list generate strings, i.e. 1.2.3., 1.2.4.
        //  if any of the strings is a prefix of another, we have an overlap!
        indexes = getAllIndexesFromIdxMods(subModLst);
        // get the overlap
        {} = getOverlap(indexes);
      then
        ();
    // modifications, overlap, source message
    case(DAE.MOD(subModLst=subModLst), pre, info)
      equation
        indexes = getAllIndexesFromIdxMods(subModLst);
        // get the overlap
        overlap = getOverlap(indexes);
        str2 = PrefixUtil.printPrefixStrIgnoreNoPre(pre);
        // now try to read this very fast ;)        
        str1 = stringDelimitList(
                 List.map1(
                   List.map(
                     List.map(
                       overlap, 
                       Util.tuple22), 
                     prettyPrintSubmod),
                   Util.stringAppendReverse,
                   str2),  
                 ", ");
        str1 = "(" +& str1 +& ")";
        // generate a warning
        Error.addSourceMessage(Error.MODIFICATION_INDEX_OVERLAP, {str1, str2}, info);
      then
        ();
  end matchcontinue;
end checkIdxModsForNoOverlap;

protected function getFullModsFromMod
"@author: adrpo
  This function will create fully qualified crefs from 
  modifications. See also getFullModsFromSubMods.
  Examples:
  x(start=1, stateSelect=s) => x.start, x.stateSelect
  (x.start=1, x.stateSelect=s) => x.start, x.stateSelect
  x([2] = 1, start = 2) => x[2], x.start"
  input DAE.ComponentRef inTopCref;
  input DAE.Mod inMod;
  output list<FullMod> outFullMods;
algorithm
  outFullMods := match(inTopCref, inMod)
    local
      list<FullMod> fullMods;
      list<DAE.SubMod> subModLst;
      list<tuple<SCode.Element, DAE.Mod>> tplSCodeElementModLst;
      SCode.Final finalPrefix;
      SCode.Each eachPrefix;
    
    // DAE.NOMOD empty case, no more dive in
    case (inTopCref, DAE.NOMOD()) then {};
    
    // DAE.MOD
    case (inTopCref, DAE.MOD(subModLst = subModLst))
      equation
        fullMods = getFullModsFromSubMods(inTopCref, subModLst);
      then
        fullMods;

    // DAE.REDECL
    case (inTopCref, DAE.REDECL(finalPrefix = finalPrefix, eachPrefix = eachPrefix, tplSCodeElementModLst = tplSCodeElementModLst))
      equation
        fullMods = getFullModsFromModRedeclare(inTopCref, tplSCodeElementModLst, finalPrefix, eachPrefix);
      then
        fullMods;
  end match;
end getFullModsFromMod;

protected function getFullModsFromModRedeclare
"@author: adrpo
  This function will create fully qualified 
  crefs from the redeclaration lists for redeclare mod.
  See also getFullModsFromMod, getFullModsFromSubMod
  Examples: 
  x(redeclare package P = P, redeclare class C = C) => x.P, x.C"
  input DAE.ComponentRef inTopCref;
  input list<tuple<SCode.Element, DAE.Mod>> inTplSCodeElementModLst;
  input SCode.Final finalPrefix;
  input SCode.Each eachPrefix;
  output list<FullMod> outFullMods;
algorithm
  outFullMods := matchcontinue(inTopCref, inTplSCodeElementModLst, finalPrefix, eachPrefix)
    local
      list<FullMod> fullMods;
      DAE.Ident id;
      DAE.Mod mod;
      list<tuple<SCode.Element, DAE.Mod>> rest;
      DAE.ComponentRef cref;
      SCode.Element el;
      tuple<SCode.Element, DAE.Mod> x;
    
    // empty case 
    case (_, {}, _, _) then {};
    
    // SCode.CLASS, TODO! FIXME! what do we do with the mod??
    case (inTopCref, (x as (SCode.CLASS(name = id), mod))::rest, finalPrefix, eachPrefix)
      equation
        cref = ComponentReference.joinCrefs(
                 inTopCref, 
                 ComponentReference.makeCrefIdent(
                   id, DAE.T_UNKNOWN_DEFAULT, {}));
        fullMods = getFullModsFromModRedeclare(inTopCref, rest, finalPrefix, eachPrefix);
      then
        MOD(cref, DAE.REDECL(finalPrefix, eachPrefix, {x}))::fullMods;
    
    // SCode.COMPONENT, TODO! FIXME! what do we do with the mod??
    case (inTopCref, (x as (SCode.COMPONENT(name = id), mod))::rest, finalPrefix, eachPrefix)
      equation
        cref = ComponentReference.joinCrefs(
                 inTopCref, 
                 ComponentReference.makeCrefIdent(
                   id, DAE.T_UNKNOWN_DEFAULT, {}));
        fullMods = getFullModsFromModRedeclare(inTopCref, rest, finalPrefix, eachPrefix);
      then
        MOD(cref, DAE.REDECL(finalPrefix, eachPrefix, {x}))::fullMods;
        
    // anything else, just ignore, TODO! FIXME! maybe report an error??!!
    case (inTopCref, (el, mod)::rest, finalPrefix, eachPrefix)
      equation
        fullMods = getFullModsFromModRedeclare(inTopCref, rest, finalPrefix, eachPrefix);
      then
        fullMods;
  end matchcontinue;
end getFullModsFromModRedeclare;

protected function getFullModsFromSubMods
"@author: adrpo
  This function will create fully qualified crefs from 
  sub modifications. See also getFullModsFromMod. 
  Examples:
  x(start=1, stateSelect=s) => x.start, x.stateSelect
  (x.start=1, x.stateSelect=s) => x.start, x.stateSelect
  x([2] = 1, start = 2) => x[2], x.start"
  input DAE.ComponentRef inTopCref;
  input list<DAE.SubMod> inSubMods;
  output list<FullMod> outFullMods;
algorithm
  outFullMods := match(inTopCref, inSubMods)
    local
      list<FullMod> fullMods1, fullMods2, fullMods;
      list<DAE.SubMod> rest;
      DAE.SubMod subMod;
      DAE.Ident id;
      DAE.Mod mod;
      list<Integer> indexes;
      DAE.ComponentRef cref;
    
    // empty case 
    case (_, {}) then {};
    
    // named modifier, only add LEAFS to the list! 
    case (inTopCref, (subMod as DAE.NAMEMOD(id, mod))::rest)
      equation
        cref = ComponentReference.joinCrefs(
                 inTopCref, 
                 ComponentReference.makeCrefIdent(
                   id, DAE.T_UNKNOWN_DEFAULT, {}));
        fullMods1 = getFullModsFromMod(cref, mod);
        fullMods2 = getFullModsFromSubMods(inTopCref, rest);
        fullMods = listAppend(
                     Util.if_(List.isEmpty(fullMods1), 
                              SUB_MOD(cref, subMod)::fullMods1, // add if LEAF
                              fullMods1),
                     fullMods2);
      then
        fullMods;

    // index modifier, only add LEAFS to the list!
    case (inTopCref, (subMod as DAE.IDXMOD(indexes, mod))::rest)
      equation
        cref = ComponentReference.crefSetLastSubs(
                 inTopCref,
                 listAppend( 
                   ComponentReference.crefLastSubs(inTopCref),
                   Expression.intSubscripts(indexes))
                 );
        fullMods1 = getFullModsFromMod(cref, mod);
        fullMods2 = getFullModsFromSubMods(inTopCref, rest);
        fullMods = listAppend(
                     Util.if_(List.isEmpty(fullMods1), 
                              SUB_MOD(cref, subMod)::fullMods1, // add if LEAF
                              fullMods1),
                     fullMods2);
      then
        fullMods;
  end match;
end getFullModsFromSubMods;

public function verifySingleMod "
Author BZ
Checks so that we only have one modifier for each element.
Fails on; a(x=3, redeclare Integer x)"
  input DAE.Mod m;
  input Prefix.Prefix pre;
  input String elementName;
  input Absyn.Info info;
algorithm 
  _ := match(m,pre,elementName,info)
    local
      DAE.Mod mod;
      DAE.ComponentRef cref;
      list<FullMod> fullMods;
    
    case(mod,pre,elementName,info)
      equation
        cref = PrefixUtil.makeCrefFromPrefixNoFail(pre);
        // print("Prefix:" +& PrefixUtil.printPrefixStr(pre)+& "\n");
        // print("Element:" +& elementName +& "\n");
        // print("Prefix + element: " +& ComponentReference.printComponentRefStr(cref) +& "\n");
        // print("Entire Mod: " +& printModStr(mod) +& "\n");
        // mod = lookupCompModification(mod, elementName);
        // print("Element Mod: " +& printModStr(mod) +& "\n");
        fullMods = getFullModsFromMod(cref, mod);
        // print("FullMods: " +& stringDelimitList(List.map1(fullMods, prettyPrintFullMod, 1), " ||| ") +& "\n");
        checkDuplicatesInFullMods(fullMods, pre, elementName, info, true);
      then
        ();
  end match;
end verifySingleMod;

protected function fullModCrefsEqual
"@author: adrpo
  This function checks if the crefs of the given full mods are equal"
  input FullMod inFullMod1;
  input FullMod inFullMod2;
  output Boolean isEqual;
algorithm
  isEqual := match(inFullMod1, inFullMod2)
    local DAE.ComponentRef cr1, cr2;
    case (MOD(cr1, _), MOD(cr2, _)) then ComponentReference.crefEqualNoStringCompare(cr1, cr2);
    case (SUB_MOD(cr1, _), SUB_MOD(cr2, _)) then ComponentReference.crefEqualNoStringCompare(cr1, cr2);
    case (MOD(cr1, _), SUB_MOD(cr2, _)) then ComponentReference.crefEqualNoStringCompare(cr1, cr2);
    case (SUB_MOD(cr1, _), MOD(cr2, _)) then ComponentReference.crefEqualNoStringCompare(cr1, cr2);
  end match;
end fullModCrefsEqual;

protected function prettyPrintFullMod
"@author: adrpo
  This function checks if the crefs of the given full mods are equal"
  input FullMod inFullMod;
  input Integer inDepth;
  output String outStr;
algorithm
  outStr := match(inFullMod, inDepth)
    local 
      DAE.Mod mod;
      DAE.SubMod subMod;
      DAE.ComponentRef cr;
      String str;
    
    case (MOD(cr, mod),        inDepth)
      equation
        str = ComponentReference.printComponentRefStr(cr) +& ": " +& prettyPrintMod(mod, inDepth);
      then
        str;
    
    case (SUB_MOD(cr, subMod), inDepth)
      equation
        str = ComponentReference.printComponentRefStr(cr) +& ": " +& prettyPrintSubmod(subMod);
      then
        str;
    
  end match;
end prettyPrintFullMod;

protected function checkDuplicatesInFullMods "helper function for verifySingleMod"
  input list<FullMod> subs;
  input Prefix.Prefix pre;
  input String elementName;
  input Absyn.Info info;
  input Boolean addErrorMessage;
algorithm 
  _ := matchcontinue(subs,pre,elementName,info,addErrorMessage)
    local 
      String s1,s2,s3;
      list<FullMod> rest, duplicates;
      FullMod fullMod;
    
    case({},pre,elementName,info,addErrorMessage) then ();
    
    case(fullMod::rest,pre,elementName,info,addErrorMessage)
      equation
        false = List.isMemberOnTrue(fullMod,rest,fullModCrefsEqual);
        checkDuplicatesInFullMods(rest,pre,elementName,info,addErrorMessage);
      then
        ();
    
    // do not add a message
    case(fullMod::rest,pre,elementName,info,addErrorMessage as false)
      equation
        true = List.isMemberOnTrue(fullMod,rest,fullModCrefsEqual);
      then
        fail();
    
    // add a message
    case(fullMod::rest,pre,elementName,info,addErrorMessage as true)
      equation
        true = List.isMemberOnTrue(fullMod,rest,fullModCrefsEqual);
        duplicates = List.select1(rest, fullModCrefsEqual, fullMod);
        s1 = prettyPrintFullMod(fullMod, 1);
        s2 = PrefixUtil.makePrefixString(pre);
        s3 = stringDelimitList(List.map1(duplicates, prettyPrintFullMod, 1), ", ");
        s2 = s2 +& ", duplicates are: " +& s3;
        Error.addSourceMessage(Error.MULTIPLE_MODIFIER, {s1,s2}, info);
      then
        fail();
  end matchcontinue;
end checkDuplicatesInFullMods;

public function getUnelabedSubMod
  input SCode.Mod inMod;
  input SCode.Ident inIdent;
  output SCode.Mod outSubMod;
protected
  list<SCode.SubMod> submods;
algorithm
  SCode.MOD(subModLst = submods) := inMod;
  outSubMod := getUnelabedSubMod2(submods, inIdent);
end getUnelabedSubMod;

protected function getUnelabedSubMod2
  input list<SCode.SubMod> inSubMods;
  input SCode.Ident inIdent;
  output SCode.Mod outMod;
algorithm
  outMod := matchcontinue(inSubMods, inIdent)
    local
      SCode.Ident id;
      SCode.Mod m;
      list<SCode.SubMod> rest_mods;

    case (SCode.NAMEMOD(ident = id, A = m) :: _, _)
      equation
        true = stringEqual(id, inIdent);
      then
        m;

    case (_ :: rest_mods, _)
      then getUnelabedSubMod2(rest_mods, inIdent);

  end matchcontinue;
end getUnelabedSubMod2;
      
public function isUntypedMod
  "Returns true if a modifier contains any untyped parts, otherwise false."
  input DAE.Mod inMod;
  output Boolean outIsUntyped;
algorithm
  outIsUntyped := matchcontinue(inMod)
    local
      list<DAE.SubMod> submods;

    case DAE.MOD(eqModOption = SOME(DAE.UNTYPED(exp = _))) then true;

    case DAE.MOD(subModLst = submods)
      equation
        _ = List.selectFirst(submods, isUntypedSubMod);
      then
        true;

    else false;
  end matchcontinue;
end isUntypedMod;

protected function isUntypedSubMod
  "Returns true if a submodifier contains any untyped parts, otherwise false."
  input DAE.SubMod inSubMod;
  output Boolean outIsUntyped;
algorithm
  outIsUntyped := match(inSubMod)
    local
      DAE.Mod mod;

    case DAE.NAMEMOD(mod = mod) then isUntypedMod(mod);
    case DAE.IDXMOD(mod = mod) then isUntypedMod(mod);

  end match;
end isUntypedSubMod;

public function getUntypedCrefs
  input DAE.Mod inMod;
  output list<Absyn.ComponentRef> outCrefs;
algorithm
  outCrefs := matchcontinue(inMod)
    local
      Absyn.Exp exp;
      list<Absyn.ComponentRef> crefs;
      list<DAE.SubMod> submods;

    case DAE.MOD(eqModOption = SOME(DAE.UNTYPED(exp = exp)))
      equation
        crefs = Absyn.getCrefFromExp(exp, true);
      then
        crefs;

    case DAE.MOD(subModLst = submods)
      equation
        crefs = List.fold(submods, getUntypedCrefFromSubMod, {});
      then
        crefs;

    else {};
  end matchcontinue;
end getUntypedCrefs;

protected function getUntypedCrefFromSubMod
  input DAE.SubMod inSubMod;
  input list<Absyn.ComponentRef> inCrefs;
  output list<Absyn.ComponentRef> outCrefs;
algorithm
  outCrefs := match(inSubMod, inCrefs)
    local
      DAE.Mod mod;
      list<Absyn.ComponentRef> crefs;

    case (DAE.NAMEMOD(mod = mod), _)
      equation
        crefs = getUntypedCrefs(mod);
      then
        listAppend(crefs, inCrefs);

    case (DAE.IDXMOD(mod = mod), _)
      equation
        crefs = getUntypedCrefs(mod);
      then
        listAppend(crefs, inCrefs);

  end match;
end getUntypedCrefFromSubMod;

// moved from Types!
public function stripSubmod
"function: stripSubmod
  author: PA
  Removes the sub modifiers of a modifier."
  input DAE.Mod inMod;
  output DAE.Mod outMod;
algorithm
  outMod := matchcontinue (inMod)
    local
      SCode.Final f;
      SCode.Each each_;
      list<SubMod> subs;
      Option<EqMod> eq;
      DAE.Mod m;
    case (DAE.MOD(finalPrefix = f,eachPrefix = each_,subModLst = subs,eqModOption = eq)) 
      then DAE.MOD(f,each_,{},eq);
    case (m) then m;
  end matchcontinue;
end stripSubmod;

public function removeFirstSubsRedecl "
Author: BZ, 2009-08
Removed REDECLARE() statements at first level of SubMods"
  input DAE.Mod inMod;
  output DAE.Mod outMod;
algorithm
  outMod := matchcontinue (inMod)
    local
      SCode.Final f;
      SCode.Each each_;
      list<SubMod> subs;
      Option<EqMod> eq;
      DAE.Mod m;
    case (DAE.MOD(finalPrefix = f,eachPrefix = each_,subModLst = {},eqModOption = eq)) 
      then DAE.MOD(f,each_,{},eq);
    case (DAE.MOD(finalPrefix = f,eachPrefix = each_,subModLst = subs,eqModOption = NONE()))
      equation
         {} = removeRedecl(subs);
      then
        DAE.NOMOD();
    case (DAE.MOD(finalPrefix = f,eachPrefix = each_,subModLst = subs,eqModOption = eq))
      equation
         subs = removeRedecl(subs);
      then
        DAE.MOD(f,each_,subs,eq);
    case (m) then m;
  end matchcontinue;
end removeFirstSubsRedecl;

protected function removeRedecl "
Author BZ
helper function for removeFirstSubsRedecl"
  input list<SubMod> isubs;
  output list<SubMod> osubs;
algorithm 
  osubs := matchcontinue(isubs)
    local
      SubMod sm;
      String s;
      list<SubMod> subs;
  
    case({}) then {};
    case(DAE.NAMEMOD(s,DAE.REDECL(_,_,_))::subs) then removeRedecl(subs);
    case(sm::subs)
      equation
        osubs = removeRedecl(subs);
      then
        sm::osubs;
  end matchcontinue;
end removeRedecl;

public function removeModList "
Author BZ, 2009-07
Delete a list of named modifiers"
  input DAE.Mod inMod;
  input list<String> remStrings;
  output DAE.Mod outMod;
protected
  String s;
algorithm 
  outMod := match(inMod,remStrings)
    case(inMod,{}) then inMod;
    case(inMod, s::remStrings)
      equation
        inMod = removeMod(inMod,s);
      then 
        removeModList(inMod,remStrings);
  end match;
end removeModList;

public function removeMod "
Author: BZ, 2009-05
Remove a modifier(/s) on a specified component.
TODO: implement IDXMOD and a better support for redeclare."
  input DAE.Mod inmod;
  input String componentModified;
  output DAE.Mod outmod;
algorithm 
  outmod := match(inmod,componentModified)
    local
      SCode.Final f;
      SCode.Each e;
      list<SubMod> subs;
      Option<EqMod> oem;
      list<tuple<SCode.Element, DAE.Mod>> redecls;
  
    case(DAE.NOMOD(),_) then DAE.NOMOD();
  
    case((inmod as DAE.REDECL(f,e,redecls)),componentModified)
      equation
        //Debug.fprint(Flags.REDECL,"Removing redeclare mods: " +& componentModified +&" before" +& Mod.printModStr(inmod) +& "\n");  
        redecls = removeRedeclareMods(redecls,componentModified);
        outmod = Util.if_(listLength(redecls) > 0,DAE.REDECL(f,e,redecls), DAE.NOMOD());
        //Debug.fprint(Flags.REDECL,"Removing redeclare mods: " +& componentModified +&" after" +& Mod.printModStr(outmod) +& "\n");
      then
        outmod;

    case(DAE.MOD(f,e,subs,oem),componentModified)
      equation
        //Debug.fprint(Flags.REDECL,"Removing redeclare mods: " +& componentModified +&" before" +& Mod.printModStr(inmod) +& "\n");
        subs = removeModInSubs(subs,componentModified);
        outmod = DAE.MOD(f,e,subs,oem);
        //Debug.fprint(Flags.REDECL,"Removing redeclare mods: " +& componentModified +&" after" +& Mod.printModStr(outmod) +& "\n");
      then
        outmod;
  end match;
end removeMod;

protected function removeRedeclareMods ""
  input list<tuple<SCode.Element, DAE.Mod>> inLst;
  input String currComp;
  output list<tuple<SCode.Element, DAE.Mod>> outLst;
algorithm 
  outLst := matchcontinue(inLst,currComp)
    local
      SCode.Element comp;
      DAE.Mod mod;
      String s1;
      list<tuple<SCode.Element, DAE.Mod>> lst;
    
    case({},_) then {};
    
    case((comp,mod)::lst,currComp)
      equation
        outLst = removeRedeclareMods(lst,currComp);
        s1 = SCode.elementName(comp);
        true = stringEq(s1,currComp);
      then
        outLst;
    
    case((comp,mod)::lst,currComp)
      equation
        outLst = removeRedeclareMods(lst,currComp);
      then
        (comp,mod)::outLst;
  
    case(_,_) 
      equation 
        print("removeRedeclareMods failed\n"); 
      then fail();
  end matchcontinue;
end removeRedeclareMods;

protected function removeModInSubs "
Author BZ, 2009-05
Helper function for removeMod, removes modifiers in submods;
"
  input list<SubMod> inSubs;
  input String componentName;
  output list<SubMod> outsubs;
algorithm outsubs := match(inSubs,componentName)
  local
    DAE.Mod m1;
    list<SubMod> subs1,subs2,subs;
    String s1;
    SubMod sub;
  case({},_) then {};
  case((sub as DAE.NAMEMOD(s1,m1))::subs,componentName)
    equation
      subs1 = Util.if_(stringEq(s1,componentName),{},{DAE.NAMEMOD(s1,m1)});
      subs2 = removeModInSubs(subs,componentName) "check for multiple mod on same comp";
      outsubs = listAppend(subs1,subs2);
    then
      outsubs;
  case((sub as DAE.IDXMOD(_,m1))::subs,componentName)
    equation
      //TODO: implement check for idxmod?
      subs2 = removeModInSubs(subs,componentName);
    then
      sub::subs2;
end match;
end removeModInSubs;

end Mod;

