package OMCCTypes
import Absyn;
import INFO = Absyn.INFO;

uniontype Token
  record TOKEN
    String name;
    Integer id;
    list<Integer> value;
    Info loc;
  end TOKEN; 
 
end Token;

type Info = Absyn.Info;
  
/*uniontype Info
"@author adrpo
 added 2005-10-29, changed 2006-02-05
 The Info attribute provides location information for elements and classes."
  
  record INFO
    String fileName "fileName where the class is defined in" ;
    Boolean isReadOnly "isReadOnly : (true|false). Should be true for libraries" ;
    Integer lineNumberStart "lineNumberStart" ;
    Integer columnNumberStart "columnNumberStart" ;
    Integer lineNumberEnd "lineNumberEnd" ;
    Integer columnNumberEnd "columnNumberEnd" ;
    Absyn.TimeStamp buildTimes "Build and edit times";
  end INFO;

end Info; */

function getTimeStamp
   output Absyn.TimeStamp timeStamp;
 algorithm
    timeStamp := Absyn.dummyTimeStamp;
end getTimeStamp;

function printToken
  input Token token;
  output String strTk;
  String tokName;
  Integer idtk,lns,cns,lne,cne;
  list<Integer> val;
  Info info;
 algorithm
  TOKEN(name=tokName,id=idtk,value=val,loc=info) := token;
  INFO(lineNumberStart=lns,columnNumberStart=cns,lineNumberEnd=lne,columnNumberEnd=cne) := info;
  
  strTk := "[TOKEN:" + tokName + " '" +  printBuffer(val,"") + "' (" + intString(lns) + ":" + intString(cns) + "-"+ intString(lne) + ":" + intString(cne) +")]";
end printToken;

function getMergeTokenValue
  input Token token1;
  input Token token2;
  output list<Integer> value;
  list<Integer> val1;
  list<Integer> val2;
 algorithm
   TOKEN(value=val1) := token1;
   TOKEN(value=val2) := token2;
   value := listAppend(val1,val2);
end getMergeTokenValue;  

function printErrorToken
  input Token token;
  output String strTk;
  String tokName,fileNm;
  Integer idtk,lns,cns,lne,cne;
  list<Integer> val;
  Info info;
 algorithm
  TOKEN(name=tokName,id=idtk,value=val,loc=info) := token;
  INFO(fileName=fileNm,lineNumberStart=lns,columnNumberStart=cns,lineNumberEnd=lne,columnNumberEnd=cne) := info;
  
  //strTk := fileNm + ":" + intString(lns) + ":" + intString(cns) + ":Syntax ERROR near token:[" + tokName + " '" +  printBuffer(val,"") + "']";
  //strTk := fileNm + ":" + intString(lns) + ":" + intString(cns) + ":Syntax ERROR near '" +  printBuffer(val,"") + "'";
   strTk := "'" +  printBuffer(val,"") + "'";
end printErrorToken;

function printInfoError
  input Info info;
  output String strTk;
  String tokName,fileNm;
  Integer idtk,lns,cns,lne,cne;
  list<Integer> val;
 algorithm
  INFO(fileName=fileNm,lineNumberStart=lns,columnNumberStart=cns,lineNumberEnd=lne,columnNumberEnd=cne) := info;
  //strTk := fileNm + ":" + intString(lns) + ":" + intString(cns) + ":Syntax ERROR near token:[" + tokName + " '" +  printBuffer(val,"") + "']";
  strTk := fileNm + ":" + intString(lns) + ":" + intString(cns) ;
end printInfoError;

function printShortToken
  input Token token;
  output String strTk;
  String tokName;
  Integer idtk,lns,cns,lne,cne;
  list<Integer> val;
  Info info;
 algorithm
  TOKEN(name=tokName,id=idtk,value=val,loc=info) := token;
  INFO(lineNumberStart=lns,columnNumberStart=cns,lineNumberEnd=lne,columnNumberEnd=cne) := info;
  
  //strTk := "[" + tokName + " '" +  printBuffer(val,"") +"']";
  strTk := "'" +  printBuffer(val,"") +"'";
end printShortToken;

function printShortToken2
  input Token token;
  output String strTk;
  String tokName;
  Integer idtk,lns,cns,lne,cne;
  list<Integer> val;
  Info info;
 algorithm
  TOKEN(name=tokName,id=idtk,value=val,loc=info) := token;
  INFO(lineNumberStart=lns,columnNumberStart=cns,lineNumberEnd=lne,columnNumberEnd=cne) := info;
  
  strTk := "[" + tokName + " '" +  printBuffer(val,"") +"']";
  //strTk := "'" +  printBuffer(val,"") +"'";
end printShortToken2;

function printTokens
    input list<Token> inList;
    input String cBuff;
    output String outList;
    list<Token> inList2;
    Token c;
   algorithm 
     outList := "";
     while (Util.isListEmpty(inList)==false) loop
       c::inList := inList;
       outList := outList + printToken(c);
     end while; 
  end printTokens; 
  
 function countTokens
    input list<Token> inList;
    input Integer sValue;
    output Integer outTotal;
    list<Token> inList2;
   algorithm 
     //printAny("\nhere1");
    (outTotal) := match(inList,sValue)
      local
        Token c;
        Integer new,tout;
        list<Token> rest;
      case ({},_) 
        then (sValue+1);
      else
        equation
           //printAny("\nhere2");
           c::rest = inList;
           //printAny("\nhere3");
           new = sValue + 1;
           (tout) = countTokens(rest,new);
        then (tout);
     end match;     
     //printAny("\nhere4");
  end countTokens;  
  
function printBuffer
  input list<Integer> inList;
  input String cBuff;
  output String outList;
  list<Integer> inList2;
algorithm 
  (outList) := match(inList,cBuff)
    local
      Integer c;
      String new,tout;
      list<Integer> rest;
    case ({},_) 
    then (cBuff);
      else
      equation
        c::rest = inList;
        new = cBuff + intStringChar(c);
        (tout) = printBuffer(rest,new);
      then (tout);
  end match;     
end printBuffer; 
 
end OMCCTypes;
