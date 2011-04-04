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
      Absyn.Path i_mi_name;

    case ( txt,
           SimCode.SIMCODE(modelInfo = SimCode.MODELINFO(name = i_mi_name)) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("SimCode: "));
        txt = SimCodeC.dotPath(txt, i_mi_name);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end dumpSimCode;

end SimCodeDump;