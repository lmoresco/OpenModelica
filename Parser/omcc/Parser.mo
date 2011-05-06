package Parser
import Types;
import ParseTable;
import ParseCode;
import Absyn;
import Error;
uniontype Env
  record ENV
    Types.Token crTk,lookAhTk;
    list<Integer> state;
    list<String> errMessages;
    Integer errStatus,sState,cState;
    list<Types.Token> program,progBk;
    ParseCode.AstStack astStack;
    Boolean isDebugging;
    list<Integer> stateBackup;
    ParseCode.AstStack astStackBackup;
  end ENV;
end Env;

uniontype ParseData
  record PARSE_TABLE
    array<Integer> translate;
    array<Integer> prhs;
    array<Integer> rhs;
    array<Integer> rline;
    array<String> tname;
    array<Integer> toknum;
    array<Integer> r1;
    array<Integer> r2;
    array<Integer> defact;
    array<Integer> defgoto;
    array<Integer> pact;
    array<Integer> pgoto;
    array<Integer> table;
    array<Integer> check;
    array<Integer> stos; // to be replaced
  end PARSE_TABLE;
end ParseData;

 /* when the error is positive the parser runs in recovery mode, 
    if the error is negative, the parser runs in testing candidate mode
    if the error is cero, then no error is present or has been recovered 
    The error value decreases with each shifted token */
constant Integer maxErrShiftToken = 3;
constant Integer maxErrRecShift = -5;

constant Integer ERR_TYPE_DELETE = 1;
constant Integer ERR_TYPE_INSERT = 2;
constant Integer ERR_TYPE_REPLACE = 3;
constant Integer ERR_TYPE_INSEND = 4;
constant Integer ERR_TYPE_MERGE = 5;

type AstTree = ParseCode.AstTree;

function parse "realize the syntax analysis over the list of tokens and generates the AST tree"
  input list<Types.Token> tokens "list of tokens from the lexer";
  input String fileName "file name of the source code";
  input Boolean debug "flag to output debug messages that explain the states of the machine while parsing";
  output Boolean result "result of the parsing";
  output ParseCode.AstTree ast "AST tree that is returned when the result output is true";
  array<String> mm_tname;
  array<Integer> mm_translate, mm_prhs, mm_rhs, mm_rline, mm_toknum, mm_r1, mm_r2, mm_defact, mm_defgoto,
                 mm_pact, mm_pgoto, mm_table, mm_check, mm_stos;
  ParseData pt;
  Env env;
  Types.Token emptyTok;
  ParseCode.AstStack astStk;
  list<Types.Token> rToks;
  list<Integer> stateStk;
  list<String> errStk;
  //Boolean result;
algorithm
   if (debug) then
      print("\nParsing tokens ParseCode ..." + fileName + "\n");
   end if;   
   mm_translate := listArray(ParseTable.yytranslate); 
   mm_prhs := listArray(ParseTable.yyprhs); 
   mm_rhs := listArray(ParseTable.yyrhs); 
   mm_rline := listArray(ParseTable.yyrline); 
   mm_tname := listArray(ParseTable.yytname); 
   mm_toknum := listArray(ParseTable.yytoknum); 
   mm_r1 := listArray(ParseTable.yyr1); 
   mm_r2 := listArray(ParseTable.yyr2); 
   mm_defact := listArray(ParseTable.yydefact); 
   mm_defgoto := listArray(ParseTable.yydefgoto); 
   mm_pact := listArray(ParseTable.yypact); 
   mm_pgoto := listArray(ParseTable.yypgoto); 
   mm_table := listArray(ParseTable.yytable); 
   mm_check := listArray(ParseTable.yycheck); 
   mm_stos := listArray(ParseTable.yystos); 
   
   pt := PARSE_TABLE(mm_translate,mm_prhs,mm_rhs,mm_rline,mm_tname,mm_toknum,mm_r1,mm_r2
       ,mm_defact,mm_defgoto,mm_pact,mm_pgoto,mm_table,mm_check,mm_stos);
   stateStk := {0}; 
   errStk := {};   
   astStk := ParseCode.initAstStack(astStk);
   env := ENV(emptyTok,emptyTok,stateStk,errStk,0,0,0,tokens,{},astStk,debug,stateStk,astStk);   
  
   (rToks,result,ast) := processToken(tokens,env,pt);
    if (debug) then
       printAny(ast);   
    end if;
    
    if (result==true) then
       print("\n SUCCEED - (AST)");
    else
       print("\n FAILED PARSING");
    end if;   
