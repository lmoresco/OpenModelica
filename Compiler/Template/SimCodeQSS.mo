encapsulated package SimCodeQSS

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
protected import SimCodeC;

protected function fun_20
  input Tpl.Text in_txt;
  input Option<SimCode.SimulationSettings> in_a_simulationSettingsOpt;
  input String in_a_fileNamePrefix;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simulationSettingsOpt, in_a_fileNamePrefix, in_a_simCode)
    local
      Tpl.Text txt;
      String a_fileNamePrefix;
      SimCode.SimCode a_simCode;
      Tpl.Text txt_1;
      Tpl.Text txt_0;

    case ( txt,
           NONE(),
           _,
           _ )
      then txt;

    case ( txt,
           _,
           a_fileNamePrefix,
           a_simCode )
      equation
        txt_0 = SimCodeC.simulationInitFile(Tpl.emptyTxt, a_simCode);
        txt_1 = Tpl.writeStr(Tpl.emptyTxt, a_fileNamePrefix);
        txt_1 = Tpl.writeTok(txt_1, Tpl.ST_STRING("_init.txt"));
        Tpl.textFile(txt_0, Tpl.textString(txt_1));
      then txt;
  end matchcontinue;
end fun_20;

public function translateModel
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;
      Option<SimCode.SimulationSettings> i_simulationSettingsOpt;
      list<DAE.Exp> i_literals;
      list<SimCode.RecordDeclaration> i_recordDecls;
      list<SimCode.Function> i_modelInfo_functions;
      String i_fileNamePrefix;
      SimCode.SimCode i_simCode;
      Tpl.Text txt_9;
      Tpl.Text txt_8;
      Tpl.Text txt_7;
      Tpl.Text txt_6;
      Tpl.Text txt_5;
      Tpl.Text txt_4;
      Tpl.Text txt_3;
      Tpl.Text txt_2;
      Tpl.Text txt_1;
      Tpl.Text txt_0;

    case ( txt,
           (i_simCode as SimCode.SIMCODE(modelInfo = SimCode.MODELINFO(functions = i_modelInfo_functions), fileNamePrefix = i_fileNamePrefix, recordDecls = i_recordDecls, literals = i_literals, simulationSettingsOpt = i_simulationSettingsOpt)) )
      equation
        txt_0 = simulationFile(Tpl.emptyTxt, i_simCode);
        txt_1 = Tpl.writeStr(Tpl.emptyTxt, i_fileNamePrefix);
        txt_1 = Tpl.writeTok(txt_1, Tpl.ST_STRING(".cpp"));
        Tpl.textFile(txt_0, Tpl.textString(txt_1));
        txt_2 = SimCodeC.simulationFunctionsHeaderFile(Tpl.emptyTxt, i_fileNamePrefix, i_modelInfo_functions, i_recordDecls);
        txt_3 = Tpl.writeStr(Tpl.emptyTxt, i_fileNamePrefix);
        txt_3 = Tpl.writeTok(txt_3, Tpl.ST_STRING("_functions.h"));
        Tpl.textFile(txt_2, Tpl.textString(txt_3));
        txt_4 = SimCodeC.simulationFunctionsFile(Tpl.emptyTxt, i_fileNamePrefix, i_modelInfo_functions, i_literals);
        txt_5 = Tpl.writeStr(Tpl.emptyTxt, i_fileNamePrefix);
        txt_5 = Tpl.writeTok(txt_5, Tpl.ST_STRING("_functions.cpp"));
        Tpl.textFile(txt_4, Tpl.textString(txt_5));
        txt_6 = SimCodeC.recordsFile(Tpl.emptyTxt, i_fileNamePrefix, i_recordDecls);
        txt_7 = Tpl.writeStr(Tpl.emptyTxt, i_fileNamePrefix);
        txt_7 = Tpl.writeTok(txt_7, Tpl.ST_STRING("_records.c"));
        Tpl.textFile(txt_6, Tpl.textString(txt_7));
        txt_8 = SimCodeC.simulationMakefile(Tpl.emptyTxt, i_simCode);
        txt_9 = Tpl.writeStr(Tpl.emptyTxt, i_fileNamePrefix);
        txt_9 = Tpl.writeTok(txt_9, Tpl.ST_STRING(".makefile"));
        Tpl.textFile(txt_8, Tpl.textString(txt_9));
        txt = fun_20(txt, i_simulationSettingsOpt, i_fileNamePrefix, i_simCode);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end translateModel;

