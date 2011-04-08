encapsulated package SimCodeCpp

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
      Tpl.Text txt_3;
      Tpl.Text txt_2;
      Tpl.Text txt_1;
      Tpl.Text txt_0;

    case ( txt,
           (i_simCode as SimCode.SIMCODE(modelInfo = SimCode.MODELINFO(name = _), fileNamePrefix = i_fileNamePrefix)) )
      equation
        txt_0 = simulationHeaderFile(Tpl.emptyTxt, i_simCode);
        txt_1 = Tpl.writeStr(Tpl.emptyTxt, i_fileNamePrefix);
        txt_1 = Tpl.writeTok(txt_1, Tpl.ST_STRING(".h"));
        Tpl.textFile(txt_0, Tpl.textString(txt_1));
        txt_2 = simulationCppFile(Tpl.emptyTxt, i_simCode);
        txt_3 = Tpl.writeStr(Tpl.emptyTxt, i_fileNamePrefix);
        txt_3 = Tpl.writeTok(txt_3, Tpl.ST_STRING(".cpp"));
        Tpl.textFile(txt_2, Tpl.textString(txt_3));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end translateModel;

public function translateFunctions
  input Tpl.Text in_txt;
  input SimCode.FunctionCode in_a_functionCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_functionCode)
    local
      Tpl.Text txt;

    case ( txt,
           SimCode.FUNCTIONCODE(name = _) )
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end translateFunctions;

public function simulationHeaderFile
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;
      SimCode.SimCode i_simCode;

    case ( txt,
           (i_simCode as SimCode.SIMCODE(modelInfo = _)) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = generateHeaderInlcudeString(txt, i_simCode);
        txt = Tpl.softNewLine(txt);
        txt = generateClassDeclarationCode(txt, i_simCode);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\n",
                                    "\n"
                                }, true));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end simulationHeaderFile;

public function simulationCppFile
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;
      SimCode.ModelInfo i_modelInfo;
      SimCode.SimCode i_simCode;
      String i_fileNamePrefix;

    case ( txt,
           (i_simCode as SimCode.SIMCODE(fileNamePrefix = i_fileNamePrefix, modelInfo = i_modelInfo)) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    " #include \"stdafx.h \"\n",
                                    " #include \"SecondOrderWithSin.h \"\n",
                                    "\n",
                                    " using boost::extensions::factory;\n",
                                    " BOOST_EXTENSION_TYPE_MAP_FUNCTION {\n",
                                    "  types.get<std::map<std::string, factory<IDAESystem,IGlobalSettings&> > >()\n"
                                }, true));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("[\"ModelicaSystem\"].set<"));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    ">();\n",
                                    "}\n",
                                    "\n"
                                }, true));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("::"));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("(IGlobalSettings& globalSettings)\n"));
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE(" :SystemDefaultImplementation()\n"));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(3));
        txt = simulationInitFile(txt, i_simCode);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "  {\n",
                                    "     // Number of equations\n"
                                }, true));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(5));
        txt = dimension1(txt, i_simCode);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "    //DAE\'s are not supported yet, Index reduction is enabled\n",
                                    "    _dimAE = 0; // algebraic equations\n",
                                    "    // Initialize the state vector\n",
                                    "    SystemDefaultImplementation::init();\n",
                                    "    //Instantiate auxiliary object for event handling functionality\n"
                                }, true));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(4));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_event_handling.resetHelpVar =  boost::bind(&"));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "::resetHelpVar, this, _1);\n",
                                    "_historyImpl = new HistoryImplType(globalSettings);\n"
                                }, true));
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "  }\n",
                                    "\n"
                                }, true));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("::~"));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "()\n",
                                    "{\n",
                                    "delete _historyImpl;\n",
                                    "}\n"
                                }, true));
        txt = Tpl.popBlock(txt);
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = init(txt, i_simCode);
        txt = Tpl.softNewLine(txt);
        txt = writeoutput(txt, i_simCode);
        txt = Tpl.softNewLine(txt);
        txt = DefaultImplementationCode(txt, i_simCode);
        txt = Tpl.softNewLine(txt);
        txt = saveall(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end simulationCppFile;

public function init
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;
      list<BackendDAE.ZeroCrossing> i_zeroCrossings;
      SimCode.SimCode i_simCode;
      list<SimCode.SimEqSystem> i_initialEquations;
      SimCode.ModelInfo i_modelInfo;
      String i_fileNamePrefix;

    case ( txt,
           (i_simCode as SimCode.SIMCODE(fileNamePrefix = i_fileNamePrefix, modelInfo = i_modelInfo, initialEquations = i_initialEquations, zeroCrossings = i_zeroCrossings)) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("void "));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "::init(double ts,double te)\n",
                                    "{\n"
                                }, true));
        txt = initvar(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = functionInitial(txt, i_initialEquations, i_simCode);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_event_handling.init(this,"));
        txt = helpvarlength(txt, i_simCode);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    ");\n",
                                    "saveAll();\n"
                                }, true));
        txt = functionOnlyZeroCrossing(txt, i_zeroCrossings, i_simCode);
        txt = Tpl.softNewLine(txt);
        txt = eventHandlingInit(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "vector<unsigned int> var_ouputs_idx;\n",
                                    "\n"
                                }, true));
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "_historyImpl->setOutputs(var_ouputs_idx);\n",
                                    "_historyImpl->clear();\n",
                                    "\n",
                                    "\n",
                                    "}"
                                }, false));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end init;

public function writeoutput
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;
      SimCode.ModelInfo i_modelInfo;

    case ( txt,
           SimCode.SIMCODE(modelInfo = i_modelInfo) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    " void SecondOrderWithSin::writeOutput(const OUTPUT command)\n",
                                    " {\n",
                                    "    //Write head line\n",
                                    "  if (command & HEAD_LINE)\n",
                                    "  {\n",
                                    "  vector<string> head;\n"
                                }, true));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("head+= "));
        txt = writeoutput1(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "_historyImpl->write(head);\n",
                                    "}\n",
                                    "//Write the current values\n",
                                    "else\n",
                                    "{\n",
                                    "HistoryImplType::value_type_v v("
                                }, false));
        txt = numAlgvars(txt, i_modelInfo);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("+"));
        txt = numStatevars(txt, i_modelInfo);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    ");\n",
                                    "HistoryImplType::value_type_dv v2("
                                }, false));
        txt = numDerivativevars(txt, i_modelInfo);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE(");\n"));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = writeoutput2(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("}\n"));
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" }"));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end writeoutput;

public function generateHeaderInlcudeString
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;
      String i_fileNamePrefix;

    case ( txt,
           SimCode.SIMCODE(modelInfo = SimCode.MODELINFO(name = _), extObjInfo = SimCode.EXTOBJINFO(includes = _), fileNamePrefix = i_fileNamePrefix) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "#pragma once\n",
                                    "#define BOOST_EXTENSION_SYSTEM_DECL BOOST_EXTENSION_IMPORT_DECL\n",
                                    "#define BOOST_EXTENSION_EVENTHANDLING_DECL BOOST_EXTENSION_IMPORT_DECL\n",
                                    "#include \"../Implementation/SystemDefaultImplementation.h\"\n",
                                    "#include \"../../Math/Implementation/ArrayOperations.h\"\n",
                                    "#include \"../Implementation/EventHandling.h\"\n",
                                    "#include \"../../Settingsfactory/Interfaces/IGlobalSettings.h\"\n",
                                    "#include \"../../DataExchange/Interfaces/IHistory.h\"\n",
                                    "#include \"HistoryImpl.h\"\n",
                                    "#include \"policies/TextFileWriter.h\"\n",
                                    "\n",
                                    "#include \"Functions.h\"\n",
                                    "/*****************************************************************************\n",
                                    "*\n",
                                    "* Simulation code for "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    " generated by the OpenModelica Compiler.\n",
                                    "* System class "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    " implements the Interface IDAESystem\n",
                                    "*\n",
                                    "*****************************************************************************/"
                                }, false));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end generateHeaderInlcudeString;

public function generateClassDeclarationCode
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;
      SimCode.ModelInfo i_modelInfo;
      SimCode.SimCode i_simCode;
      String i_fileNamePrefix;

    case ( txt,
           (i_simCode as SimCode.SIMCODE(fileNamePrefix = i_fileNamePrefix, modelInfo = i_modelInfo)) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("class "));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    ": public IDAESystem ,public IContinous ,public IEvent ,public ISystemProperties, public SystemDefaultImplementation\n",
                                    "{\n",
                                    "public:\n"
                                }, true));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(4));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "(IGlobalSettings& globalSettings);\n",
                                    "~"
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "();\n",
                                    "\n"
                                }, true));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = generateMethodDeclarationCode(txt, i_simCode);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = Tpl.popBlock(txt);
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "private:\n",
                                    "  //Methods:\n",
                                    "  //Saves all variables before an event is handled, is needed for the pre, edge and change operator\n",
                                    "   void saveAll();\n",
                                    "\n",
                                    "   void resetHelpVar(const int index);\n",
                                    "\n",
                                    "   //Variables:\n",
                                    "   EventHandling _event_handling;\n",
                                    "\n"
                                }, true));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(3));
        txt = MemberVariable(txt, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\n",
                                    "Functions _functions;\n",
                                    "HistoryImplType* _historyImpl;\n"
                                }, true));
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" }"));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end generateClassDeclarationCode;

public function DefaultImplementationCode
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;
      String i_fileNamePrefix;

    case ( txt,
           SimCode.SIMCODE(fileNamePrefix = i_fileNamePrefix) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "  // Release instance\n",
                                    "void "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "::destroy()\n",
                                    "{\n",
                                    "    delete this;\n",
                                    "}\n",
                                    "\n",
                                    "// Set current integration time\n",
                                    "void "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "::setTime(const double& t)\n",
                                    "{\n",
                                    "    SystemDefaultImplementation::setTime(t);\n",
                                    "}\n",
                                    "\n",
                                    "// Returns the vector with all time events\n",
                                    "event_times_type "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "::getTimeEvents()\n",
                                    "{\n",
                                    "    return _event_handling.getTimeEvents();\n",
                                    "}\n",
                                    "\n",
                                    "// Provide number (dimension) of variables according to the index\n",
                                    "int "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "::getDimVars(const INDEX index) const\n",
                                    "{\n",
                                    "    return(SystemDefaultImplementation::getDimVars(index));\n",
                                    "}\n",
                                    "\n",
                                    "// Provide number (dimension) of right hand sides (equations and/or residuals) according to the index\n",
                                    "int "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "::getDimRHS(const INDEX index ) const\n",
                                    "{\n",
                                    "     return(SystemDefaultImplementation::getDimRHS(index));\n",
                                    "}\n",
                                    "\n",
                                    "// Provide variables with given index to the system\n",
                                    "void "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "::giveVars(double* z, const INDEX index)\n",
                                    "{\n",
                                    "    SystemDefaultImplementation::giveVars(z,index);\n",
                                    "}\n",
                                    "\n",
                                    "// Set variables with given index to the system\n",
                                    "void "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "::setVars(const double* z, const INDEX index)\n",
                                    "{\n",
                                    "    SystemDefaultImplementation::setVars(z,index);\n",
                                    "}\n",
                                    "\n",
                                    "// Provide the right hand side (according to the index)\n",
                                    "void "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "::giveRHS(double* f, const INDEX index)\n",
                                    "{\n",
                                    "    SystemDefaultImplementation::giveRHS(f,index);\n",
                                    "}\n",
                                    "void "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "::giveJacobianSparsityPattern(SparcityPattern pattern)\n",
                                    "{\n",
                                    "  throw std::runtime_error(\"giveJacobianSparsityPattern is not yet implemented\");\n",
                                    "}\n",
                                    "\n",
                                    "void "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "::giveJacobian(SparseMatrix matrix)\n",
                                    "{\n",
                                    "  throw std::runtime_error(\"giveJacobian is not yet implemented\");\n",
                                    "}\n",
                                    "\n",
                                    "void "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "::giveMassSparsityPattern(SparcityPattern pattern)\n",
                                    "{\n",
                                    "  throw std::runtime_error(\"giveMassSparsityPattern is not yet implemented\");\n",
                                    "}\n",
                                    "\n",
                                    "void "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "::giveMassMatrix(SparseMatrix matrix)\n",
                                    "{\n",
                                    "  throw std::runtime_error(\"giveMassMatrix is not yet implemented\");\n",
                                    "}\n",
                                    "\n",
                                    "void "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "::giveConstraintSparsityPattern(SparcityPattern pattern)\n",
                                    "{\n",
                                    "  throw std::runtime_error(\"giveConstraintSparsityPattern is not yet implemented\");\n",
                                    "}\n",
                                    "\n",
                                    "void "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "::giveConstraint(SparseMatrix matrix)\n",
                                    "{\n",
                                    "  throw std::runtime_error(\"giveConstraint is not yet implemented\");\n",
                                    "}\n",
                                    "\n",
                                    "bool "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "::isAutonomous()\n",
                                    "{\n",
                                    "  throw std::runtime_error(\"isAutonomous is not yet implemented\");\n",
                                    "}\n",
                                    "\n",
                                    "bool "
                                }, false));
        txt = Tpl.writeStr(txt, i_fileNamePrefix);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "::isTimeInvariant()\n",
                                    "{\n",
                                    "  throw std::runtime_error(\"isTimeInvariant is not yet implemented\");\n",
                                    "}"
                                }, false));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end DefaultImplementationCode;

public function generateMethodDeclarationCode
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
                                    "     //Releases the Modelica System\n",
                                    "    virtual void destroy();\n",
                                    "    //provide number (dimension) of variables according to the index\n",
                                    "    virtual int getDimVars(const INDEX index = ALL_VARS) const;\n",
                                    "    //Provide number (dimension) of right hand sides (equations and/or residuals) according to the index\n",
                                    "    virtual int getDimRHS(const INDEX index = ALL_VARS)const;\n",
                                    "    //(Re-) initialize the system of equations\n",
                                    "    virtual void init(double ts,double te);\n",
                                    "    //Resets all time events\n",
                                    "    virtual void resetTimeEvents();\n",
                                    "    //Set current integration time\n",
                                    "    virtual void setTime(const double& t);\n",
                                    "    //Provide variables with given index to the system\n",
                                    "    virtual void giveVars(double* z, const INDEX index = ALL_VARS);\n",
                                    "    //Set variables with given index to the system\n",
                                    "    virtual void setVars(const double* z, const INDEX index = ALL_VARS);\n",
                                    "    //Update transfer behavior of the system of equations according to command given by solver\n",
                                    "    virtual void update(const UPDATE command =\", CSYSTEM,\"::UNDEF_UPDATE);\n",
                                    "    //Provide the right hand side (according to the index)\n",
                                    "    virtual void giveRHS(double* f, const INDEX index = ALL_VARS);\n",
                                    "    //Output routine (to be called by the solver after every successful integration step)\n",
                                    "    virtual void writeOutput(const OUTPUT command = UNDEF_OUTPUT);\n",
                                    "    //Provide pattern for Jacobian\n",
                                    "    virtual void giveJacobianSparsityPattern(SparcityPattern pattern);\n",
                                    "    //Provide Jacobian\n",
                                    "    virtual void giveJacobian(SparseMatrix matrix);\n",
                                    "    //Provide pattern for mass matrix\n",
                                    "    virtual void giveMassSparsityPattern(SparcityPattern pattern);\n",
                                    "    //Provide mass matrix\n",
                                    "    virtual void giveMassMatrix(SparseMatrix matrix);\n",
                                    "    //Provide pattern for global constraint jacobian\n",
                                    "    virtual void giveConstraintSparsityPattern(SparcityPattern pattern);\n",
                                    "    //Provide global constraint jacobian\n",
                                    "    virtual void giveConstraint(SparseMatrix matrix);\n",
                                    "    //Provide number (dimension) of zero functions\n",
                                    "    virtual int getDimZeroFunc();\n",
                                    "    //Provides current values of root/zero functions\n",
                                    "     virtual void giveZeroFunc(double* f,const double& eps);\n",
                                    "    //Called to handle all  events occured at same time\n",
                                    "    virtual void handleSystemEvents(const bool* events,update_events_type update_event);\n",
                                    "    //Called to handle an event\n",
                                    "    virtual void handleEvent(unsigned long index);\n",
                                    "    //Checks if a discrete variable has changed and triggers an event\n",
                                    "    virtual bool checkForDiscreteEvents();\n",
                                    "    //Returns the vector with all time events\n",
                                    "    virtual event_times_type getTimeEvents();\n",
                                    "    // No input\n",
                                    "    virtual bool isAutonomous();\n",
                                    "    // Time is not present\n",
                                    "    virtual bool isTimeInvariant();\n",
                                    "    // M is regular\n",
                                    "    virtual bool isODE();\n",
                                    "    // M is singular\n",
                                    "    virtual bool isAlgebraic();\n",
                                    "    //M = identity\n",
                                    "    virtual bool isExplicit();\n",
                                    "    // M does not depend on t, z\n",
                                    "    virtual bool hasConstantMass();\n",
                                    "    // M depends on z\n",
                                    "    virtual bool hasStateDependentMass();\n",
                                    "    // System is able to provide the Jacobian symbolically\n",
                                    "    virtual bool provideSymbolicJacobian();"
                                }, false));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end generateMethodDeclarationCode;

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
        txt = MemberVariableDefine(txt, i_var, "algebraics");
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
        txt = MemberVariableDefine(txt, i_var, "parameters");
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
        txt = MemberVariableDefine(txt, i_var, "intVariables.algebraics");
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
        txt = MemberVariableDefine(txt, i_var, "intVariables.parameters");
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
        txt = MemberVariableDefine(txt, i_var, "boolVariables.algebraics");
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
        txt = MemberVariableDefine(txt, i_var, "boolVariables.parameters");
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
        txt = MemberVariableDefine(txt, i_var, "stringVariables.algebraics");
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
        txt = MemberVariableDefine(txt, i_var, "stringVariables.parameters");
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
        txt = MemberVariableDefine(txt, i_var, "constvariables");
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

