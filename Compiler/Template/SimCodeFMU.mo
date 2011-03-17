encapsulated package SimCodeFMU

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
public import SimCodeC;

public function translateModel
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;
      String i_fileNamePrefix;
      SimCode.SimCode i_simCode;
      Tpl.Text txt_6;
      Tpl.Text txt_5;
      Tpl.Text txt_4;
      Tpl.Text txt_3;
      Tpl.Text txt_2;
      String ret_1;
      Tpl.Text l_guid;

    case ( txt,
           (i_simCode as SimCode.SIMCODE(fileNamePrefix = i_fileNamePrefix)) )
      equation
        ret_1 = System.getUUIDStr();
        l_guid = Tpl.writeStr(Tpl.emptyTxt, ret_1);
        txt_2 = fmuModelDescriptionFile(Tpl.emptyTxt, i_simCode, Tpl.textString(l_guid));
        Tpl.textFile(txt_2, "modelDescription.xml");
        txt_3 = fmumodel_identifierFile(Tpl.emptyTxt, i_simCode, Tpl.textString(l_guid));
        txt_4 = Tpl.writeStr(Tpl.emptyTxt, i_fileNamePrefix);
        txt_4 = Tpl.writeTok(txt_4, Tpl.ST_STRING("_FMU.cpp"));
        Tpl.textFile(txt_3, Tpl.textString(txt_4));
        txt_5 = fmuMakefile(Tpl.emptyTxt, i_simCode);
        txt_6 = Tpl.writeStr(Tpl.emptyTxt, i_fileNamePrefix);
        txt_6 = Tpl.writeTok(txt_6, Tpl.ST_STRING("_FMU.makefile"));
        Tpl.textFile(txt_5, Tpl.textString(txt_6));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end translateModel;

public function fmuModelDescriptionFile
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;
  input String in_a_guid;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode, in_a_guid)
    local
      Tpl.Text txt;
      String a_guid;
      SimCode.SimCode i_simCode;

    case ( txt,
           (i_simCode as SimCode.SIMCODE(modelInfo = _)),
           a_guid )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"));
        txt = fmiModelDescription(txt, i_simCode, a_guid);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
      then txt;

    case ( txt,
           _,
           _ )
      then txt;
  end matchcontinue;
end fmuModelDescriptionFile;

public function fmiModelDescription
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;
  input String in_a_guid;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode, in_a_guid)
    local
      Tpl.Text txt;
      String a_guid;
      SimCode.ModelInfo i_modelInfo;
      Option<SimCode.SimulationSettings> i_simulationSettingsOpt;
      SimCode.SimCode i_simCode;

    case ( txt,
           (i_simCode as SimCode.SIMCODE(simulationSettingsOpt = i_simulationSettingsOpt, modelInfo = i_modelInfo)),
           a_guid )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("<fmiModelDescription\n"));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = fmiModelDescriptionAttributes(txt, i_simCode, a_guid);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE(">\n"));
        txt = DefaultExperiment(txt, i_simulationSettingsOpt);
        txt = Tpl.softNewLine(txt);
        txt = ModelVariables(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("</fmiModelDescription>"));
      then txt;

    case ( txt,
           _,
           _ )
      then txt;
  end matchcontinue;
end fmiModelDescription;

public function fmiModelDescriptionAttributes
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;
  input String in_a_guid;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode, in_a_guid)
    local
      Tpl.Text txt;
      String a_guid;
      Integer i_vi_numZeroCrossings;
      Integer i_vi_numStateVars;
      String i_fileNamePrefix;
      Absyn.Path i_modelInfo_name;
      Tpl.Text l_numberOfEventIndicators;
      Tpl.Text l_numberOfContinuousStates;
      Tpl.Text l_variableNamingConvention;
      Util.DateTime ret_9;
      Tpl.Text l_generationDateAndTime;
      String ret_7;
      Tpl.Text l_generationTool;
      Tpl.Text l_version;
      Tpl.Text l_author;
      Tpl.Text l_description;
      Tpl.Text l_modelIdentifier;
      Tpl.Text l_modelName;
      Tpl.Text l_fmiVersion;

    case ( txt,
           SimCode.SIMCODE(modelInfo = SimCode.MODELINFO(varInfo = SimCode.VARINFO(numStateVars = i_vi_numStateVars, numZeroCrossings = i_vi_numZeroCrossings), name = i_modelInfo_name), fileNamePrefix = i_fileNamePrefix),
           a_guid )
      equation
        l_fmiVersion = Tpl.writeTok(Tpl.emptyTxt, Tpl.ST_STRING("1.0"));
        l_modelName = SimCodeC.dotPath(Tpl.emptyTxt, i_modelInfo_name);
        l_modelIdentifier = Tpl.writeStr(Tpl.emptyTxt, i_fileNamePrefix);
        l_description = Tpl.emptyTxt;
        l_author = Tpl.emptyTxt;
        l_version = Tpl.emptyTxt;
        l_generationTool = Tpl.writeTok(Tpl.emptyTxt, Tpl.ST_STRING("OpenModelica Compiler "));
        ret_7 = Settings.getVersionNr();
        l_generationTool = Tpl.writeStr(l_generationTool, ret_7);
        ret_9 = Util.getCurrentDateTime();
        l_generationDateAndTime = xsdateTime(Tpl.emptyTxt, ret_9);
        l_variableNamingConvention = Tpl.writeTok(Tpl.emptyTxt, Tpl.ST_STRING("structured"));
        l_numberOfContinuousStates = Tpl.writeStr(Tpl.emptyTxt, intString(i_vi_numStateVars));
        l_numberOfEventIndicators = Tpl.writeStr(Tpl.emptyTxt, intString(i_vi_numZeroCrossings));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("fmiVersion=\""));
        txt = Tpl.writeText(txt, l_fmiVersion);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\"\n",
                                    "modelName=\""
                                }, false));
        txt = Tpl.writeText(txt, l_modelName);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\"\n",
                                    "modelIdentifier=\""
                                }, false));
        txt = Tpl.writeText(txt, l_modelIdentifier);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\"\n",
                                    "guid=\"{"
                                }, false));
        txt = Tpl.writeStr(txt, a_guid);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "}\"\n",
                                    "generationTool=\""
                                }, false));
        txt = Tpl.writeText(txt, l_generationTool);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\"\n",
                                    "generationDateAndTime=\""
                                }, false));
        txt = Tpl.writeText(txt, l_generationDateAndTime);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\"\n",
                                    "variableNamingConvention=\""
                                }, false));
        txt = Tpl.writeText(txt, l_variableNamingConvention);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\"\n",
                                    "numberOfContinuousStates=\""
                                }, false));
        txt = Tpl.writeText(txt, l_numberOfContinuousStates);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\"\n",
                                    "numberOfEventIndicators=\""
                                }, false));
        txt = Tpl.writeText(txt, l_numberOfEventIndicators);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
      then txt;

    case ( txt,
           _,
           _ )
      then txt;
  end matchcontinue;
end fmiModelDescriptionAttributes;

public function xsdateTime
  input Tpl.Text in_txt;
  input Util.DateTime in_a_dt;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_dt)
    local
      Tpl.Text txt;
      Integer i_sec;
      Integer i_min;
      Integer i_hour;
      Integer i_mday;
      Integer i_mon;
      Integer i_year;
      String ret_4;
      String ret_3;
      String ret_2;
      String ret_1;
      String ret_0;

    case ( txt,
           Util.DATETIME(year = i_year, mon = i_mon, mday = i_mday, hour = i_hour, min = i_min, sec = i_sec) )
      equation
        txt = Tpl.writeStr(txt, intString(i_year));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("-"));
        ret_0 = SimCode.twodigit(i_mon);
        txt = Tpl.writeStr(txt, ret_0);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("-"));
        ret_1 = SimCode.twodigit(i_mday);
        txt = Tpl.writeStr(txt, ret_1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("T"));
        ret_2 = SimCode.twodigit(i_hour);
        txt = Tpl.writeStr(txt, ret_2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(":"));
        ret_3 = SimCode.twodigit(i_min);
        txt = Tpl.writeStr(txt, ret_3);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(":"));
        ret_4 = SimCode.twodigit(i_sec);
        txt = Tpl.writeStr(txt, ret_4);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("Z"));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end xsdateTime;

public function UnitDefinitions
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;

    case ( txt,
           SimCode.SIMCODE(modelInfo = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "<UnitDefinitions>\n",
                                    "</UnitDefinitions>"
                                }, false));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end UnitDefinitions;

public function TypeDefinitions
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;

    case ( txt,
           SimCode.SIMCODE(modelInfo = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "<TypeDefinitions>\n",
                                    "</TypeDefinitions>"
                                }, false));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end TypeDefinitions;

public function DefaultExperiment
  input Tpl.Text in_txt;
  input Option<SimCode.SimulationSettings> in_a_simulationSettingsOpt;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simulationSettingsOpt)
    local
      Tpl.Text txt;
      SimCode.SimulationSettings i_v;

    case ( txt,
           SOME(i_v) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("<DefaultExperiment "));
        txt = DefaultExperimentAttribute(txt, i_v);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("/>"));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end DefaultExperiment;

public function DefaultExperimentAttribute
  input Tpl.Text in_txt;
  input SimCode.SimulationSettings in_a_simulationSettings;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simulationSettings)
    local
      Tpl.Text txt;
      Real i_tolerance;
      Real i_stopTime;
      Real i_startTime;

    case ( txt,
           SimCode.SIMULATION_SETTINGS(startTime = i_startTime, stopTime = i_stopTime, tolerance = i_tolerance) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("startTime=\""));
        txt = Tpl.writeStr(txt, realString(i_startTime));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\" stopTime=\""));
        txt = Tpl.writeStr(txt, realString(i_stopTime));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\" tolerance=\""));
        txt = Tpl.writeStr(txt, realString(i_tolerance));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end DefaultExperimentAttribute;

public function VendorAnnotations
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;

    case ( txt,
           SimCode.SIMCODE(modelInfo = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "<VendorAnnotations>\n",
                                    "</VendorAnnotations>"
                                }, false));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end VendorAnnotations;

