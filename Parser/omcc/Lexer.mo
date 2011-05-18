package Lexer "Implements the DFA of OMCC"
import Types;
import LexTable;
import LexerCode;

uniontype LexerTable
  record LEXER_TABLE
    array<Integer> accept;
    array<Integer> ec;
    array<Integer> meta;
    array<Integer> base;
    array<Integer> def;
    array<Integer> nxt;
    array<Integer> chk;
    array<Integer> acclist;
  end LEXER_TABLE;
end LexerTable;

uniontype Env
  record ENV
    Integer startSt,currSt;
    Integer pos,sPos,ePos,linenr;
    list<Integer> buff;
    list<Integer> bkBuf;
    list<Integer> stateSk;
    Boolean isDebugging;
    String fileName;
  end ENV;
end Env;

function scan "Scan starts the lexical analysis, load the tables and consume the program to output the tokens"
  input String fileName "input source code file";
  input Boolean debug "flag to activate the debug mode";
  output list<OMCCTypes.Token> tokens "return list of tokens";
  
 algorithm
    // load program
   (tokens) := match(fileName,debug)
      local
         list<OMCCTypes.Token> resTokens;
         list<Integer> streamInteger;
     case (_,_)
       equation
          streamInteger = loadSourceCode(fileName);
          resTokens = lex(fileName,streamInteger,debug);
       then (resTokens);   
    end match;
end scan; 

function scanString "Scan starts the lexical analysis, load the tables and consume the program to output the tokens"
  input String fileSource "input source code file";
  input Boolean debug "flag to activate the debug mode";
  output list<OMCCTypes.Token> tokens "return list of tokens";
  
 algorithm
    // load program
   (tokens) := match(fileSource,debug)
      local
         list<OMCCTypes.Token> resTokens;
         list<Integer> streamInteger;
         list<String> chars;
     case (_,_)
       equation
          chars = stringListStringChar(fileSource);
          //streamInteger = Util.listMap(chars, stringCharInt);
          streamInteger = list(stringCharInt(c) for c in chars);
          resTokens = lex("<StringSource>",streamInteger,debug);
       then (resTokens);   
    end match;
end scanString; 

function loadSourceCode
   input String fileName "input source code file";
   output list<Integer> program;
 algorithm
   (program) := match(fileName)
     local
       list<Integer> streamInteger;
       list<String> chars;
     case ("") 
       equation
          print("Empty FileName");
         then ({}); 
     case (_)
       equation
           chars = stringListStringChar(System.readFile(fileName));
           //streamInteger = Util.listMap(chars, stringCharInt);
           streamInteger = list(stringCharInt(c) for c in chars);
         then (streamInteger);
   end match;  
end loadSourceCode;

function lex "Scan starts the lexical analysis, load the tables and consume the program to output the tokens"
  input String fileName "input source code file";
  input list<Integer> program "source code as a stream of Integers";
  input Boolean debug "flag to activate the debug mode";
  output list<OMCCTypes.Token> tokens "return list of tokens";
  Integer r,cTok;
  list<Integer> cProg;
  list<String> chars;
  array<Integer> mm_accept,mm_ec,mm_meta,mm_base,mm_def,mm_nxt,mm_chk,mm_acclist; 
  Env env;
  LexerTable lexTables;
algorithm
  // load arrays
  
  mm_accept := listArray(LexTable.yy_accept); 
  mm_ec := listArray(LexTable.yy_ec); 
  mm_meta := listArray(LexTable.yy_meta); 
  mm_base := listArray(LexTable.yy_base); 
  mm_def := listArray(LexTable.yy_def); 
  mm_nxt := listArray(LexTable.yy_nxt); 
  mm_chk := listArray(LexTable.yy_chk); 
  mm_acclist := listArray(LexTable.yy_acclist);
  lexTables := LEXER_TABLE(mm_accept,mm_ec,mm_meta,mm_base,mm_def,mm_nxt,mm_chk,mm_acclist);
  
  // Initialize the Env Variables
  env := ENV(1,1,1,0,1,1,{},{},{1},debug,fileName);
  if (debug==true) then
     print("\nLexer analyzer LexerCode..." + fileName + "\n");
     //printAny("\nLexer analyzer LexerCode..." + fileName + "\n");
  end if;
  
  tokens := {};
  if (debug) then
	  print("\n TOTAL Chars:");
		print(intString(listLength(program)));   
	end if;
  while (Util.isListEmpty(program)==false) loop
	   if (debug) then 
	     print("\nChars remaining:");
	     print(intString(listLength(program)));   
     end if;
     cTok::program := program;
     cProg := {cTok};
     (tokens,env,cProg) := consume(env,cProg,lexTables,tokens);
     if (Util.isListEmpty(cProg)==false) then
        cTok::cProg := cProg;
        program := cTok::program; 
     end if; 
  end while;
  tokens := listReverse(tokens);
end lex;   