public function MemberVariable
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> i_vars_constVars;
      list<SimCode.SimVar> i_vars_stringParamVars;
      list<SimCode.SimVar> i_vars_stringAlgVars;
      list<SimCode.SimVar> i_vars_boolParamVars;
      list<SimCode.SimVar> i_vars_boolAlgVars;
      list<SimCode.SimVar> i_vars_intParamVars;
      list<SimCode.SimVar> i_vars_intAlgVars;
      list<SimCode.SimVar> i_vars_paramVars;
      list<SimCode.SimVar> i_vars_algVars;

    case ( txt,
           SimCode.MODELINFO(vars = SimCode.SIMVARS(algVars = i_vars_algVars, paramVars = i_vars_paramVars, intAlgVars = i_vars_intAlgVars, intParamVars = i_vars_intParamVars, boolAlgVars = i_vars_boolAlgVars, boolParamVars = i_vars_boolParamVars, stringAlgVars = i_vars_stringAlgVars, stringParamVars = i_vars_stringParamVars, constVars = i_vars_constVars)) )
      equation
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_32(txt, i_vars_algVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_33(txt, i_vars_paramVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_34(txt, i_vars_intAlgVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_35(txt, i_vars_intParamVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_36(txt, i_vars_boolAlgVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_37(txt, i_vars_boolParamVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_38(txt, i_vars_stringAlgVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_39(txt, i_vars_stringParamVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_40(txt, i_vars_constVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end MemberVariable;

protected function fun_42
  input Tpl.Text in_txt;
  input SimCode.SimVar in_a_simVar;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simVar)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_name;
      DAE.ExpType i_type__;

    case ( txt,
           SimCode.SIMVAR(type_ = i_type__, name = i_name) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = variableType(txt, i_type__);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end fun_42;

protected function fun_43
  input Tpl.Text in_txt;
  input SimCode.SimVar in_a_simVar;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simVar)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_name;
      DAE.ExpType i_type__;

    case ( txt,
           SimCode.SIMVAR(type_ = i_type__, name = i_name) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = variableType(txt, i_type__);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end fun_43;

protected function fun_44
  input Tpl.Text in_txt;
  input SimCode.SimVar in_a_simVar;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simVar)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_name;
      DAE.ExpType i_type__;

    case ( txt,
           SimCode.SIMVAR(type_ = i_type__, name = i_name) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = variableType(txt, i_type__);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end fun_44;

protected function fun_45
  input Tpl.Text in_txt;
  input SimCode.SimVar in_a_simVar;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simVar)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_name;
      DAE.ExpType i_type__;

    case ( txt,
           SimCode.SIMVAR(type_ = i_type__, name = i_name) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(3));
        txt = variableType(txt, i_type__);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end fun_45;

protected function fun_46
  input Tpl.Text in_txt;
  input SimCode.SimVar in_a_simVar;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simVar)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_name;
      DAE.ExpType i_type__;

    case ( txt,
           SimCode.SIMVAR(type_ = i_type__, name = i_name) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = variableType(txt, i_type__);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end fun_46;

protected function fun_47
  input Tpl.Text in_txt;
  input SimCode.SimVar in_a_simVar;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simVar)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_name;
      DAE.ExpType i_type__;

    case ( txt,
           SimCode.SIMVAR(type_ = i_type__, name = i_name) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = variableType(txt, i_type__);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end fun_47;

protected function fun_48
  input Tpl.Text in_txt;
  input SimCode.SimVar in_a_simVar;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simVar)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_name;
      DAE.ExpType i_type__;

    case ( txt,
           SimCode.SIMVAR(type_ = i_type__, name = i_name) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = variableType(txt, i_type__);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end fun_48;

protected function fun_49
  input Tpl.Text in_txt;
  input SimCode.SimVar in_a_simVar;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simVar)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_name;
      DAE.ExpType i_type__;

    case ( txt,
           SimCode.SIMVAR(type_ = i_type__, name = i_name) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(3));
        txt = variableType(txt, i_type__);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end fun_49;

protected function fun_50
  input Tpl.Text in_txt;
  input SimCode.SimVar in_a_simVar;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simVar)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_name;
      DAE.ExpType i_type__;

    case ( txt,
           SimCode.SIMVAR(type_ = i_type__, name = i_name) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(3));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("const "));
        txt = variableType(txt, i_type__);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end fun_50;

protected function fun_51
  input Tpl.Text in_txt;
  input String in_a_arrayName;
  input SimCode.SimVar in_a_simVar;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_arrayName, in_a_simVar)
    local
      Tpl.Text txt;
      SimCode.SimVar a_simVar;

    case ( txt,
           "algebraics",
           a_simVar )
      equation
        txt = fun_42(txt, a_simVar);
      then txt;

    case ( txt,
           "parameters",
           a_simVar )
      equation
        txt = fun_43(txt, a_simVar);
      then txt;

    case ( txt,
           "intVariables.algebraics",
           a_simVar )
      equation
        txt = fun_44(txt, a_simVar);
      then txt;

    case ( txt,
           "intVariables.parameters",
           a_simVar )
      equation
        txt = fun_45(txt, a_simVar);
      then txt;

    case ( txt,
           "boolVariables.algebraics",
           a_simVar )
      equation
        txt = fun_46(txt, a_simVar);
      then txt;

    case ( txt,
           "boolVariables.parameters",
           a_simVar )
      equation
        txt = fun_47(txt, a_simVar);
      then txt;

    case ( txt,
           "stringVariables.algebraics",
           a_simVar )
      equation
        txt = fun_48(txt, a_simVar);
      then txt;

    case ( txt,
           "stringVariables.parameters",
           a_simVar )
      equation
        txt = fun_49(txt, a_simVar);
      then txt;

    case ( txt,
           "constvariables",
           a_simVar )
      equation
        txt = fun_50(txt, a_simVar);
      then txt;

    case ( txt,
           _,
           _ )
      then txt;
  end matchcontinue;
end fun_51;

public function MemberVariableDefine
  input Tpl.Text txt;
  input SimCode.SimVar a_simVar;
  input String a_arrayName;

  output Tpl.Text out_txt;
algorithm
  out_txt := fun_51(txt, a_arrayName, a_simVar);
end MemberVariableDefine;

public function variableType
  input Tpl.Text in_txt;
  input DAE.ExpType in_a_type;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_type)
    local
      Tpl.Text txt;

    case ( txt,
           DAE.ET_REAL() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("double"));
      then txt;

    case ( txt,
           DAE.ET_STRING() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("string"));
      then txt;

    case ( txt,
           DAE.ET_INT() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("int"));
      then txt;

    case ( txt,
           DAE.ET_BOOL() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("boolean"));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end variableType;

public function cref
  input Tpl.Text in_txt;
  input DAE.ComponentRef in_a_cr;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_cr)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_cr;

    case ( txt,
           (i_cr as DAE.CREF_IDENT(ident = "xloc")) )
      equation
        txt = crefStr(txt, i_cr);
      then txt;

    case ( txt,
           DAE.CREF_IDENT(ident = "time") )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("time"));
      then txt;

    case ( txt,
           DAE.WILD() )
      then txt;

    case ( txt,
           i_cr )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("$"));
        txt = crefToCStr(txt, i_cr);
      then txt;
  end matchcontinue;
end cref;

public function crefToCStr
  input Tpl.Text in_txt;
  input DAE.ComponentRef in_a_cr;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_cr)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_componentRef;
      list<DAE.Subscript> i_subscriptLst;
      DAE.Ident i_ident;

    case ( txt,
           DAE.CREF_IDENT(ident = i_ident, subscriptLst = i_subscriptLst) )
      equation
        txt = Tpl.writeStr(txt, i_ident);
        txt = subscriptsToCStr(txt, i_subscriptLst);
      then txt;

    case ( txt,
           DAE.CREF_QUAL(ident = i_ident, subscriptLst = i_subscriptLst, componentRef = i_componentRef) )
      equation
        txt = Tpl.writeStr(txt, i_ident);
        txt = subscriptsToCStr(txt, i_subscriptLst);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("$P"));
        txt = crefToCStr(txt, i_componentRef);
      then txt;

    case ( txt,
           DAE.WILD() )
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("CREF_NOT_IDENT_OR_QUAL"));
      then txt;
  end matchcontinue;
end crefToCStr;

protected function lm_56
  input Tpl.Text in_txt;
  input list<DAE.Subscript> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<DAE.Subscript> rest;
      DAE.Subscript i_s;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_s :: rest )
      equation
        txt = subscriptToCStr(txt, i_s);
        txt = Tpl.nextIter(txt);
        txt = lm_56(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_56(txt, rest);
      then txt;
  end matchcontinue;
end lm_56;

public function subscriptsToCStr
  input Tpl.Text in_txt;
  input list<DAE.Subscript> in_a_subscripts;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_subscripts)
    local
      Tpl.Text txt;
      list<DAE.Subscript> i_subscripts;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_subscripts )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("$lB"));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_STRING("$c")), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_56(txt, i_subscripts);
        txt = Tpl.popIter(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("$rB"));
      then txt;
  end matchcontinue;
end subscriptsToCStr;

public function subscriptToCStr
  input Tpl.Text in_txt;
  input DAE.Subscript in_a_subscript;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_subscript)
    local
      Tpl.Text txt;
      Integer i_i;

    case ( txt,
           DAE.INDEX(exp = DAE.ICONST(integer = i_i)) )
      equation
        txt = Tpl.writeStr(txt, intString(i_i));
      then txt;

    case ( txt,
           DAE.SLICE(exp = DAE.ICONST(integer = i_i)) )
      equation
        txt = Tpl.writeStr(txt, intString(i_i));
      then txt;

    case ( txt,
           DAE.WHOLEDIM() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("WHOLEDIM"));
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("UNKNOWN_SUBSCRIPT"));
      then txt;
  end matchcontinue;
end subscriptToCStr;

public function crefStr
  input Tpl.Text in_txt;
  input DAE.ComponentRef in_a_cr;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_cr)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_componentRef;
      list<DAE.Subscript> i_subscriptLst;
      DAE.Ident i_ident;

    case ( txt,
           DAE.CREF_IDENT(ident = i_ident, subscriptLst = i_subscriptLst) )
      equation
        txt = Tpl.writeStr(txt, i_ident);
        txt = subscriptsStr(txt, i_subscriptLst);
      then txt;

    case ( txt,
           DAE.CREF_QUAL(ident = "$DER", componentRef = i_componentRef) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("der("));
        txt = crefStr(txt, i_componentRef);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.CREF_QUAL(ident = i_ident, subscriptLst = i_subscriptLst, componentRef = i_componentRef) )
      equation
        txt = Tpl.writeStr(txt, i_ident);
        txt = subscriptsStr(txt, i_subscriptLst);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("."));
        txt = crefStr(txt, i_componentRef);
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("CREF_NOT_IDENT_OR_QUAL"));
      then txt;
  end matchcontinue;
end crefStr;

protected function lm_60
  input Tpl.Text in_txt;
  input list<DAE.Subscript> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<DAE.Subscript> rest;
      DAE.Subscript i_s;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_s :: rest )
      equation
        txt = subscriptStr(txt, i_s);
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

public function subscriptsStr
  input Tpl.Text in_txt;
  input list<DAE.Subscript> in_a_subscripts;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_subscripts)
    local
      Tpl.Text txt;
      list<DAE.Subscript> i_subscripts;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_subscripts )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("["));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_STRING(",")), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_60(txt, i_subscripts);
        txt = Tpl.popIter(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("]"));
      then txt;
  end matchcontinue;
end subscriptsStr;

public function subscriptStr
  input Tpl.Text in_txt;
  input DAE.Subscript in_a_subscript;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_subscript)
    local
      Tpl.Text txt;
      Integer i_i;

    case ( txt,
           DAE.INDEX(exp = DAE.ICONST(integer = i_i)) )
      equation
        txt = Tpl.writeStr(txt, intString(i_i));
      then txt;

    case ( txt,
           DAE.SLICE(exp = DAE.ICONST(integer = i_i)) )
      equation
        txt = Tpl.writeStr(txt, intString(i_i));
      then txt;

    case ( txt,
           DAE.WHOLEDIM() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("WHOLEDIM"));
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("UNKNOWN_SUBSCRIPT"));
      then txt;
  end matchcontinue;
end subscriptStr;

public function simulationInitFile
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> i_vars_stringParamVars;
      list<SimCode.SimVar> i_vars_boolParamVars;
      list<SimCode.SimVar> i_vars_intParamVars;
      list<SimCode.SimVar> i_vars_paramVars;

    case ( txt,
           SimCode.SIMCODE(modelInfo = SimCode.MODELINFO(varInfo = SimCode.VARINFO(numHelpVars = _), vars = SimCode.SIMVARS(paramVars = i_vars_paramVars, intParamVars = i_vars_intParamVars, boolParamVars = i_vars_boolParamVars, stringParamVars = i_vars_stringParamVars))) )
      equation
        txt = initVals(txt, i_vars_paramVars);
        txt = Tpl.softNewLine(txt);
        txt = initVals(txt, i_vars_intParamVars);
        txt = Tpl.softNewLine(txt);
        txt = initVals(txt, i_vars_boolParamVars);
        txt = Tpl.softNewLine(txt);
        txt = initVals(txt, i_vars_stringParamVars);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end simulationInitFile;

protected function fun_64
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
      then txt;
  end matchcontinue;
end fun_64;

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
      Option<DAE.Exp> i_initialValue;
      DAE.ComponentRef i_name;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           SimCode.SIMVAR(name = i_name, initialValue = i_initialValue) :: rest )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(","));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = fun_64(txt, i_initialValue);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
        txt = Tpl.popBlock(txt);
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

public function initVals
  input Tpl.Text txt;
  input list<SimCode.SimVar> a_varsLst;

  output Tpl.Text out_txt;
algorithm
  out_txt := Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
  out_txt := lm_65(out_txt, a_varsLst);
  out_txt := Tpl.popIter(out_txt);
end initVals;

protected function fun_67
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
end fun_67;

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
        txt = fun_67(txt, i_bool);
      then txt;

    case ( txt,
           DAE.ENUM_LITERAL(index = i_index, name = i_name) )
      equation
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("/*ENUM:"));
        txt = dotPath(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("*/"));
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("*ERROR* initial value of unknown type"));
      then txt;
  end matchcontinue;
end initVal;

public function dotPath
  input Tpl.Text in_txt;
  input Absyn.Path in_a_path;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_path)
    local
      Tpl.Text txt;
      String i_name_1;
      Absyn.Path i_path;
      Absyn.Ident i_name;

    case ( txt,
           Absyn.QUALIFIED(name = i_name, path = i_path) )
      equation
        txt = Tpl.writeStr(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("."));
        txt = dotPath(txt, i_path);
      then txt;

    case ( txt,
           Absyn.IDENT(name = i_name_1) )
      equation
        txt = Tpl.writeStr(txt, i_name_1);
      then txt;

    case ( txt,
           Absyn.FULLYQUALIFIED(path = i_path) )
      equation
        txt = dotPath(txt, i_path);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end dotPath;

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
      DAE.ComponentRef i_name;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           SimCode.SIMVAR(name = i_name) :: rest )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
        txt = crefStr(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\" "));
        txt = Tpl.popBlock(txt);
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
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
        txt = crefStr(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\" "));
        txt = Tpl.popBlock(txt);
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
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
        txt = crefStr(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\" "));
        txt = Tpl.popBlock(txt);
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

protected function lm_73
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
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
        txt = crefStr(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\" "));
        txt = Tpl.popBlock(txt);
        txt = Tpl.nextIter(txt);
        txt = lm_73(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_73(txt, rest);
      then txt;
  end matchcontinue;
end lm_73;

protected function lm_74
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
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\""));
        txt = crefStr(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\" "));
        txt = Tpl.popBlock(txt);
        txt = Tpl.nextIter(txt);
        txt = lm_74(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_74(txt, rest);
      then txt;
  end matchcontinue;
end lm_74;

protected function smf_75
  input Tpl.Text in_txt;
  input Tpl.Text in_it;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_it)
    local
      Tpl.Text txt;
      Tpl.Text i_it;

    case ( txt,
           i_it )
      equation
        txt = Tpl.writeText(txt, i_it);
        txt = Tpl.nextIter(txt);
      then txt;
  end matchcontinue;
end smf_75;

protected function smf_76
  input Tpl.Text in_txt;
  input Tpl.Text in_it;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_it)
    local
      Tpl.Text txt;
      Tpl.Text i_it;

    case ( txt,
           i_it )
      equation
        txt = Tpl.writeText(txt, i_it);
        txt = Tpl.nextIter(txt);
      then txt;
  end matchcontinue;
end smf_76;

protected function smf_77
  input Tpl.Text in_txt;
  input Tpl.Text in_it;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_it)
    local
      Tpl.Text txt;
      Tpl.Text i_it;

    case ( txt,
           i_it )
      equation
        txt = Tpl.writeText(txt, i_it);
        txt = Tpl.nextIter(txt);
      then txt;
  end matchcontinue;
end smf_77;

protected function smf_78
  input Tpl.Text in_txt;
  input Tpl.Text in_it;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_it)
    local
      Tpl.Text txt;
      Tpl.Text i_it;

    case ( txt,
           i_it )
      equation
        txt = Tpl.writeText(txt, i_it);
        txt = Tpl.nextIter(txt);
      then txt;
  end matchcontinue;
end smf_78;

protected function smf_79
  input Tpl.Text in_txt;
  input Tpl.Text in_it;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_it)
    local
      Tpl.Text txt;
      Tpl.Text i_it;

    case ( txt,
           i_it )
      equation
        txt = Tpl.writeText(txt, i_it);
        txt = Tpl.nextIter(txt);
      then txt;
  end matchcontinue;
end smf_79;

public function writeoutput1
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> i_vars_derivativeVars;
      list<SimCode.SimVar> i_vars_stateVars;
      list<SimCode.SimVar> i_vars_boolAlgVars;
      list<SimCode.SimVar> i_vars_intAlgVars;
      list<SimCode.SimVar> i_vars_algVars;
      Tpl.Text txt_4;
      Tpl.Text txt_3;
      Tpl.Text txt_2;
      Tpl.Text txt_1;
      Tpl.Text txt_0;

    case ( txt,
           SimCode.MODELINFO(vars = SimCode.SIMVARS(algVars = i_vars_algVars, intAlgVars = i_vars_intAlgVars, boolAlgVars = i_vars_boolAlgVars, stateVars = i_vars_stateVars, derivativeVars = i_vars_derivativeVars)) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(4));
        txt_0 = Tpl.pushIter(Tpl.emptyTxt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_STRING(",")), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt_0 = lm_70(txt_0, i_vars_algVars);
        txt_0 = Tpl.popIter(txt_0);
        txt_1 = Tpl.pushIter(Tpl.emptyTxt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_STRING(",")), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt_1 = lm_71(txt_1, i_vars_intAlgVars);
        txt_1 = Tpl.popIter(txt_1);
        txt_2 = Tpl.pushIter(Tpl.emptyTxt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_STRING(",")), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt_2 = lm_72(txt_2, i_vars_boolAlgVars);
        txt_2 = Tpl.popIter(txt_2);
        txt_3 = Tpl.pushIter(Tpl.emptyTxt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_STRING(",")), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt_3 = lm_73(txt_3, i_vars_stateVars);
        txt_3 = Tpl.popIter(txt_3);
        txt_4 = Tpl.pushIter(Tpl.emptyTxt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_STRING(",")), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt_4 = lm_74(txt_4, i_vars_derivativeVars);
        txt_4 = Tpl.popIter(txt_4);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_STRING(",")), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = smf_75(txt, txt_0);
        txt = smf_76(txt, txt_1);
        txt = smf_77(txt, txt_2);
        txt = smf_78(txt, txt_3);
        txt = smf_79(txt, txt_4);
        txt = Tpl.popIter(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end writeoutput1;

public function numStatevars
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      Integer i_varInfo_numStateVars;

    case ( txt,
           SimCode.MODELINFO(varInfo = SimCode.VARINFO(numStateVars = i_varInfo_numStateVars)) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = Tpl.writeStr(txt, intString(i_varInfo_numStateVars));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end numStatevars;

public function numAlgvars
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      Integer i_varInfo_numBoolAlgVars;
      Integer i_varInfo_numIntAlgVars;
      Integer i_varInfo_numAlgVars;

    case ( txt,
           SimCode.MODELINFO(varInfo = SimCode.VARINFO(numAlgVars = i_varInfo_numAlgVars, numIntAlgVars = i_varInfo_numIntAlgVars, numBoolAlgVars = i_varInfo_numBoolAlgVars)) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = Tpl.writeStr(txt, intString(i_varInfo_numAlgVars));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("+"));
        txt = Tpl.writeStr(txt, intString(i_varInfo_numIntAlgVars));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("+"));
        txt = Tpl.writeStr(txt, intString(i_varInfo_numBoolAlgVars));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end numAlgvars;

protected function fun_83
  input Tpl.Text in_txt;
  input Option<Integer> in_mArg;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_mArg)
    local
      Tpl.Text txt;
      Integer i_val;

    case ( txt,
           SOME(i_val) )
      equation
        txt = Tpl.writeStr(txt, intString(i_val));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end fun_83;