protected function lm_30
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = ScalarVariable(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_30(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_30(txt, rest);
      then txt;
  end matchcontinue;
end lm_30;

protected function lm_31
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = ScalarVariable(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_31(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_31(txt, rest);
      then txt;
  end matchcontinue;
end lm_31;

protected function lm_32
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = ScalarVariable(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_32(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_32(txt, rest);
      then txt;
  end matchcontinue;
end lm_32;

protected function lm_33
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = ScalarVariable(txt, i_var);
        txt = Tpl.nextIter(txt);
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
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = ScalarVariable(txt, i_var);
        txt = Tpl.nextIter(txt);
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
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = ScalarVariable(txt, i_var);
        txt = Tpl.nextIter(txt);
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
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = ScalarVariable(txt, i_var);
        txt = Tpl.nextIter(txt);
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
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = ScalarVariable(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_37(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_37(txt, rest);
      then txt;
  end matchcontinue;
end lm_37;

protected function lm_38
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = ScalarVariable(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_38(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_38(txt, rest);
      then txt;
  end matchcontinue;
end lm_38;

protected function lm_39
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = ScalarVariable(txt, i_var);
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

protected function lm_40
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = ScalarVariable(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_40(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_40(txt, rest);
      then txt;
  end matchcontinue;
end lm_40;

protected function lm_41
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = ScalarVariable(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_41(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_41(txt, rest);
      then txt;
  end matchcontinue;
end lm_41;

protected function lm_42
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = ScalarVariable(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_42(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_42(txt, rest);
      then txt;
  end matchcontinue;
end lm_42;

protected function lm_43
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = ScalarVariable(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_43(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_43(txt, rest);
      then txt;
  end matchcontinue;
end lm_43;

public function ModelVariables
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> i_vars_stringAliasVars;
      list<SimCode.SimVar> i_vars_stringParamVars;
      list<SimCode.SimVar> i_vars_stringAlgVars;
      list<SimCode.SimVar> i_vars_boolAliasVars;
      list<SimCode.SimVar> i_vars_boolParamVars;
      list<SimCode.SimVar> i_vars_boolAlgVars;
      list<SimCode.SimVar> i_vars_intAliasVars;
      list<SimCode.SimVar> i_vars_intParamVars;
      list<SimCode.SimVar> i_vars_intAlgVars;
      list<SimCode.SimVar> i_vars_aliasVars;
      list<SimCode.SimVar> i_vars_paramVars;
      list<SimCode.SimVar> i_vars_algVars;
      list<SimCode.SimVar> i_vars_derivativeVars;
      list<SimCode.SimVar> i_vars_stateVars;

    case ( txt,
           SimCode.MODELINFO(vars = SimCode.SIMVARS(stateVars = i_vars_stateVars, derivativeVars = i_vars_derivativeVars, algVars = i_vars_algVars, paramVars = i_vars_paramVars, aliasVars = i_vars_aliasVars, intAlgVars = i_vars_intAlgVars, intParamVars = i_vars_intParamVars, intAliasVars = i_vars_intAliasVars, boolAlgVars = i_vars_boolAlgVars, boolParamVars = i_vars_boolParamVars, boolAliasVars = i_vars_boolAliasVars, stringAlgVars = i_vars_stringAlgVars, stringParamVars = i_vars_stringParamVars, stringAliasVars = i_vars_stringAliasVars)) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("<ModelVariables>\n"));
        System.tmpTickReset(0);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_30(txt, i_vars_stateVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_31(txt, i_vars_derivativeVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_32(txt, i_vars_algVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_33(txt, i_vars_paramVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_34(txt, i_vars_aliasVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        System.tmpTickReset(0);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_35(txt, i_vars_intAlgVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_36(txt, i_vars_intParamVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_37(txt, i_vars_intAliasVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        System.tmpTickReset(0);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_38(txt, i_vars_boolAlgVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_39(txt, i_vars_boolParamVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_40(txt, i_vars_boolAliasVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        System.tmpTickReset(0);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_41(txt, i_vars_stringAlgVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_42(txt, i_vars_stringParamVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_43(txt, i_vars_stringAliasVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("</ModelVariables>"));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end ModelVariables;

public function ScalarVariable
  input Tpl.Text in_txt;
  input SimCode.SimVar in_a_simVar;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simVar)
    local
      Tpl.Text txt;
      Boolean i_isFixed;
      Option<DAE.Exp> i_initialValue;
      String i_displayUnit;
      String i_unit;
      DAE.ExpType i_type__;
      SimCode.SimVar i_simVar;

    case ( txt,
           (i_simVar as SimCode.SIMVAR(type_ = i_type__, unit = i_unit, displayUnit = i_displayUnit, initialValue = i_initialValue, isFixed = i_isFixed)) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("<ScalarVariable\n"));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = ScalarVariableAttribute(txt, i_simVar);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE(">\n"));
        txt = ScalarVariableType(txt, i_type__, i_unit, i_displayUnit, i_initialValue, i_isFixed);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("</ScalarVariable>"));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end ScalarVariable;

protected function fun_46
  input Tpl.Text in_txt;
  input String in_a_comment;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_comment)
    local
      Tpl.Text txt;
      String i_comment;

    case ( txt,
           "" )
      then txt;

    case ( txt,
           i_comment )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("description=\""));
        txt = Tpl.writeStr(txt, i_comment);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
      then txt;
  end matchcontinue;
end fun_46;

public function ScalarVariableAttribute
  input Tpl.Text in_txt;
  input SimCode.SimVar in_a_simVar;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simVar)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_name;
      SimCode.Causality i_causality;
      SimCode.AliasVariable i_aliasvar;
      String i_comment;
      BackendDAE.VarKind i_varKind;
      Tpl.Text l_caus;
      Tpl.Text l_alias;
      Tpl.Text l_description;
      Tpl.Text l_variability;
      Integer ret_1;
      Tpl.Text l_valueReference;

    case ( txt,
           SimCode.SIMVAR(varKind = i_varKind, comment = i_comment, aliasvar = i_aliasvar, causality = i_causality, name = i_name) )
      equation
        ret_1 = System.tmpTick();
        l_valueReference = Tpl.writeStr(Tpl.emptyTxt, intString(ret_1));
        l_variability = getVariablity(Tpl.emptyTxt, i_varKind);
        l_description = fun_46(Tpl.emptyTxt, i_comment);
        l_alias = getAliasVar(Tpl.emptyTxt, i_aliasvar);
        l_caus = getCausality(Tpl.emptyTxt, i_causality);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("name=\""));
        txt = SimCodeC.crefStr(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\"\n",
                                    "valueReference=\""
                                }, false));
        txt = Tpl.writeText(txt, l_valueReference);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("\"\n"));
        txt = Tpl.writeText(txt, l_description);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("variability=\""));
        txt = Tpl.writeText(txt, l_variability);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\"\n",
                                    "causality=\""
                                }, false));
        txt = Tpl.writeText(txt, l_caus);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\"\n",
                                    "alias=\""
                                }, false));
        txt = Tpl.writeText(txt, l_alias);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end ScalarVariableAttribute;

public function getCausality
  input Tpl.Text in_txt;
  input SimCode.Causality in_a_c;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_c)
    local
      Tpl.Text txt;

    case ( txt,
           SimCode.NONECAUS() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("none"));
      then txt;

    case ( txt,
           SimCode.INTERNAL() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("internal"));
      then txt;

    case ( txt,
           SimCode.OUTPUT() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("output"));
      then txt;

    case ( txt,
           SimCode.INPUT() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("input"));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end getCausality;

public function getVariablity
  input Tpl.Text in_txt;
  input BackendDAE.VarKind in_a_varKind;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_varKind)
    local
      Tpl.Text txt;

    case ( txt,
           BackendDAE.DISCRETE() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("discrete"));
      then txt;

    case ( txt,
           BackendDAE.PARAM() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("parameter"));
      then txt;

    case ( txt,
           BackendDAE.CONST() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("constant"));
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("continuous"));
      then txt;
  end matchcontinue;
end getVariablity;

public function getAliasVar
  input Tpl.Text in_txt;
  input SimCode.AliasVariable in_a_aliasvar;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_aliasvar)
    local
      Tpl.Text txt;

    case ( txt,
           SimCode.NOALIAS() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("noAlias"));
      then txt;

    case ( txt,
           SimCode.ALIAS(varName = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("alias"));
      then txt;

    case ( txt,
           SimCode.NEGATEDALIAS(varName = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("negatedAlias"));
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("noAlias"));
      then txt;
  end matchcontinue;
end getAliasVar;

public function ScalarVariableType
  input Tpl.Text in_txt;
  input DAE.ExpType in_a_type__;
  input String in_a_unit;
  input String in_a_displayUnit;
  input Option<DAE.Exp> in_a_initialValue;
  input Boolean in_a_isFixed;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_type__, in_a_unit, in_a_displayUnit, in_a_initialValue, in_a_isFixed)
    local
      Tpl.Text txt;
      String a_unit;
      String a_displayUnit;
      Option<DAE.Exp> a_initialValue;
      Boolean a_isFixed;

    case ( txt,
           DAE.ET_INT(),
           _,
           _,
           _,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("<Integer/>"));
      then txt;

    case ( txt,
           DAE.ET_REAL(),
           a_unit,
           a_displayUnit,
           a_initialValue,
           a_isFixed )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("<Real "));
        txt = ScalarVariableTypeCommonAttribute(txt, a_initialValue, a_isFixed);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
        txt = ScalarVariableTypeRealAttribute(txt, a_unit, a_displayUnit);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("/>"));
      then txt;

    case ( txt,
           DAE.ET_BOOL(),
           _,
           _,
           _,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("<Boolean/>"));
      then txt;

    case ( txt,
           DAE.ET_STRING(),
           _,
           _,
           _,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("<String/>"));
      then txt;

    case ( txt,
           DAE.ET_ENUMERATION(path = _),
           _,
           _,
           _,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("<Integer/>"));
      then txt;

    case ( txt,
           _,
           _,
           _,
           _,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("UNKOWN_TYPE"));
      then txt;
  end matchcontinue;
end ScalarVariableType;

public function ScalarVariableTypeCommonAttribute
  input Tpl.Text in_txt;
  input Option<DAE.Exp> in_a_initialValue;
  input Boolean in_a_isFixed;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_initialValue, in_a_isFixed)
    local
      Tpl.Text txt;
      Boolean a_isFixed;
      DAE.Exp i_exp;

    case ( txt,
           SOME(i_exp),
           a_isFixed )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("start=\""));
        txt = SimCodeC.initVal(txt, i_exp);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\" fixed=\""));
        txt = Tpl.writeStr(txt, Tpl.booleanString(a_isFixed));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
      then txt;

    case ( txt,
           _,
           _ )
      then txt;
  end matchcontinue;
end ScalarVariableTypeCommonAttribute;

protected function fun_53
  input Tpl.Text in_txt;
  input String in_a_unit;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_unit)
    local
      Tpl.Text txt;
      String i_unit;

    case ( txt,
           "" )
      then txt;

    case ( txt,
           i_unit )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("unit=\""));
        txt = Tpl.writeStr(txt, i_unit);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
      then txt;
  end matchcontinue;
end fun_53;

protected function fun_54
  input Tpl.Text in_txt;
  input String in_a_displayUnit;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_displayUnit)
    local
      Tpl.Text txt;
      String i_displayUnit;

    case ( txt,
           "" )
      then txt;

    case ( txt,
           i_displayUnit )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("displayUnit=\""));
        txt = Tpl.writeStr(txt, i_displayUnit);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
      then txt;
  end matchcontinue;