end parse;

function addSourceMessage
  input list<String> errStk;
  input Types.Info info;
algorithm
    //Error.addSourceMessage(1,errStk,info);
    //print(printSemStack(listReverse(errStk),""));
end addSourceMessage;

function printErrorMessages
  input list<String> errStk;
algorithm
    print("\n ***ERROR(S) FOUND*** ");
    print(printSemStack(listReverse(errStk),""));
end printErrorMessages;

function processToken
  input list<Types.Token> tokens;
  input Env env;
  input ParseData pt;
  output list<Types.Token> rTokens;
  output Boolean result;
  output ParseCode.AstTree ast;
  list<Types.Token> tempTokens;
  // parse tables
  array<String> mm_tname;
  array<Integer> mm_translate, mm_prhs, mm_rhs, mm_rline, mm_toknum, mm_r1, mm_r2, mm_defact, mm_defgoto,
                 mm_pact, mm_pgoto, mm_table, mm_check, mm_stos;
  // env variables               
  Types.Token cTok,nTk;
  ParseCode.AstStack astStk,astSkBk;
  Boolean debug;
  list<Integer> stateStk,stateSkBk;
  list<String> errStk;
  String astTmp;
  Integer sSt,cSt,lSt,errSt,cFinal,cPactNinf,cTableNinf;
  list<Types.Token> prog,prgBk;               
 algorithm
   PARSE_TABLE(translate=mm_translate,prhs=mm_prhs,rhs=mm_rhs,rline=mm_rline,tname=mm_tname,toknum=mm_toknum,r1=mm_r1,r2=mm_r2
       ,defact=mm_defact,defgoto=mm_defgoto,pact=mm_pact,pgoto=mm_pgoto,table=mm_table,check=mm_check,stos=mm_stos) := pt;
   
   ENV(crTk=cTok,lookAhTk=nTk,state=stateStk,errMessages=errStk,errStatus=errSt,
     sState=sSt,cState=cSt,program=prog,progBk=prgBk,astStack=astStk,isDebugging=debug,stateBackup=stateSkBk,astStackBackup=astSkBk):= env;
   if (debug) then
     print("\n[State:" + intString(cSt) +"]{" + printStack(stateStk,"") + "}\n");
   end if;  
    // Start the LALR(1) Parsing
   cFinal := ParseTable.YYFINAL;
   cPactNinf := ParseTable.YYPACT_NINF;
   cTableNinf := ParseTable.YYTABLE_NINF;
   prog := tokens;
   // cFinal==cSt is a final state? then ACCEPT
   // mm_pact[cSt]==cPactNinf if this REDUCE or ERROR
   result := true;
   (rTokens,result) := matchcontinue(tokens,env,pt,cFinal==cSt,mm_pact[cSt+1]==cPactNinf)
      local 
        list<Types.Token> rest;
        list<Integer> vl;
        Types.Token c,nt;
        Env env2;
        Integer n,len,val,tok,tmTok,chkVal;
        String nm,semVal;
        Absyn.Ident idVal;
     case ({},_,_,false,false)
        equation
          if (debug) then
            print("\nNow at end of input:\n");
          end if;
           n = mm_pact[cSt+1];
           rest = {};
         if (debug) then  
          print("[n:" + intString(n) + "]");
         end if; 
         if (n < 0 or ParseTable.YYLAST < n or mm_check[n+1] <> 0) then
           //goto yydefault;
           n = mm_defact[cSt+1];
           if (n==0) then
             // Error Handler
             if (debug) then
                print("\n Syntax Error found yyerrlab5:" + intString(errSt));
                //printAny("\n Syntax Error found yyerrlab5:" + intString(errSt));
             end if;
             if (errSt>=0) then
	             (env2,semVal,result) = errorHandler(cTok,env,pt);
			         ENV(crTk=cTok,lookAhTk=nTk,state=stateStk,errMessages=errStk,errStatus=errSt,sState=sSt,cState=cSt,program=prog,progBk=prgBk,astStack=astStk,isDebugging=debug,stateBackup=stateSkBk,astStackBackup=astSkBk)= env2;
             else
		            result=false;
		         end if;		         
           end if;
             if (debug) then
               print(" REDUCE4");
             end if;  
             env2=reduce(n,env,pt);
             ENV(crTk=cTok,lookAhTk=nTk,state=stateStk,errMessages=errStk,errStatus=errSt,sState=sSt,cState=cSt,
               program=prog,progBk=prgBk,astStack=astStk,isDebugging=debug,stateBackup=stateSkBk,astStackBackup=astSkBk)= env2;
             
         else  
	         n = mm_table[n+1];
	         if (n<=0) then
	           if (n==0 or n==cTableNinf) then
	             // Error Handler
	             if (debug) then
	                print("\n Syntax Error found yyerrlab4:" + intString(n));
	             end if;
	             if (errSt>=0) then  
	                (env2,semVal,result) = errorHandler(cTok,env,pt);
	             else
	                result = false;
	             end if;   
			         ENV(crTk=cTok,lookAhTk=nTk,state=stateStk,errMessages=errStk,errStatus=errSt,sState=sSt,cState=cSt,program=prog,progBk=prgBk,astStack=astStk,isDebugging=debug,stateBackup=stateSkBk,astStackBackup=astSkBk)= env2;
	           end if;
	             n = -n;
	             if (debug) then
	               print(" REDUCE5");
	             end if;  
	             env2=reduce(n,env,pt);
	             ENV(crTk=cTok,lookAhTk=nTk,state=stateStk,errMessages=errStk,errStatus=errSt,sState=sSt,cState=cSt,program=prog,progBk=prgBk,astStack=astStk,isDebugging=debug,stateBackup=stateSkBk,astStackBackup=astSkBk)= env2;
            
	         else
	           if (debug) then
	             print(" SHIFT");
	           end if;
	           if (errSt<0) then // reduce the shift error lookup
	             if (debug) then
	               print("\n***-RECOVERY TOKEN INSERTED IS SHIFTED-***");
	             end if;  
	              errSt = maxErrRecShift;
	           end if;  
	           cSt = n;
	           stateStk = cSt::stateStk;
	           env2 = ENV(c,nt,stateStk,errStk,errSt,sSt,cSt,rest,rest,astStk,debug,stateSkBk,astSkBk);
            
	         end if;
         end if; 
         if (result==true and errSt>maxErrRecShift) then //stops when it finds and error                 
            if (debug) then 
              print("\nReprocesing at the END");
            end if;  
            (rest,result,ast) = processToken(rest,env2,pt);
         end if;   
           
        then ({},result);
     case (_,_,_,true,_) 
       equation
         if (debug) then
            print("\n\n***************-ACCEPTED-***************\n");
         end if;   
         result = true;
         if (Util.isListEmpty(errStk)==false) then
           printErrorMessages(errStk);
           result = false;
         end if;
         ast = ParseCode.getAST(astStk); 
         then ({},result);
     case (_,_,_,false,true)
       equation      
          n = mm_defact[cSt+1];
				  if (n == 0) then
				    // Error Handler
             if (debug) then
                print("\n Syntax Error found yyerrlab3:" + intString(n));
             end if;  
             if (errSt>=0) then  
	                (env2,semVal,result) = errorHandler(cTok,env,pt);
	                ENV(crTk=cTok,lookAhTk=nTk,state=stateStk,errMessages=errStk,errStatus=errSt,sState=sSt,cState=cSt,program=prog,progBk=prgBk,astStack=astStk,isDebugging=debug,stateBackup=stateSkBk,astStackBackup=astSkBk)= env2;
	             else
	                result = false;
	             end if; 		         
				  end if;
				   // reduce; 
				   if (debug) then
				      print("REDUCE3");
				   end if;   
				   
				   env2=reduce(n,env,pt);
				   
				   if (result==true) then //stops when it finds and error             
              (rest,result,ast) = processToken(tokens,env2,pt);
           end if;
         
      then (rest,result);    
     case (_,_,_,false,false)
       equation
          /* Do appropriate processing given the current state.  Read a
            lookahead token if we need one and don't already have one.  */
          c::rest = tokens;
          cTok = c;
          Types.TOKEN(id=tmTok,name=nm,value=vl) = c;
          semVal = printBuffer(vl,"");
          if (debug) then
             print("[" + nm + ",'" + semVal +"']");
          end if;   
          
          tok = translate(tmTok,pt);
          
          /* First try to decide what to do without reference to lookahead token.  */
          
          n = mm_pact[cSt+1];
          if (debug) then
             print("[n:" + intString(n) + "-");
          end if;   

			    n = n + tok;
			    if (debug) then
			       print("NT:" + intString(n) + "]");
			    end if;
			    chkVal = n+1;
			    if (chkVal<=0) then
			       chkVal = 1;
			    end if;   
         if (n < 0 or ParseTable.YYLAST < n or mm_check[chkVal] <> tok) then
           //goto yydefault;
           n = mm_defact[cSt+1];
           if (n==0) then
	             // Error Handler
	             if (debug) then
	                print("\n Syntax Error found yyerrlab2:" + intString(n));
	             end if; 
	             if (errSt>=0) then  
	                (env2,semVal,result) = errorHandler(cTok,env,pt);
	                ENV(crTk=cTok,lookAhTk=nTk,state=stateStk,errMessages=errStk,errStatus=errSt,sState=sSt,cState=cSt,program=prog,progBk=prgBk,astStack=astStk,isDebugging=debug,stateBackup=stateSkBk,astStackBackup=astSkBk)= env2;
	             else
	                errSt = maxErrRecShift;
	                result = false;
	             end if;			           
           else
	             if (debug) then 
	                print(" REDUCE2");
	             end if;
	             env2=reduce(n,env,pt);
	             ENV(crTk=cTok,lookAhTk=nTk,state=stateStk,errMessages=errStk,errStatus=errSt,sState=sSt,cState=cSt,program=prog,progBk=prgBk,astStack=astStk,isDebugging=debug,stateBackup=stateSkBk,astStackBackup=astSkBk)= env2;
	             rest = tokens;
           end if; 
         else  
           // try to get the value for the action in the table array
	         n = mm_table[n+1];
	         if (n<=0) then
	           // 
	           if (n==0 or n==cTableNinf) then
	             // Error Handler
	             if (debug) then
		             print("\n Syntax Error found yyerrlab:" + intString(n));
		           end if;
		           if (errSt>=0) then  
	                (env2,semVal,result) = errorHandler(cTok,env,pt);
	                ENV(crTk=cTok,lookAhTk=nTk,state=stateStk,errMessages=errStk,errStatus=errSt,sState=sSt,cState=cSt,program=prog,progBk=prgBk,astStack=astStk,isDebugging=debug,stateBackup=stateSkBk,astStackBackup=astSkBk)= env2;
	             else
	                result = false;
	                errSt = maxErrRecShift;
	             end if; 		             
		         else
	             n = -n;
	             if (debug) then
	                 print(" REDUCE");
	             end if;    
	             env2=reduce(n,env,pt);
	             rest = tokens;
	           end if;  
	         else
	           if (debug) then
	              print(" SHIFT1");
	           end if;   
	           cSt = n;
	           stateStk = cSt::stateStk;
	           idVal = semVal;
	           (astStk) = ParseCode.push(astStk,idVal,cTok);
	           astSkBk = astStk;
	           stateSkBk = stateStk;
	           if (errSt<>0) then // reduce the shift error lookup
	              errSt = errSt - 1;
	           end if;
	           env2 = ENV(c,nt,stateStk,errStk,errSt,sSt,cSt,rest,rest,astStk,debug,stateSkBk,astSkBk);     
	         end if;
         end if;
         if ((result==true) and (errSt>maxErrRecShift)) then //stops when it finds and error             
           (rest,result,ast) = processToken(rest,env2,pt);
         end if;
         
     then (rest,result);
    end matchcontinue;
   // return the AST  
    
