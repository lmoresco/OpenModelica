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

encapsulated package SCodeExpand
" file:        SCodeExpand.mo
  package:     SCodeExpand
  description: Expands the output from SCodeInst into DAE form.

  RCS: $Id$

"

public import DAE;
public import InstTypes;

protected import Absyn;
protected import ComponentReference;
protected import DAEDump;
protected import Debug;
protected import Error;
protected import Expression;
protected import ExpressionDump;
protected import ExpressionSimplify;
protected import Flags;
protected import InstUtil;
protected import List;
protected import SCode;
protected import Types;
  
protected type Equation = InstTypes.Equation;

replaceable type ElementType subtypeof Any;

partial function ExpandScalarFunc
  input ElementType inElement;
  input list<list<DAE.Subscript>> inSubscripts;
  input list<DAE.Element> inAccumEl;
  output list<DAE.Element> outElements;
end ExpandScalarFunc;

public function expand
  input String inName;
  input InstTypes.Class inClass;
  output DAE.DAElist outDAE;
protected
  list<DAE.Element> el;
  DAE.FunctionTree tree;
algorithm
  outDAE := matchcontinue(inName, inClass)
    local
      list<DAE.Element> el;
      DAE.DAElist dae;
      DAE.FunctionTree tree;
      Integer vars, params;
    
    case (_, _)
      equation
        el = expandClass(inClass, {}, {});
        el = listReverse(el);
        dae = DAE.DAE({DAE.COMP(inName, el, DAE.emptyElementSource, NONE())});

        tree = DAE.AVLTREENODE(NONE(), 0, NONE(), NONE());
        print("\nEXPANDED FORM:\n\n");
        print(DAEDump.dumpStr(dae, tree) +& "\n");
        (vars, params) = countElements(el, 0, 0);
        print("\nFound " +& intString(vars) +& " components and " +&
          intString(params) +& " parameters.\n");
      then
        dae;

    else
      equation
        true = Flags.isSet(Flags.FAILTRACE);
        Debug.traceln("SCodeExpand.expand failed.\n");
      then
        fail();

  end matchcontinue;
end expand;

protected function countElements
  input list<DAE.Element> inElements;
  input Integer inVarCount;
  input Integer inParamCount;
  output Integer outVarCount;
  output Integer outParamCount;
algorithm
  (outVarCount, outParamCount) := match(inElements, inVarCount, inParamCount)
    local
      list<DAE.Element> rest_el;
      Integer vars, params;

    case ({}, _, _) then (inVarCount, inParamCount);

    case (DAE.VAR(kind = DAE.VARIABLE()) :: rest_el, _, _)
      equation
        (vars, params) = countElements(rest_el, inVarCount + 1, inParamCount);
      then
        (vars, params);

    case (DAE.VAR(kind = DAE.DISCRETE()) :: rest_el, _, _)
      equation
        (vars, params) = countElements(rest_el, inVarCount + 1, inParamCount);
      then
        (vars, params);

    case (DAE.VAR(kind = DAE.PARAM()) :: rest_el, _, _)
      equation
        (vars, params) = countElements(rest_el, inVarCount, inParamCount + 1);
      then
        (vars, params);

    case (_ :: rest_el, _, _)
      equation
        (vars, params) = countElements(rest_el, inVarCount, inParamCount);
      then
        (vars, params);

  end match;
end countElements;

protected function expandClass
  input InstTypes.Class inClass;
  input list<list<DAE.Subscript>> inSubscripts;
  input list<DAE.Element> inAccumEl;
  output list<DAE.Element> outElements;
algorithm
  outElements := match(inClass, inSubscripts, inAccumEl)
    local
      list<InstTypes.Element> comps;
      list<DAE.Element> el;
      list<Equation> eq;

    case (InstTypes.BASIC_TYPE(), _, _) then inAccumEl;
    
    case (InstTypes.COMPLEX_CLASS(components = comps, equations = eq), _, _)
      equation
        el = List.fold1(comps, expandElement, inSubscripts, inAccumEl);
        el = List.fold1(eq, expandEquation, inSubscripts, el);
      then
        el;

  end match;