end fun_54;

public function ScalarVariableTypeRealAttribute
  input Tpl.Text txt;
  input String a_unit;
  input String a_displayUnit;

  output Tpl.Text out_txt;
protected
  Tpl.Text l_displayUnit__;
  Tpl.Text l_unit__;
algorithm
  l_unit__ := fun_53(Tpl.emptyTxt, a_unit);
  l_displayUnit__ := fun_54(Tpl.emptyTxt, a_displayUnit);
  out_txt := Tpl.writeText(txt, l_unit__);
  out_txt := Tpl.writeTok(out_txt, Tpl.ST_STRING(" "));
  out_txt := Tpl.writeText(out_txt, l_displayUnit__);
end ScalarVariableTypeRealAttribute;

public function fmumodel_identifierFile
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;
  input String in_a_guid;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode, in_a_guid)
    local
      Tpl.Text txt;
      String a_guid;
      SimCode.SimCode i_simCode;
      SimCode.ModelInfo i_modelInfo;
      String i_fileNamePrefix;

    case ( txt,
           (i_simCode as SimCode.SIMCODE(fileNamePrefix = i_fileNamePrefix, modelInfo = i_modelInfo)),
           a_guid )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\n",
                                    "// define class name and unique id\n",
                                    "#define MODEL_IDENTIFIER "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("#define MODEL_GUID \"{"));
        txt = Tpl.writeStr(txt, a_guid);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "}\"\n",
                                    "\n",
                                    "// include fmu header files, typedefs and macros\n",
                                    "#include \"fmiModelFunctions.h\"\n",
                                    "#include \"fmu_model_interface.h\"\n",
                                    "#include \""
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "_functions.h\"\n",
                                    "\n",
                                    "void setStartValues(ModelInstance *comp);\n",
                                    "fmiStatus getEventIndicator(ModelInstance* comp, fmiReal eventIndicators[]);\n",
                                    "void eventUpdate(ModelInstance* comp, fmiEventInfo* eventInfo);\n",
                                    "fmiReal getReal(ModelInstance* comp, const fmiValueReference vr);\n",
                                    "fmiStatus setReal(ModelInstance* comp, const fmiValueReference vr, const fmiReal value);\n",
                                    "fmiInteger getInteger(ModelInstance* comp, const fmiValueReference vr);\n",
                                    "fmiStatus setInteger(ModelInstance* comp, const fmiValueReference vr, const fmiInteger value);\n",
                                    "fmiBoolean getBoolean(ModelInstance* comp, const fmiValueReference vr);\n",
                                    "fmiStatus setBoolean(ModelInstance* comp, const fmiValueReference vr, const fmiBoolean value);\n",
                                    "fmiString getString(ModelInstance* comp, const fmiValueReference vr);\n",
                                    "fmiStatus setString(ModelInstance* comp, const fmiValueReference vr, const fmiString value);\n",
                                    "fmiStatus setExternalFunction(ModelInstance* c, const fmiValueReference vr, const void* value);\n",
                                    "\n"
                                }, true));
        txt = ModelDefineData(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\n",
                                    "// implementation of the Model Exchange functions\n",
                                    "#include \"fmu_model_interface.c\"\n",
                                    "\n"
                                }, true));
        txt = setStartValues(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = getEventIndicatorFunction(txt, i_simCode);
        txt = Tpl.softNewLine(txt);
        txt = eventUpdateFunction(txt, i_simCode);
        txt = Tpl.softNewLine(txt);
        txt = getRealFunction(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = setRealFunction(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = getIntegerFunction(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = setIntegerFunction(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = getBooleanFunction(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = setBooleanFunction(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = getStringFunction(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = setStringFunction(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = setExternalFunction(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
      then txt;

    case ( txt,
           _,
           _ )
      then txt;
  end matchcontinue;
end fmumodel_identifierFile;

protected function lm_57
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = DefineVariables(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_57(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_57(txt, rest);
      then txt;
  end matchcontinue;
end lm_57;

protected function lm_58
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = DefineVariables(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_58(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_58(txt, rest);
      then txt;
  end matchcontinue;
end lm_58;

protected function lm_59
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = DefineVariables(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_59(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_59(txt, rest);
      then txt;
  end matchcontinue;
end lm_59;

protected function lm_60
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = DefineVariables(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_60(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_60(txt, rest);
      then txt;
  end matchcontinue;
end lm_60;

protected function lm_61
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = DefineVariables(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_61(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_61(txt, rest);
      then txt;
  end matchcontinue;
end lm_61;

protected function lm_62
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = DefineVariables(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_62(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_62(txt, rest);
      then txt;
  end matchcontinue;
end lm_62;

protected function lm_63
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = DefineVariables(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_63(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_63(txt, rest);
      then txt;
  end matchcontinue;
end lm_63;

protected function lm_64
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = DefineVariables(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_64(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_64(txt, rest);
      then txt;
  end matchcontinue;
end lm_64;

protected function lm_65
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = DefineVariables(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_65(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_65(txt, rest);
      then txt;
  end matchcontinue;
end lm_65;

protected function lm_66
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = DefineVariables(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_66(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_66(txt, rest);
      then txt;
  end matchcontinue;
end lm_66;

protected function lm_67
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = DefineVariables(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_67(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_67(txt, rest);
      then txt;
  end matchcontinue;
end lm_67;

protected function lm_68
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = DefineVariables(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_68(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_68(txt, rest);
      then txt;
  end matchcontinue;
end lm_68;

protected function lm_69
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = DefineVariables(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_69(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_69(txt, rest);
      then txt;
  end matchcontinue;
end lm_69;

protected function lm_70
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = DefineVariables(txt, i_var);
        txt = Tpl.nextIter(txt);
        txt = lm_70(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_70(txt, rest);
      then txt;
  end matchcontinue;
end lm_70;

protected function lm_71
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      DAE.ComponentRef i_name;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           SimCode.SIMVAR(name = i_name) :: rest )
      equation
        txt = SimCodeC.cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_"));
        txt = Tpl.nextIter(txt);
        txt = lm_71(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_71(txt, rest);
      then txt;
  end matchcontinue;
end lm_71;

protected function lm_72
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      DAE.ComponentRef i_name;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           SimCode.SIMVAR(name = i_name) :: rest )
      equation
        txt = SimCodeC.cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_"));
        txt = Tpl.nextIter(txt);
        txt = lm_72(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_72(txt, rest);
      then txt;
  end matchcontinue;
end lm_72;

public function ModelDefineData
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> i_vars_stringAliasVars;
      list<SimCode.SimVar> i_vars_stringParamVars;
      list<SimCode.SimVar> i_vars_stringAlgVars;
      list<SimCode.SimVar> i_vars_boolAliasVars;
      list<SimCode.SimVar> i_vars_boolParamVars;
      list<SimCode.SimVar> i_vars_boolAlgVars;
      list<SimCode.SimVar> i_vars_intAliasVars;
      list<SimCode.SimVar> i_vars_intParamVars;
      list<SimCode.SimVar> i_vars_intAlgVars;
      list<SimCode.SimVar> i_vars_aliasVars;
      list<SimCode.SimVar> i_vars_paramVars;
      list<SimCode.SimVar> i_vars_algVars;
      list<SimCode.SimVar> i_vars_derivativeVars;
      list<SimCode.SimVar> i_vars_stateVars;
      Integer i_varInfo_numZeroCrossings;
      Integer i_varInfo_numBoolAliasVars;
      Integer i_varInfo_numBoolParams;
      Integer i_varInfo_numBoolAlgVars;
      Integer i_varInfo_numStringAliasVars;
      Integer i_varInfo_numStringParamVars;
      Integer i_varInfo_numStringAlgVars;
      Integer i_varInfo_numIntAliasVars;
      Integer i_varInfo_numIntParams;
      Integer i_varInfo_numIntAlgVars;
      Integer i_varInfo_numAlgAliasVars;
      Integer i_varInfo_numParams;
      Integer i_varInfo_numAlgVars;
      Integer i_varInfo_numStateVars;
      Integer ret_12;
      Integer ret_11;
      Tpl.Text l_numberOfBooleans;
      Integer ret_9;
      Integer ret_8;
      Tpl.Text l_numberOfStrings;
      Integer ret_6;
      Integer ret_5;
      Tpl.Text l_numberOfIntegers;
      Integer ret_3;
      Integer ret_2;
      Integer ret_1;
      Tpl.Text l_numberOfReals;

    case ( txt,
           SimCode.MODELINFO(varInfo = SimCode.VARINFO(numStateVars = i_varInfo_numStateVars, numAlgVars = i_varInfo_numAlgVars, numParams = i_varInfo_numParams, numAlgAliasVars = i_varInfo_numAlgAliasVars, numIntAlgVars = i_varInfo_numIntAlgVars, numIntParams = i_varInfo_numIntParams, numIntAliasVars = i_varInfo_numIntAliasVars, numStringAlgVars = i_varInfo_numStringAlgVars, numStringParamVars = i_varInfo_numStringParamVars, numStringAliasVars = i_varInfo_numStringAliasVars, numBoolAlgVars = i_varInfo_numBoolAlgVars, numBoolParams = i_varInfo_numBoolParams, numBoolAliasVars = i_varInfo_numBoolAliasVars, numZeroCrossings = i_varInfo_numZeroCrossings), vars = SimCode.SIMVARS(stateVars = i_vars_stateVars, derivativeVars = i_vars_derivativeVars, algVars = i_vars_algVars, paramVars = i_vars_paramVars, aliasVars = i_vars_aliasVars, intAlgVars = i_vars_intAlgVars, intParamVars = i_vars_intParamVars, intAliasVars = i_vars_intAliasVars, boolAlgVars = i_vars_boolAlgVars, boolParamVars = i_vars_boolParamVars, boolAliasVars = i_vars_boolAliasVars, stringAlgVars = i_vars_stringAlgVars, stringParamVars = i_vars_stringParamVars, stringAliasVars = i_vars_stringAliasVars)) )
      equation
        ret_1 = intAdd(i_varInfo_numParams, i_varInfo_numAlgAliasVars);
        ret_2 = intAdd(i_varInfo_numAlgVars, ret_1);
        ret_3 = intAdd(i_varInfo_numStateVars, ret_2);
        l_numberOfReals = Tpl.writeStr(Tpl.emptyTxt, intString(ret_3));
        ret_5 = intAdd(i_varInfo_numIntParams, i_varInfo_numIntAliasVars);
        ret_6 = intAdd(i_varInfo_numIntAlgVars, ret_5);
        l_numberOfIntegers = Tpl.writeStr(Tpl.emptyTxt, intString(ret_6));
        ret_8 = intAdd(i_varInfo_numStringParamVars, i_varInfo_numStringAliasVars);
        ret_9 = intAdd(i_varInfo_numStringAlgVars, ret_8);
        l_numberOfStrings = Tpl.writeStr(Tpl.emptyTxt, intString(ret_9));
        ret_11 = intAdd(i_varInfo_numBoolParams, i_varInfo_numBoolAliasVars);
        ret_12 = intAdd(i_varInfo_numBoolAlgVars, ret_11);
        l_numberOfBooleans = Tpl.writeStr(Tpl.emptyTxt, intString(ret_12));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "// define model size\n",
                                    "#define NUMBER_OF_STATES "
                                }, false));
        txt = Tpl.writeStr(txt, intString(i_varInfo_numStateVars));
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("#define NUMBER_OF_EVENT_INDICATORS "));
        txt = Tpl.writeStr(txt, intString(i_varInfo_numZeroCrossings));
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("#define NUMBER_OF_REALS "));
        txt = Tpl.writeText(txt, l_numberOfReals);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("#define NUMBER_OF_INTEGERS "));
        txt = Tpl.writeText(txt, l_numberOfIntegers);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("#define NUMBER_OF_STRINGS "));
        txt = Tpl.writeText(txt, l_numberOfStrings);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("#define NUMBER_OF_BOOLEANS "));
        txt = Tpl.writeText(txt, l_numberOfBooleans);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "#define NUMBER_OF_EXTERNALFUNCTIONS 0\n",
                                    "\n",
                                    "// define variable data for model\n"
                                }, true));
        System.tmpTickReset(0);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_57(txt, i_vars_stateVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_58(txt, i_vars_derivativeVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_59(txt, i_vars_algVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_60(txt, i_vars_paramVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_61(txt, i_vars_aliasVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        System.tmpTickReset(0);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_62(txt, i_vars_intAlgVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_63(txt, i_vars_intParamVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_64(txt, i_vars_intAliasVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        System.tmpTickReset(0);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_65(txt, i_vars_boolAlgVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_66(txt, i_vars_boolParamVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_67(txt, i_vars_boolAliasVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        System.tmpTickReset(0);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_68(txt, i_vars_stringAlgVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_69(txt, i_vars_stringParamVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_70(txt, i_vars_stringAliasVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\n",
                                    "\n",
                                    "// define initial state vector as vector of value references\n",
                                    "#define STATES { "
                                }, false));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_STRING(", ")), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_71(txt, i_vars_stateVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    " }\n",
                                    "#define STATESDERIVATIVES { "
                                }, false));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_STRING(", ")), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_72(txt, i_vars_derivativeVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    " }\n",
                                    "\n"
                                }, true));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end ModelDefineData;

public function dervativeNameCStyle
  input Tpl.Text in_txt;
  input DAE.ComponentRef in_a_cr;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_cr)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_componentRef;

    case ( txt,
           DAE.CREF_QUAL(ident = "$DER", componentRef = i_componentRef) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("der_"));
        txt = SimCodeC.crefStr(txt, i_componentRef);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_"));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end dervativeNameCStyle;

protected function fun_75
  input Tpl.Text in_txt;
  input String in_a_comment;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_comment)
    local
      Tpl.Text txt;
      String i_comment;

    case ( txt,
           "" )
      then txt;

    case ( txt,
           i_comment )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("// \""));
        txt = Tpl.writeStr(txt, i_comment);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
      then txt;
  end matchcontinue;
end fun_75;

public function DefineVariables
  input Tpl.Text in_txt;
  input SimCode.SimVar in_a_simVar;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simVar)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_name;
      String i_comment;
      Integer ret_1;
      Tpl.Text l_description;

    case ( txt,
           SimCode.SIMVAR(comment = i_comment, name = i_name) )
      equation
        l_description = fun_75(Tpl.emptyTxt, i_comment);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("#define "));
        txt = SimCodeC.cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_ "));
        ret_1 = System.tmpTick();
        txt = Tpl.writeStr(txt, intString(ret_1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
        txt = Tpl.writeText(txt, l_description);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end DefineVariables;

public function setStartValues
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> i_vars_stringAlgVars;
      list<SimCode.SimVar> i_vars_stringParamVars;
      list<SimCode.SimVar> i_vars_boolAlgVars;
      list<SimCode.SimVar> i_vars_boolParamVars;
      list<SimCode.SimVar> i_vars_intAlgVars;
      list<SimCode.SimVar> i_vars_intParamVars;
      list<SimCode.SimVar> i_vars_paramVars;
      list<SimCode.SimVar> i_vars_algVars;
      list<SimCode.SimVar> i_vars_derivativeVars;
      list<SimCode.SimVar> i_vars_stateVars;

    case ( txt,
           SimCode.MODELINFO(vars = SimCode.SIMVARS(stateVars = i_vars_stateVars, derivativeVars = i_vars_derivativeVars, algVars = i_vars_algVars, paramVars = i_vars_paramVars, intParamVars = i_vars_intParamVars, intAlgVars = i_vars_intAlgVars, boolParamVars = i_vars_boolParamVars, boolAlgVars = i_vars_boolAlgVars, stringParamVars = i_vars_stringParamVars, stringAlgVars = i_vars_stringAlgVars)) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "// Set values for all variables that define a start value\n",
                                    "void setStartValues(ModelInstance *comp) {\n",
                                    "\n"
                                }, true));
        txt = initVals(txt, i_vars_stateVars, "r", "states");
        txt = Tpl.softNewLine(txt);
        txt = initDerivativeVals(txt, i_vars_derivativeVars);
        txt = Tpl.softNewLine(txt);
        txt = initVals(txt, i_vars_algVars, "r", "algebraics");
        txt = Tpl.softNewLine(txt);
        txt = initVals(txt, i_vars_paramVars, "r", "parameters");
        txt = Tpl.softNewLine(txt);
        txt = initVals(txt, i_vars_intParamVars, "i", "intVariables.parameters");
        txt = Tpl.softNewLine(txt);
        txt = initVals(txt, i_vars_intAlgVars, "i", "intVariables.algebraics");
        txt = Tpl.softNewLine(txt);
        txt = initVals(txt, i_vars_boolParamVars, "b", "boolVariables.parameters");
        txt = Tpl.softNewLine(txt);
        txt = initVals(txt, i_vars_boolAlgVars, "b", "boolVariables.algebraics");
        txt = Tpl.softNewLine(txt);
        txt = initVals(txt, i_vars_stringParamVars, "s", "stringVariables.parameters");
        txt = Tpl.softNewLine(txt);
        txt = initVals(txt, i_vars_stringAlgVars, "s", "stringVariables.algebraics");
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("}"));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end setStartValues;

protected function lm_78
  input Tpl.Text in_txt;
  input list<SimCode.SimEqSystem> in_items;
  input Tpl.Text in_a_varDecls;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_varDecls) :=
  matchcontinue(in_txt, in_items, in_a_varDecls)
    local
      Tpl.Text txt;
      list<SimCode.SimEqSystem> rest;
      Tpl.Text a_varDecls;
      SimCode.SimEqSystem i_eq;

    case ( txt,
           {},
           a_varDecls )
      then (txt, a_varDecls);

    case ( txt,
           (i_eq as SimCode.SES_SIMPLE_ASSIGN(cref = _)) :: rest,
           a_varDecls )
      equation
        (txt, a_varDecls) = SimCodeC.equation_(txt, i_eq, SimCode.contextOther, a_varDecls);
        txt = Tpl.nextIter(txt);
        (txt, a_varDecls) = lm_78(txt, rest, a_varDecls);
      then (txt, a_varDecls);

    case ( txt,
           _ :: rest,
           a_varDecls )
      equation
        (txt, a_varDecls) = lm_78(txt, rest, a_varDecls);
      then (txt, a_varDecls);
  end matchcontinue;
end lm_78;

protected function lm_79
  input Tpl.Text in_txt;
  input list<SimCode.SimEqSystem> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimEqSystem> rest;
      DAE.ComponentRef i_cref;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           SimCode.SES_SIMPLE_ASSIGN(cref = i_cref) :: rest )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("if (sim_verbose) { printf(\"Setting variable start value: %s(start=%f)\\n\", \""));
        txt = SimCodeC.cref(txt, i_cref);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\", "));
        txt = SimCodeC.cref(txt, i_cref);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("); }"));
        txt = Tpl.nextIter(txt);
        txt = lm_79(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_79(txt, rest);
      then txt;
  end matchcontinue;
end lm_79;

public function initializeFunction
  input Tpl.Text txt;
  input list<SimCode.SimEqSystem> a_allEquations;

  output Tpl.Text out_txt;
protected
  Tpl.Text l_eqPart;
  Tpl.Text l_varDecls;
algorithm
  l_varDecls := Tpl.emptyTxt;
  l_eqPart := Tpl.pushIter(Tpl.emptyTxt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
  (l_eqPart, l_varDecls) := lm_78(l_eqPart, a_allEquations, l_varDecls);
  l_eqPart := Tpl.popIter(l_eqPart);
  out_txt := Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                   "// Used to set the first time event, if any.\n",
                                   "void initialize(ModelInstance* comp, fmiEventInfo* eventInfo) {\n",
                                   "\n"
                               }, true));
  out_txt := Tpl.pushBlock(out_txt, Tpl.BT_INDENT(2));
  out_txt := Tpl.writeText(out_txt, l_varDecls);
  out_txt := Tpl.softNewLine(out_txt);
  out_txt := Tpl.writeTok(out_txt, Tpl.ST_NEW_LINE());
  out_txt := Tpl.writeText(out_txt, l_eqPart);
  out_txt := Tpl.softNewLine(out_txt);
  out_txt := Tpl.pushIter(out_txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
  out_txt := lm_79(out_txt, a_allEquations);
  out_txt := Tpl.popIter(out_txt);
  out_txt := Tpl.softNewLine(out_txt);
  out_txt := Tpl.writeTok(out_txt, Tpl.ST_NEW_LINE());
  out_txt := Tpl.popBlock(out_txt);
  out_txt := Tpl.writeTok(out_txt, Tpl.ST_STRING("}"));
end initializeFunction;

protected function fun_81
  input Tpl.Text in_txt;
  input Option<DAE.Exp> in_a_initialValue;
  input String in_a_prefix;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_initialValue, in_a_prefix)
    local
      Tpl.Text txt;
      String a_prefix;
      DAE.Exp i_v;

    case ( txt,
           SOME(i_v),
           _ )
      equation
        txt = initVal(txt, i_v);
      then txt;

    case ( txt,
           _,
           a_prefix )
      equation
        txt = setDefaultVal(txt, a_prefix);
      then txt;
  end matchcontinue;
end fun_81;

protected function lm_82
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;
  input String in_a_prefix;
  input String in_a_arrayName;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items, in_a_prefix, in_a_arrayName)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      String a_prefix;
      String a_arrayName;
      Option<DAE.Exp> i_initialValue;
      Integer i_index;

    case ( txt,
           {},
           _,
           _ )
      then txt;

    case ( txt,
           SimCode.SIMVAR(index = i_index, initialValue = i_initialValue) :: rest,
           a_prefix,
           a_arrayName )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("globalData->"));
        txt = Tpl.writeStr(txt, a_arrayName);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("["));
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("] = "));
        txt = fun_81(txt, i_initialValue, a_prefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
        txt = Tpl.nextIter(txt);
        txt = lm_82(txt, rest, a_prefix, a_arrayName);
      then txt;

    case ( txt,
           _ :: rest,
           a_prefix,
           a_arrayName )
      equation
        txt = lm_82(txt, rest, a_prefix, a_arrayName);
      then txt;
  end matchcontinue;
end lm_82;

public function initVals
  input Tpl.Text txt;
  input list<SimCode.SimVar> a_varsLst;
  input String a_prefix;
  input String a_arrayName;

  output Tpl.Text out_txt;
algorithm
  out_txt := Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
  out_txt := lm_82(out_txt, a_varsLst, a_prefix, a_arrayName);
  out_txt := Tpl.popIter(out_txt);
end initVals;

public function setDefaultVal
  input Tpl.Text in_txt;
  input String in_a_prefix;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_prefix)
    local
      Tpl.Text txt;

    case ( txt,
           "r" )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("0.0; //default value for real"));
      then txt;

    case ( txt,
           "i" )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("0; //default value for integer"));
      then txt;

    case ( txt,
           "b" )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("false; //default value for bool"));
      then txt;

    case ( txt,
           "s" )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\"\"; //default value for string"));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end setDefaultVal;

protected function fun_85
  input Tpl.Text in_txt;
  input Option<DAE.Exp> in_a_initialValue;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_initialValue)
    local
      Tpl.Text txt;
      DAE.Exp i_v;

    case ( txt,
           SOME(i_v) )
      equation
        txt = initVal(txt, i_v);
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("0.0; //default"));
      then txt;
  end matchcontinue;
end fun_85;

protected function lm_86
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      Option<DAE.Exp> i_initialValue;
      Integer i_index;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           SimCode.SIMVAR(index = i_index, initialValue = i_initialValue) :: rest )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("globalData->statesDerivatives["));
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("] = "));
        txt = fun_85(txt, i_initialValue);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
        txt = Tpl.nextIter(txt);
        txt = lm_86(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_86(txt, rest);
      then txt;
  end matchcontinue;
end lm_86;

public function initDerivativeVals
  input Tpl.Text txt;
  input list<SimCode.SimVar> a_varsLst;

  output Tpl.Text out_txt;
algorithm
  out_txt := Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
  out_txt := lm_86(out_txt, a_varsLst);
  out_txt := Tpl.popIter(out_txt);
end initDerivativeVals;

protected function fun_88
  input Tpl.Text in_txt;
  input Boolean in_a_bool;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_bool)
    local
      Tpl.Text txt;

    case ( txt,
           false )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("false"));
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("true"));
      then txt;
  end matchcontinue;
end fun_88;

public function initVal
  input Tpl.Text in_txt;
  input DAE.Exp in_a_initialValue;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_initialValue)
    local
      Tpl.Text txt;
      Absyn.Path i_name;
      Integer i_index;
      Boolean i_bool;
      String i_string;
      Real i_real;
      Integer i_integer;
      String ret_0;

    case ( txt,
           DAE.ICONST(integer = i_integer) )
      equation
        txt = Tpl.writeStr(txt, intString(i_integer));
      then txt;

    case ( txt,
           DAE.RCONST(real = i_real) )
      equation
        txt = Tpl.writeStr(txt, realString(i_real));
      then txt;

    case ( txt,
           DAE.SCONST(string = i_string) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
        ret_0 = Util.escapeModelicaStringToCString(i_string);
        txt = Tpl.writeStr(txt, ret_0);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
      then txt;

    case ( txt,
           DAE.BCONST(bool = i_bool) )
      equation
        txt = fun_88(txt, i_bool);
      then txt;

    case ( txt,
           DAE.ENUM_LITERAL(index = i_index, name = i_name) )
      equation
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("/*ENUM:"));
        txt = SimCodeC.dotPath(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("*/"));
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("*ERROR* initial value of unknown type"));
      then txt;
  end matchcontinue;