protected function fun_84
  input Tpl.Text in_txt;
  input Option<Integer> in_mArg;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_mArg)
    local
      Tpl.Text txt;
      Integer i_val;

    case ( txt,
           SOME(i_val) )
      equation
        txt = Tpl.writeStr(txt, intString(i_val));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end fun_84;

public function numDerivativevars
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      Option<Integer> i_varInfo_dimODE2ndOrder;
      Option<Integer> i_varInfo_dimODE1stOrder;

    case ( txt,
           SimCode.MODELINFO(varInfo = SimCode.VARINFO(dimODE1stOrder = i_varInfo_dimODE1stOrder, dimODE2ndOrder = i_varInfo_dimODE2ndOrder)) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = fun_83(txt, i_varInfo_dimODE1stOrder);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("+"));
        txt = fun_84(txt, i_varInfo_dimODE2ndOrder);
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end numDerivativevars;

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
      DAE.ComponentRef i_name;
      Integer i_index;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           SimCode.SIMVAR(index = i_index, name = i_name) :: rest )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("v("));
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")="));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
        txt = lm_86(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_86(txt, rest);
      then txt;
  end matchcontinue;
end lm_86;

protected function lm_87
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
      Integer i_index;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           SimCode.SIMVAR(index = i_index, name = i_name) :: rest )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("v("));
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")="));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
        txt = lm_87(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_87(txt, rest);
      then txt;
  end matchcontinue;
end lm_87;

protected function lm_88
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
      Integer i_index;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           SimCode.SIMVAR(index = i_index, name = i_name) :: rest )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("v("));
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")="));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
        txt = lm_88(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_88(txt, rest);
      then txt;
  end matchcontinue;
end lm_88;

protected function lm_89
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items, in_a_modelInfo)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.ModelInfo a_modelInfo;
      Integer i_index;

    case ( txt,
           {},
           _ )
      then txt;

    case ( txt,
           SimCode.SIMVAR(index = i_index) :: rest,
           a_modelInfo )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("v("));
        txt = numAlgvars(txt, a_modelInfo);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("+"));
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")=_z["));
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("]; "));
        txt = Tpl.popBlock(txt);
        txt = lm_89(txt, rest, a_modelInfo);
      then txt;

    case ( txt,
           _ :: rest,
           a_modelInfo )
      equation
        txt = lm_89(txt, rest, a_modelInfo);
      then txt;
  end matchcontinue;
end lm_89;

protected function lm_90
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      Integer i_index;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           SimCode.SIMVAR(index = i_index) :: rest )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("v2("));
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")=_zDot["));
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("]; "));
        txt = Tpl.popBlock(txt);
        txt = lm_90(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_90(txt, rest);
      then txt;
  end matchcontinue;
end lm_90;

public function writeoutput2
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> i_vars_derivativeVars;
      SimCode.ModelInfo i_modelInfo;
      list<SimCode.SimVar> i_vars_stateVars;
      list<SimCode.SimVar> i_vars_boolAlgVars;
      list<SimCode.SimVar> i_vars_intAlgVars;
      list<SimCode.SimVar> i_vars_algVars;

    case ( txt,
           (i_modelInfo as SimCode.MODELINFO(vars = SimCode.SIMVARS(algVars = i_vars_algVars, intAlgVars = i_vars_intAlgVars, boolAlgVars = i_vars_boolAlgVars, stateVars = i_vars_stateVars, derivativeVars = i_vars_derivativeVars))) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(4));
        txt = lm_86(txt, i_vars_algVars);
        txt = Tpl.softNewLine(txt);
        txt = lm_87(txt, i_vars_intAlgVars);
        txt = Tpl.softNewLine(txt);
        txt = lm_88(txt, i_vars_boolAlgVars);
        txt = Tpl.softNewLine(txt);
        txt = lm_89(txt, i_vars_stateVars, i_modelInfo);
        txt = Tpl.softNewLine(txt);
        txt = lm_90(txt, i_vars_derivativeVars);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "\n",
                                    "\n"
                                }, true));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end writeoutput2;

protected function lm_92
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
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_event_handling.save("));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(",\""));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.nextIter(txt);
        txt = lm_92(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_92(txt, rest);
      then txt;
  end matchcontinue;
end lm_92;

protected function lm_93
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
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_event_handling.save("));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(",\""));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.nextIter(txt);
        txt = lm_93(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_93(txt, rest);
      then txt;
  end matchcontinue;
end lm_93;

protected function lm_94
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
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_event_handling.save("));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(",\""));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.nextIter(txt);
        txt = lm_94(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_94(txt, rest);
      then txt;
  end matchcontinue;
end lm_94;

protected function lm_95
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
      Integer i_index;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           SimCode.SIMVAR(index = i_index, name = i_name) :: rest )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_event_handling.save(_z["));
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("],\""));
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.nextIter(txt);
        txt = lm_95(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_95(txt, rest);
      then txt;
  end matchcontinue;
end lm_95;

protected function smf_96
  input Tpl.Text in_txt;
  input Tpl.Text in_it;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_it)
    local
      Tpl.Text txt;
      Tpl.Text i_it;

    case ( txt,
           i_it )
      equation
        txt = Tpl.writeText(txt, i_it);
        txt = Tpl.nextIter(txt);
      then txt;
  end matchcontinue;
end smf_96;

protected function smf_97
  input Tpl.Text in_txt;
  input Tpl.Text in_it;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_it)
    local
      Tpl.Text txt;
      Tpl.Text i_it;

    case ( txt,
           i_it )
      equation
        txt = Tpl.writeText(txt, i_it);
        txt = Tpl.nextIter(txt);
      then txt;
  end matchcontinue;
end smf_97;

protected function smf_98
  input Tpl.Text in_txt;
  input Tpl.Text in_it;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_it)
    local
      Tpl.Text txt;
      Tpl.Text i_it;

    case ( txt,
           i_it )
      equation
        txt = Tpl.writeText(txt, i_it);
        txt = Tpl.nextIter(txt);
      then txt;
  end matchcontinue;
end smf_98;

protected function smf_99
  input Tpl.Text in_txt;
  input Tpl.Text in_it;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_it)
    local
      Tpl.Text txt;
      Tpl.Text i_it;

    case ( txt,
           i_it )
      equation
        txt = Tpl.writeText(txt, i_it);
        txt = Tpl.nextIter(txt);
      then txt;
  end matchcontinue;
end smf_99;

public function saveall
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> i_vars_stateVars;
      list<SimCode.SimVar> i_vars_boolAlgVars;
      list<SimCode.SimVar> i_vars_intAlgVars;
      list<SimCode.SimVar> i_vars_algVars;
      Tpl.Text txt_3;
      Tpl.Text txt_2;
      Tpl.Text txt_1;
      Tpl.Text txt_0;

    case ( txt,
           SimCode.MODELINFO(vars = SimCode.SIMVARS(algVars = i_vars_algVars, intAlgVars = i_vars_intAlgVars, boolAlgVars = i_vars_boolAlgVars, stateVars = i_vars_stateVars)) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "  void SecondOrderWithSin::saveAll()\n",
                                    "  {\n"
                                }, true));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(4));
        txt_0 = Tpl.pushIter(Tpl.emptyTxt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt_0 = lm_92(txt_0, i_vars_algVars);
        txt_0 = Tpl.popIter(txt_0);
        txt_1 = Tpl.pushIter(Tpl.emptyTxt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt_1 = lm_93(txt_1, i_vars_intAlgVars);
        txt_1 = Tpl.popIter(txt_1);
        txt_2 = Tpl.pushIter(Tpl.emptyTxt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt_2 = lm_94(txt_2, i_vars_boolAlgVars);
        txt_2 = Tpl.popIter(txt_2);
        txt_3 = Tpl.pushIter(Tpl.emptyTxt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt_3 = lm_95(txt_3, i_vars_stateVars);
        txt_3 = Tpl.popIter(txt_3);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = smf_96(txt, txt_0);
        txt = smf_97(txt, txt_1);
        txt = smf_98(txt, txt_2);
        txt = smf_99(txt, txt_3);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "   _event_handling.saveH();\n",
                                    "  }"
                                }, false));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end saveall;

protected function fun_101
  input Tpl.Text in_txt;
  input Option<DAE.Exp> in_a_initialValue;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_initialValue)
    local
      Tpl.Text txt;

    case ( txt,
           SOME(_) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" v; "));
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("0.0;"));
      then txt;
  end matchcontinue;
end fun_101;

protected function lm_102
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
      DAE.ComponentRef i_name;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           SimCode.SIMVAR(name = i_name, initialValue = i_initialValue) :: rest )
      equation
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("="));
        txt = fun_101(txt, i_initialValue);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
        txt = Tpl.nextIter(txt);
        txt = lm_102(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_102(txt, rest);
      then txt;
  end matchcontinue;
end lm_102;

protected function fun_103
  input Tpl.Text in_txt;
  input Option<DAE.Exp> in_a_initialValue;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_initialValue)
    local
      Tpl.Text txt;

    case ( txt,
           SOME(_) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" v; "));
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("0.0;"));
      then txt;
  end matchcontinue;
end fun_103;

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
      Option<DAE.Exp> i_initialValue;
      DAE.ComponentRef i_name;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           SimCode.SIMVAR(name = i_name, initialValue = i_initialValue) :: rest )
      equation
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("="));
        txt = fun_103(txt, i_initialValue);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
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

protected function fun_105
  input Tpl.Text in_txt;
  input Option<DAE.Exp> in_a_initialValue;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_initialValue)
    local
      Tpl.Text txt;

    case ( txt,
           SOME(_) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" v; "));
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("0.0;"));
      then txt;
  end matchcontinue;
end fun_105;

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
      Option<DAE.Exp> i_initialValue;
      DAE.ComponentRef i_name;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           SimCode.SIMVAR(name = i_name, initialValue = i_initialValue) :: rest )
      equation
        txt = cref(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("="));
        txt = fun_105(txt, i_initialValue);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
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

public function initvar
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> i_vars_boolAlgVars;
      list<SimCode.SimVar> i_vars_intAlgVars;
      list<SimCode.SimVar> i_vars_algVars;

    case ( txt,
           SimCode.MODELINFO(vars = SimCode.SIMVARS(algVars = i_vars_algVars, intAlgVars = i_vars_intAlgVars, boolAlgVars = i_vars_boolAlgVars)) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(4));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_102(txt, i_vars_algVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_104(txt, i_vars_intAlgVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        txt = lm_106(txt, i_vars_boolAlgVars);
        txt = Tpl.popIter(txt);
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end initvar;

public function eventHandlingInit
  input Tpl.Text in_txt;
  input SimCode.ModelInfo in_a_modelInfo;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_modelInfo)
    local
      Tpl.Text txt;
      Integer i_varInfo_numZeroCrossings;
      Integer i_varInfo_numTimeEvents;

    case ( txt,
           SimCode.MODELINFO(varInfo = SimCode.VARINFO(numTimeEvents = i_varInfo_numTimeEvents, numZeroCrossings = i_varInfo_numZeroCrossings)) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(4));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("for(int i="));
        txt = Tpl.writeStr(txt, intString(i_varInfo_numTimeEvents));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";i<"));
        txt = Tpl.writeStr(txt, intString(i_varInfo_numZeroCrossings));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";++i) { handleEvent(i); }"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end eventHandlingInit;

protected function fun_109
  input Tpl.Text in_txt;
  input Option<Integer> in_mArg;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_mArg)
    local
      Tpl.Text txt;
      Integer i_val;

    case ( txt,
           SOME(i_val) )
      equation
        txt = Tpl.writeStr(txt, intString(i_val));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end fun_109;

protected function fun_110
  input Tpl.Text in_txt;
  input Option<Integer> in_a_dimODE1stOrder;
  input Option<Integer> in_a_vi_dimODE1stOrder;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_dimODE1stOrder, in_a_vi_dimODE1stOrder)
    local
      Tpl.Text txt;
      Option<Integer> a_vi_dimODE1stOrder;

    case ( txt,
           SOME(_),
           a_vi_dimODE1stOrder )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_dimODE1stOrder = "));
        txt = fun_109(txt, a_vi_dimODE1stOrder);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _,
           _ )
      then txt;
  end matchcontinue;
end fun_110;

protected function smf_111
  input Tpl.Text in_txt;
  input SimCode.VarInfo in_it;
  input Option<Integer> in_a_vi_dimODE1stOrder;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_it, in_a_vi_dimODE1stOrder)
    local
      Tpl.Text txt;
      Option<Integer> a_vi_dimODE1stOrder;
      Option<Integer> i_dimODE1stOrder;

    case ( txt,
           SimCode.VARINFO(dimODE1stOrder = i_dimODE1stOrder),
           a_vi_dimODE1stOrder )
      equation
        txt = fun_110(txt, i_dimODE1stOrder, a_vi_dimODE1stOrder);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
      then txt;

    case ( txt,
           _,
           _ )
      then txt;
  end matchcontinue;
end smf_111;

protected function fun_112
  input Tpl.Text in_txt;
  input Option<Integer> in_mArg;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_mArg)
    local
      Tpl.Text txt;
      Integer i_val;

    case ( txt,
           SOME(i_val) )
      equation
        txt = Tpl.writeStr(txt, intString(i_val));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end fun_112;

protected function fun_113
  input Tpl.Text in_txt;
  input Option<Integer> in_a_dimODE2ndOrder;
  input Option<Integer> in_a_vi_dimODE2ndOrder;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_dimODE2ndOrder, in_a_vi_dimODE2ndOrder)
    local
      Tpl.Text txt;
      Option<Integer> a_vi_dimODE2ndOrder;

    case ( txt,
           SOME(_),
           a_vi_dimODE2ndOrder )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_dimODE2ndOrder = "));
        txt = fun_112(txt, a_vi_dimODE2ndOrder);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _,
           _ )
      then txt;
  end matchcontinue;
end fun_113;

protected function smf_114
  input Tpl.Text in_txt;
  input SimCode.VarInfo in_it;
  input Option<Integer> in_a_vi_dimODE2ndOrder;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_it, in_a_vi_dimODE2ndOrder)
    local
      Tpl.Text txt;
      Option<Integer> a_vi_dimODE2ndOrder;
      Option<Integer> i_dimODE2ndOrder;

    case ( txt,
           SimCode.VARINFO(dimODE2ndOrder = i_dimODE2ndOrder),
           a_vi_dimODE2ndOrder )
      equation
        txt = fun_113(txt, i_dimODE2ndOrder, a_vi_dimODE2ndOrder);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
      then txt;

    case ( txt,
           _,
           _ )
      then txt;
  end matchcontinue;
end smf_114;

public function dimension1
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;
      Option<Integer> i_vi_dimODE2ndOrder;
      Option<Integer> i_vi_dimODE1stOrder;
      SimCode.VarInfo i_modelInfo_varInfo;

    case ( txt,
           SimCode.SIMCODE(modelInfo = SimCode.MODELINFO(varInfo = (i_modelInfo_varInfo as SimCode.VARINFO(dimODE1stOrder = i_vi_dimODE1stOrder, dimODE2ndOrder = i_vi_dimODE2ndOrder)))) )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(3));
        txt = smf_111(txt, i_modelInfo_varInfo, i_vi_dimODE1stOrder);
        txt = Tpl.softNewLine(txt);
        txt = smf_114(txt, i_modelInfo_varInfo, i_vi_dimODE2ndOrder);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end dimension1;

protected function fun_116
  input Tpl.Text in_txt;
  input SimCode.Context in_a_context;
  input DAE.ComponentRef in_a_cr;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_context, in_a_cr)
    local
      Tpl.Text txt;
      DAE.ComponentRef a_cr;

    case ( txt,
           SimCode.FUNCTION_CONTEXT(),
           a_cr )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_"));
        txt = arrayCrefStr(txt, a_cr);
      then txt;

    case ( txt,
           _,
           a_cr )
      equation
        txt = arrayCrefCStr(txt, a_cr);
      then txt;
  end matchcontinue;
end fun_116;

public function contextArrayCref
  input Tpl.Text txt;
  input DAE.ComponentRef a_cr;
  input SimCode.Context a_context;

  output Tpl.Text out_txt;
algorithm
  out_txt := fun_116(txt, a_context, a_cr);
end contextArrayCref;

public function arrayCrefStr
  input Tpl.Text in_txt;
  input DAE.ComponentRef in_a_cr;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_cr)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_componentRef;
      DAE.Ident i_ident;

    case ( txt,
           DAE.CREF_IDENT(ident = i_ident) )
      equation
        txt = Tpl.writeStr(txt, i_ident);
      then txt;

    case ( txt,
           DAE.CREF_QUAL(ident = i_ident, componentRef = i_componentRef) )
      equation
        txt = Tpl.writeStr(txt, i_ident);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("."));
        txt = arrayCrefStr(txt, i_componentRef);
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("CREF_NOT_IDENT_OR_QUAL"));
      then txt;
  end matchcontinue;
end arrayCrefStr;

protected function fun_119
  input Tpl.Text in_txt;
  input DAE.ExpType in_a_ty;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_ty)
    local
      Tpl.Text txt;
      DAE.ExpType i_ty;
      Absyn.Path i_name;

    case ( txt,
           DAE.ET_COMPLEX(name = i_name) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("struct "));
        txt = underscorePath(txt, i_name);
      then txt;

    case ( txt,
           i_ty )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("modelica_"));
        txt = expTypeShort(txt, i_ty);
      then txt;
  end matchcontinue;