end processToken;

function errorHandler
  input Types.Token currTok;
  input Env env;
  input ParseData pt;
  output Env env2;
  output String errorMsg;
  output Boolean result;
  // env variables
  Types.Token cTok,nTk;
  ParseCode.AstStack astStk,astSkBk;
  Boolean debug;
  Integer sSt,cSt,errSt;
  list<Types.Token> prog,prgBk; 
  list<Integer> stateStk,stateSkBk;
  list<String> errStk;
   // parse tables
  array<String> mm_tname;
  array<Integer> mm_translate, mm_prhs, mm_rhs, mm_rline, mm_toknum, mm_r1, mm_r2, mm_defact, mm_defgoto,
                 mm_pact, mm_pgoto, mm_table, mm_check, mm_stos;
 
  list<String> redStk;
  Integer numTokens;
  String msg,semVal;
  
algorithm
   PARSE_TABLE(translate=mm_translate,prhs=mm_prhs,rhs=mm_rhs,rline=mm_rline,tname=mm_tname,toknum=mm_toknum,r1=mm_r1,r2=mm_r2
       ,defact=mm_defact,defgoto=mm_defgoto,pact=mm_pact,pgoto=mm_pgoto,table=mm_table,check=mm_check,stos=mm_stos) := pt;
  
  ENV(crTk=cTok,lookAhTk=nTk,state=stateStk,sState=sSt,errMessages=errStk,errStatus=errSt,cState=cSt,
        program=prog,progBk=prgBk,astStack=astStk,isDebugging=debug,stateBackup=stateSkBk,astStackBackup=astSkBk):= env;
  
  if (debug) then
	   print("\nERROR RECOVERY INITIATED:");
	   print("\n[State:" + intString(cSt) +"]{" + printStack(stateStk,"") + "}\n");
	   print("\n[StateStack Backup:{" + printStack(stateSkBk,"") + "}\n");
  end if;
  semVal := Types.printToken(currTok);
  (errorMsg,result) := matchcontinue(errSt==0,prog)
    local
       String erMsg,name;
       list<String> candidates;
       list<Types.Token> rest;
       Integer i,idTok;
       Types.Info info;
    case (true,{}) //start error catching
      equation  
         erMsg = Types.printErrorToken(currTok); 
         // insert token
         if (debug) then
            print("\n Checking INSERT at the END token:");
            //printAny("\n Checking INSERT at the END token:");
         end if;
         candidates = {};
         candidates = checkCandidates(candidates,env,pt,3);
         if (Util.isListEmpty(candidates)==false) then
             erMsg = erMsg + ", INSERT at the End token " + printCandidateTokens(candidates,"") ;
         end if;
         errStk = erMsg::errStk;
         
         Types.TOKEN(loc=info) = currTok;
         addSourceMessage(errStk,info);
         
         printErrorMessages(errStk);
         errSt = maxErrShiftToken;
      then (erMsg,false); //end error catching    
    case (true,_) //start error catching
      equation
         
         //Types.TOKEN(id=idTok) = currTok;
         erMsg = Types.printErrorToken(currTok);
         
        if (debug) then
            print("\n Check MERGE token until next token");
         end if;
         nTk::_ = prog;
         Types.TOKEN(id=idTok) = nTk;
         if (checkToken(idTok,env,pt,5)==true) then
            _::nTk::_ = prog;
            erMsg = erMsg + ", MERGE tokens " + Types.printShortToken(currTok) 
              + " and " +  Types.printShortToken(nTk);
         end if;
         
         // insert token
         if (debug) then
            print("\n Checking INSERT token:");
         end if;
         candidates = {};
         candidates = checkCandidates(candidates,env,pt,2);
         if (Util.isListEmpty(candidates)==false) then
             erMsg = erMsg + ", INSERT token " + printCandidateTokens(candidates,"");
             //errStk = erMsg::errStk;
         end if; 
         
         errSt = maxErrShiftToken;
       
        // replace token
        // erMsg = "Syntax Error near " + semVal;
         if (debug) then
            print("\n Checking REPLACE token:");
         end if;
         candidates = {};
         candidates = checkCandidates(candidates,env,pt,3);
         if (Util.isListEmpty(candidates)==false) then
           erMsg = erMsg + ", REPLACE token with " + printCandidateTokens(candidates,"");
           //errStk = erMsg::errStk;
         end if;  
         
         errSt = maxErrShiftToken;
         
          // try to supress the token
         // erMsg = "Syntax Error near " + semVal;
         if (debug) then
            print("\n Check ERASE token until next token");
         end if;
         nTk::_ = prog;
         Types.TOKEN(id=idTok) = nTk;
         if (checkToken(idTok,env,pt,1)==true) then
            erMsg = erMsg + ", ERASE token";
            //errStk = erMsg::errStk;     
         end if;
               
         //printAny(errStk);
         if (Util.isListEmpty(errStk)==true) then
            errStk = erMsg::{};
         else
             errStk = erMsg::errStk;
         end if;
         Types.TOKEN(loc=info) = currTok;
         addSourceMessage(errStk,info);
         errSt = maxErrShiftToken;
      then (erMsg,true); //end error catching            
    case (false,_) // add one more error
      equation
         printErrorMessages(errStk);
         erMsg = Types.printErrorToken(currTok);
      then (erMsg,false);
  end matchcontinue;
  if (debug==true) then
     print("\nERROR NUM:" + intString(errSt) +" DETECTED:\n" + errorMsg);
  end if;   
  env2 := ENV(cTok,nTk,stateStk,errStk,errSt,sSt,cSt,prog,prgBk,astStk,debug,stateSkBk,astSkBk);
  //env2 := env;    
