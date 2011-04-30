package Types
import Absyn;

uniontype Token
  record TOKEN
    String name;
    Integer id;
    list<Integer> value;
    Info loc;
  end TOKEN; 
 
end Token;
  
uniontype Info
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
    //TimeStamp buildTimes "Build and edit times";
  end INFO;

end Info;

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
  
  strTk := "[TOKEN:" + tokName + " '" +  printBuffer(val,"") + "' from (line:" + intString(lns) + " col:" + intString(cns) + ") to (line:"+ intString(lne) + " col:" + intString(cne) +")]";
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
  strTk := fileNm + ":" + intString(lns) + ":" + intString(cns) + ":Syntax ERROR near '" +  printBuffer(val,"") + "'";
end printErrorToken;

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
   algorithm 
    (outList) := matchcontinue(inList,cBuff)
      local
        Token c;
        String new,tout;
        list<Token> rest;
      case ({},_) 
        then (cBuff);
      else
        equation
           c::rest = inList;
           new = cBuff + printShortToken2(c);
           (tout) = printTokens(rest,new);
        then (tout);
     end matchcontinue;     
  end printTokens; 
  
function printBuffer
  input list<Integer> inList;
  input String cBuff;
  output String outList;
  list<Integer> inList2;
algorithm 
  (outList) := matchcontinue(inList,cBuff)
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
  end matchcontinue;     
end printBuffer; 
 
end Types;