end fun_119;

protected function fun_120
  input Tpl.Text in_txt;
  input DAE.ExpType in_a_ty;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_ty)
    local
      Tpl.Text txt;
      DAE.ExpType i_ty;

    case ( txt,
           (i_ty as DAE.ET_COMPLEX(complexClassType = ClassInf.EXTERNAL_OBJ(path = _))) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("modelica_"));
        txt = expTypeShort(txt, i_ty);
      then txt;

    case ( txt,
           i_ty )
      equation
        txt = fun_119(txt, i_ty);
      then txt;
  end matchcontinue;
end fun_120;

protected function fun_121
  input Tpl.Text in_txt;
  input DAE.ExpType in_a_ty;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_ty)
    local
      Tpl.Text txt;
      DAE.ExpType i_ty;

    case ( txt,
           DAE.ET_ARRAY(ty = i_ty) )
      equation
        txt = expTypeShort(txt, i_ty);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_array"));
      then txt;

    case ( txt,
           i_ty )
      equation
        txt = expTypeFlag(txt, i_ty, 2);
      then txt;
  end matchcontinue;
end fun_121;

protected function fun_122
  input Tpl.Text in_txt;
  input Integer in_a_flag;
  input DAE.ExpType in_a_ty;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_flag, in_a_ty)
    local
      Tpl.Text txt;
      DAE.ExpType a_ty;

    case ( txt,
           1,
           a_ty )
      equation
        txt = expTypeShort(txt, a_ty);
      then txt;

    case ( txt,
           2,
           a_ty )
      equation
        txt = fun_120(txt, a_ty);
      then txt;

    case ( txt,
           3,
           a_ty )
      equation
        txt = expTypeShort(txt, a_ty);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_array"));
      then txt;

    case ( txt,
           4,
           a_ty )
      equation
        txt = fun_121(txt, a_ty);
      then txt;

    case ( txt,
           _,
           _ )
      then txt;
  end matchcontinue;
end fun_122;

public function expTypeFlag
  input Tpl.Text txt;
  input DAE.ExpType a_ty;
  input Integer a_flag;

  output Tpl.Text out_txt;
algorithm
  out_txt := fun_122(txt, a_flag, a_ty);
end expTypeFlag;

public function expTypeArray
  input Tpl.Text txt;
  input DAE.ExpType a_ty;

  output Tpl.Text out_txt;
algorithm
  out_txt := expTypeFlag(txt, a_ty, 3);
end expTypeArray;

protected function fun_125
  input Tpl.Text in_txt;
  input Boolean in_mArg;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_mArg)
    local
      Tpl.Text txt;

    case ( txt,
           false )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("string"));
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("metatype"));
      then txt;
  end matchcontinue;
end fun_125;

public function expTypeShort
  input Tpl.Text in_txt;
  input DAE.ExpType in_a_type;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_type)
    local
      Tpl.Text txt;
      Absyn.Path i_name;
      DAE.ExpType i_ty;
      Boolean ret_0;

    case ( txt,
           DAE.ET_INT() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("integer"));
      then txt;

    case ( txt,
           DAE.ET_REAL() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("real"));
      then txt;

    case ( txt,
           DAE.ET_STRING() )
      equation
        ret_0 = RTOpts.acceptMetaModelicaGrammar();
        txt = fun_125(txt, ret_0);
      then txt;

    case ( txt,
           DAE.ET_BOOL() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("boolean"));
      then txt;

    case ( txt,
           DAE.ET_ENUMERATION(path = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("integer"));
      then txt;

    case ( txt,
           DAE.ET_OTHER() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("complex"));
      then txt;

    case ( txt,
           DAE.ET_ARRAY(ty = i_ty) )
      equation
        txt = expTypeShort(txt, i_ty);
      then txt;

    case ( txt,
           DAE.ET_COMPLEX(complexClassType = ClassInf.EXTERNAL_OBJ(path = _)) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("complex"));
      then txt;

    case ( txt,
           DAE.ET_COMPLEX(name = i_name) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("struct "));
        txt = underscorePath(txt, i_name);
      then txt;

    case ( txt,
           DAE.ET_METATYPE() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("metatype"));
      then txt;

    case ( txt,
           DAE.ET_BOXED(ty = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("metatype"));
      then txt;

    case ( txt,
           DAE.ET_FUNCTION_REFERENCE_VAR() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("fnptr"));
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("expTypeShort:ERROR"));
      then txt;
  end matchcontinue;
end expTypeShort;

public function dimension
  input Tpl.Text in_txt;
  input DAE.Dimension in_a_d;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_d)
    local
      Tpl.Text txt;
      Integer i_size;
      Integer i_integer;

    case ( txt,
           DAE.DIM_INTEGER(integer = i_integer) )
      equation
        txt = Tpl.writeStr(txt, intString(i_integer));
      then txt;

    case ( txt,
           DAE.DIM_ENUM(size = i_size) )
      equation
        txt = Tpl.writeStr(txt, intString(i_size));
      then txt;

    case ( txt,
           DAE.DIM_UNKNOWN() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(":"));
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("INVALID_DIMENSION"));
      then txt;
  end matchcontinue;
end dimension;

public function arrayCrefCStr
  input Tpl.Text txt;
  input DAE.ComponentRef a_cr;

  output Tpl.Text out_txt;
algorithm
  out_txt := Tpl.writeTok(txt, Tpl.ST_STRING("$P"));
  out_txt := arrayCrefCStr2(out_txt, a_cr);
end arrayCrefCStr;

public function arrayCrefCStr2
  input Tpl.Text in_txt;
  input DAE.ComponentRef in_a_cr;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_cr)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_componentRef;
      DAE.Ident i_ident;
      String ret_1;
      String ret_0;

    case ( txt,
           DAE.CREF_IDENT(ident = i_ident) )
      equation
        ret_0 = System.unquoteIdentifier(i_ident);
        txt = Tpl.writeStr(txt, ret_0);
      then txt;

    case ( txt,
           DAE.CREF_QUAL(ident = i_ident, componentRef = i_componentRef) )
      equation
        ret_1 = System.unquoteIdentifier(i_ident);
        txt = Tpl.writeStr(txt, ret_1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("$P"));
        txt = arrayCrefCStr2(txt, i_componentRef);
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("CREF_NOT_IDENT_OR_QUAL"));
      then txt;
  end matchcontinue;
end arrayCrefCStr2;

public function underscorePath
  input Tpl.Text in_txt;
  input Absyn.Path in_a_path;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_path)
    local
      Tpl.Text txt;
      String i_name_1;
      Absyn.Path i_path;
      Absyn.Ident i_name;

    case ( txt,
           Absyn.QUALIFIED(name = i_name, path = i_path) )
      equation
        txt = replaceDotAndUnderscore(txt, i_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_"));
        txt = underscorePath(txt, i_path);
      then txt;

    case ( txt,
           Absyn.IDENT(name = i_name_1) )
      equation
        txt = replaceDotAndUnderscore(txt, i_name_1);
      then txt;

    case ( txt,
           Absyn.FULLYQUALIFIED(path = i_path) )
      equation
        txt = underscorePath(txt, i_path);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end underscorePath;

public function replaceDotAndUnderscore
  input Tpl.Text in_txt;
  input String in_a_str;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_str)
    local
      Tpl.Text txt;
      String i_name;
      String ret_3;
      Tpl.Text l_str__underscores;
      String ret_1;
      Tpl.Text l_str__dots;

    case ( txt,
           i_name )
      equation
        ret_1 = System.stringReplace(i_name, ".", "_");
        l_str__dots = Tpl.writeStr(Tpl.emptyTxt, ret_1);
        ret_3 = System.stringReplace(Tpl.textString(l_str__dots), "_", "__");
        l_str__underscores = Tpl.writeStr(Tpl.emptyTxt, ret_3);
        txt = Tpl.writeText(txt, l_str__underscores);
      then txt;
  end matchcontinue;
end replaceDotAndUnderscore;

protected function fun_132
  input Tpl.Text in_txt;
  input String in_a_ty;
  input Tpl.Text in_a_newVar;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_ty, in_a_newVar)
    local
      Tpl.Text txt;
      Tpl.Text a_newVar;

    case ( txt,
           "modelica_metatype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "metamodelica_string",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "metamodelica_string_const",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "stringListStringChar_rettype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "stringAppendList_rettype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "stringGetStringChar_rettype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "stringUpdateStringChar_rettype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "listReverse_rettype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "listAppend_rettype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "listGet_rettype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "listDelete_rettype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "listRest_rettype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "listFirst_rettype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "arrayGet_rettype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "arrayCreate_rettype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "arrayList_rettype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "listArray_rettype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "arrayUpdate_rettype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "arrayCopy_rettype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "arrayAdd_rettype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           "getGlobalRoot_rettype",
           a_newVar )
      equation
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("= NULL;  mmc_GC_add_root(&"));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", mmc_GC_local_state, \""));
        txt = Tpl.writeText(txt, a_newVar);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("\");"));
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
      then txt;
  end matchcontinue;
end fun_132;

public function tempDecl
  input Tpl.Text txt;
  input String a_ty;
  input Tpl.Text a_varDecls;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
protected
  Tpl.Text l_initVarAddRoot;
  Integer ret_1;
  Tpl.Text l_newVar;
algorithm
  l_newVar := Tpl.writeTok(Tpl.emptyTxt, Tpl.ST_STRING("tmp"));
  ret_1 := System.tmpTick();
  l_newVar := Tpl.writeStr(l_newVar, intString(ret_1));
  l_initVarAddRoot := fun_132(Tpl.emptyTxt, a_ty, l_newVar);
  out_a_varDecls := Tpl.writeStr(a_varDecls, a_ty);
  out_a_varDecls := Tpl.writeTok(out_a_varDecls, Tpl.ST_STRING(" "));
  out_a_varDecls := Tpl.writeText(out_a_varDecls, l_newVar);
  out_a_varDecls := Tpl.writeText(out_a_varDecls, l_initVarAddRoot);
  out_a_varDecls := Tpl.writeTok(out_a_varDecls, Tpl.ST_NEW_LINE());
  out_txt := Tpl.writeText(txt, l_newVar);
end tempDecl;

protected function fun_134
  input Tpl.Text in_txt;
  input SimCode.Context in_a_context;
  input DAE.ComponentRef in_a_cr;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_context, in_a_cr)
    local
      Tpl.Text txt;
      DAE.ComponentRef a_cr;

    case ( txt,
           SimCode.FUNCTION_CONTEXT(),
           a_cr )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_"));
        txt = crefStr(txt, a_cr);
      then txt;

    case ( txt,
           _,
           a_cr )
      equation
        txt = cref(txt, a_cr);
      then txt;
  end matchcontinue;
end fun_134;

public function contextCref
  input Tpl.Text txt;
  input DAE.ComponentRef a_cr;
  input SimCode.Context a_context;

  output Tpl.Text out_txt;
algorithm
  out_txt := fun_134(txt, a_context, a_cr);
end contextCref;

public function crefFunctionName
  input Tpl.Text in_txt;
  input DAE.ComponentRef in_a_cr;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_cr)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_componentRef;
      DAE.Ident i_ident;
      String ret_3;
      String ret_2;
      String ret_1;
      String ret_0;

    case ( txt,
           DAE.CREF_IDENT(ident = i_ident) )
      equation
        ret_0 = System.unquoteIdentifier(i_ident);
        ret_1 = System.stringReplace(ret_0, "_", "__");
        txt = Tpl.writeStr(txt, ret_1);
      then txt;

    case ( txt,
           DAE.CREF_QUAL(ident = i_ident, componentRef = i_componentRef) )
      equation
        ret_2 = System.unquoteIdentifier(i_ident);
        ret_3 = System.stringReplace(ret_2, "_", "__");
        txt = Tpl.writeStr(txt, ret_3);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_"));
        txt = crefFunctionName(txt, i_componentRef);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end crefFunctionName;

protected function lm_137
  input Tpl.Text in_txt;
  input list<SimCode.SimEqSystem> in_items;
  input SimCode.SimCode in_a_simCode;
  input Tpl.Text in_a_varDecls;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_varDecls) :=
  matchcontinue(in_txt, in_items, in_a_simCode, in_a_varDecls)
    local
      Tpl.Text txt;
      list<SimCode.SimEqSystem> rest;
      SimCode.SimCode a_simCode;
      Tpl.Text a_varDecls;
      SimCode.SimEqSystem i_eq;

    case ( txt,
           {},
           _,
           a_varDecls )
      then (txt, a_varDecls);

    case ( txt,
           (i_eq as SimCode.SES_SIMPLE_ASSIGN(cref = _)) :: rest,
           a_simCode,
           a_varDecls )
      equation
        (txt, a_varDecls) = equation_(txt, i_eq, SimCode.contextOther, a_varDecls, a_simCode);
        txt = Tpl.nextIter(txt);
        (txt, a_varDecls) = lm_137(txt, rest, a_simCode, a_varDecls);
      then (txt, a_varDecls);

    case ( txt,
           _ :: rest,
           a_simCode,
           a_varDecls )
      equation
        (txt, a_varDecls) = lm_137(txt, rest, a_simCode, a_varDecls);
      then (txt, a_varDecls);
  end matchcontinue;
end lm_137;

public function functionInitial
  input Tpl.Text txt;
  input list<SimCode.SimEqSystem> a_initialEquations;
  input SimCode.SimCode a_simCode;

  output Tpl.Text out_txt;
protected
  Tpl.Text l_eqPart;
  Tpl.Text l_varDecls;
algorithm
  l_varDecls := Tpl.emptyTxt;
  l_eqPart := Tpl.pushIter(Tpl.emptyTxt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
  (l_eqPart, l_varDecls) := lm_137(l_eqPart, a_initialEquations, a_simCode, l_varDecls);
  l_eqPart := Tpl.popIter(l_eqPart);
  out_txt := Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
  out_txt := Tpl.writeText(out_txt, l_varDecls);
  out_txt := Tpl.softNewLine(out_txt);
  out_txt := Tpl.writeText(out_txt, l_eqPart);
  out_txt := Tpl.popBlock(out_txt);
end functionInitial;

public function equation_
  input Tpl.Text in_txt;
  input SimCode.SimEqSystem in_a_eq;
  input SimCode.Context in_a_context;
  input Tpl.Text in_a_preExp;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
algorithm
  (out_txt, out_a_preExp) :=
  matchcontinue(in_txt, in_a_eq, in_a_context, in_a_preExp, in_a_simCode)
    local
      Tpl.Text txt;
      SimCode.Context a_context;
      Tpl.Text a_preExp;
      SimCode.SimCode a_simCode;
      SimCode.SimEqSystem i_e;

    case ( txt,
           (i_e as SimCode.SES_SIMPLE_ASSIGN(cref = _)),
           a_context,
           a_preExp,
           a_simCode )
      equation
        (txt, a_preExp) = equationSimpleAssign(txt, i_e, a_context, a_preExp, a_simCode);
      then (txt, a_preExp);

    case ( txt,
           SimCode.SES_ALGORITHM(statements = _),
           _,
           a_preExp,
           _ )
      then (txt, a_preExp);

    case ( txt,
           _,
           _,
           a_preExp,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("NOT IMPLEMENTED EQUATION"));
      then (txt, a_preExp);
  end matchcontinue;
end equation_;

public function equationSimpleAssign
  input Tpl.Text in_txt;
  input SimCode.SimEqSystem in_a_eq;
  input SimCode.Context in_a_context;
  input Tpl.Text in_a_varDecls;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_varDecls) :=
  matchcontinue(in_txt, in_a_eq, in_a_context, in_a_varDecls, in_a_simCode)
    local
      Tpl.Text txt;
      SimCode.Context a_context;
      Tpl.Text a_varDecls;
      SimCode.SimCode a_simCode;
      DAE.ComponentRef i_cref;
      DAE.Exp i_exp;
      Tpl.Text l_expPart;
      Tpl.Text l_preExp;

    case ( txt,
           SimCode.SES_SIMPLE_ASSIGN(exp = i_exp, cref = i_cref),
           a_context,
           a_varDecls,
           a_simCode )
      equation
        l_preExp = Tpl.emptyTxt;
        (l_expPart, l_preExp, a_varDecls) = daeExp(Tpl.emptyTxt, i_exp, a_context, l_preExp, a_varDecls, a_simCode);
        txt = Tpl.writeText(txt, l_preExp);
        txt = Tpl.softNewLine(txt);
        txt = cref1(txt, i_cref, a_simCode);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("="));
        txt = Tpl.writeText(txt, l_expPart);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
      then (txt, a_varDecls);

    case ( txt,
           _,
           _,
           a_varDecls,
           _ )
      then (txt, a_varDecls);
  end matchcontinue;
end equationSimpleAssign;

public function daeExp
  input Tpl.Text in_txt;
  input DAE.Exp in_a_exp;
  input SimCode.Context in_a_context;
  input Tpl.Text in_a_preExp;
  input Tpl.Text in_a_varDecls;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_preExp, out_a_varDecls) :=
  matchcontinue(in_txt, in_a_exp, in_a_context, in_a_preExp, in_a_varDecls, in_a_simCode)
    local
      Tpl.Text txt;
      SimCode.Context a_context;
      Tpl.Text a_preExp;
      Tpl.Text a_varDecls;
      SimCode.SimCode a_simCode;
      DAE.Exp i_expElse;
      DAE.Exp i_expThen;
      DAE.Exp i_expCond;
      DAE.Exp i_exp2;
      DAE.Exp i_exp1;
      DAE.Operator i_operator;
      String i_string;
      DAE.Exp i_e;
      Real i_real;
      Integer i_integer;

    case ( txt,
           DAE.ICONST(integer = i_integer),
           _,
           a_preExp,
           a_varDecls,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("(modelica_integer) "));
        txt = Tpl.writeStr(txt, intString(i_integer));
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           DAE.RCONST(real = i_real),
           _,
           a_preExp,
           a_varDecls,
           _ )
      equation
        txt = Tpl.writeStr(txt, realString(i_real));
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           (i_e as DAE.CREF(componentRef = _)),
           a_context,
           a_preExp,
           a_varDecls,
           a_simCode )
      equation
        (txt, a_preExp, a_varDecls) = daeExpCrefRhs(txt, i_e, a_context, a_preExp, a_varDecls, a_simCode);
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           DAE.SCONST(string = i_string),
           a_context,
           a_preExp,
           a_varDecls,
           a_simCode )
      equation
        (txt, a_preExp, a_varDecls) = daeExpSconst(txt, i_string, a_context, a_preExp, a_varDecls, a_simCode);
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           DAE.BINARY(operator = i_operator, exp1 = i_exp1, exp2 = i_exp2),
           a_context,
           a_preExp,
           a_varDecls,
           a_simCode )
      equation
        (txt, a_preExp, a_varDecls) = daeExpBinary(txt, i_operator, i_exp1, i_exp2, a_context, a_preExp, a_varDecls, a_simCode);
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           DAE.IFEXP(expCond = i_expCond, expThen = i_expThen, expElse = i_expElse),
           a_context,
           a_preExp,
           a_varDecls,
           a_simCode )
      equation
        (txt, a_preExp, a_varDecls) = daeExpIf(txt, i_expCond, i_expThen, i_expElse, a_context, a_preExp, a_varDecls, a_simCode);
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           DAE.RELATION(operator = i_operator, exp1 = i_exp1, exp2 = i_exp2),
           a_context,
           a_preExp,
           a_varDecls,
           a_simCode )
      equation
        (txt, a_preExp, a_varDecls) = daeExpRelation(txt, i_operator, i_exp1, i_exp2, a_context, a_preExp, a_varDecls, a_simCode);
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           _,
           _,
           a_preExp,
           a_varDecls,
           _ )
      then (txt, a_preExp, a_varDecls);
  end matchcontinue;