end errorHandler;

function checkCandidates
  input list<String> candidates;
  input Env env;
  input ParseData pt;
  input Integer action;
  output list<String> resCandidates;
  Integer n;
   // env variables
  Types.Token cTok,nTk;
  ParseCode.AstStack astStk,astSkBk;
  Boolean debug;
  Integer sSt,cSt,errSt;
  list<Types.Token> prog,prgBk; 
  list<Integer> stateStk,stateSkBk;
  list<String> errStk;
   // parse tables
  array<String> mm_tname;
  array<Integer> mm_translate, mm_prhs, mm_rhs, mm_rline, mm_toknum, mm_r1, mm_r2, mm_defact, mm_defgoto,
                 mm_pact, mm_pgoto, mm_table, mm_check, mm_stos;
  
  Integer numTokens,i;
  String name,tokVal;
 algorithm
    PARSE_TABLE(tname=mm_tname) := pt;
    
    resCandidates := candidates;
    numTokens := 255 + ParseTable.YYNTOKENS - 1;
    // exhaustive search over the tokens
    for i in 258:numTokens loop
      if (checkToken(i,env,pt,action)==true) then
         //name := mm_tname[i-255];
         tokVal := getTokenSemValue(i-255,pt);
         resCandidates := tokVal::resCandidates;
      end if;
    end for;
