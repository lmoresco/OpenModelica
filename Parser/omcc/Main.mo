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
  
     case args as _::_
      equation
        {filename,parser} = RTOpts.args(args);
        System.startTimer();
         "Modelica" = parser;
         false=(0==stringLength(filename));
         print("\nParsing Modelica with file " + filename + "\n");
        
        // call the lexer
  	    //tokens = LexerModelica.scanString("Hello",true); 
  	    tokens = LexerModelica.scan(filename,false);
  	    
  	    print(OMCCTypes.printTokens(tokens,""));
  	    print("\n Tokens processed:");
  	    print(intString(listLength(tokens)));
  	    // call the parser
  	    (result,astTreeModelica) = ParserModelica.parse(tokens,filename,true);
  	    // print the AST
  	    if (result) then
  	     //unparsed = Dump.unparseStr(astTreeModelica,false);
  	     //print(unparsed);
  	     System.writeFile("UnParsed" + filename,Dump.unparseStr(astTreeModelica,true));
  	     //printAny(unparsed);
  	    end if;
  	    // Run the machine for exercise 10 
  	   
	    
	      
  	   // printAny(astTree);        
  	    print("\nargs:" + filename);
        System.stopTimer();
       //  print(str::args_1);
        print("\n Total time:" + realString(System.getTimerIntervalTime()));
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
        printUsage();
     then ();            
   end matchcontinue;   
end main; 

public function printUsage
  Integer n;
  List<String> strs;
algorithm
  print("\nOMCC v0.8 (OpenModelica Compiler- Compiler) Lexer and Parser Generator - 2011");
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