end daeExp;

protected function fun_142
  input Tpl.Text in_txt;
  input DAE.Operator in_a_it;
  input Tpl.Text in_a_e2;
  input Tpl.Text in_a_e1;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_it, in_a_e2, in_a_e1)
    local
      Tpl.Text txt;
      Tpl.Text a_e2;
      Tpl.Text a_e1;

    case ( txt,
           DAE.ADD(ty = _),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" + "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.SUB(ty = _),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" - "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.MUL(ty = _),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" * "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.DIV(ty = _),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" / "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.POW(ty = _),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("Math.Pow("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.AND(),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" && "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.OR(),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" || "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           _,
           _,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("daeExpBinary:ERR"));
      then txt;
  end matchcontinue;
end fun_142;

public function daeExpBinary
  input Tpl.Text txt;
  input DAE.Operator a_it;
  input DAE.Exp a_exp1;
  input DAE.Exp a_exp2;
  input SimCode.Context a_context;
  input Tpl.Text a_preExp;
  input Tpl.Text a_varDecls;
  input SimCode.SimCode a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_varDecls;
protected
  Tpl.Text l_e2;
  Tpl.Text l_e1;
algorithm
  (l_e1, out_a_preExp, out_a_varDecls) := daeExp(Tpl.emptyTxt, a_exp1, a_context, a_preExp, a_varDecls, a_simCode);
  (l_e2, out_a_preExp, out_a_varDecls) := daeExp(Tpl.emptyTxt, a_exp2, a_context, out_a_preExp, out_a_varDecls, a_simCode);
  out_txt := fun_142(txt, a_it, l_e2, l_e1);
end daeExpBinary;

public function daeExpSconst
  input Tpl.Text txt;
  input String a_string;
  input SimCode.Context a_context;
  input Tpl.Text a_preExp;
  input Tpl.Text a_varDecls;
  input SimCode.SimCode a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_varDecls;
protected
  String ret_0;
algorithm
  out_txt := Tpl.writeTok(txt, Tpl.ST_STRING("\""));
  ret_0 := Util.escapeModelicaStringToCString(a_string);
  out_txt := Tpl.writeStr(out_txt, ret_0);
  out_txt := Tpl.writeTok(out_txt, Tpl.ST_STRING("\""));
  out_a_preExp := a_preExp;
  out_a_varDecls := a_varDecls;
end daeExpSconst;

protected function fun_145
  input Tpl.Text in_txt;
  input SimCode.Context in_a_context;
  input DAE.ComponentRef in_a_cr;
  input DAE.ExpType in_a_t;
  input SimCode.SimCode in_a_simCode;
  input Tpl.Text in_a_varDecls;
  input Tpl.Text in_a_preExp;
  input DAE.Exp in_a_exp;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
  output Tpl.Text out_a_preExp;
algorithm
  (out_txt, out_a_varDecls, out_a_preExp) :=
  matchcontinue(in_txt, in_a_context, in_a_cr, in_a_t, in_a_simCode, in_a_varDecls, in_a_preExp, in_a_exp)
    local
      Tpl.Text txt;
      DAE.ComponentRef a_cr;
      DAE.ExpType a_t;
      SimCode.SimCode a_simCode;
      Tpl.Text a_varDecls;
      Tpl.Text a_preExp;
      DAE.Exp a_exp;
      SimCode.Context i_context;

    case ( txt,
           (i_context as SimCode.FUNCTION_CONTEXT()),
           _,
           _,
           a_simCode,
           a_varDecls,
           a_preExp,
           a_exp )
      equation
        (txt, a_preExp, a_varDecls) = daeExpCrefRhs2(txt, a_exp, i_context, a_preExp, a_varDecls, a_simCode);
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           i_context,
           a_cr,
           a_t,
           a_simCode,
           a_varDecls,
           a_preExp,
           _ )
      equation
        (txt, a_preExp, a_varDecls) = daeExpRecordCrefRhs(txt, a_t, a_cr, i_context, a_preExp, a_varDecls, a_simCode);
      then (txt, a_varDecls, a_preExp);
  end matchcontinue;
end fun_145;

public function daeExpCrefRhs
  input Tpl.Text in_txt;
  input DAE.Exp in_a_exp;
  input SimCode.Context in_a_context;
  input Tpl.Text in_a_preExp;
  input Tpl.Text in_a_varDecls;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_preExp, out_a_varDecls) :=
  matchcontinue(in_txt, in_a_exp, in_a_context, in_a_preExp, in_a_varDecls, in_a_simCode)
    local
      Tpl.Text txt;
      SimCode.Context a_context;
      Tpl.Text a_preExp;
      Tpl.Text a_varDecls;
      SimCode.SimCode a_simCode;
      DAE.ComponentRef i_cr;
      DAE.ExpType i_t;
      DAE.Exp i_exp;

    case ( txt,
           (i_exp as DAE.CREF(componentRef = i_cr, ty = (i_t as DAE.ET_COMPLEX(complexClassType = ClassInf.RECORD(path = _))))),
           a_context,
           a_preExp,
           a_varDecls,
           a_simCode )
      equation
        (txt, a_varDecls, a_preExp) = fun_145(txt, a_context, i_cr, i_t, a_simCode, a_varDecls, a_preExp, i_exp);
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           DAE.CREF(componentRef = i_cr, ty = DAE.ET_FUNCTION_REFERENCE_FUNC(builtin = _)),
           _,
           a_preExp,
           a_varDecls,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("((modelica_fnptr)boxptr_"));
        txt = crefFunctionName(txt, i_cr);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           DAE.CREF(componentRef = i_cr, ty = DAE.ET_FUNCTION_REFERENCE_VAR()),
           _,
           a_preExp,
           a_varDecls,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("((modelica_fnptr) _"));
        txt = crefStr(txt, i_cr);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           i_exp,
           a_context,
           a_preExp,
           a_varDecls,
           a_simCode )
      equation
        (txt, a_preExp, a_varDecls) = daeExpCrefRhs2(txt, i_exp, a_context, a_preExp, a_varDecls, a_simCode);
      then (txt, a_preExp, a_varDecls);
  end matchcontinue;
end daeExpCrefRhs;

protected function lm_147
  input Tpl.Text in_txt;
  input list<DAE.ExpVar> in_items;
  input SimCode.SimCode in_a_simCode;
  input Tpl.Text in_a_varDecls;
  input Tpl.Text in_a_preExp;
  input SimCode.Context in_a_context;
  input DAE.ComponentRef in_a_cr;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
  output Tpl.Text out_a_preExp;
algorithm
  (out_txt, out_a_varDecls, out_a_preExp) :=
  matchcontinue(in_txt, in_items, in_a_simCode, in_a_varDecls, in_a_preExp, in_a_context, in_a_cr)
    local
      Tpl.Text txt;
      list<DAE.ExpVar> rest;
      SimCode.SimCode a_simCode;
      Tpl.Text a_varDecls;
      Tpl.Text a_preExp;
      SimCode.Context a_context;
      DAE.ComponentRef a_cr;
      DAE.ExpVar i_v;
      DAE.Exp ret_0;

    case ( txt,
           {},
           _,
           a_varDecls,
           a_preExp,
           _,
           _ )
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           i_v :: rest,
           a_simCode,
           a_varDecls,
           a_preExp,
           a_context,
           a_cr )
      equation
        ret_0 = SimCode.makeCrefRecordExp(a_cr, i_v);
        (txt, a_preExp, a_varDecls) = daeExp(txt, ret_0, a_context, a_preExp, a_varDecls, a_simCode);
        txt = Tpl.nextIter(txt);
        (txt, a_varDecls, a_preExp) = lm_147(txt, rest, a_simCode, a_varDecls, a_preExp, a_context, a_cr);
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           _ :: rest,
           a_simCode,
           a_varDecls,
           a_preExp,
           a_context,
           a_cr )
      equation
        (txt, a_varDecls, a_preExp) = lm_147(txt, rest, a_simCode, a_varDecls, a_preExp, a_context, a_cr);
      then (txt, a_varDecls, a_preExp);
  end matchcontinue;
end lm_147;

public function daeExpRecordCrefRhs
  input Tpl.Text in_txt;
  input DAE.ExpType in_a_ty;
  input DAE.ComponentRef in_a_cr;
  input SimCode.Context in_a_context;
  input Tpl.Text in_a_preExp;
  input Tpl.Text in_a_varDecls;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_preExp, out_a_varDecls) :=
  matchcontinue(in_txt, in_a_ty, in_a_cr, in_a_context, in_a_preExp, in_a_varDecls, in_a_simCode)
    local
      Tpl.Text txt;
      DAE.ComponentRef a_cr;
      SimCode.Context a_context;
      Tpl.Text a_preExp;
      Tpl.Text a_varDecls;
      SimCode.SimCode a_simCode;
      Absyn.Path i_record__path;
      list<DAE.ExpVar> i_var__lst;
      Tpl.Text l_ret__var;
      Tpl.Text l_ret__type;
      Tpl.Text l_record__type__name;
      Tpl.Text l_vars;

    case ( txt,
           DAE.ET_COMPLEX(name = i_record__path, varLst = i_var__lst),
           a_cr,
           a_context,
           a_preExp,
           a_varDecls,
           a_simCode )
      equation
        l_vars = Tpl.pushIter(Tpl.emptyTxt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_STRING(", ")), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        (l_vars, a_varDecls, a_preExp) = lm_147(l_vars, i_var__lst, a_simCode, a_varDecls, a_preExp, a_context, a_cr);
        l_vars = Tpl.popIter(l_vars);
        l_record__type__name = underscorePath(Tpl.emptyTxt, i_record__path);
        l_ret__type = Tpl.writeText(Tpl.emptyTxt, l_record__type__name);
        l_ret__type = Tpl.writeTok(l_ret__type, Tpl.ST_STRING("_rettype"));
        (l_ret__var, a_varDecls) = tempDecl(Tpl.emptyTxt, Tpl.textString(l_ret__type), a_varDecls);
        a_preExp = Tpl.writeText(a_preExp, l_ret__var);
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_STRING(" = _"));
        a_preExp = Tpl.writeText(a_preExp, l_record__type__name);
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_STRING("("));
        a_preExp = Tpl.writeText(a_preExp, l_vars);
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_STRING(");"));
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_NEW_LINE());
        txt = Tpl.writeText(txt, l_ret__var);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("."));
        txt = Tpl.writeText(txt, l_ret__type);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_1"));
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           _,
           _,
           _,
           a_preExp,
           a_varDecls,
           _ )
      then (txt, a_preExp, a_varDecls);
  end matchcontinue;
end daeExpRecordCrefRhs;

protected function lm_149
  input Tpl.Text in_txt;
  input list<DAE.Subscript> in_items;
  input SimCode.SimCode in_a_simCode;
  input Tpl.Text in_a_varDecls;
  input Tpl.Text in_a_preExp;
  input SimCode.Context in_a_context;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
  output Tpl.Text out_a_preExp;
algorithm
  (out_txt, out_a_varDecls, out_a_preExp) :=
  matchcontinue(in_txt, in_items, in_a_simCode, in_a_varDecls, in_a_preExp, in_a_context)
    local
      Tpl.Text txt;
      list<DAE.Subscript> rest;
      SimCode.SimCode a_simCode;
      Tpl.Text a_varDecls;
      Tpl.Text a_preExp;
      SimCode.Context a_context;
      DAE.Exp i_exp;

    case ( txt,
           {},
           _,
           a_varDecls,
           a_preExp,
           _ )
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           DAE.INDEX(exp = i_exp) :: rest,
           a_simCode,
           a_varDecls,
           a_preExp,
           a_context )
      equation
        (txt, a_preExp, a_varDecls) = daeExp(txt, i_exp, a_context, a_preExp, a_varDecls, a_simCode);
        txt = Tpl.nextIter(txt);
        (txt, a_varDecls, a_preExp) = lm_149(txt, rest, a_simCode, a_varDecls, a_preExp, a_context);
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           _ :: rest,
           a_simCode,
           a_varDecls,
           a_preExp,
           a_context )
      equation
        (txt, a_varDecls, a_preExp) = lm_149(txt, rest, a_simCode, a_varDecls, a_preExp, a_context);
      then (txt, a_varDecls, a_preExp);
  end matchcontinue;
end lm_149;

protected function fun_150
  input Tpl.Text in_txt;
  input String in_mArg;
  input Tpl.Text in_a_dimsLenStr;
  input Tpl.Text in_a_arrayType;
  input Tpl.Text in_a_dimsValuesStr;
  input Tpl.Text in_a_arrName;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_mArg, in_a_dimsLenStr, in_a_arrayType, in_a_dimsValuesStr, in_a_arrName)
    local
      Tpl.Text txt;
      Tpl.Text a_dimsLenStr;
      Tpl.Text a_arrayType;
      Tpl.Text a_dimsValuesStr;
      Tpl.Text a_arrName;

    case ( txt,
           "metatype_array",
           _,
           _,
           a_dimsValuesStr,
           a_arrName )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("arrayGet("));
        txt = Tpl.writeText(txt, a_arrName);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(","));
        txt = Tpl.writeText(txt, a_dimsValuesStr);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(") /* DAE.CREF */"));
      then txt;

    case ( txt,
           _,
           a_dimsLenStr,
           a_arrayType,
           a_dimsValuesStr,
           a_arrName )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("(*"));
        txt = Tpl.writeText(txt, a_arrayType);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_element_addr(&"));
        txt = Tpl.writeText(txt, a_arrName);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", "));
        txt = Tpl.writeText(txt, a_dimsLenStr);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", "));
        txt = Tpl.writeText(txt, a_dimsValuesStr);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("))"));
      then txt;
  end matchcontinue;
end fun_150;

protected function fun_151
  input Tpl.Text in_txt;
  input Boolean in_mArg;
  input SimCode.SimCode in_a_simCode;
  input Tpl.Text in_a_preExp;
  input Tpl.Text in_a_varDecls;
  input DAE.ExpType in_a_ty;
  input SimCode.Context in_a_context;
  input DAE.ComponentRef in_a_cr;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_preExp, out_a_varDecls) :=
  matchcontinue(in_txt, in_mArg, in_a_simCode, in_a_preExp, in_a_varDecls, in_a_ty, in_a_context, in_a_cr)
    local
      Tpl.Text txt;
      SimCode.SimCode a_simCode;
      Tpl.Text a_preExp;
      Tpl.Text a_varDecls;
      DAE.ExpType a_ty;
      SimCode.Context a_context;
      DAE.ComponentRef a_cr;
      String str_11;
      list<DAE.Subscript> ret_10;
      Tpl.Text l_dimsValuesStr;
      Integer ret_8;
      list<DAE.Subscript> ret_7;
      Tpl.Text l_dimsLenStr;
      DAE.ComponentRef ret_5;
      list<DAE.Subscript> ret_4;
      Tpl.Text l_spec1;
      Tpl.Text l_tmp;
      Tpl.Text l_arrayType;
      Tpl.Text l_arrName;

    case ( txt,
           false,
           a_simCode,
           a_preExp,
           a_varDecls,
           a_ty,
           a_context,
           a_cr )
      equation
        l_arrName = contextArrayCref(Tpl.emptyTxt, a_cr, a_context);
        l_arrayType = expTypeArray(Tpl.emptyTxt, a_ty);
        (l_tmp, a_varDecls) = tempDecl(Tpl.emptyTxt, Tpl.textString(l_arrayType), a_varDecls);
        ret_4 = ComponentReference.crefSubs(a_cr);
        (l_spec1, a_preExp, a_varDecls) = daeExpCrefRhsIndexSpec(Tpl.emptyTxt, ret_4, a_context, a_preExp, a_varDecls, a_simCode);
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_STRING("index_alloc_"));
        a_preExp = Tpl.writeText(a_preExp, l_arrayType);
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_STRING("(&"));
        a_preExp = Tpl.writeText(a_preExp, l_arrName);
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_STRING(", &"));
        a_preExp = Tpl.writeText(a_preExp, l_spec1);
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_STRING(", &"));
        a_preExp = Tpl.writeText(a_preExp, l_tmp);
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_STRING(");"));
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_NEW_LINE());
        txt = Tpl.writeText(txt, l_tmp);
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           _,
           a_simCode,
           a_preExp,
           a_varDecls,
           a_ty,
           a_context,
           a_cr )
      equation
        ret_5 = ComponentReference.crefStripLastSubs(a_cr);
        l_arrName = contextCref(Tpl.emptyTxt, ret_5, a_context);
        l_arrayType = expTypeArray(Tpl.emptyTxt, a_ty);
        ret_7 = ComponentReference.crefSubs(a_cr);
        ret_8 = listLength(ret_7);
        l_dimsLenStr = Tpl.writeStr(Tpl.emptyTxt, intString(ret_8));
        ret_10 = ComponentReference.crefSubs(a_cr);
        l_dimsValuesStr = Tpl.pushIter(Tpl.emptyTxt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_STRING(", ")), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        (l_dimsValuesStr, a_varDecls, a_preExp) = lm_149(l_dimsValuesStr, ret_10, a_simCode, a_varDecls, a_preExp, a_context);
        l_dimsValuesStr = Tpl.popIter(l_dimsValuesStr);
        str_11 = Tpl.textString(l_arrayType);
        txt = fun_150(txt, str_11, l_dimsLenStr, l_arrayType, l_dimsValuesStr, l_arrName);
      then (txt, a_preExp, a_varDecls);
  end matchcontinue;
end fun_151;