end initVal;

public function eventUpdateFunction
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;

    case ( txt,
           SimCode.SIMCODE(modelInfo = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "// Used to set the next time event, if any.\n",
                                    "void eventUpdate(ModelInstance* comp, fmiEventInfo* eventInfo) {\n",
                                    "}\n",
                                    "\n"
                                }, true));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end eventUpdateFunction;

public function getEventIndicatorFunction
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;
      list<BackendDAE.ZeroCrossing> i_zeroCrossings;
      Tpl.Text l_zeroCrossingsCode;
      Tpl.Text l_varDecls;

    case ( txt,
           SimCode.SIMCODE(zeroCrossings = i_zeroCrossings) )
      equation
        l_varDecls = Tpl.emptyTxt;
        (l_zeroCrossingsCode, l_varDecls) = zeroCrossingsTpl2_fmu(Tpl.emptyTxt, i_zeroCrossings, l_varDecls);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "// Used to get event indicators\n",
                                    "fmiStatus getEventIndicator(ModelInstance* comp, fmiReal eventIndicators[]) {\n",
                                    "int res = function_onlyZeroCrossings(eventIndicators, &globalData->timeValue);\n",
                                    "if (res == 0) return fmiOK;\n",
                                    "return fmiError;\n",
                                    "}\n",
                                    "\n"
                                }, true));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end getEventIndicatorFunction;