end expandClass;

protected function expandElement
  input InstTypes.Element inElement;
  input list<list<DAE.Subscript>> inSubscripts;
  input list<DAE.Element> inAccumEl;
  output list<DAE.Element> outElements;
algorithm
  outElements := match(inElement, inSubscripts, inAccumEl)
    local
      InstTypes.Component comp;
      list<DAE.Element> el;
      InstTypes.Class cls;
      Absyn.Path path;
      String err_msg;
      DAE.Type ty;
      DAE.Dimensions dims;

    case (InstTypes.ELEMENT(component = comp, cls = InstTypes.BASIC_TYPE()), _, _)
      equation
        el = expandComponent(comp, inSubscripts, inAccumEl);
      then
        el;

    case (InstTypes.ELEMENT(component = InstTypes.TYPED_COMPONENT(ty =
        DAE.T_ARRAY(ty = ty, dims = dims)), cls = cls), _, _)
      equation
        el = expandArray(cls, dims, {} :: inSubscripts, inAccumEl, expandClass);
      then
        el;

    case (InstTypes.ELEMENT(component = comp, cls = cls), _, _)
      equation
        el = expandClass(cls, {} :: inSubscripts, inAccumEl);
      then
        el;

    case (InstTypes.EXTENDED_ELEMENTS(cls = cls), _, _)
      equation
        el = expandClass(cls, inSubscripts, inAccumEl);
      then
        el;

    case (InstTypes.CONDITIONAL_ELEMENT(component = comp), _, _)
      equation
        path = InstUtil.getComponentName(comp);
        err_msg = "SCodeExpand.expandElement got unresolved conditional component " +& 
          Absyn.pathString(path) +& "\n";
        Error.addMessage(Error.INTERNAL_ERROR, {err_msg});
      then
        inAccumEl;

  end match;
end expandElement;

protected function expandComponent
  input InstTypes.Component inComponent;
  input list<list<DAE.Subscript>> inSubscripts;
  input list<DAE.Element> inAccumEl;
  output list<DAE.Element> outElements;
algorithm
  outElements := match(inComponent, inSubscripts, inAccumEl)
    local
      Absyn.Path name;
      DAE.Dimensions dims;
      list<DAE.Element> el;
      InstTypes.Component comp;
      String err_msg;

    case (InstTypes.TYPED_COMPONENT(ty = DAE.T_ARRAY(dims = dims)), _, _)
      equation
        comp = unliftComponentType(inComponent);
        el = expandArray(comp, dims, {} :: inSubscripts, inAccumEl, expandScalar);
      then
        el;

    case (InstTypes.TYPED_COMPONENT(ty = _), _, _)
      equation
        el = expandScalar(inComponent, {} :: inSubscripts, inAccumEl);
      then
        el;
        
    case (InstTypes.UNTYPED_COMPONENT(name = name), _, _)
      equation
        err_msg = "SCodeExpand.expandComponent got untyped component " +&
          Absyn.pathString(name) +& "\n";
        Error.addMessage(Error.INTERNAL_ERROR, {err_msg});
      then
        fail();

    case (InstTypes.CONDITIONAL_COMPONENT(name = name), _, _)
      equation
        err_msg = "SCodeExpand.expandComponent got unresolved conditional component " +&
          Absyn.pathString(name) +& "\n";
        Error.addMessage(Error.INTERNAL_ERROR, {err_msg});
      then
        inAccumEl;

    case (InstTypes.OUTER_COMPONENT(name = _), _, _)
      then inAccumEl;

  end match;
end expandComponent;

protected function expandArray
  input ElementType inElement;
  input list<DAE.Dimension> inDimensions;
  input list<list<DAE.Subscript>> inSubscripts;
  input list<DAE.Element> inAccumEl;
  input ExpandScalarFunc inScalarFunc;
  output list<DAE.Element> outElements;