protected function fun_152
  input Tpl.Text in_txt;
  input DAE.ExpType in_a_ty;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_ty)
    local
      Tpl.Text txt;

    case ( txt,
           DAE.ET_INT() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("(modelica_integer)"));
      then txt;

    case ( txt,
           DAE.ET_ENUMERATION(path = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("(modelica_integer)"));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end fun_152;

protected function fun_153
  input Tpl.Text in_txt;
  input Boolean in_mArg;
  input SimCode.SimCode in_a_simCode;
  input Tpl.Text in_a_preExp;
  input Tpl.Text in_a_varDecls;
  input DAE.ExpType in_a_ty;
  input SimCode.Context in_a_context;
  input DAE.ComponentRef in_a_cr;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_preExp, out_a_varDecls) :=
  matchcontinue(in_txt, in_mArg, in_a_simCode, in_a_preExp, in_a_varDecls, in_a_ty, in_a_context, in_a_cr)
    local
      Tpl.Text txt;
      SimCode.SimCode a_simCode;
      Tpl.Text a_preExp;
      Tpl.Text a_varDecls;
      DAE.ExpType a_ty;
      SimCode.Context a_context;
      DAE.ComponentRef a_cr;
      Tpl.Text l_cast;
      Boolean ret_0;

    case ( txt,
           false,
           a_simCode,
           a_preExp,
           a_varDecls,
           a_ty,
           a_context,
           a_cr )
      equation
        ret_0 = SimCode.crefSubIsScalar(a_cr);
        (txt, a_preExp, a_varDecls) = fun_151(txt, ret_0, a_simCode, a_preExp, a_varDecls, a_ty, a_context, a_cr);
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           _,
           _,
           a_preExp,
           a_varDecls,
           a_ty,
           a_context,
           a_cr )
      equation
        l_cast = fun_152(Tpl.emptyTxt, a_ty);
        txt = Tpl.writeText(txt, l_cast);
        txt = contextCref(txt, a_cr, a_context);
      then (txt, a_preExp, a_varDecls);
  end matchcontinue;
end fun_153;

protected function fun_154
  input Tpl.Text in_txt;
  input Tpl.Text in_a_box;
  input SimCode.SimCode in_a_simCode;
  input Tpl.Text in_a_preExp;
  input Tpl.Text in_a_varDecls;
  input DAE.ExpType in_a_ty;
  input SimCode.Context in_a_context;
  input DAE.ComponentRef in_a_cr;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_preExp, out_a_varDecls) :=
  matchcontinue(in_txt, in_a_box, in_a_simCode, in_a_preExp, in_a_varDecls, in_a_ty, in_a_context, in_a_cr)
    local
      Tpl.Text txt;
      SimCode.SimCode a_simCode;
      Tpl.Text a_preExp;
      Tpl.Text a_varDecls;
      DAE.ExpType a_ty;
      SimCode.Context a_context;
      DAE.ComponentRef a_cr;
      Tpl.Text i_box;
      Boolean ret_0;

    case ( txt,
           Tpl.MEM_TEXT(tokens = {}),
           a_simCode,
           a_preExp,
           a_varDecls,
           a_ty,
           a_context,
           a_cr )
      equation
        ret_0 = SimCode.crefIsScalar(a_cr, a_context);
        (txt, a_preExp, a_varDecls) = fun_153(txt, ret_0, a_simCode, a_preExp, a_varDecls, a_ty, a_context, a_cr);
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           i_box,
           _,
           a_preExp,
           a_varDecls,
           _,
           _,
           _ )
      equation
        txt = Tpl.writeText(txt, i_box);
      then (txt, a_preExp, a_varDecls);
  end matchcontinue;
end fun_154;

public function daeExpCrefRhs2
  input Tpl.Text in_txt;
  input DAE.Exp in_a_ecr;
  input SimCode.Context in_a_context;
  input Tpl.Text in_a_preExp;
  input Tpl.Text in_a_varDecls;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_preExp, out_a_varDecls) :=
  matchcontinue(in_txt, in_a_ecr, in_a_context, in_a_preExp, in_a_varDecls, in_a_simCode)
    local
      Tpl.Text txt;
      SimCode.Context a_context;
      Tpl.Text a_preExp;
      Tpl.Text a_varDecls;
      SimCode.SimCode a_simCode;
      DAE.ExpType i_ty;
      DAE.ComponentRef i_cr;
      DAE.Exp i_ecr;
      Tpl.Text l_box;

    case ( txt,
           (i_ecr as DAE.CREF(componentRef = i_cr, ty = i_ty)),
           a_context,
           a_preExp,
           a_varDecls,
           a_simCode )
      equation
        (l_box, a_preExp, a_varDecls) = daeExpCrefRhsArrayBox(Tpl.emptyTxt, i_ecr, a_context, a_preExp, a_varDecls, a_simCode);
        (txt, a_preExp, a_varDecls) = fun_154(txt, l_box, a_simCode, a_preExp, a_varDecls, i_ty, a_context, i_cr);
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           _,
           _,
           a_preExp,
           a_varDecls,
           _ )
      then (txt, a_preExp, a_varDecls);
  end matchcontinue;
end daeExpCrefRhs2;

protected function fun_156
  input Tpl.Text in_txt;
  input DAE.Subscript in_a_sub;
  input SimCode.SimCode in_a_simCode;
  input Tpl.Text in_a_varDecls;
  input Tpl.Text in_a_preExp;
  input SimCode.Context in_a_context;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
  output Tpl.Text out_a_preExp;
algorithm
  (out_txt, out_a_varDecls, out_a_preExp) :=
  matchcontinue(in_txt, in_a_sub, in_a_simCode, in_a_varDecls, in_a_preExp, in_a_context)
    local
      Tpl.Text txt;
      SimCode.SimCode a_simCode;
      Tpl.Text a_varDecls;
      Tpl.Text a_preExp;
      SimCode.Context a_context;
      DAE.Exp i_exp;
      Tpl.Text l_tmp;
      Tpl.Text l_expPart;

    case ( txt,
           DAE.INDEX(exp = i_exp),
           a_simCode,
           a_varDecls,
           a_preExp,
           a_context )
      equation
        (l_expPart, a_preExp, a_varDecls) = daeExp(Tpl.emptyTxt, i_exp, a_context, a_preExp, a_varDecls, a_simCode);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("(0), make_index_array(1, (int) "));
        txt = Tpl.writeText(txt, l_expPart);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING_LIST({
                                    "), \'S\'\n",
                                    "\n"
                                }, true));
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           DAE.WHOLEDIM(),
           _,
           a_varDecls,
           a_preExp,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("(1), (int*)0, \'W\'"));
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           DAE.SLICE(exp = i_exp),
           a_simCode,
           a_varDecls,
           a_preExp,
           a_context )
      equation
        (l_expPart, a_preExp, a_varDecls) = daeExp(Tpl.emptyTxt, i_exp, a_context, a_preExp, a_varDecls, a_simCode);
        (l_tmp, a_varDecls) = tempDecl(Tpl.emptyTxt, "modelica_integer", a_varDecls);
        a_preExp = Tpl.writeText(a_preExp, l_tmp);
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_STRING(" = size_of_dimension_integer_array("));
        a_preExp = Tpl.writeText(a_preExp, l_expPart);
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_STRING(", 1);"));
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_NEW_LINE());
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("(int) "));
        txt = Tpl.writeText(txt, l_tmp);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", integer_array_make_index_array(&"));
        txt = Tpl.writeText(txt, l_expPart);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("), \'A\'"));
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           _,
           _,
           a_varDecls,
           a_preExp,
           _ )
      then (txt, a_varDecls, a_preExp);
  end matchcontinue;
end fun_156;

protected function lm_157
  input Tpl.Text in_txt;
  input list<DAE.Subscript> in_items;
  input SimCode.SimCode in_a_simCode;
  input Tpl.Text in_a_varDecls;
  input Tpl.Text in_a_preExp;
  input SimCode.Context in_a_context;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
  output Tpl.Text out_a_preExp;
algorithm
  (out_txt, out_a_varDecls, out_a_preExp) :=
  matchcontinue(in_txt, in_items, in_a_simCode, in_a_varDecls, in_a_preExp, in_a_context)
    local
      Tpl.Text txt;
      list<DAE.Subscript> rest;
      SimCode.SimCode a_simCode;
      Tpl.Text a_varDecls;
      Tpl.Text a_preExp;
      SimCode.Context a_context;
      DAE.Subscript i_sub;

    case ( txt,
           {},
           _,
           a_varDecls,
           a_preExp,
           _ )
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           i_sub :: rest,
           a_simCode,
           a_varDecls,
           a_preExp,
           a_context )
      equation
        (txt, a_varDecls, a_preExp) = fun_156(txt, i_sub, a_simCode, a_varDecls, a_preExp, a_context);
        txt = Tpl.nextIter(txt);
        (txt, a_varDecls, a_preExp) = lm_157(txt, rest, a_simCode, a_varDecls, a_preExp, a_context);
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           _ :: rest,
           a_simCode,
           a_varDecls,
           a_preExp,
           a_context )
      equation
        (txt, a_varDecls, a_preExp) = lm_157(txt, rest, a_simCode, a_varDecls, a_preExp, a_context);
      then (txt, a_varDecls, a_preExp);
  end matchcontinue;
end lm_157;

public function daeExpCrefRhsIndexSpec
  input Tpl.Text txt;
  input list<DAE.Subscript> a_subs;
  input SimCode.Context a_context;
  input Tpl.Text a_preExp;
  input Tpl.Text a_varDecls;
  input SimCode.SimCode a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_varDecls;
protected
  Tpl.Text l_tmp;
  Tpl.Text l_idx__str;
  Integer ret_1;
  Tpl.Text l_nridx__str;
algorithm
  ret_1 := listLength(a_subs);
  l_nridx__str := Tpl.writeStr(Tpl.emptyTxt, intString(ret_1));
  l_idx__str := Tpl.pushIter(Tpl.emptyTxt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_STRING(", ")), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
  (l_idx__str, out_a_varDecls, out_a_preExp) := lm_157(l_idx__str, a_subs, a_simCode, a_varDecls, a_preExp, a_context);
  l_idx__str := Tpl.popIter(l_idx__str);
  (l_tmp, out_a_varDecls) := tempDecl(Tpl.emptyTxt, "index_spec_t", out_a_varDecls);
  out_a_preExp := Tpl.writeTok(out_a_preExp, Tpl.ST_STRING("create_index_spec(&"));
  out_a_preExp := Tpl.writeText(out_a_preExp, l_tmp);
  out_a_preExp := Tpl.writeTok(out_a_preExp, Tpl.ST_STRING(", "));
  out_a_preExp := Tpl.writeText(out_a_preExp, l_nridx__str);
  out_a_preExp := Tpl.writeTok(out_a_preExp, Tpl.ST_STRING(", "));
  out_a_preExp := Tpl.writeText(out_a_preExp, l_idx__str);
  out_a_preExp := Tpl.writeTok(out_a_preExp, Tpl.ST_STRING(");"));
  out_a_preExp := Tpl.writeTok(out_a_preExp, Tpl.ST_NEW_LINE());
  out_txt := Tpl.writeText(txt, l_tmp);
end daeExpCrefRhsIndexSpec;

protected function fun_159
  input Tpl.Text in_txt;
  input SimCode.Context in_a_context;
  input DAE.ComponentRef in_a_ecr_componentRef;
  input Tpl.Text in_a_preExp;
  input list<DAE.Dimension> in_a_dims;
  input Tpl.Text in_a_varDecls;
  input DAE.ExpType in_a_aty;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_preExp, out_a_varDecls) :=
  matchcontinue(in_txt, in_a_context, in_a_ecr_componentRef, in_a_preExp, in_a_dims, in_a_varDecls, in_a_aty)
    local
      Tpl.Text txt;
      DAE.ComponentRef a_ecr_componentRef;
      Tpl.Text a_preExp;
      list<DAE.Dimension> a_dims;
      Tpl.Text a_varDecls;
      DAE.ExpType a_aty;
      Tpl.Text l_type;
      Integer ret_3;
      Tpl.Text l_dimsLenStr;
      Tpl.Text txt_1;
      Tpl.Text l_tmpArr;

    case ( txt,
           SimCode.FUNCTION_CONTEXT(),
           _,
           a_preExp,
           _,
           a_varDecls,
           _ )
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           _,
           a_ecr_componentRef,
           a_preExp,
           a_dims,
           a_varDecls,
           a_aty )
      equation
        txt_1 = expTypeArray(Tpl.emptyTxt, a_aty);
        (l_tmpArr, a_varDecls) = tempDecl(Tpl.emptyTxt, Tpl.textString(txt_1), a_varDecls);
        ret_3 = listLength(a_dims);
        l_dimsLenStr = Tpl.writeStr(Tpl.emptyTxt, intString(ret_3));
        l_type = expTypeShort(Tpl.emptyTxt, a_aty);
        a_preExp = Tpl.writeText(a_preExp, l_type);
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_STRING("_array_create(&"));
        a_preExp = Tpl.writeText(a_preExp, l_tmpArr);
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_STRING(", ((modelica_"));
        a_preExp = Tpl.writeText(a_preExp, l_type);
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_STRING("*)&("));
        a_preExp = arrayCrefCStr(a_preExp, a_ecr_componentRef);
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_STRING(")), "));
        a_preExp = Tpl.writeText(a_preExp, l_dimsLenStr);
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_STRING(");"));
        a_preExp = Tpl.writeTok(a_preExp, Tpl.ST_NEW_LINE());
        txt = Tpl.writeText(txt, l_tmpArr);
      then (txt, a_preExp, a_varDecls);
  end matchcontinue;
end fun_159;

protected function fun_160
  input Tpl.Text in_txt;
  input DAE.Exp in_a_ecr;
  input SimCode.Context in_a_context;
  input Tpl.Text in_a_preExp;
  input Tpl.Text in_a_varDecls;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_preExp, out_a_varDecls) :=
  matchcontinue(in_txt, in_a_ecr, in_a_context, in_a_preExp, in_a_varDecls)
    local
      Tpl.Text txt;
      SimCode.Context a_context;
      Tpl.Text a_preExp;
      Tpl.Text a_varDecls;
      DAE.ComponentRef i_ecr_componentRef;
      list<DAE.Dimension> i_dims;
      DAE.ExpType i_aty;

    case ( txt,
           DAE.CREF(ty = DAE.ET_ARRAY(ty = i_aty, arrayDimensions = i_dims), componentRef = i_ecr_componentRef),
           a_context,
           a_preExp,
           a_varDecls )
      equation
        (txt, a_preExp, a_varDecls) = fun_159(txt, a_context, i_ecr_componentRef, a_preExp, i_dims, a_varDecls, i_aty);
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           _,
           _,
           a_preExp,
           a_varDecls )
      then (txt, a_preExp, a_varDecls);
  end matchcontinue;
end fun_160;

public function daeExpCrefRhsArrayBox
  input Tpl.Text txt;
  input DAE.Exp a_ecr;
  input SimCode.Context a_context;
  input Tpl.Text a_preExp;
  input Tpl.Text a_varDecls;
  input SimCode.SimCode a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_preExp, out_a_varDecls) := fun_160(txt, a_ecr, a_context, a_preExp, a_varDecls);
end daeExpCrefRhsArrayBox;

public function cref1
  input Tpl.Text in_txt;
  input DAE.ComponentRef in_a_cr;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_cr, in_a_simCode)
    local
      Tpl.Text txt;
      SimCode.SimCode a_simCode;
      DAE.ComponentRef i_cr;

    case ( txt,
           DAE.CREF_IDENT(ident = "xloc"),
           _ )
      then txt;

    case ( txt,
           DAE.CREF_IDENT(ident = "time"),
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("time"));
      then txt;

    case ( txt,
           i_cr,
           a_simCode )
      equation
        txt = representationCref(txt, i_cr, a_simCode);
      then txt;
  end matchcontinue;
end cref1;

protected function smf_163
  input Tpl.Text in_txt;
  input SimCode.SimVar in_it;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_it)
    local
      Tpl.Text txt;
      Integer i_index;
      DAE.ExpType i_type__;
      BackendDAE.VarKind i_varKind;

    case ( txt,
           SimCode.SIMVAR(varKind = i_varKind, type_ = i_type__, index = i_index) )
      equation
        txt = representationArrayName(txt, i_varKind, i_type__);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("["));
        txt = Tpl.writeStr(txt, intString(i_index));
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("]"));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end smf_163;

public function representationCref
  input Tpl.Text txt;
  input DAE.ComponentRef a_inCref;
  input SimCode.SimCode a_simCode;

  output Tpl.Text out_txt;
protected
  SimCode.SimVar ret_0;
algorithm
  ret_0 := SimCode.cref2simvar(a_inCref, a_simCode);
  out_txt := smf_163(txt, ret_0);
end representationCref;

protected function fun_165
  input Tpl.Text in_txt;
  input BackendDAE.VarKind in_a_varKind;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_varKind)
    local
      Tpl.Text txt;

    case ( txt,
           BackendDAE.STATE() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_z"));
      then txt;

    case ( txt,
           BackendDAE.STATE_DER() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_zDot"));
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("BAD_VARKIND"));
      then txt;
  end matchcontinue;
end fun_165;

public function representationArrayName
  input Tpl.Text txt;
  input BackendDAE.VarKind a_varKind;
  input DAE.ExpType a_type__;

  output Tpl.Text out_txt;
algorithm
  out_txt := fun_165(txt, a_varKind);
end representationArrayName;

public function helpvarlength
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simCode)
    local
      Tpl.Text txt;
      list<SimCode.HelpVarInfo> i_helpVarInfo;
      Integer ret_1;
      Tpl.Text l_size;

    case ( txt,
           SimCode.SIMCODE(helpVarInfo = i_helpVarInfo) )
      equation
        ret_1 = listLength(i_helpVarInfo);
        l_size = Tpl.writeStr(Tpl.emptyTxt, intString(ret_1));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
        txt = Tpl.writeText(txt, l_size);
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end helpvarlength;