protected function lm_92
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
      DAE.Exp i_relation__;

    case ( txt,
           {},
           a_varDecls )
      then (txt, a_varDecls);

    case ( txt,
           BackendDAE.ZERO_CROSSING(relation_ = i_relation__) :: rest,
           a_varDecls )
      equation
        x_i0 = Tpl.getIteri_i0(txt);
        (txt, a_varDecls) = zeroCrossingTpl2_fmu(txt, x_i0, i_relation__, a_varDecls);
        txt = Tpl.nextIter(txt);
        (txt, a_varDecls) = lm_92(txt, rest, a_varDecls);
      then (txt, a_varDecls);

    case ( txt,
           _ :: rest,
           a_varDecls )
      equation
        (txt, a_varDecls) = lm_92(txt, rest, a_varDecls);
      then (txt, a_varDecls);
  end matchcontinue;
end lm_92;

public function zeroCrossingsTpl2_fmu
  input Tpl.Text txt;
  input list<BackendDAE.ZeroCrossing> a_zeroCrossings;
  input Tpl.Text a_varDecls;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
algorithm
  out_txt := Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
  (out_txt, out_a_varDecls) := lm_92(out_txt, a_zeroCrossings, a_varDecls);
  out_txt := Tpl.popIter(out_txt);
end zeroCrossingsTpl2_fmu;