end checkCandidates;

function checkToken
  input Integer chkTok;
  input Env env;
  input ParseData pt;
  input Integer action; // 1 delete 2 insert 3 replace
  output Boolean result;
  Integer n;
   // env variables
  Types.Token cTok,nTk;
  ParseCode.AstStack astStk,astSkBk;
  Boolean debug;
  Integer sSt,cSt,errSt;
  list<Types.Token> prog,prgBk; 
  list<Integer> stateStk,stateSkBk;
  list<String> errStk;
   // parse tables
  array<String> mm_tname;
  array<Integer> mm_translate, mm_prhs, mm_rhs, mm_rline, mm_toknum, mm_r1, mm_r2, mm_defact, mm_defgoto,
                 mm_pact, mm_pgoto, mm_table, mm_check, mm_stos;
  Integer chk2;
  Env env2;
  Types.Info info;
  Types.Token candTok;
 algorithm
    PARSE_TABLE(translate=mm_translate,prhs=mm_prhs,rhs=mm_rhs,rline=mm_rline,tname=mm_tname,toknum=mm_toknum,r1=mm_r1,r2=mm_r2
       ,defact=mm_defact,defgoto=mm_defgoto,pact=mm_pact,pgoto=mm_pgoto,table=mm_table,check=mm_check,stos=mm_stos) := pt;
   
   ENV(crTk=cTok,lookAhTk=nTk,state=stateStk,sState=sSt,errMessages=errStk,errStatus=errSt,cState=cSt,program=prog,
         progBk=prgBk,astStack=astStk,isDebugging=debug,stateBackup=stateSkBk,astStackBackup=astSkBk):= env;
   
   if (debug) then
      print("\n **** Checking TOKEN: " + intString(chkTok) + " action:" + intString(action));
      //printAny("\n **** Checking TOKEN: " + intString(chkTok) + " action:" + intString(action));
   end if; 
  // restore back up configuration and run the machine again to check candidate
   if (Util.isListEmpty(prog)==false) then 
     cTok::prog := prog;
	   if (debug) then
	      print("\n **** Last token: " + Types.printToken(cTok));
	   end if;   
	   info := Types.INFO("",false,1,1,1,1,Types.getTimeStamp()); //fake position
	   candTok := Types.TOKEN(mm_tname[chkTok-255],chkTok,{65},info);
   else
     if (debug) then
	      print("\n Creating Fake Token position");
	   end if; 
     info := Types.INFO("",false,1,1,1,1,Types.getTimeStamp()); //fake position
     candTok := Types.TOKEN(mm_tname[chkTok-255],chkTok,{65},info);
   end if;
   
   if (debug) then
      print("\n **** Process candidate token: " + Types.printToken(candTok) + " action: " + intString(action));
   end if; 
   
   (prog) := matchcontinue(action)
     local 
        list<Integer> value;
        list<Types.Token> lstTokens;
     case (5) // Merge
       equation
          if (Util.isListEmpty(prog)==false) then 
             candTok::prog = prog; 
             value = Types.getMergeTokenValue(cTok,candTok);
             lstTokens = Lexer.lex("fileName",value,debug);
             candTok::_ = lstTokens;
             prog = candTok::prog;
          end if;  
       then (prog);
     case (2) // Insert
       equation
           prog = candTok::cTok::prog;
       then (prog); 
     case (3) // replace
       equation
           prog = candTok::prog;
       then (prog);     
   else then (prog);  
   end matchcontinue;  
   
   cSt::_ := stateSkBk;   
   errStk := {}; //reset errors
   errSt := -1; // no errors reset
   // backup the env variables to the last shifted token
   env2 := ENV(cTok,nTk,stateSkBk,errStk,errSt,sSt,cSt,prog,prgBk,astSkBk,debug,stateSkBk,astSkBk); 
   
   //printAny(env2);
   
   result := false;
   if (debug) then
      //print("\n\n*****ProcessTOKENS:" + Types.printTokens(prog,"") + " check" + intString(chkTok));
   end if;   
   //print("\n[State="+ intString(cSt) + " Stack Backup:{" + printStack(stateSkBk,"") + "}]\n");
   //print("\n[StateStack Backup:{" + printStack(stateSkBk,"") + "}\n");
   
   (_,result,_) := processToken(prog,env2,pt);
   if (result and debug) then
      print("\n **** Candidate TOKEN ADDED: " + intString(chkTok));
   end if;