function consume
  input Env env;
  input list<Integer> program;
  input LexerTable lexTables;
  input list<OMCCTypes.Token> tokens;
  output list<OMCCTypes.Token> resToken;
  output Env env2;
  output list<Integer> program2;
  array<Integer> mm_accept,mm_ec,mm_meta,mm_base,mm_def,mm_nxt,mm_chk,mm_acclist; 
  Integer mm_startSt,mm_currSt,mm_pos,mm_sPos,mm_ePos,mm_linenr;
  list<Integer> buffer,bkBuffer,states;
  String fileNm;
  Integer c,cp,mm_finish,baseCond;
  Boolean debug;
algorithm
  LEXER_TABLE(accept=mm_accept,ec=mm_ec,meta=mm_meta,base=mm_base,
    def=mm_def,nxt=mm_nxt,chk=mm_chk,acclist=mm_acclist) := lexTables;
  
  ENV(startSt=mm_startSt,currSt=mm_currSt,pos=mm_pos,sPos=mm_sPos,ePos=mm_ePos,
    linenr=mm_linenr, buff=buffer,bkBuf=bkBuffer,stateSk=states,isDebugging=debug,fileName=fileNm) := env;
   
  mm_finish := LexTable.yy_finish;
  baseCond := mm_base[mm_currSt];
  if (debug==true) then
    print("\nPROGRAM:{" + printBuffer(program,"") + "} ");
    print("\nBUFFER:{" + printBuffer(buffer,"") + "} ");
    print("\nBKBUFFER:{" + printBuffer(bkBuffer,"") + "} ");
    print("\nSTATE STACK:{" + printStack(states,"") + "} ");
    print("base:" + intString(baseCond) + " st:" + intString(mm_currSt)+" ");
  end if;
  (resToken,program2) := match (program,tokens)
    local 
      Integer c,d,act,val,c2,curr2,fchar;
      list<Integer> rest;
      list<OMCCTypes.Token> lToken;
      String sToken;
      Boolean emptyToken;
      Option<OMCCTypes.Token> otok;
    case (_,_) // loop tokens
      equation
        cp::rest = program;
        buffer = cp::buffer;
        
        mm_pos = mm_pos+1;
        
        if (cp==10) then
            mm_linenr = mm_linenr+1;
            mm_ePos = mm_sPos;
            mm_sPos = 0;
        else
            mm_sPos = mm_sPos+1;
        end if;
        if (debug==true) then
         print("\n[Reading:'"  + intStringChar(cp) +"' at p:" + intString(mm_pos-1) 
             + " line:"+ intString(mm_linenr) + " rPos:" + intString(mm_sPos) +"]");
        end if;
        c = mm_ec[cp];
        
        c2 = c;
        curr2 = mm_currSt;
        if (debug==true) then
          print(" evalState Before[c" + intString(c2) + ",s"+ intString(curr2)+"]");
        end if;  
        (mm_currSt,c) = evalState(lexTables,curr2,c2);
        if (debug==true) then
          print(" After[c" + intString(c) + ",s"+ intString(mm_currSt)+"]");
        end if;  
        if (mm_currSt>0) then
          curr2 = mm_base[mm_currSt];
          // print("BASE:"+ intString(curr2)+"]");
          mm_currSt = mm_nxt[curr2 + c];
          // print("NEXT:"+ intString(mm_currSt)+"]");
          else
            mm_currSt = mm_nxt[c];   
        end if;
          states = mm_currSt::states;
          // printAny(states);
          //  print("[c" + intString(c) + ",s"+ intString(mm_currSt)+"]");
          //  print("[B:" + intString(mm_base[mm_currSt])+"]");
          env2 = ENV(mm_startSt,mm_currSt,mm_pos,mm_sPos,mm_ePos,mm_linenr,buffer,rest,states,debug,fileNm);
          lToken = tokens;
          
          
          baseCond = mm_base[mm_currSt];
          if (baseCond==mm_finish) then
             if (debug==true) then
		          print("\n[RESTORE=" + intString(mm_accept[mm_currSt]) + "]");
		        end if;  
		        (env2,act) = findRule(lexTables,env2);
		        
		       
		        
		        (otok,env2) = LexerCode.action(act,env2);
		        
		        // read the env
		        ENV(startSt=mm_startSt,currSt=mm_currSt,pos=mm_pos,sPos=mm_sPos,ePos=mm_ePos,
		          linenr=mm_linenr,  buff=buffer,bkBuf=bkBuffer,stateSk=states,isDebugging=debug,fileName=fileNm) = env2;
		     
		        //restore the program
		        program2 = bkBuffer;
		        //restart current state
		        env2 = ENV(mm_startSt,mm_startSt,mm_pos,mm_sPos,mm_pos,mm_linenr,buffer,{},{mm_startSt},debug,fileNm);
		        lToken = Util.listConsOption(otok,tokens);
		        if(debug) then
		          print("\n CountTokens:" + intString(listLength(lToken)));
		        end if;
		      else
		         program2 = rest; // consume the character  
          end if;
          
        then (lToken,program2);
          
  end match;
  
end consume;