protected function fun_94
  input Tpl.Text in_txt;
  input DAE.Exp in_a_relation;
  input Integer in_a_index1;
  input Tpl.Text in_a_varDecls;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_varDecls) :=
  matchcontinue(in_txt, in_a_relation, in_a_index1, in_a_varDecls)
    local
      Tpl.Text txt;
      Integer a_index1;
      Tpl.Text a_varDecls;
      DAE.Exp i_exp2;
      DAE.Operator i_operator;
      DAE.Exp i_exp1;
      Tpl.Text l_e2;
      Tpl.Text l_op;
      Tpl.Text l_e1;
      Tpl.Text l_preExp;

    case ( txt,
           DAE.RELATION(exp1 = i_exp1, operator = i_operator, exp2 = i_exp2),
           a_index1,
           a_varDecls )
      equation
        l_preExp = Tpl.emptyTxt;
        (l_e1, l_preExp, a_varDecls) = SimCodeC.daeExp(Tpl.emptyTxt, i_exp1, SimCode.contextOther, l_preExp, a_varDecls);
        l_op = zeroCrossingOpFunc_fmu(Tpl.emptyTxt, i_operator);
        (l_e2, l_preExp, a_varDecls) = SimCodeC.daeExp(Tpl.emptyTxt, i_exp2, SimCode.contextOther, l_preExp, a_varDecls);
        txt = Tpl.writeText(txt, l_preExp);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("FMIZEROCROSSING("));
        txt = Tpl.writeStr(txt, intString(a_index1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", "));
        txt = Tpl.writeText(txt, l_op);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, l_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_, "));
        txt = Tpl.writeText(txt, l_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("));"));
      then (txt, a_varDecls);

    case ( txt,
           DAE.CALL(path = Absyn.IDENT(name = "sample"), expLst = {_, _}),
           _,
           a_varDecls )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
      then (txt, a_varDecls);

    case ( txt,
           _,
           a_index1,
           a_varDecls )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("// UNKNOWN ZERO CROSSING for "));
        txt = Tpl.writeStr(txt, intString(a_index1));
      then (txt, a_varDecls);
  end matchcontinue;
end fun_94;

public function zeroCrossingTpl2_fmu
  input Tpl.Text txt;
  input Integer a_index1;
  input DAE.Exp a_relation;
  input Tpl.Text a_varDecls;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_varDecls) := fun_94(txt, a_relation, a_index1, a_varDecls);
end zeroCrossingTpl2_fmu;

public function zeroCrossingOpFunc_fmu
  input Tpl.Text in_txt;
  input DAE.Operator in_a_op;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_op)
    local
      Tpl.Text txt;

    case ( txt,
           DAE.LESS(ty = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("FmiLess"));
      then txt;

    case ( txt,
           DAE.GREATER(ty = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("FmiGreater"));
      then txt;

    case ( txt,
           DAE.LESSEQ(ty = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("FmiLessEq"));
      then txt;

    case ( txt,
           DAE.GREATEREQ(ty = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("FmiGreaterEq"));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end zeroCrossingOpFunc_fmu;

protected function lm_97
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVars(txt, i_var, "states");
        txt = Tpl.nextIter(txt);
        txt = lm_97(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_97(txt, rest);
      then txt;
  end matchcontinue;
end lm_97;

protected function lm_98
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVars(txt, i_var, "statesDerivatives");
        txt = Tpl.nextIter(txt);
        txt = lm_98(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_98(txt, rest);
      then txt;
  end matchcontinue;
end lm_98;

protected function lm_99
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVars(txt, i_var, "algebraics");
        txt = Tpl.nextIter(txt);
        txt = lm_99(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_99(txt, rest);
      then txt;
  end matchcontinue;
end lm_99;

protected function lm_100
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVars(txt, i_var, "parameters");
        txt = Tpl.nextIter(txt);
        txt = lm_100(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_100(txt, rest);
      then txt;
  end matchcontinue;
end lm_100;

protected function lm_101
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchAliasVars(txt, i_var, "realAlias", "-");
        txt = Tpl.nextIter(txt);
        txt = lm_101(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_101(txt, rest);
      then txt;
  end matchcontinue;
end lm_101;

public function getRealFunction
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> i_vars_aliasVars;
      list<SimCode.SimVar> i_vars_paramVars;
      list<SimCode.SimVar> i_vars_algVars;
      list<SimCode.SimVar> i_vars_derivativeVars;
      list<SimCode.SimVar> i_vars_stateVars;

    case ( txt,
           SimCode.MODELINFO(vars = SimCode.SIMVARS(stateVars = i_vars_stateVars, derivativeVars = i_vars_derivativeVars, algVars = i_vars_algVars, paramVars = i_vars_paramVars, aliasVars = i_vars_aliasVars)) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "fmiReal getReal(ModelInstance* comp, const fmiValueReference vr) {\n",
                                    "  switch (vr) {\n"
                                }, true));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(6));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_97(txt, i_vars_stateVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_98(txt, i_vars_derivativeVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_99(txt, i_vars_algVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_100(txt, i_vars_paramVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_101(txt, i_vars_aliasVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "default:\n",
                                    "    return 0.0;\n"
                                }, true));
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "  }\n",
                                    "}\n",
                                    "\n"
                                }, true));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end getRealFunction;

protected function lm_103
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVarsSet(txt, i_var, "states");
        txt = Tpl.nextIter(txt);
        txt = lm_103(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_103(txt, rest);
      then txt;
  end matchcontinue;
end lm_103;

protected function lm_104
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVarsSet(txt, i_var, "statesDerivatives");
        txt = Tpl.nextIter(txt);
        txt = lm_104(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_104(txt, rest);
      then txt;
  end matchcontinue;
end lm_104;

protected function lm_105
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVarsSet(txt, i_var, "algebraics");
        txt = Tpl.nextIter(txt);
        txt = lm_105(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_105(txt, rest);
      then txt;
  end matchcontinue;
end lm_105;

protected function lm_106
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVarsSet(txt, i_var, "parameters");
        txt = Tpl.nextIter(txt);
        txt = lm_106(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_106(txt, rest);
      then txt;
  end matchcontinue;
end lm_106;

protected function lm_107
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchAliasVarsSet(txt, i_var, "realAlias");
        txt = Tpl.nextIter(txt);
        txt = lm_107(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_107(txt, rest);
      then txt;
  end matchcontinue;
end lm_107;

public function setRealFunction
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> i_vars_aliasVars;
      list<SimCode.SimVar> i_vars_paramVars;
      list<SimCode.SimVar> i_vars_algVars;
      list<SimCode.SimVar> i_vars_derivativeVars;
      list<SimCode.SimVar> i_vars_stateVars;

    case ( txt,
           SimCode.MODELINFO(vars = SimCode.SIMVARS(stateVars = i_vars_stateVars, derivativeVars = i_vars_derivativeVars, algVars = i_vars_algVars, paramVars = i_vars_paramVars, aliasVars = i_vars_aliasVars)) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "fmiStatus setReal(ModelInstance* comp, const fmiValueReference vr, const fmiReal value) {\n",
                                    "  switch (vr) {\n"
                                }, true));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(6));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_103(txt, i_vars_stateVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_104(txt, i_vars_derivativeVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_105(txt, i_vars_algVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_106(txt, i_vars_paramVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_107(txt, i_vars_aliasVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "default:\n",
                                    "    return fmiError;\n"
                                }, true));
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "  }\n",
                                    "  return fmiOK;\n",
                                    "}\n",
                                    "\n"
                                }, true));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end setRealFunction;

protected function lm_109
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVars(txt, i_var, "intVariables.algebraics");
        txt = Tpl.nextIter(txt);
        txt = lm_109(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_109(txt, rest);
      then txt;
  end matchcontinue;
end lm_109;

protected function lm_110
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVars(txt, i_var, "intVariables.parameters");
        txt = Tpl.nextIter(txt);
        txt = lm_110(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_110(txt, rest);
      then txt;
  end matchcontinue;
end lm_110;

protected function lm_111
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchAliasVars(txt, i_var, "intVariables.alias", "-");
        txt = Tpl.nextIter(txt);
        txt = lm_111(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_111(txt, rest);
      then txt;
  end matchcontinue;
end lm_111;

public function getIntegerFunction
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> i_vars_intAliasVars;
      list<SimCode.SimVar> i_vars_intParamVars;
      list<SimCode.SimVar> i_vars_intAlgVars;

    case ( txt,
           SimCode.MODELINFO(vars = SimCode.SIMVARS(intAlgVars = i_vars_intAlgVars, intParamVars = i_vars_intParamVars, intAliasVars = i_vars_intAliasVars)) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "fmiInteger getInteger(ModelInstance* comp, const fmiValueReference vr) {\n",
                                    "  switch (vr) {\n"
                                }, true));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(6));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_109(txt, i_vars_intAlgVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_110(txt, i_vars_intParamVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_111(txt, i_vars_intAliasVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "default:\n",
                                    "    return 0;\n"
                                }, true));
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "  }\n",
                                    "}\n",
                                    "\n"
                                }, true));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end getIntegerFunction;

protected function lm_113
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVarsSet(txt, i_var, "intVariables.algebraics");
        txt = Tpl.nextIter(txt);
        txt = lm_113(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_113(txt, rest);
      then txt;
  end matchcontinue;
end lm_113;

protected function lm_114
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVarsSet(txt, i_var, "intVariables.parameters");
        txt = Tpl.nextIter(txt);
        txt = lm_114(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_114(txt, rest);
      then txt;
  end matchcontinue;
end lm_114;

protected function lm_115
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchAliasVarsSet(txt, i_var, "intVariables.alias");
        txt = Tpl.nextIter(txt);
        txt = lm_115(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_115(txt, rest);
      then txt;
  end matchcontinue;
end lm_115;

public function setIntegerFunction
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> i_vars_intAliasVars;
      list<SimCode.SimVar> i_vars_intParamVars;
      list<SimCode.SimVar> i_vars_intAlgVars;

    case ( txt,
           SimCode.MODELINFO(vars = SimCode.SIMVARS(intAlgVars = i_vars_intAlgVars, intParamVars = i_vars_intParamVars, intAliasVars = i_vars_intAliasVars)) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "fmiStatus setInteger(ModelInstance* comp, const fmiValueReference vr, const fmiInteger value) {\n",
                                    "  switch (vr) {\n"
                                }, true));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(6));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_113(txt, i_vars_intAlgVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_114(txt, i_vars_intParamVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_115(txt, i_vars_intAliasVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "default:\n",
                                    "    return fmiError;\n"
                                }, true));
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "  }\n",
                                    "  return fmiOK;\n",
                                    "}\n",
                                    "\n"
                                }, true));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end setIntegerFunction;