algorithm
  outElements := 
  match(inElement, inDimensions, inSubscripts, inAccumEl, inScalarFunc)
    local
      Integer dim;
      list<DAE.Dimension> rest_dims;
      list<DAE.Element> el;
      list<DAE.Subscript> subs;
      list<list<DAE.Subscript>> rest_subs;
      String dim_str;

    case (_, {}, subs :: rest_subs, _, _)
      equation
        subs = listReverse(subs);
        el = inScalarFunc(inElement, subs :: rest_subs, inAccumEl);
      then
        el;
        
    case (_, DAE.DIM_INTEGER(integer = dim) :: rest_dims, _, _, _)
      equation
        el = expandArrayIntDim(inElement, 1, dim, rest_dims, inSubscripts,
            inAccumEl, inScalarFunc);
      then
        el;

    case (_, DAE.DIM_ENUM(enumTypeName = _) :: _, _, _, _)
      equation
        print("SCodeExpand.expandArray TODO: implement support for enum dims.\n");
      then
        fail();

    else
      equation
        dim_str = ExpressionDump.dimensionString(List.first(inDimensions));
        print("Unknown dimension " +& dim_str +& " in SCodeExpand.expandArray\n");
      then
        fail();

  end match;
end expandArray;

protected function expandArrayIntDim
  input ElementType inElement;
  input Integer inIndex;
  input Integer inDimSize;
  input list<DAE.Dimension> inDimensions;
  input list<list<DAE.Subscript>> inSubscripts;
  input list<DAE.Element> inAccumEl;
  input ExpandScalarFunc inScalarFunc;
  output list<DAE.Element> outElements;
algorithm
  outElements := 
  matchcontinue(inElement, inIndex, inDimSize, inDimensions, inSubscripts, inAccumEl, inScalarFunc)
    local
      list<DAE.Subscript> subs;
      list<list<DAE.Subscript>> rest_subs;
      list<DAE.Element> el;
      String err_msg;

    case (_, _, _, _, _, _, _)
      equation
        true = (inIndex > inDimSize);
      then
        inAccumEl;

    case (_, _, _, _, subs :: rest_subs, _, _)
      equation
        subs = DAE.INDEX(DAE.ICONST(inIndex)) :: subs;
        el = expandArray(inElement, inDimensions, subs :: rest_subs,
            inAccumEl, inScalarFunc);
      then
        expandArrayIntDim(inElement, inIndex + 1, inDimSize, inDimensions,
          inSubscripts, el, inScalarFunc);

  end matchcontinue;
end expandArrayIntDim;      

protected function expandScalar
  input InstTypes.Component inComponent;
  input list<list<DAE.Subscript>> inSubscripts;
  input list<DAE.Element> inAccumEl;
  output list<DAE.Element> outElements;
algorithm
  outElements := match(inComponent, inSubscripts, inAccumEl)
    local
      Absyn.Path name;
      DAE.Type ty;
      DAE.ComponentRef cref;
      list<list<DAE.Subscript>> subs;
      DAE.Element elem;
      SCode.Variability var;
      DAE.VarKind var_kind;
      DAE.VarDirection dir;
      DAE.VarVisibility vis;
      DAE.Flow fp;
      DAE.Stream sp;
      InstTypes.Binding binding;
      Option<DAE.Exp> bind_exp;
      InstTypes.DaePrefixes prefs;

    case (InstTypes.TYPED_COMPONENT(prefixes = 
        InstTypes.DAE_PREFIXES(variability = DAE.CONST())), _, _)
      then inAccumEl;

    case (InstTypes.TYPED_COMPONENT(name, ty, prefs, binding, _), subs, _)
      equation
        subs = listReverse(subs);
        bind_exp = expandBinding(binding, subs);
        cref = subscriptPath(name, subs);
        (var_kind, dir, vis, fp, sp) = getPrefixes(prefs);
        elem = DAE.VAR(cref, var_kind, dir, DAE.NON_PARALLEL(), vis, ty,
          bind_exp, {}, fp, sp, DAE.emptyElementSource, NONE(), NONE(),
          Absyn.NOT_INNER_OUTER());
      then
        elem :: inAccumEl;

    case (InstTypes.UNTYPED_COMPONENT(name = name), _, _)
      equation
        print("Got untyped component " +& Absyn.pathString(name) +& "\n");
      then
        fail();

    case (InstTypes.CONDITIONAL_COMPONENT(name = name), _, _)
      equation
        print("Got conditional component " +& Absyn.pathString(name) +& "\n");
      then
        fail();

    case (InstTypes.OUTER_COMPONENT(name = _), _, _)
      then inAccumEl;

  end match;