function findRule
  input LexerTable lexTables;
  input Env env;
  output Env env2;
  output Integer action;
  array<Integer> mm_accept,mm_ec,mm_meta,mm_base,mm_def,mm_nxt,mm_chk,mm_acclist;
  Integer mm_startSt,mm_currSt,mm_pos,mm_sPos,mm_ePos,mm_linenr;
  list<Integer> buffer,bkBuffer,states;
  String fileNm;
  Integer lp,lp1,stCmp;
  Boolean st,debug;
algorithm
  LEXER_TABLE(accept=mm_accept,ec=mm_ec,meta=mm_meta,base=mm_base,
    def=mm_def,nxt=mm_nxt,chk=mm_chk,acclist=mm_acclist) := lexTables;
  ENV(startSt=mm_startSt,currSt=mm_currSt,pos=mm_pos,sPos=mm_sPos,ePos=mm_ePos,
    linenr=mm_linenr,  buff=buffer,bkBuf=bkBuffer,stateSk=states,isDebugging=debug,fileName=fileNm) := env;
  
  stCmp::_ := states; 
  lp := mm_accept[stCmp];   
  
  // stCmp::_ := states;  
  lp1 := mm_accept[stCmp+1];
  
  st := intGt(lp,0) and intLt(lp,lp1);
  //  print("STATE:[" + intString(mm_currSt)+ " pos:" + intString(mm_pos) + "]");
  // printAny(st);       
  (env2,action) := match(states,st)
    local
      Integer act,cp;
      list<Integer> restBuff,restStates;
    case ({},_)
      equation
        
        act = mm_acclist[lp];
        print("\nERROR:EMPTY STATE STACK");
      then (env,act);
    case (_,true)
      equation
        stCmp::_ = states;  
        lp = mm_accept[stCmp]; 
        act = mm_acclist[lp];
      then (env,act);
    case (_,false)  
      equation    
        
        cp::restBuff = buffer;
        
        bkBuffer = cp::bkBuffer;
        mm_pos = mm_pos - 1;
        mm_sPos = mm_sPos -1;
        if (cp==10) then
            mm_sPos = mm_ePos;
            mm_linenr = mm_linenr-1;
        end if;
        //bkBuffer = cp::bkBuffer;
        mm_currSt::restStates = states;
        //  printAny(restStates);
        //    print("Restore STATE:[" + intString(mm_currSt)+ " pos:" + intString(mm_pos) + "]");
        env2 = ENV(mm_startSt,mm_currSt,mm_pos,mm_sPos,mm_ePos,mm_linenr,restBuff,bkBuffer,restStates,debug,fileNm);
        (env2,act) = findRule(lexTables,env2);
      then (env2,act);
        
  end match;
end findRule;

function evalState
  input LexerTable lexTables;
  input Integer cState;
  input Integer c;
  output Integer new_state;
  output Integer new_c;
  array<Integer> mm_accept,mm_ec,mm_meta,mm_base,mm_def,mm_nxt,mm_chk,mm_acclist;  
  Integer val,val2,chk;
algorithm
  LEXER_TABLE(accept=mm_accept,ec=mm_ec,meta=mm_meta,base=mm_base,
    def=mm_def,nxt=mm_nxt,chk=mm_chk,acclist=mm_acclist) := lexTables;
  chk := mm_base[cState];
  chk := chk + c;
  val := mm_chk[chk];
  val2 := mm_base[cState] + c;
  //   print("{val2=" + intString(val2) + "}\n");
  (new_state,new_c) := match (cState==val)
    local
      Integer s,c2;
    case (true)
       then (cState,c);
    case (false)
      equation
        cState = mm_def[cState];
        //print("[newS:" + intString(cState)+"]");
        //c2 = c;
        if ( cState >= LexTable.yy_limit ) then
          c = mm_meta[c];
          //     print("META[c:" + intString(c)+"]");
        end if;
          if (cState>0) then
            (cState,c) = evalState(lexTables,cState,c);
          end if;  
          then (cState,c);
  end match;
  
end evalState;

function getInfo
  input list<Integer> buff;
  input Integer frPos;
  input Integer flineNr;
  input String programName;
  output OMCCTypes.Info info;
  Integer mm_linenr,mm_sPos;
  Integer c;
algorithm
  mm_sPos := frPos;
  mm_linenr := flineNr;
  while (Util.isListEmpty(buff)==false) loop
      c::buff := buff;
      if (c==10) then
          mm_linenr := mm_linenr - 1;
          mm_sPos := 0;
      else
          mm_sPos := mm_sPos - 1;
      end if;
  end while;
  info := OMCCTypes.INFO(programName,false,mm_linenr,mm_sPos+1,flineNr,frPos+1,OMCCTypes.getTimeStamp());
  /*if (true) then
     print("\nTOKEN file:" +programName + " p(" + intString(mm_sPos) + ":" + intString(mm_linenr) + ")-(" + intString(frPos) + ":" + intString(flineNr) + ")");
  end if; */
end getInfo;

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

function printStack
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
           new = cBuff + "|" + intString(c);
           (tout) = printStack(rest,new);
        then (tout);
     end match;     
  end printStack;
  
  

end Lexer;  