protected function fun_168
  input Tpl.Text in_txt;
  input DAE.Operator in_a_op;
  input Tpl.Text in_a_e2;
  input Tpl.Text in_a_e1;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_op, in_a_e2, in_a_e1)
    local
      Tpl.Text txt;
      Tpl.Text a_e2;
      Tpl.Text a_e1;

    case ( txt,
           DAE.LESS(ty = DAE.ET_BOOL()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("(!"));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" && "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.LESS(ty = DAE.ET_STRING()),
           _,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("# string comparison not supported\n"));
      then txt;

    case ( txt,
           DAE.LESS(ty = DAE.ET_INT()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" < "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.LESS(ty = DAE.ET_REAL()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" < "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.GREATER(ty = DAE.ET_BOOL()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" && !"));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.GREATER(ty = DAE.ET_STRING()),
           _,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("# string comparison not supported\n"));
      then txt;

    case ( txt,
           DAE.GREATER(ty = DAE.ET_INT()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" > "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.GREATER(ty = DAE.ET_REAL()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" > "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.LESSEQ(ty = DAE.ET_BOOL()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("(!"));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" || "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.LESSEQ(ty = DAE.ET_STRING()),
           _,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("# string comparison not supported\n"));
      then txt;

    case ( txt,
           DAE.LESSEQ(ty = DAE.ET_INT()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" <= "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.LESSEQ(ty = DAE.ET_REAL()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" <= "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.GREATEREQ(ty = DAE.ET_BOOL()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" || !"));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.GREATEREQ(ty = DAE.ET_STRING()),
           _,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("# string comparison not supported\n"));
      then txt;

    case ( txt,
           DAE.GREATEREQ(ty = DAE.ET_INT()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" >= "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.GREATEREQ(ty = DAE.ET_REAL()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" >= "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.EQUAL(ty = DAE.ET_BOOL()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("((!"));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" && !"));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(") || ("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" && "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("))"));
      then txt;

    case ( txt,
           DAE.EQUAL(ty = DAE.ET_STRING()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" == "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.EQUAL(ty = DAE.ET_INT()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" == "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.EQUAL(ty = DAE.ET_REAL()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" == "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.NEQUAL(ty = DAE.ET_BOOL()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("((!"));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" && "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(") || ("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" && !"));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("))"));
      then txt;

    case ( txt,
           DAE.NEQUAL(ty = DAE.ET_STRING()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" != "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.NEQUAL(ty = DAE.ET_INT()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" != "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           DAE.NEQUAL(ty = DAE.ET_REAL()),
           a_e2,
           a_e1 )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("("));
        txt = Tpl.writeText(txt, a_e1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" != "));
        txt = Tpl.writeText(txt, a_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(")"));
      then txt;

    case ( txt,
           _,
           _,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("daeExpRelation:ERR"));
      then txt;
  end matchcontinue;
end fun_168;

protected function fun_169
  input Tpl.Text in_txt;
  input Tpl.Text in_a_simrel;
  input Tpl.Text in_a_e2;
  input Tpl.Text in_a_e1;
  input DAE.Operator in_a_op;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_simrel, in_a_e2, in_a_e1, in_a_op)
    local
      Tpl.Text txt;
      Tpl.Text a_e2;
      Tpl.Text a_e1;
      DAE.Operator a_op;
      Tpl.Text i_simrel;

    case ( txt,
           Tpl.MEM_TEXT(tokens = {}),
           a_e2,
           a_e1,
           a_op )
      equation
        txt = fun_168(txt, a_op, a_e2, a_e1);
      then txt;

    case ( txt,
           i_simrel,
           _,
           _,
           _ )
      equation
        txt = Tpl.writeText(txt, i_simrel);
      then txt;
  end matchcontinue;
end fun_169;

public function daeExpRelation
  input Tpl.Text txt;
  input DAE.Operator a_op;
  input DAE.Exp a_exp1;
  input DAE.Exp a_exp2;
  input SimCode.Context a_context;
  input Tpl.Text a_preExp;
  input Tpl.Text a_varDecls;
  input SimCode.SimCode a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_varDecls;
protected
  Tpl.Text l_simrel;
  Tpl.Text l_e2;
  Tpl.Text l_e1;
algorithm
  (l_e1, out_a_preExp, out_a_varDecls) := daeExp(Tpl.emptyTxt, a_exp1, a_context, a_preExp, a_varDecls, a_simCode);
  (l_e2, out_a_preExp, out_a_varDecls) := daeExp(Tpl.emptyTxt, a_exp2, a_context, out_a_preExp, out_a_varDecls, a_simCode);
  (l_simrel, l_e1, l_e2, out_a_preExp) := daeExpSimRelation(Tpl.emptyTxt, a_context, a_op, l_e1, l_e2, out_a_preExp);
  out_txt := fun_169(txt, l_simrel, l_e2, l_e1, a_op);
end daeExpRelation;

protected function fun_171
  input Tpl.Text in_txt;
  input DAE.Operator in_a_op;
  input Tpl.Text in_a_preExp;
  input Tpl.Text in_a_e2;
  input Tpl.Text in_a_e1;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_e2;
  output Tpl.Text out_a_e1;
algorithm
  (out_txt, out_a_preExp, out_a_e2, out_a_e1) :=
  matchcontinue(in_txt, in_a_op, in_a_preExp, in_a_e2, in_a_e1)
    local
      Tpl.Text txt;
      Tpl.Text a_preExp;
      Tpl.Text a_e2;
      Tpl.Text a_e1;

    case ( txt,
           DAE.LESS(ty = _),
           a_preExp,
           a_e2,
           a_e1 )
      equation
        (txt, a_e1, a_e2, a_preExp) = SimRelationSimple(txt, a_e1, a_e2, " <", a_preExp);
      then (txt, a_preExp, a_e2, a_e1);

    case ( txt,
           DAE.LESSEQ(ty = _),
           a_preExp,
           a_e2,
           a_e1 )
      equation
        (txt, a_e1, a_e2, a_preExp) = SimRelationEqual(txt, a_e1, a_e2, " <", a_preExp);
      then (txt, a_preExp, a_e2, a_e1);

    case ( txt,
           DAE.GREATER(ty = _),
           a_preExp,
           a_e2,
           a_e1 )
      equation
        (txt, a_e1, a_e2, a_preExp) = SimRelationSimple(txt, a_e1, a_e2, " >", a_preExp);
      then (txt, a_preExp, a_e2, a_e1);

    case ( txt,
           DAE.GREATEREQ(ty = _),
           a_preExp,
           a_e2,
           a_e1 )
      equation
        (txt, a_e1, a_e2, a_preExp) = SimRelationEqual(txt, a_e1, a_e2, " >", a_preExp);
      then (txt, a_preExp, a_e2, a_e1);

    case ( txt,
           _,
           a_preExp,
           a_e2,
           a_e1 )
      then (txt, a_preExp, a_e2, a_e1);
  end matchcontinue;
end fun_171;

public function daeExpSimRelation
  input Tpl.Text in_txt;
  input SimCode.Context in_a_it;
  input DAE.Operator in_a_op;
  input Tpl.Text in_a_e1;
  input Tpl.Text in_a_e2;
  input Tpl.Text in_a_preExp;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_e1;
  output Tpl.Text out_a_e2;
  output Tpl.Text out_a_preExp;
algorithm
  (out_txt, out_a_e1, out_a_e2, out_a_preExp) :=
  matchcontinue(in_txt, in_a_it, in_a_op, in_a_e1, in_a_e2, in_a_preExp)
    local
      Tpl.Text txt;
      DAE.Operator a_op;
      Tpl.Text a_e1;
      Tpl.Text a_e2;
      Tpl.Text a_preExp;

    case ( txt,
           SimCode.SIMULATION(genDiscrete = _),
           a_op,
           a_e1,
           a_e2,
           a_preExp )
      equation
        (txt, a_preExp, a_e2, a_e1) = fun_171(txt, a_op, a_preExp, a_e2, a_e1);
      then (txt, a_e1, a_e2, a_preExp);

    case ( txt,
           _,
           _,
           a_e1,
           a_e2,
           a_preExp )
      then (txt, a_e1, a_e2, a_preExp);
  end matchcontinue;
end daeExpSimRelation;

public function SimRelationSimple
  input Tpl.Text txt;
  input Tpl.Text a_e1;
  input Tpl.Text a_e2;
  input String a_op;
  input Tpl.Text a_preExp;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_e1;
  output Tpl.Text out_a_e2;
  output Tpl.Text out_a_preExp;
protected
  Tpl.Text l_res;
algorithm
  l_res := Tpl.emptyTxt;
  out_a_preExp := Tpl.writeTok(a_preExp, Tpl.ST_STRING("// RELATION( "));
  out_a_preExp := Tpl.writeText(out_a_preExp, a_e1);
  out_a_preExp := Tpl.writeStr(out_a_preExp, a_op);
  out_a_preExp := Tpl.writeTok(out_a_preExp, Tpl.ST_STRING(" "));
  out_a_preExp := Tpl.writeText(out_a_preExp, a_e2);
  out_a_preExp := Tpl.writeTok(out_a_preExp, Tpl.ST_LINE(" ) macro expansion\n"));
  (out_a_preExp, l_res) := tempDecl(out_a_preExp, "bool", l_res);
  out_a_preExp := Tpl.writeTok(out_a_preExp, Tpl.ST_STRING(" = "));
  out_a_preExp := Tpl.writeText(out_a_preExp, a_e1);
  out_a_preExp := Tpl.writeStr(out_a_preExp, a_op);
  out_a_preExp := Tpl.writeTok(out_a_preExp, Tpl.ST_STRING(" "));
  out_a_preExp := Tpl.writeText(out_a_preExp, a_e2);
  out_a_preExp := Tpl.writeTok(out_a_preExp, Tpl.ST_STRING("; "));
  out_a_preExp := Tpl.writeTok(out_a_preExp, Tpl.ST_NEW_LINE());
  out_txt := Tpl.writeText(txt, l_res);
  out_a_e1 := a_e1;
  out_a_e2 := a_e2;
end SimRelationSimple;

public function SimRelationEqual
  input Tpl.Text txt;
  input Tpl.Text a_e1;
  input Tpl.Text a_e2;
  input String a_op;
  input Tpl.Text a_preExp;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_e1;
  output Tpl.Text out_a_e2;
  output Tpl.Text out_a_preExp;
protected
  Tpl.Text l_res;
algorithm
  l_res := Tpl.emptyTxt;
  out_a_preExp := Tpl.writeTok(a_preExp, Tpl.ST_STRING("// RELATION( "));
  out_a_preExp := Tpl.writeText(out_a_preExp, a_e1);
  out_a_preExp := Tpl.writeStr(out_a_preExp, a_op);
  out_a_preExp := Tpl.writeTok(out_a_preExp, Tpl.ST_STRING("= "));
  out_a_preExp := Tpl.writeText(out_a_preExp, a_e2);
  out_a_preExp := Tpl.writeTok(out_a_preExp, Tpl.ST_LINE(" ) macro expansion\n"));
  (out_a_preExp, l_res) := tempDecl(out_a_preExp, "bool", l_res);
  out_a_preExp := Tpl.writeTok(out_a_preExp, Tpl.ST_STRING("; "));
  out_a_preExp := Tpl.writeTok(out_a_preExp, Tpl.ST_NEW_LINE());
  out_txt := Tpl.writeText(txt, l_res);
  out_a_e1 := a_e1;
  out_a_e2 := a_e2;
end SimRelationEqual;

public function daeExpIf
  input Tpl.Text txt;
  input DAE.Exp a_cond;
  input DAE.Exp a_then__;
  input DAE.Exp a_else__;
  input SimCode.Context a_context;
  input Tpl.Text a_preExp;
  input Tpl.Text a_varDecls;
  input SimCode.SimCode a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_varDecls;
protected
  Tpl.Text l_condExp;
algorithm
  (l_condExp, out_a_preExp, out_a_varDecls) := daeExp(Tpl.emptyTxt, a_cond, a_context, a_preExp, a_varDecls, a_simCode);
  out_txt := Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
  out_txt := Tpl.writeText(out_txt, l_condExp);
  out_txt := Tpl.popBlock(out_txt);
end daeExpIf;

protected function lm_176
  input Tpl.Text in_txt;
  input list<DAE.Statement> in_items;
  input SimCode.SimCode in_a_simCode;
  input Tpl.Text in_a_varDecls;
  input Tpl.Text in_a_preExp;
  input SimCode.Context in_a_context;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
  output Tpl.Text out_a_preExp;
algorithm
  (out_txt, out_a_varDecls, out_a_preExp) :=
  matchcontinue(in_txt, in_items, in_a_simCode, in_a_varDecls, in_a_preExp, in_a_context)
    local
      Tpl.Text txt;
      list<DAE.Statement> rest;
      SimCode.SimCode a_simCode;
      Tpl.Text a_varDecls;
      Tpl.Text a_preExp;
      SimCode.Context a_context;
      DAE.Statement i_it;

    case ( txt,
           {},
           _,
           a_varDecls,
           a_preExp,
           _ )
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           i_it :: rest,
           a_simCode,
           a_varDecls,
           a_preExp,
           a_context )
      equation
        (txt, a_preExp, a_varDecls) = algStatement(txt, i_it, a_context, a_preExp, a_varDecls, a_simCode);
        txt = Tpl.nextIter(txt);
        (txt, a_varDecls, a_preExp) = lm_176(txt, rest, a_simCode, a_varDecls, a_preExp, a_context);
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           _ :: rest,
           a_simCode,
           a_varDecls,
           a_preExp,
           a_context )
      equation
        (txt, a_varDecls, a_preExp) = lm_176(txt, rest, a_simCode, a_varDecls, a_preExp, a_context);
      then (txt, a_varDecls, a_preExp);
  end matchcontinue;
end lm_176;

protected function lm_177
  input Tpl.Text in_txt;
  input list<DAE.Statement> in_items;
  input SimCode.SimCode in_a_simCode;
  input Tpl.Text in_a_varDecls;
  input Tpl.Text in_a_preExp;
  input SimCode.Context in_a_context;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
  output Tpl.Text out_a_preExp;
algorithm
  (out_txt, out_a_varDecls, out_a_preExp) :=
  matchcontinue(in_txt, in_items, in_a_simCode, in_a_varDecls, in_a_preExp, in_a_context)
    local
      Tpl.Text txt;
      list<DAE.Statement> rest;
      SimCode.SimCode a_simCode;
      Tpl.Text a_varDecls;
      Tpl.Text a_preExp;
      SimCode.Context a_context;
      DAE.Statement i_stmt;

    case ( txt,
           {},
           _,
           a_varDecls,
           a_preExp,
           _ )
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           i_stmt :: rest,
           a_simCode,
           a_varDecls,
           a_preExp,
           a_context )
      equation
        (txt, a_preExp, a_varDecls) = algStatement(txt, i_stmt, a_context, a_preExp, a_varDecls, a_simCode);
        txt = Tpl.nextIter(txt);
        (txt, a_varDecls, a_preExp) = lm_177(txt, rest, a_simCode, a_varDecls, a_preExp, a_context);
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           _ :: rest,
           a_simCode,
           a_varDecls,
           a_preExp,
           a_context )
      equation
        (txt, a_varDecls, a_preExp) = lm_177(txt, rest, a_simCode, a_varDecls, a_preExp, a_context);
      then (txt, a_varDecls, a_preExp);
  end matchcontinue;
end lm_177;

protected function fun_178
  input Tpl.Text in_txt;
  input DAE.Statement in_a_it;
  input SimCode.Context in_a_context;
  input Tpl.Text in_a_varDecls;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_varDecls) :=
  matchcontinue(in_txt, in_a_it, in_a_context, in_a_varDecls, in_a_simCode)
    local
      Tpl.Text txt;
      SimCode.Context a_context;
      Tpl.Text a_varDecls;
      SimCode.SimCode a_simCode;
      DAE.Else i_else__;
      list<DAE.Statement> i_statementLst;
      DAE.ComponentRef i_componentRef;
      DAE.Ident i_componentRef_ident;
      list<DAE.Subscript> i_subs;
      DAE.Exp i_exp1;
      DAE.Exp i_exp;
      DAE.Exp i_e;
      Tpl.Text l_var;
      Tpl.Text l_condExp;
      Tpl.Text l_spec;
      Tpl.Text l_expPart2;
      Tpl.Text l_expPart1;
      Tpl.Text l_expPart;
      Tpl.Text l_preExp;

    case ( txt,
           DAE.STMT_ASSIGN(exp1 = DAE.CREF(componentRef = DAE.WILD()), exp = i_e),
           a_context,
           a_varDecls,
           a_simCode )
      equation
        l_preExp = Tpl.emptyTxt;
        (l_expPart, l_preExp, a_varDecls) = daeExp(Tpl.emptyTxt, i_e, a_context, l_preExp, a_varDecls, a_simCode);
        txt = Tpl.writeText(txt, l_preExp);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeText(txt, l_expPart);
      then (txt, a_varDecls);

    case ( txt,
           DAE.STMT_ASSIGN(exp1 = (i_exp1 as DAE.CREF(componentRef = _)), exp = i_exp),
           a_context,
           a_varDecls,
           a_simCode )
      equation
        l_preExp = Tpl.emptyTxt;
        (l_expPart, l_preExp, a_varDecls) = daeExp(Tpl.emptyTxt, i_exp, a_context, l_preExp, a_varDecls, a_simCode);
        txt = Tpl.writeText(txt, l_preExp);
        txt = Tpl.softNewLine(txt);
        (txt, l_preExp, a_varDecls) = scalarLhsCref(txt, i_exp1, a_context, l_preExp, a_varDecls, a_simCode);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" = "));
        txt = Tpl.writeText(txt, l_expPart);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
      then (txt, a_varDecls);

    case ( txt,
           DAE.STMT_ASSIGN(exp1 = i_exp1, exp = i_exp),
           a_context,
           a_varDecls,
           a_simCode )
      equation
        l_preExp = Tpl.emptyTxt;
        (l_expPart1, l_preExp, a_varDecls) = daeExp(Tpl.emptyTxt, i_exp1, a_context, l_preExp, a_varDecls, a_simCode);
        (l_expPart2, l_preExp, a_varDecls) = daeExp(Tpl.emptyTxt, i_exp, a_context, l_preExp, a_varDecls, a_simCode);
        txt = Tpl.writeText(txt, l_preExp);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeText(txt, l_expPart1);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" = "));
        txt = Tpl.writeText(txt, l_expPart2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
      then (txt, a_varDecls);

    case ( txt,
           DAE.STMT_ASSIGN_ARR(componentRef = DAE.CREF_IDENT(subscriptLst = (i_subs as _ :: _), ident = i_componentRef_ident), exp = i_exp),
           a_context,
           a_varDecls,
           a_simCode )
      equation
        l_preExp = Tpl.emptyTxt;
        (l_expPart, l_preExp, a_varDecls) = daeExp(Tpl.emptyTxt, i_exp, a_context, l_preExp, a_varDecls, a_simCode);
        (l_spec, l_preExp, a_varDecls) = daeExpCrefRhsIndexSpec(Tpl.emptyTxt, i_subs, a_context, l_preExp, a_varDecls, a_simCode);
        txt = Tpl.writeText(txt, l_preExp);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeStr(txt, i_componentRef_ident);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(".AssignSpec("));
        txt = Tpl.writeText(txt, l_spec);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(", "));
        txt = Tpl.writeText(txt, l_expPart);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(".A);"));
      then (txt, a_varDecls);

    case ( txt,
           DAE.STMT_ASSIGN_ARR(exp = i_exp, componentRef = i_componentRef),
           a_context,
           a_varDecls,
           a_simCode )
      equation
        l_preExp = Tpl.emptyTxt;
        (l_expPart, l_preExp, a_varDecls) = daeExp(Tpl.emptyTxt, i_exp, a_context, l_preExp, a_varDecls, a_simCode);
        txt = Tpl.writeText(txt, l_preExp);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("ArrayCopy("));
        txt = Tpl.writeText(txt, l_expPart);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(".A, "));
        txt = contextCref(txt, i_componentRef, a_context);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(".A);"));
      then (txt, a_varDecls);

    case ( txt,
           DAE.STMT_IF(exp = i_exp, statementLst = i_statementLst, else_ = i_else__),
           a_context,
           a_varDecls,
           a_simCode )
      equation
        l_preExp = Tpl.emptyTxt;
        (l_condExp, l_preExp, a_varDecls) = daeExp(Tpl.emptyTxt, i_exp, a_context, l_preExp, a_varDecls, a_simCode);
        txt = Tpl.writeText(txt, l_preExp);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("if ("));
        txt = Tpl.writeText(txt, l_condExp);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE(") {\n"));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        (txt, a_varDecls, l_preExp) = lm_176(txt, i_statementLst, a_simCode, a_varDecls, l_preExp, a_context);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("}\n"));
        (txt, l_preExp, a_varDecls) = elseExpr(txt, i_else__, a_context, l_preExp, a_varDecls, a_simCode);
      then (txt, a_varDecls);

    case ( txt,
           DAE.STMT_WHILE(exp = i_exp, statementLst = i_statementLst),
           a_context,
           a_varDecls,
           a_simCode )
      equation
        l_preExp = Tpl.emptyTxt;
        (l_var, l_preExp, a_varDecls) = daeExp(Tpl.emptyTxt, i_exp, a_context, l_preExp, a_varDecls, a_simCode);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("for(;;) {\n"));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = Tpl.writeText(txt, l_preExp);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("if (!"));
        txt = Tpl.writeText(txt, l_var);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE(") break;\n"));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        (txt, a_varDecls, l_preExp) = lm_177(txt, i_statementLst, a_simCode, a_varDecls, l_preExp, a_context);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("}"));
      then (txt, a_varDecls);

    case ( txt,
           _,
           _,
           a_varDecls,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("NOT_IMPLEMENTED_ALG_STATEMENT"));
      then (txt, a_varDecls);
  end matchcontinue;