end checkToken;

function reduce
   input Integer rule;
   input Env env;
   input ParseData pt;
   output Env env2;
  // parse tables
  array<String> mm_tname;
  array<Integer> mm_translate, mm_prhs, mm_rhs, mm_rline, mm_toknum, mm_r1, mm_r2, mm_defact, mm_defgoto,
                 mm_pact, mm_pgoto, mm_table, mm_check, mm_stos;
  // env variables               
  Types.Token cTok,nTk;
  ParseCode.AstStack astStk;
  ParseCode.AstStack astSkBk;
  Boolean debug;
  list<Integer> stateStk,stateSkBk;
  list<String> errStk,redStk;
  String astTmp,semVal;
  Integer errSt,sSt,cSt;
  list<Types.Token> prog,prgBk; 
  Integer i,len,val,n, nSt,chkVal;
 algorithm
   PARSE_TABLE(translate=mm_translate,prhs=mm_prhs,rhs=mm_rhs,rline=mm_rline,tname=mm_tname,toknum=mm_toknum,r1=mm_r1,r2=mm_r2
       ,defact=mm_defact,defgoto=mm_defgoto,pact=mm_pact,pgoto=mm_pgoto,table=mm_table,check=mm_check,stos=mm_stos) := pt;
   
   ENV(crTk=cTok,lookAhTk=nTk,state=stateStk,sState=sSt,errMessages=errStk,errStatus=errSt,cState=cSt,program=prog,progBk=prgBk,astStack=astStk,
      isDebugging=debug,stateBackup=stateSkBk,astStackBackup=astSkBk):= env;
   if rule > 0 then
		   len := mm_r2[rule];
		   if (debug) then
		      print("[Reducing(l:" + intString(len) + ",r:" + intString(rule) +")]");
		   end if;   
		   redStk := {};
		   for i in 1:len loop
		      val::stateStk := stateStk;
		   end for;
		  if (errSt>=0) then
		    (astStk) := ParseCode.actionRed(rule,astStk);
		  end if;
		  /* YYPOPSTACK (yylen);
		  yylen = 0;
		  YY_STACK_PRINT (yyss, yyssp);
		
		  *++yyvsp = yyval;
		  */
		  /* Find the new State after reduce */
		   cSt::_ := stateStk;
		  
		   n := mm_r1[rule];
		  
		   nSt := mm_pgoto[n - ParseTable.YYNTOKENS + 1];
		   nSt := nSt + cSt;
		   chkVal := nSt +1;
		   if (chkVal<=0) then
		      chkVal := 1;
		   end if;
		   if ( (nSt >=0) and (nSt <= ParseTable.YYLAST) and (mm_check[chkVal] == cSt) ) then
		      cSt := mm_table[nSt+1];
		   else
		      cSt := mm_defgoto[n - ParseTable.YYNTOKENS+1];
		   end if;
		   if (debug) then
		     print("[nState:" + intString(cSt) + "]");
		   end if;  
		   stateStk := cSt::stateStk;
   end if;
    env2 := ENV(cTok,nTk,stateStk,errStk,errSt,sSt,cSt,prog,prgBk,astStk,debug,stateSkBk,astSkBk);
   
