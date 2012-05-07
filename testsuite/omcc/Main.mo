class Main

import Lexer;
import Parser;

import LexerModelica;
import ParserModelica;

import Util;
import RTOpts;
import System;
import Types;


public function main
"function: main
  This is the main function that the MetaModelica Compiler (MMC) runtime system calls to
  start the translation."
  input list<String> inStringLst;
  protected
  list<OMCCTypes.Token> tokens;
  ParserModelica.AstTree astTreeModelica;
  type Mcode_MCodeLst = list<Mcode.MCode>;
algorithm
  
  
  _ := matchcontinue (inStringLst)
  local
      String ver_str,errstr,filename,parser,ast;
      list<String> args_1,args,chars;
      String s,str,omhome,oldpath,newpath,unparsed;
      Boolean result; 
      Real tl,tp,tt;
     case args as _::_
      equation
        {filename,parser} = Flags.new(args);
        
         "Modelica" = parser;
         false=(0==stringLength(filename));
         print("\nParsing Modelica with file " + filename + "\n");
        
        // call the lexer
  	    //tokens = LexerModelica.scanString("Hello",true); 
  	    System.startTimer();
  	   // printAny("\nstarting lexer");
  	   tokens = LexerModelica.scan(filename,false);
  	    System.stopTimer();
  	    tl = System.getTimerIntervalTime();
  	    print("\n Time Lexer:" + realString(tl));
  	    //print(OMCCTypes.printTokens(tokens,""));
  	    print("\n Tokens processed:");
  	    print(intString(listLength(tokens)));
  	    // call the parser
  	    
  	    System.startTimer();
  	   // printAny("\nstarting parser");
  	    (result,astTreeModelica) = ParserModelica.parse(tokens,filename,false);
  	     System.stopTimer();
       //  print(str::args_1);
        tp = System.getTimerIntervalTime();
        print("\n Time Parser:" + realString(tp));
        tt = tl+tp;
        print("\n   TOTAL Time:" + realString(tt));
        print("\n");
  	    // print the AST
  	    if (result) then
  	     //unparsed = Dump.unparseStr(astTreeModelica,false);
  	     //print(unparsed);
  	     print("\n" +Error.printMessagesStr());
          print("\nSUCCEED");
  	     System.writeFile(filename + "UnParsed.mo",Dump.unparseStr(astTreeModelica,true));
  	     //printAny(unparsed);
         else
            //print(Error.getMessagesStr());
            print("\n" +Error.printMessagesStr());
  	    end if;
  	    // Run the machine for exercise 10 
  	   
	    
	      
  	    //printAny(astTreeModelica);        
  	    print("\nargs:" + filename);
       
         printUsage();
      then ();
    case {}
      equation
        print("no args");
        printUsage();
     then ();  
    case _
      equation
        print("\n**********Error*************");
        print("\n" +Error.printMessagesStr());
        printUsage();
     then ();            
   end matchcontinue;   
end main; 

public function printUsage
protected
  Integer n;
  List<String> strs;
algorithm
  print("\nOMCCp v0.9.2 (OpenModelica compiler-compiler Parser generator) Lexer and Parser Generator-2012");
end printUsage;

protected function readSettings
"function: readSettings
 author: x02lucpo
 Checks if 'settings.mos' exist and uses handleCommand with runScript(...) to execute it.
 Checks if '-s <file>.mos' has been
 returns Interactive.InteractiveSymbolTable which is used in the rest of the loop"
  input list<String> inStringLst;
  output String str;
algorithm
  str:=
  matchcontinue (inStringLst)
    local
      list<String> args;
    case (args)
      equation
        outSymbolTable = Interactive.emptySymboltable;
         "" = Util.flagValue("-s",args);
//         this is out-commented because automatically reading settings.mos
//         can make a system bad
//         outSymbolTable = readSettingsFile("settings.mos", Interactive.emptySymboltable);
      then
       outSymbolTable;
    case (args)
      equation
        str = Util.flagValue("-s",args);
        str = System.trim(str," \"");
        outSymbolTable = readSettingsFile(str, Interactive.emptySymboltable);
      then
       outSymbolTable;
  end matchcontinue;
end readSettings;


end Main;