end expandScalar;

protected function expandBinding
  input InstTypes.Binding inBinding;
  input list<list<DAE.Subscript>> inSubscripts;
  output Option<DAE.Exp> outBinding;
algorithm
  outBinding := match(inBinding, inSubscripts)
    local
      DAE.Exp exp;
      Integer pd;
      list<list<DAE.Subscript>> subs;
      list<DAE.Subscript> flat_subs;
      list<DAE.Exp> sub_exps;

    case (InstTypes.UNBOUND(), _) then NONE();

    case (InstTypes.TYPED_BINDING(bindingExp = exp, propagatedDims = -1), _)
      then SOME(exp);

    case (InstTypes.TYPED_BINDING(bindingExp = exp, propagatedDims = pd), _)
      equation
        flat_subs = List.flatten(inSubscripts);
        flat_subs = List.lastN(flat_subs, pd);
        sub_exps = List.map(flat_subs, Expression.subscriptExp);
        exp = DAE.ASUB(exp, sub_exps);
        (exp, _) = ExpressionSimplify.simplify(exp);
      then 
        SOME(exp);

    else
      equation
        print("SCodeExpand.expandBinding got unknown binding\n");
      then
        fail();

  end match;
end expandBinding;

protected function subscriptPath
  input Absyn.Path inPath;
  input list<list<DAE.Subscript>> inSubscripts;
  output DAE.ComponentRef outCref;
algorithm
  outCref := match(inPath, inSubscripts)
    case (_, {{}}) then ComponentReference.pathToCref(inPath);
    else subscriptPath2(inPath, inSubscripts);
  end match;
end subscriptPath;

protected function subscriptPath2
  input Absyn.Path inPath;
  input list<list<DAE.Subscript>> inSubscripts;
  output DAE.ComponentRef outCref;
algorithm
  outCref := match(inPath, inSubscripts)
    local
      String name;
      Absyn.Path path;
      list<DAE.Subscript> subs;
      list<list<DAE.Subscript>> rest_subs;
      DAE.ComponentRef cref;

    case (Absyn.IDENT(name = name), {subs})
      then DAE.CREF_IDENT(name, DAE.T_UNKNOWN_DEFAULT, subs);

    case (Absyn.QUALIFIED(name = name, path = path), subs :: rest_subs)
      equation
        cref = subscriptPath2(path, rest_subs);
      then
        DAE.CREF_QUAL(name, DAE.T_UNKNOWN_DEFAULT, subs, cref);

    case (Absyn.FULLYQUALIFIED(path = path), _)
      then subscriptPath2(path, inSubscripts);

    case (_, {})
      equation
        Error.addMessage(Error.INTERNAL_ERROR,
          {"SCodeExpand.subscriptPath ran out of subscripts!\n"});
      then
        fail();

    case (Absyn.IDENT(name = _), _)
      equation
        Error.addMessage(Error.INTERNAL_ERROR,
          {"SCodeExpand.subscriptPath got too many subscripts!\n"});
      then
        fail();

  end match;
end subscriptPath2;

protected function subscriptCref
  input DAE.ComponentRef inCref;
  input list<list<DAE.Subscript>> inSubscripts;
  output DAE.ComponentRef outCref;
algorithm
  outCref := match(inCref, inSubscripts)
    case (_, {{}}) then inCref;
    else subscriptCref2(inCref, inSubscripts);
  end match;
end subscriptCref;

protected function subscriptCref2
  input DAE.ComponentRef inCref;
  input list<list<DAE.Subscript>> inSubscripts;
  output DAE.ComponentRef outCref;