end reduce;

function translate
  input Integer tok1;
  input ParseData pt;
  output Integer tok2;
  array<Integer> mm_translate;
  Integer maxT,uTok;
  algorithm
    PARSE_TABLE(translate=mm_translate) := pt;
    maxT := ParseTable.YYMAXUTOK;
    uTok := ParseTable.YYUNDEFTOK;
    (tok2) := matchcontinue(tok1<=maxT)
       local
         Integer res;
      case (true)
        equation
          
          res = mm_translate[tok1];
          //print("\nTRANSLATE TO:" + intString(res));
        then (res);
      case (false)
        then (uTok);
    end matchcontinue;
end translate;

function getTokenSemValue "retrieves semantic value from token id"
  input Integer tokenId;
  input ParseData pt; 
  output String tokenSemValue "returns semantic value of the token";
  array<String> values;
  algorithm
    
    if (Util.isListEmpty(ParseCode.lstSemValue)==true) then
       PARSE_TABLE(tname=values) := pt;
    else
       values := listArray(ParseCode.lstSemValue);   
    end if;
    tokenSemValue := "'" + values[tokenId] + "'";
end getTokenSemValue;

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
  
  function printSemStack
    input list<String> inList;
    input String cBuff;
    output String outList;
    list<String> inList2;
   algorithm 
    (outList) := matchcontinue(inList,cBuff)
      local
        String c;
        String new,tout;
        list<String> rest;
      case ({},_) 
        then (cBuff);
      else
        equation
           c::rest = inList;
           new = cBuff + "\n" + c;
           (tout) = printSemStack(rest,new);
        then (tout);
     end matchcontinue;     
  end printSemStack;
  
    function printCandidateTokens
    input list<String> inList;
    input String cBuff;
    output String outList;
    list<String> inList2;
   algorithm 
    (outList) := matchcontinue(inList,cBuff)
      local
        String c;
        String new,tout;
        list<String> rest;
      case ({},_)
        equation
           cBuff = System.substring(cBuff,1,stringLength(cBuff)-4); 
        then (cBuff);
      else
        equation
           c::rest = inList;
           new = cBuff + c + " or ";
           (tout) = printCandidateTokens(rest,new);
        then (tout);
     end matchcontinue;     
  end printCandidateTokens;  
  
  function printStack
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
           new = cBuff + "|" + intString(c);
           (tout) = printStack(rest,new);
        then (tout);
     end matchcontinue;     
  end printStack;  
end Parser;