end fun_178;

public function algStatement
  input Tpl.Text txt;
  input DAE.Statement a_it;
  input SimCode.Context a_context;
  input Tpl.Text a_preExp;
  input Tpl.Text a_varDecls;
  input SimCode.SimCode a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_varDecls) := fun_178(txt, a_it, a_context, a_varDecls, a_simCode);
  out_a_preExp := a_preExp;
end algStatement;

protected function fun_180
  input Tpl.Text in_txt;
  input Boolean in_mArg;
  input DAE.ComponentRef in_a_ecr_componentRef;
  input SimCode.SimCode in_a_simCode;
  input Tpl.Text in_a_varDecls;
  input Tpl.Text in_a_preExp;
  input SimCode.Context in_a_context;
  input DAE.Exp in_a_ecr;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
  output Tpl.Text out_a_preExp;
algorithm
  (out_txt, out_a_varDecls, out_a_preExp) :=
  matchcontinue(in_txt, in_mArg, in_a_ecr_componentRef, in_a_simCode, in_a_varDecls, in_a_preExp, in_a_context, in_a_ecr)
    local
      Tpl.Text txt;
      DAE.ComponentRef a_ecr_componentRef;
      SimCode.SimCode a_simCode;
      Tpl.Text a_varDecls;
      Tpl.Text a_preExp;
      SimCode.Context a_context;
      DAE.Exp a_ecr;

    case ( txt,
           false,
           _,
           a_simCode,
           a_varDecls,
           a_preExp,
           a_context,
           a_ecr )
      equation
        (txt, a_preExp, a_varDecls) = daeExpCrefRhs(txt, a_ecr, a_context, a_preExp, a_varDecls, a_simCode);
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           _,
           a_ecr_componentRef,
           _,
           a_varDecls,
           a_preExp,
           a_context,
           _ )
      equation
        txt = contextCref(txt, a_ecr_componentRef, a_context);
      then (txt, a_varDecls, a_preExp);
  end matchcontinue;
end fun_180;

public function scalarLhsCref
  input Tpl.Text in_txt;
  input DAE.Exp in_a_ecr;
  input SimCode.Context in_a_context;
  input Tpl.Text in_a_preExp;
  input Tpl.Text in_a_varDecls;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_preExp, out_a_varDecls) :=
  matchcontinue(in_txt, in_a_ecr, in_a_context, in_a_preExp, in_a_varDecls, in_a_simCode)
    local
      Tpl.Text txt;
      SimCode.Context a_context;
      Tpl.Text a_preExp;
      Tpl.Text a_varDecls;
      SimCode.SimCode a_simCode;
      DAE.Exp i_ecr;
      DAE.ComponentRef i_ecr_componentRef;
      Boolean ret_0;

    case ( txt,
           (i_ecr as DAE.CREF(componentRef = (i_ecr_componentRef as DAE.CREF_IDENT(subscriptLst = _)))),
           a_context,
           a_preExp,
           a_varDecls,
           a_simCode )
      equation
        ret_0 = SimCode.crefNoSub(i_ecr_componentRef);
        (txt, a_varDecls, a_preExp) = fun_180(txt, ret_0, i_ecr_componentRef, a_simCode, a_varDecls, a_preExp, a_context, i_ecr);
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           DAE.CREF(componentRef = (i_ecr_componentRef as DAE.CREF_QUAL(ident = _))),
           a_context,
           a_preExp,
           a_varDecls,
           _ )
      equation
        txt = contextCref(txt, i_ecr_componentRef, a_context);
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           _,
           _,
           a_preExp,
           a_varDecls,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("ONLY_IDENT_OR_QUAL_CREF_SUPPORTED_SLHS"));
      then (txt, a_preExp, a_varDecls);
  end matchcontinue;
end scalarLhsCref;

protected function lm_182
  input Tpl.Text in_txt;
  input list<DAE.Statement> in_items;
  input SimCode.SimCode in_a_simCode;
  input Tpl.Text in_a_varDecls;
  input Tpl.Text in_a_preExp;
  input SimCode.Context in_a_context;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
  output Tpl.Text out_a_preExp;
algorithm
  (out_txt, out_a_varDecls, out_a_preExp) :=
  matchcontinue(in_txt, in_items, in_a_simCode, in_a_varDecls, in_a_preExp, in_a_context)
    local
      Tpl.Text txt;
      list<DAE.Statement> rest;
      SimCode.SimCode a_simCode;
      Tpl.Text a_varDecls;
      Tpl.Text a_preExp;
      SimCode.Context a_context;
      DAE.Statement i_it;

    case ( txt,
           {},
           _,
           a_varDecls,
           a_preExp,
           _ )
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           i_it :: rest,
           a_simCode,
           a_varDecls,
           a_preExp,
           a_context )
      equation
        (txt, a_preExp, a_varDecls) = algStatement(txt, i_it, a_context, a_preExp, a_varDecls, a_simCode);
        txt = Tpl.nextIter(txt);
        (txt, a_varDecls, a_preExp) = lm_182(txt, rest, a_simCode, a_varDecls, a_preExp, a_context);
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           _ :: rest,
           a_simCode,
           a_varDecls,
           a_preExp,
           a_context )
      equation
        (txt, a_varDecls, a_preExp) = lm_182(txt, rest, a_simCode, a_varDecls, a_preExp, a_context);
      then (txt, a_varDecls, a_preExp);
  end matchcontinue;
end lm_182;

protected function lm_183
  input Tpl.Text in_txt;
  input list<DAE.Statement> in_items;
  input SimCode.SimCode in_a_simCode;
  input Tpl.Text in_a_varDecls;
  input Tpl.Text in_a_preExp;
  input SimCode.Context in_a_context;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
  output Tpl.Text out_a_preExp;
algorithm
  (out_txt, out_a_varDecls, out_a_preExp) :=
  matchcontinue(in_txt, in_items, in_a_simCode, in_a_varDecls, in_a_preExp, in_a_context)
    local
      Tpl.Text txt;
      list<DAE.Statement> rest;
      SimCode.SimCode a_simCode;
      Tpl.Text a_varDecls;
      Tpl.Text a_preExp;
      SimCode.Context a_context;
      DAE.Statement i_it;

    case ( txt,
           {},
           _,
           a_varDecls,
           a_preExp,
           _ )
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           i_it :: rest,
           a_simCode,
           a_varDecls,
           a_preExp,
           a_context )
      equation
        (txt, a_preExp, a_varDecls) = algStatement(txt, i_it, a_context, a_preExp, a_varDecls, a_simCode);
        txt = Tpl.nextIter(txt);
        (txt, a_varDecls, a_preExp) = lm_183(txt, rest, a_simCode, a_varDecls, a_preExp, a_context);
      then (txt, a_varDecls, a_preExp);

    case ( txt,
           _ :: rest,
           a_simCode,
           a_varDecls,
           a_preExp,
           a_context )
      equation
        (txt, a_varDecls, a_preExp) = lm_183(txt, rest, a_simCode, a_varDecls, a_preExp, a_context);
      then (txt, a_varDecls, a_preExp);
  end matchcontinue;
end lm_183;

public function elseExpr
  input Tpl.Text in_txt;
  input DAE.Else in_a_it;
  input SimCode.Context in_a_context;
  input Tpl.Text in_a_preExp;
  input Tpl.Text in_a_varDecls;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_preExp;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_preExp, out_a_varDecls) :=
  matchcontinue(in_txt, in_a_it, in_a_context, in_a_preExp, in_a_varDecls, in_a_simCode)
    local
      Tpl.Text txt;
      SimCode.Context a_context;
      Tpl.Text a_preExp;
      Tpl.Text a_varDecls;
      SimCode.SimCode a_simCode;
      DAE.Else i_else__;
      list<DAE.Statement> i_statementLst;
      DAE.Exp i_exp;
      Tpl.Text l_condExp;
      Tpl.Text l_preExp;

    case ( txt,
           DAE.NOELSE(),
           _,
           a_preExp,
           a_varDecls,
           _ )
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           DAE.ELSEIF(exp = i_exp, statementLst = i_statementLst, else_ = i_else__),
           a_context,
           a_preExp,
           a_varDecls,
           a_simCode )
      equation
        l_preExp = Tpl.emptyTxt;
        (l_condExp, l_preExp, a_varDecls) = daeExp(Tpl.emptyTxt, i_exp, a_context, l_preExp, a_varDecls, a_simCode);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("else {\n"));
        txt = Tpl.writeText(txt, l_preExp);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("if ("));
        txt = Tpl.writeText(txt, l_condExp);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE(") {\n"));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        (txt, a_varDecls, l_preExp) = lm_182(txt, i_statementLst, a_simCode, a_varDecls, l_preExp, a_context);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("}\n"));
        (txt, l_preExp, a_varDecls) = elseExpr(txt, i_else__, a_context, l_preExp, a_varDecls, a_simCode);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("}"));
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           DAE.ELSE(statementLst = i_statementLst),
           a_context,
           a_preExp,
           a_varDecls,
           a_simCode )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_LINE("else {\n"));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
        (txt, a_varDecls, a_preExp) = lm_183(txt, i_statementLst, a_simCode, a_varDecls, a_preExp, a_context);
        txt = Tpl.popIter(txt);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.popBlock(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("}"));
      then (txt, a_preExp, a_varDecls);

    case ( txt,
           _,
           _,
           a_preExp,
           a_varDecls,
           _ )
      then (txt, a_preExp, a_varDecls);
  end matchcontinue;
end elseExpr;

protected function fun_185
  input Tpl.Text in_txt;
  input Boolean in_a_isArray;
  input DAE.ExpType in_a_ty;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_isArray, in_a_ty)
    local
      Tpl.Text txt;
      DAE.ExpType a_ty;

    case ( txt,
           false,
           a_ty )
      equation
        txt = expTypeShort(txt, a_ty);
      then txt;

    case ( txt,
           _,
           a_ty )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("expType_"));
        txt = expTypeArray1(txt, a_ty, 0);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("_NOT_YET"));
      then txt;
  end matchcontinue;
end fun_185;

public function expType
  input Tpl.Text txt;
  input DAE.ExpType a_ty;
  input Boolean a_isArray;

  output Tpl.Text out_txt;
algorithm
  out_txt := fun_185(txt, a_isArray, a_ty);
end expType;

public function expTypeArray1
  input Tpl.Text txt;
  input DAE.ExpType a_ty;
  input Integer a_dims;

  output Tpl.Text out_txt;
algorithm
  out_txt := Tpl.pushBlock(txt, Tpl.BT_INDENT(1));
  out_txt := Tpl.writeTok(out_txt, Tpl.ST_STRING("SimArray"));
  out_txt := Tpl.writeStr(out_txt, intString(a_dims));
  out_txt := Tpl.writeTok(out_txt, Tpl.ST_STRING("<"));
  out_txt := expTypeShort(out_txt, a_ty);
  out_txt := Tpl.writeTok(out_txt, Tpl.ST_STRING(">"));
  out_txt := Tpl.popBlock(out_txt);
end expTypeArray1;

public function functionOnlyZeroCrossing
  input Tpl.Text txt;
  input list<BackendDAE.ZeroCrossing> a_zeroCrossings;
  input SimCode.SimCode a_simCode;

  output Tpl.Text out_txt;
protected
  Tpl.Text l_zeroCrossingsCode;
  Tpl.Text l_varDecls;
algorithm
  l_varDecls := Tpl.emptyTxt;
  (l_zeroCrossingsCode, l_varDecls) := zeroCrossingsTpl2(Tpl.emptyTxt, a_zeroCrossings, l_varDecls, a_simCode);
  out_txt := Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
  out_txt := Tpl.writeText(out_txt, l_varDecls);
  out_txt := Tpl.softNewLine(out_txt);
  out_txt := Tpl.writeText(out_txt, l_zeroCrossingsCode);
  out_txt := Tpl.softNewLine(out_txt);
  out_txt := Tpl.writeTok(out_txt, Tpl.ST_NEW_LINE());
  out_txt := Tpl.popBlock(out_txt);
end functionOnlyZeroCrossing;

protected function lm_189
  input Tpl.Text in_txt;
  input list<BackendDAE.ZeroCrossing> in_items;
  input SimCode.SimCode in_a_simCode;
  input Tpl.Text in_a_varDecls;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_varDecls) :=
  matchcontinue(in_txt, in_items, in_a_simCode, in_a_varDecls)
    local
      Tpl.Text txt;
      list<BackendDAE.ZeroCrossing> rest;
      SimCode.SimCode a_simCode;
      Tpl.Text a_varDecls;
      Integer x_i0;
      DAE.Exp i_relation__;

    case ( txt,
           {},
           _,
           a_varDecls )
      then (txt, a_varDecls);

    case ( txt,
           BackendDAE.ZERO_CROSSING(relation_ = i_relation__) :: rest,
           a_simCode,
           a_varDecls )
      equation
        x_i0 = Tpl.getIteri_i0(txt);
        (txt, a_varDecls) = zeroCrossingTpl2(txt, x_i0, i_relation__, a_varDecls, a_simCode);
        txt = Tpl.nextIter(txt);
        (txt, a_varDecls) = lm_189(txt, rest, a_simCode, a_varDecls);
      then (txt, a_varDecls);

    case ( txt,
           _ :: rest,
           a_simCode,
           a_varDecls )
      equation
        (txt, a_varDecls) = lm_189(txt, rest, a_simCode, a_varDecls);
      then (txt, a_varDecls);
  end matchcontinue;
end lm_189;

public function zeroCrossingsTpl2
  input Tpl.Text txt;
  input list<BackendDAE.ZeroCrossing> a_zeroCrossings;
  input Tpl.Text a_varDecls;
  input SimCode.SimCode a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
algorithm
  out_txt := Tpl.pushIter(txt, Tpl.ITER_OPTIONS(0, NONE(), SOME(Tpl.ST_NEW_LINE()), 0, 0, Tpl.ST_NEW_LINE(), 0, Tpl.ST_NEW_LINE()));
  (out_txt, out_a_varDecls) := lm_189(out_txt, a_zeroCrossings, a_simCode, a_varDecls);
  out_txt := Tpl.popIter(out_txt);
end zeroCrossingsTpl2;

protected function fun_191
  input Tpl.Text in_txt;
  input DAE.Exp in_a_relation;
  input Tpl.Text in_a_varDecls;
  input SimCode.SimCode in_a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_varDecls) :=
  matchcontinue(in_txt, in_a_relation, in_a_varDecls, in_a_simCode)
    local
      Tpl.Text txt;
      Tpl.Text a_varDecls;
      SimCode.SimCode a_simCode;
      DAE.Exp i_exp2;
      DAE.Operator i_operator;
      DAE.Exp i_exp1;
      Tpl.Text l_res;
      Tpl.Text l_e2;
      Tpl.Text l_op;
      Tpl.Text l_e1;
      Tpl.Text l_preExp;

    case ( txt,
           DAE.RELATION(exp1 = i_exp1, operator = i_operator, exp2 = i_exp2),
           a_varDecls,
           a_simCode )
      equation
        l_preExp = Tpl.emptyTxt;
        (l_e1, l_preExp, a_varDecls) = daeExp(Tpl.emptyTxt, i_exp1, SimCode.contextOther, l_preExp, a_varDecls, a_simCode);
        l_op = zeroCrossingOpFunc(Tpl.emptyTxt, i_operator);
        (l_e2, l_preExp, a_varDecls) = daeExp(Tpl.emptyTxt, i_exp2, SimCode.contextOther, l_preExp, a_varDecls, a_simCode);
        (l_res, a_varDecls) = tempDecl(Tpl.emptyTxt, "bool", a_varDecls);
        txt = Tpl.writeText(txt, l_preExp);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeText(txt, l_res);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("=("));
        txt = Tpl.writeText(txt, l_e1);
        txt = Tpl.writeText(txt, l_op);
        txt = Tpl.writeText(txt, l_e2);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(");"));
      then (txt, a_varDecls);

    case ( txt,
           _,
           a_varDecls,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" \"\""));
      then (txt, a_varDecls);
  end matchcontinue;
end fun_191;

public function zeroCrossingTpl2
  input Tpl.Text txt;
  input Integer a_index1;
  input DAE.Exp a_relation;
  input Tpl.Text a_varDecls;
  input SimCode.SimCode a_simCode;

  output Tpl.Text out_txt;
  output Tpl.Text out_a_varDecls;
algorithm
  (out_txt, out_a_varDecls) := fun_191(txt, a_relation, a_varDecls, a_simCode);
end zeroCrossingTpl2;

public function zeroCrossingOpFunc
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
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("<"));
      then txt;

    case ( txt,
           DAE.GREATER(ty = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(">"));
      then txt;

    case ( txt,
           DAE.LESSEQ(ty = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("<="));
      then txt;

    case ( txt,
           DAE.GREATEREQ(ty = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(">="));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end zeroCrossingOpFunc;

end SimCodeCpp;