algorithm
  outCref := match(inCref, inSubscripts)
    local
      String id;
      DAE.Type ty;
      DAE.ComponentRef cref;
      list<DAE.Subscript> subs;
      list<list<DAE.Subscript>> rest_subs;

    case (DAE.CREF_IDENT(id, ty, {}), {subs})
      then DAE.CREF_IDENT(id, ty, subs);

    case (DAE.CREF_IDENT(id, ty, subs), {_})
      then DAE.CREF_IDENT(id, ty, subs);

    case (DAE.CREF_QUAL(id, ty, {}, cref), subs :: rest_subs)
      equation
        cref = subscriptCref2(cref, rest_subs);
      then
        DAE.CREF_QUAL(id, ty, subs, cref);

    case (DAE.CREF_QUAL(id, ty, subs, cref), _ :: rest_subs)
      equation
        cref = subscriptCref2(cref, rest_subs);
      then
        DAE.CREF_QUAL(id, ty, subs, cref);

    case (DAE.WILD(), _) then inCref;

    case (_, {})
      equation
        Error.addMessage(Error.INTERNAL_ERROR,
          {"SCodeExpand.subscriptCref ran out of subscripts!\n"});
      then
        fail();

    case (DAE.CREF_IDENT(ident = _), _)
      equation
        Error.addMessage(Error.INTERNAL_ERROR,
          {"SCodeExpand.subscriptCref got too many subscripts!\n"});
      then
        fail();

  end match;
end subscriptCref2;

protected function unliftComponentType
  input InstTypes.Component inComponent;
  output InstTypes.Component outComponent;
protected
  Absyn.Path name;
  DAE.Type ty;
  InstTypes.DaePrefixes prefs;
  InstTypes.Binding binding;
  Absyn.Info info;
algorithm
  InstTypes.TYPED_COMPONENT(name, DAE.T_ARRAY(ty = ty), prefs, binding, info) := inComponent;
  outComponent := InstTypes.TYPED_COMPONENT(name, ty, prefs, binding, info);
end unliftComponentType;

protected function getPrefixes
  input InstTypes.DaePrefixes inPrefixes;
  output DAE.VarKind outVarKind;
  output DAE.VarDirection outDirection;
  output DAE.VarVisibility outVisibility;
  output DAE.Flow outFlow;
  output DAE.Stream outStream;
algorithm
  (outVarKind, outDirection, outVisibility, outFlow, outStream) :=
  match(inPrefixes)
    local
      DAE.VarKind kind;
      DAE.VarDirection dir;
      DAE.VarVisibility vis;
      DAE.Flow fp;
      DAE.Stream sp;

    case InstTypes.DAE_PREFIXES(vis, kind, _, _, dir, fp, sp)
      then (kind, dir, vis, fp, sp);
    
    case InstTypes.NO_DAE_PREFIXES()
      then (DAE.VARIABLE(), DAE.BIDIR(), DAE.PUBLIC(), DAE.NON_CONNECTOR(),
          DAE.NON_STREAM_CONNECTOR());

  end match;
end getPrefixes;

protected function expandEquation
  input Equation inEquation;
  input list<list<DAE.Subscript>> inSubscripts;
  input list<DAE.Element> inAccumEl;
  output list<DAE.Element> outElements;
algorithm
  outElements := matchcontinue(inEquation, inSubscripts, inAccumEl)
    local
      DAE.Exp rhs, lhs;
      DAE.Element eq;
      DAE.ComponentRef cref1, cref2;
      DAE.Type ty1, ty2;
      list<list<DAE.Subscript>> subs;
      list<DAE.Element> accum_el;
      list<DAE.Dimension> dims;

    case (InstTypes.EQUALITY_EQUATION(lhs = lhs, rhs = rhs), _, _)
      equation
        ty1 = Expression.typeof(lhs);
        dims = Types.getDimensions(ty1);
        accum_el = expandArray((lhs, rhs), dims, {} :: inSubscripts, inAccumEl,
          expandEqEquation);
      then
        accum_el;
        
    case (InstTypes.CONNECT_EQUATION(lhs = _), _, _)
      equation
        print("Skipping expansion of connect\n");
      then
        inAccumEl;

    else
      equation
        print("SCodeExpand.expandEquation failed\n");
      then
        fail();

  end matchcontinue;