public function simulationFile
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;
      list<SimCode.HelpVarInfo> i_helpVarInfo;
      list<SimCode.SimWhenClause> i_whenClauses;
      list<BackendDAE.ZeroCrossing> i_zeroCrossings;
      SimCode.ExtObjInfo i_extObjInfo;
      list<SimCode.SimEqSystem> i_allEquations;
      list<SimCode.JacobianMatrix> i_JacobianMatrixes;
      String i_fileNamePrefix;
      SimCode.ModelInfo i_modelInfo;
      list<String> i_externalFunctionIncludes;
      SimCode.SimCode i_simCode;
      list<SimCode.SimEqSystem> ret_1;
      list<SimCode.SimEqSystem> ret_0;

    case ( txt,
           (i_simCode as SimCode.SIMCODE(externalFunctionIncludes = i_externalFunctionIncludes, modelInfo = i_modelInfo, fileNamePrefix = i_fileNamePrefix, JacobianMatrixes = i_JacobianMatrixes, allEquations = i_allEquations, extObjInfo = i_extObjInfo, zeroCrossings = i_zeroCrossings, whenClauses = i_whenClauses, helpVarInfo = i_helpVarInfo)) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = SimCodeC.simulationFileHeader(txt, i_simCode);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = SimCodeC.externalFunctionIncludes(txt, i_externalFunctionIncludes);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\n",
                                    "#ifdef _OMC_MEASURE_TIME\n",
                                    "int measure_time_flag = 1;\n",
                                    "#else\n",
                                    "int measure_time_flag = 0;\n",
                                    "#endif\n",
                                    "\n"
                                }, true));
        txt = SimCodeC.globalData(txt, i_modelInfo, i_fileNamePrefix);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        ret_0 = SimCode.appendAllequation(i_JacobianMatrixes);
        ret_1 = SimCode.appendLists(ret_0, i_allEquations);
        txt = SimCodeC.equationInfo(txt, ret_1);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = SimCodeC.functionGetName(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = SimCodeC.functionSetLocalData(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = SimCodeC.functionInitializeDataStruc(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = SimCodeC.functionCallExternalObjectConstructors(txt, i_extObjInfo);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = SimCodeC.functionDeInitializeDataStruc(txt, i_extObjInfo);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = SimCodeC.functionExtraResiduals(txt, i_allEquations);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\n",
                                    "// fbergero, xfloros: Code for QSS methods\n",
                                    "#ifdef _OMC_QSS\n"
                                }, true));
        txt = functionQssSample(txt, i_zeroCrossings);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = functionQssWhen(txt, i_whenClauses, i_helpVarInfo);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("#endif\n"));
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end simulationFile;

protected function lm_23
  input Tpl.Text in_txt;
  input list<BackendDAE.ZeroCrossing> in_items;
  input Tpl.Text in_a_varDecls;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_varDecls) :=
  matchcontinue(in_txt, in_items, in_a_varDecls)
    local
      Tpl.Text txt;
      list<BackendDAE.ZeroCrossing> rest;
      Tpl.Text a_varDecls;
      Integer x_i0;
      DAE.Exp i_interval;
      DAE.Exp i_start;

    case ( txt,
           {},
           a_varDecls )
      then (txt, a_varDecls);

    case ( txt,
           BackendDAE.ZERO_CROSSING(relation_ = DAE.CALL(path = Absyn.IDENT(name = "sample"), expLst = {i_start, i_interval})) :: rest,
           a_varDecls )
      equation
        x_i0 = Tpl.getIteri_i0(txt);
        (txt, a_varDecls) = functionQssSample3(txt, x_i0, i_start, i_interval, a_varDecls);
        txt = Tpl.nextIter(txt);
        (txt, a_varDecls) = lm_23(txt, rest, a_varDecls);
      then (txt, a_varDecls);

    case ( txt,
           _ :: rest,
           a_varDecls )
      equation
        (txt, a_varDecls) = lm_23(txt, rest, a_varDecls);
      then (txt, a_varDecls);
  end matchcontinue;
end lm_23;

public function functionQssSample2
  input Tpl.Text txt;
  input list<BackendDAE.ZeroCrossing> a_zeroCrossings;
  input Tpl.Text a_varDecls;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
algorithm
  out_txt := Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
  (out_txt, out_a_varDecls) := lm_23(out_txt, a_zeroCrossings, a_varDecls);
  out_txt := Tpl.popIter(out_txt);
end functionQssSample2;

public function functionQssSample3
  input Tpl.Text txt;
  input Integer a_index1;
  input DAE.Exp a_start;
  input DAE.Exp a_interval;
  input Tpl.Text a_varDecls;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
protected
  Tpl.Text l_e2;
  Tpl.Text l_e1;
  Tpl.Text l_preExp;