protected function lm_117
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVars(txt, i_var, "boolVariables.algebraics");
        txt = Tpl.nextIter(txt);
        txt = lm_117(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_117(txt, rest);
      then txt;
  end matchcontinue;
end lm_117;

protected function lm_118
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVars(txt, i_var, "boolVariables.parameters");
        txt = Tpl.nextIter(txt);
        txt = lm_118(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_118(txt, rest);
      then txt;
  end matchcontinue;
end lm_118;

protected function lm_119
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchAliasVars(txt, i_var, "boolVariables.alias", "!");
        txt = Tpl.nextIter(txt);
        txt = lm_119(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_119(txt, rest);
      then txt;
  end matchcontinue;
end lm_119;

public function getBooleanFunction
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> i_vars_boolAliasVars;
      list<SimCode.SimVar> i_vars_boolParamVars;
      list<SimCode.SimVar> i_vars_boolAlgVars;

    case ( txt,
           SimCode.MODELINFO(vars = SimCode.SIMVARS(boolAlgVars = i_vars_boolAlgVars, boolParamVars = i_vars_boolParamVars, boolAliasVars = i_vars_boolAliasVars)) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "fmiBoolean getBoolean(ModelInstance* comp, const fmiValueReference vr) {\n",
                                    "  switch (vr) {\n"
                                }, true));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(6));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_117(txt, i_vars_boolAlgVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_118(txt, i_vars_boolParamVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_119(txt, i_vars_boolAliasVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "default:\n",
                                    "    return 0;\n"
                                }, true));
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "  }\n",
                                    "}\n",
                                    "\n"
                                }, true));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end getBooleanFunction;

protected function lm_121
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVarsSet(txt, i_var, "boolVariables.algebraics");
        txt = Tpl.nextIter(txt);
        txt = lm_121(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_121(txt, rest);
      then txt;
  end matchcontinue;
end lm_121;

protected function lm_122
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVarsSet(txt, i_var, "boolVariables.parameters");
        txt = Tpl.nextIter(txt);
        txt = lm_122(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_122(txt, rest);
      then txt;
  end matchcontinue;
end lm_122;

protected function lm_123
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchAliasVarsSet(txt, i_var, "boolVariables.alias");
        txt = Tpl.nextIter(txt);
        txt = lm_123(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_123(txt, rest);
      then txt;
  end matchcontinue;
end lm_123;

public function setBooleanFunction
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> i_vars_boolAliasVars;
      list<SimCode.SimVar> i_vars_boolParamVars;
      list<SimCode.SimVar> i_vars_boolAlgVars;

    case ( txt,
           SimCode.MODELINFO(vars = SimCode.SIMVARS(boolAlgVars = i_vars_boolAlgVars, boolParamVars = i_vars_boolParamVars, boolAliasVars = i_vars_boolAliasVars)) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "fmiStatus setBoolean(ModelInstance* comp, const fmiValueReference vr, const fmiBoolean value) {\n",
                                    "  switch (vr) {\n"
                                }, true));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(6));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_121(txt, i_vars_boolAlgVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_122(txt, i_vars_boolParamVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_123(txt, i_vars_boolAliasVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "default:\n",
                                    "    return fmiError;\n"
                                }, true));
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "  }\n",
                                    "  return fmiOK;\n",
                                    "}\n",
                                    "\n"
                                }, true));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end setBooleanFunction;

protected function lm_125
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVars(txt, i_var, "stringVariables.algebraics");
        txt = Tpl.nextIter(txt);
        txt = lm_125(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_125(txt, rest);
      then txt;
  end matchcontinue;
end lm_125;

protected function lm_126
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVars(txt, i_var, "stringVariables.parameters");
        txt = Tpl.nextIter(txt);
        txt = lm_126(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_126(txt, rest);
      then txt;
  end matchcontinue;
end lm_126;

protected function lm_127
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchAliasVars(txt, i_var, "stringVariables.alias", "");
        txt = Tpl.nextIter(txt);
        txt = lm_127(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_127(txt, rest);
      then txt;
  end matchcontinue;
end lm_127;

public function getStringFunction
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> i_vars_stringAliasVars;
      list<SimCode.SimVar> i_vars_stringParamVars;
      list<SimCode.SimVar> i_vars_stringAlgVars;

    case ( txt,
           SimCode.MODELINFO(vars = SimCode.SIMVARS(stringAlgVars = i_vars_stringAlgVars, stringParamVars = i_vars_stringParamVars, stringAliasVars = i_vars_stringAliasVars)) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "fmiString getString(ModelInstance* comp, const fmiValueReference vr) {\n",
                                    "  switch (vr) {\n"
                                }, true));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(6));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_125(txt, i_vars_stringAlgVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_126(txt, i_vars_stringParamVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_127(txt, i_vars_stringAliasVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "default:\n",
                                    "    return 0;\n"
                                }, true));
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "  }\n",
                                    "}\n",
                                    "\n"
                                }, true));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end getStringFunction;

protected function lm_129
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVarsSet(txt, i_var, "stringVariables.algebraics");
        txt = Tpl.nextIter(txt);
        txt = lm_129(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_129(txt, rest);
      then txt;
  end matchcontinue;
end lm_129;

protected function lm_130
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchVarsSet(txt, i_var, "stringVariables.parameters");
        txt = Tpl.nextIter(txt);
        txt = lm_130(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_130(txt, rest);
      then txt;
  end matchcontinue;
end lm_130;

protected function lm_131
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.SimVar i_var;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_var :: rest )
      equation
        txt = SwitchAliasVarsSet(txt, i_var, "stringVariables.alias");
        txt = Tpl.nextIter(txt);
        txt = lm_131(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_131(txt, rest);
      then txt;
  end matchcontinue;
end lm_131;

public function setStringFunction
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> i_vars_stringAliasVars;
      list<SimCode.SimVar> i_vars_stringParamVars;
      list<SimCode.SimVar> i_vars_stringAlgVars;

    case ( txt,
           SimCode.MODELINFO(vars = SimCode.SIMVARS(stringAlgVars = i_vars_stringAlgVars, stringParamVars = i_vars_stringParamVars, stringAliasVars = i_vars_stringAliasVars)) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "fmiStatus setString(ModelInstance* comp, const fmiValueReference vr, const fmiString value) {\n",
                                    "  switch (vr) {\n"
                                }, true));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(6));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_129(txt, i_vars_stringAlgVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_130(txt, i_vars_stringParamVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_131(txt, i_vars_stringAliasVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "default:\n",
                                    "    return fmiError;\n"
                                }, true));
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "  }\n",
                                    "  return fmiOK;\n",
                                    "}\n",
                                    "\n"
                                }, true));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end setStringFunction;

public function setExternalFunction
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;

    case ( txt,
           SimCode.MODELINFO(vars = SimCode.SIMVARS(stateVars = _)) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "fmiStatus setExternalFunction(ModelInstance* c, const fmiValueReference vr, const void* value){\n",
                                    "  switch (vr) {\n",
                                    "      default:\n",
                                    "          return fmiError;\n",
                                    "  }\n",
                                    "  return fmiOK;\n",
                                    "}\n",
                                    "\n"
                                }, true));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end setExternalFunction;

protected function fun_134
  input Tpl.Text in_txt;
  input String in_a_comment;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_comment)
    local
      Tpl.Text txt;
      String i_comment;

    case ( txt,
           "" )
      then txt;

    case ( txt,
           i_comment )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("// \""));
        txt = Tpl.writeStr(txt, i_comment);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
      then txt;
  end matchcontinue;
end fun_134;

public function SwitchVars
  input Tpl.Text in_txt;
  input SimCode.SimVar in_a_simVar;
  input String in_a_arrayName;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simVar, in_a_arrayName)
    local
      Tpl.Text txt;
      String a_arrayName;
      Integer i_index;
      DAE.ComponentRef i_name;
      String i_comment;
      Tpl.Text l_description;

    case ( txt,
           SimCode.SIMVAR(comment = i_comment, name = i_name, index = i_index),
           a_arrayName )
      equation
        l_description = fun_134(Tpl.emptyTxt, i_comment);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("case "));
        txt = SimCodeC.cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_ : return globalData->"));
        txt = Tpl.writeStr(txt, a_arrayName);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("["));
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("]; break;"));
      then txt;

    case ( txt,
           _,
           _ )
      then txt;
  end matchcontinue;
end SwitchVars;

protected function fun_136
  input Tpl.Text in_txt;
  input String in_a_comment;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_comment)
    local
      Tpl.Text txt;
      String i_comment;

    case ( txt,
           "" )
      then txt;

    case ( txt,
           i_comment )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("// \""));
        txt = Tpl.writeStr(txt, i_comment);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
      then txt;
  end matchcontinue;
end fun_136;