end expandEquation; 

protected function expandEqEquation
  input tuple<DAE.Exp, DAE.Exp> inTuple;
  input list<list<DAE.Subscript>> inSubscripts;
  input list<DAE.Element> inAccumEl;
  output list<DAE.Element> outAccumEl;
algorithm
  outAccumEl := match(inTuple, inSubscripts, inAccumEl)
    local
      DAE.Exp lhs, rhs;
      list<list<DAE.Subscript>> subs;
      list<DAE.Subscript> comp_subs;
      DAE.Element eq;
      list<DAE.Exp> sub_expl;

    case ((lhs, rhs), subs as comp_subs :: _, _)
      equation
        subs = listReverse(subs);
        sub_expl = List.map(comp_subs, Expression.subscriptExp);
        lhs = subscriptExp(lhs, sub_expl, subs);
        (lhs, _) = ExpressionSimplify.simplify(lhs);
        rhs = subscriptExp(rhs, sub_expl, subs);
        (rhs, _) = ExpressionSimplify.simplify(rhs);
        eq = DAE.EQUATION(lhs, rhs, DAE.emptyElementSource);
      then
        eq :: inAccumEl;
        
  end match;
end expandEqEquation;

protected function subscriptExp
  input DAE.Exp inExp;
  input list<DAE.Exp> inEqSubscripts;
  input list<list<DAE.Subscript>> inAllSubscripts;
  output DAE.Exp outExp;
algorithm
  outExp := match(inExp, inEqSubscripts, inAllSubscripts)
    local
      DAE.ComponentRef cref;
      DAE.Type ty;
      DAE.Exp e1, e2;
      DAE.Operator op;
      Boolean scalar;
      list<DAE.Exp> expl;

    case (DAE.ICONST(_), _, _) then inExp;
    case (DAE.RCONST(_), _, _) then inExp;
    case (DAE.SCONST(_), _, _) then inExp;
    case (DAE.BCONST(_), _, _) then inExp;
    case (DAE.ENUM_LITERAL(name = _), _, _) then inExp;

    case (DAE.CREF(cref, ty), _, _)
      equation
        cref = subscriptCref(cref, inAllSubscripts);
      then
        DAE.CREF(cref, ty);

    case (DAE.BINARY(e1, op, e2), _, _)
      equation
        e1 = subscriptExp(e1, inEqSubscripts, inAllSubscripts);
        e2 = subscriptExp(e2, inEqSubscripts, inAllSubscripts);
      then
        DAE.BINARY(e1, op, e2);

    case (DAE.ARRAY(ty = _), _, _)
      equation
        e1 = subscriptArrayElements(inExp, inAllSubscripts);
        e2 = DAE.ASUB(e1, inEqSubscripts);
      then
        e2;

    else inExp;
  end match;
end subscriptExp;

protected function subscriptArrayElements
  input DAE.Exp inArray;
  input list<list<DAE.Subscript>> inAllSubscripts;
  output DAE.Exp outArray;
algorithm
  outArray := match(inArray, inAllSubscripts)
    local
      DAE.Type ty;
      Boolean scalar;
      list<DAE.Exp> expl;

    case (DAE.ARRAY(ty as DAE.T_ARRAY(ty = DAE.T_ARRAY(ty = _)), scalar, expl), _)
      equation
        expl = List.map1(expl, subscriptArrayElements, inAllSubscripts);
      then
        DAE.ARRAY(ty, scalar, expl);

    case (DAE.ARRAY(ty, scalar, expl), _)
      equation
        expl = List.map2(expl, subscriptExp, {}, inAllSubscripts);
      then
        DAE.ARRAY(ty, scalar, expl);
       
  end match;
end subscriptArrayElements;

end SCodeExpand;