algorithm
  l_preExp := Tpl.emptyTxt;
  (l_e1, l_preExp, out_a_varDecls) := SimCodeC.daeExp(Tpl.emptyTxt, a_start, SimCode.contextOther, l_preExp, a_varDecls);
  (l_e2, l_preExp, out_a_varDecls) := SimCodeC.daeExp(Tpl.emptyTxt, a_interval, SimCode.contextOther, l_preExp, out_a_varDecls);
  out_txt := Tpl.writeTok(txt, Tpl.ST_STRING("case "));
  out_txt := Tpl.writeStr(out_txt, intString(a_index1));
  out_txt := Tpl.writeTok(out_txt, Tpl.ST_LINE(":\n"));
  out_txt := Tpl.pushBlock(out_txt, Tpl.BT_INDENT(2));
  out_txt := Tpl.writeText(out_txt, l_preExp);
  out_txt := Tpl.softNewLine(out_txt);
  out_txt := Tpl.writeTok(out_txt, Tpl.ST_STRING("out[0] = "));
  out_txt := Tpl.writeText(out_txt, l_e1);
  out_txt := Tpl.writeTok(out_txt, Tpl.ST_STRING_LIST({
                                       ";\n",
                                       "out[1] = "
                                   }, false));
  out_txt := Tpl.writeText(out_txt, l_e2);
  out_txt := Tpl.writeTok(out_txt, Tpl.ST_STRING_LIST({
                                       ";\n",
                                       "break;"
                                   }, false));
  out_txt := Tpl.popBlock(out_txt);
end functionQssSample3;

public function functionQssSample
  input Tpl.Text txt;
  input list<BackendDAE.ZeroCrossing> a_zeroCrossings;

  output Tpl.Text out_txt;
protected
  Tpl.Text l_sampleCode;
  Tpl.Text l_varDecls;
algorithm
  l_varDecls := Tpl.emptyTxt;
  (l_sampleCode, l_varDecls) := functionQssSample2(Tpl.emptyTxt, a_zeroCrossings, l_varDecls);
  out_txt := Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                   "void functionQssSample(unsigned int sampleIndex, double *out)\n",
                                   "{\n",
                                   "  state mem_state;\n"
                               }, true));
  out_txt := Tpl.pushBlock(out_txt, Tpl.BT_INDENT(2));
  out_txt := Tpl.writeText(out_txt, l_varDecls);
  out_txt := Tpl.softNewLine(out_txt);
  out_txt := Tpl.writeTok(out_txt, Tpl.ST_STRING_LIST({
                                       "mem_state = get_memory_state();\n",
                                       "switch (sampleIndex)\n",
                                       "{\n"
                                   }, true));
  out_txt := Tpl.pushBlock(out_txt, Tpl.BT_INDENT(2));
  out_txt := Tpl.writeText(out_txt, l_sampleCode);
  out_txt := Tpl.softNewLine(out_txt);
  out_txt := Tpl.popBlock(out_txt);
  out_txt := Tpl.writeTok(out_txt, Tpl.ST_STRING_LIST({
                                       "}\n",
                                       "restore_memory_state(mem_state);\n"
                                   }, true));
  out_txt := Tpl.popBlock(out_txt);
  out_txt := Tpl.writeTok(out_txt, Tpl.ST_STRING("}"));
end functionQssSample;

public function functionQssWhen
  input Tpl.Text txt;
  input list<SimCode.SimWhenClause> a_whenClauses;
  input list<SimCode.HelpVarInfo> a_helpVars;

  output Tpl.Text out_txt;
protected
  Tpl.Text l_varDecls;
algorithm
  l_varDecls := Tpl.emptyTxt;
  out_txt := Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                   "bool functionQssWhen(unsigned int whenIndex, double *out)\n",
                                   "{\n",
                                   "  state mem_state;\n"
                               }, true));
  out_txt := Tpl.pushBlock(out_txt, Tpl.BT_INDENT(2));
  out_txt := Tpl.writeText(out_txt, l_varDecls);
  out_txt := Tpl.softNewLine(out_txt);
  out_txt := Tpl.writeTok(out_txt, Tpl.ST_STRING_LIST({
                                       "mem_state = get_memory_state();\n",
                                       "switch (whenIndex)\n",
                                       "{\n",
                                       "}\n",
                                       "restore_memory_state(mem_state);\n"
                                   }, true));
  out_txt := Tpl.popBlock(out_txt);
  out_txt := Tpl.writeTok(out_txt, Tpl.ST_STRING("}"));
end functionQssWhen;

end SimCodeQSS;