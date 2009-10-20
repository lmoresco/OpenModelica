package Main "main.rml"

import FCode;
import Absyn;
import TCode;

protected import Parse;
protected import Static;
protected import Flatten;
protected import FCEmit;

protected function emit
  input FCode.Prog inProg;
algorithm 
  _:=
  matchcontinue (inProg)
    local FCode.Prog fcode;
    case fcode
      equation 
        FCEmit.emit(fcode);
      then
        ();
    case fcode
      equation 
        failure(FCEmit.emit(fcode));
        print("FCEmit.emit failed\n");
      then
        fail();
  end matchcontinue;
end emit;

protected function flatten
  input TCode.Prog inProg;
algorithm 
  _:=
  matchcontinue (inProg)
    local
      FCode.Prog fcode;
      TCode.Prog tcode;
    case tcode
      equation 
        fcode = Flatten.flatten(tcode);
        emit(fcode);
      then
        ();
    case tcode
      equation 
        failure(_ = Flatten.flatten(tcode));
        print("Flatten.flatten failed\n");
      then
        fail();
  end matchcontinue;
end flatten;

protected function static
  input Absyn.Prog inProg;
algorithm 
  _:=
  matchcontinue (inProg)
    local
      TCode.Prog tcode;
      Absyn.Prog ast;
    case ast
      equation 
        tcode = Static.elaborate(ast);
        flatten(tcode);
      then
        ();
    case ast
      equation 
        failure(_ = Static.elaborate(ast));
        print("Static.elaborate failed\n");
      then
        fail();
  end matchcontinue;
end static;

public function main
  input list<String> inStringLst;
algorithm 
  _:=
  matchcontinue (inStringLst)
    local String file; Absyn.Prog ast;
    case _
      equation 
        ast = Parse.parse();
        static(ast);
      then
        ();
    case _
      equation
        print("Failed to parse program\n");
      then ();
  end matchcontinue;
end main;



end Main;