public function SwitchAliasVars
  input Tpl.Text in_txt;
  input SimCode.SimVar in_a_simVar;
  input String in_a_arrayName;
  input String in_a_negator;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simVar, in_a_arrayName, in_a_negator)
    local
      Tpl.Text txt;
      String a_arrayName;
      String a_negator;
      Integer i_index;
      DAE.ComponentRef i_name;
      String i_comment;
      Tpl.Text l_description;

    case ( txt,
           SimCode.SIMVAR(comment = i_comment, name = i_name, index = i_index),
           a_arrayName,
           a_negator )
      equation
        l_description = fun_136(Tpl.emptyTxt, i_comment);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("case "));
        txt = SimCodeC.cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_ : return (globalData->"));
        txt = Tpl.writeStr(txt, a_arrayName);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("["));
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("].negate?"));
        txt = Tpl.writeStr(txt, a_negator);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("*(globalData->"));
        txt = Tpl.writeStr(txt, a_arrayName);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("["));
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("].alias):*(globalData->"));
        txt = Tpl.writeStr(txt, a_arrayName);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("["));
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("].alias)); break;"));
      then txt;

    case ( txt,
           _,
           _,
           _ )
      then txt;
  end matchcontinue;
end SwitchAliasVars;

protected function fun_138
  input Tpl.Text in_txt;
  input String in_a_comment;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_comment)
    local
      Tpl.Text txt;
      String i_comment;

    case ( txt,
           "" )
      then txt;

    case ( txt,
           i_comment )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("// \""));
        txt = Tpl.writeStr(txt, i_comment);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
      then txt;
  end matchcontinue;
end fun_138;

public function SwitchVarsSet
  input Tpl.Text in_txt;
  input SimCode.SimVar in_a_simVar;
  input String in_a_arrayName;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simVar, in_a_arrayName)
    local
      Tpl.Text txt;
      String a_arrayName;
      Integer i_index;
      DAE.ComponentRef i_name;
      String i_comment;
      Tpl.Text l_description;

    case ( txt,
           SimCode.SIMVAR(comment = i_comment, name = i_name, index = i_index),
           a_arrayName )
      equation
        l_description = fun_138(Tpl.emptyTxt, i_comment);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("case "));
        txt = SimCodeC.cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_ : globalData->"));
        txt = Tpl.writeStr(txt, a_arrayName);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("["));
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("]=value; break;"));
      then txt;

    case ( txt,
           _,
           _ )
      then txt;
  end matchcontinue;
end SwitchVarsSet;

protected function fun_140
  input Tpl.Text in_txt;
  input String in_a_comment;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_comment)
    local
      Tpl.Text txt;
      String i_comment;

    case ( txt,
           "" )
      then txt;

    case ( txt,
           i_comment )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("// \""));
        txt = Tpl.writeStr(txt, i_comment);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
      then txt;
  end matchcontinue;
end fun_140;

public function SwitchAliasVarsSet
  input Tpl.Text in_txt;
  input SimCode.SimVar in_a_simVar;
  input String in_a_arrayName;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simVar, in_a_arrayName)
    local
      Tpl.Text txt;
      String a_arrayName;
      Integer i_index;
      DAE.ComponentRef i_name;
      String i_comment;
      Tpl.Text l_description;

    case ( txt,
           SimCode.SIMVAR(comment = i_comment, name = i_name, index = i_index),
           a_arrayName )
      equation
        l_description = fun_140(Tpl.emptyTxt, i_comment);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("case "));
        txt = SimCodeC.cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_ : *(globalData->"));
        txt = Tpl.writeStr(txt, a_arrayName);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("["));
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("].alias)=value; break;"));
      then txt;

    case ( txt,
           _,
           _ )
      then txt;
  end matchcontinue;
end SwitchAliasVarsSet;

protected function fun_142
  input Tpl.Text in_txt;
  input String in_a_modelInfo_directory;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo_directory)
    local
      Tpl.Text txt;
      String i_modelInfo_directory;

    case ( txt,
           "" )
      then txt;

    case ( txt,
           i_modelInfo_directory )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("-L\""));
        txt = Tpl.writeStr(txt, i_modelInfo_directory);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
      then txt;
  end matchcontinue;
end fun_142;

protected function lm_143
  input Tpl.Text in_txt;
  input list<String> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<String> rest;
      String i_lib;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_lib :: rest )
      equation
        txt = Tpl.writeStr(txt, i_lib);
        txt = Tpl.nextIter(txt);
        txt = lm_143(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_143(txt, rest);
      then txt;
  end matchcontinue;
end lm_143;

protected function fun_144
  input Tpl.Text in_txt;
  input Tpl.Text in_a_dirExtra;
  input Tpl.Text in_a_libsStr;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_dirExtra, in_a_libsStr)
    local
      Tpl.Text txt;
      Tpl.Text a_libsStr;

    case ( txt,
           Tpl.MEM_TEXT(tokens = {}),
           a_libsStr )
      equation
        txt = Tpl.writeText(txt, a_libsStr);
      then txt;

    case ( txt,
           _,
           _ )
      then txt;
  end matchcontinue;
end fun_144;

protected function fun_145
  input Tpl.Text in_txt;
  input Tpl.Text in_a_dirExtra;
  input Tpl.Text in_a_libsStr;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_dirExtra, in_a_libsStr)
    local
      Tpl.Text txt;
      Tpl.Text a_libsStr;

    case ( txt,
           Tpl.MEM_TEXT(tokens = {}),
           _ )
      then txt;

    case ( txt,
           _,
           a_libsStr )
      equation
        txt = Tpl.writeText(txt, a_libsStr);
      then txt;
  end matchcontinue;
end fun_145;

public function fmuMakefile
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;
      String i_fileNamePrefix;
      String i_makefileParams_senddatalibs;
      String i_makefileParams_ldflags;
      String i_makefileParams_cflags;
      String i_makefileParams_omhome;
      String i_makefileParams_dllext;
      String i_makefileParams_exeext;
      String i_makefileParams_linker;
      String i_makefileParams_cxxcompiler;
      String i_makefileParams_ccompiler;
      list<String> i_makefileParams_libs;
      String i_modelInfo_directory;
      Tpl.Text l_libsPos2;
      Tpl.Text l_libsPos1;
      Tpl.Text l_libsStr;
      Tpl.Text l_dirExtra;

    case ( txt,
           SimCode.SIMCODE(modelInfo = SimCode.MODELINFO(directory = i_modelInfo_directory), makefileParams = SimCode.MAKEFILE_PARAMS(libs = i_makefileParams_libs, ccompiler = i_makefileParams_ccompiler, cxxcompiler = i_makefileParams_cxxcompiler, linker = i_makefileParams_linker, exeext = i_makefileParams_exeext, dllext = i_makefileParams_dllext, omhome = i_makefileParams_omhome, cflags = i_makefileParams_cflags, ldflags = i_makefileParams_ldflags, senddatalibs = i_makefileParams_senddatalibs), fileNamePrefix = i_fileNamePrefix) )
      equation
        l_dirExtra = fun_142(Tpl.emptyTxt, i_modelInfo_directory);
        l_libsStr = Tpl.pushIter(Tpl.emptyTxt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_STRING(" ")), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        l_libsStr = lm_143(l_libsStr, i_makefileParams_libs);
        l_libsStr = Tpl.popIter(l_libsStr);
        l_libsPos1 = fun_144(Tpl.emptyTxt, l_dirExtra, l_libsStr);
        l_libsPos2 = fun_145(Tpl.emptyTxt, l_dirExtra, l_libsStr);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "# Makefile generated by OpenModelica\n",
                                    "\n",
                                    "# Simulations use -O3 by default\n",
                                    "SIM_OR_DYNLOAD_OPT_LEVEL=-O3\n",
                                    "CC="
                                }, false));
        txt = Tpl.writeStr(txt, i_makefileParams_ccompiler);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("CXX="));
        txt = Tpl.writeStr(txt, i_makefileParams_cxxcompiler);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("LINK="));
        txt = Tpl.writeStr(txt, i_makefileParams_linker);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("EXEEXT="));
        txt = Tpl.writeStr(txt, i_makefileParams_exeext);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("DLLEXT="));
        txt = Tpl.writeStr(txt, i_makefileParams_dllext);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("CFLAGS=-I\""));
        txt = Tpl.writeStr(txt, i_makefileParams_omhome);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("/include/omc\" "));
        txt = Tpl.writeStr(txt, i_makefileParams_cflags);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("LDFLAGS=-L\""));
        txt = Tpl.writeStr(txt, i_makefileParams_omhome);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("/lib/omc\" "));
        txt = Tpl.writeStr(txt, i_makefileParams_ldflags);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("SENDDATALIBS="));
        txt = Tpl.writeStr(txt, i_makefileParams_senddatalibs);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "PERL=perl\n",
                                    "\n",
                                    ".PHONY: "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(": "));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(".conv.cpp "));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_functions.cpp "));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_FMU.cpp "));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_functions.h "));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("_records.c\n"));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\t"));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" $(CXX) -I. -o "));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("$(DLLEXT) "));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(".conv.cpp "));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_functions.cpp "));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_FMU.cpp "));
        txt = Tpl.writeText(txt, l_dirExtra);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
        txt = Tpl.writeText(txt, l_libsPos1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
        txt = Tpl.writeText(txt, l_libsPos2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" -shared -lsim -linteractive $(CFLAGS) $(SENDDATALIBS) $(LDFLAGS) -lf2c "));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_records.c -Wl,--out-implib,lib"));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE(".a\n"));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\t"));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" mv lib"));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(".a "));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    ".lib\n",
                                    "\n"
                                }, true));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\t"));
        txt = Tpl.writeTok(txt, Tpl.ST_LINE(" mkdir -p binaries\n"));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\t"));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    " mkdir -p binaries/win32\n",
                                    "\n"
                                }, true));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\t"));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" mv "));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("$(DLLEXT) binaries/win32/\n"));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\t"));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" mv "));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE(".lib binaries/win32/\n"));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\t"));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" zip -r "));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    ".fmu binaries modelDescription.xml\n",
                                    "\n"
                                }, true));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(".conv.cpp: "));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE(".cpp\n"));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\t"));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" $(PERL) "));
        txt = Tpl.writeStr(txt, i_makefileParams_omhome);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("/share/omc/scripts/convert_lines.pl $< $@.tmp\n"));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\t"));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" @mv $@.tmp $@"));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end fmuMakefile;

end SimCodeFMU;