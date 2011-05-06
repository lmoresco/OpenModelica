class Main

import Lexer;
import Parser;

import LexerModelica;
import ParserModelica;

import Lexer10;
import Parser10;

import Util;
import RTOpts;
import System;
import Types;


import AbsynPAM;
import LexerGenerator;
import ParserGenerator;

public import Mcode;
protected import Trans;
protected import Emit;

public function main
"function: main
  This is the main function that the MetaModelica Compiler (MMC) runtime system calls to
  start the translation."
  input list<String> inStringLst;
  list<Types.Token> tokens;
  ParseCode10.AstTree astTree10;
  ParserModelica.AstTree astTreeModelica;
  type Mcode_MCodeLst = list<Mcode.MCode>;
protected
  AbsynPAM.Stmt program;
  Mcode_MCodeLst mcode;
algorithm
  
  
  _ := matchcontinue (inStringLst)
  local
      String ver_str,errstr,filename,parser,ast;
      list<String> args_1,args,chars;
      String s,str,omhome,oldpath,newpath;
      Boolean result; 
    case args as _::_
      equation
        {filename,parser} = RTOpts.args(args);
         true=(0==stringLength(filename));
         str = LexerGenerator.genLexer("lexer"+ parser +".c", "lexer"+ parser +".l", parser);
	       print("\nResult:" + str);
	       str = ParserGenerator.genParser("parser"+ parser +".c","parser"+ parser +".y",parser);
  	     print("\nResult:" + str); 
        // call the lexer
  	 /*  tokens = Lexer.scan(filename); 
  	    // call the parser
  	    (ast,astTree) = Parser.parse(tokens,filename);
  	    // print the AST
  	  //  printAny(program.astProgram);
  	    // Run the machine for exercise 10 
  	    print("\nRun the machine for exercise 10\n");
  	    program = astTree;
		     mcode = Trans.transProgram(program); 
	       Emit.emitAssembly(mcode);
	       print("\n" + ast);
	    */
	      
  	   // printAny(astTree);        
  	    print("\n OMC-LPG Ended:" + filename);
       // System.stopTimer();
       //  print(str::args_1);
         //printAny(System.getTimerIntervalTime());
         printUsage();
      then ();
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
  	    
  	    print(Types.printTokens(tokens,""));
  	    print("\n Tokens processed:");
  	    print(intString(listLength(tokens)));
  	    // call the parser
  	    (result,astTreeModelica) = ParserModelica.parse(tokens,filename,false);
  	    // print the AST
  	    if (result) then
  	     printAny(astTreeModelica);
  	    end if;
  	    // Run the machine for exercise 10 
  	   
	    
	      
  	   // printAny(astTree);        
  	    print("\nargs:" + filename);
        System.stopTimer();
       //  print(str::args_1);
        print("\n Total time:" + realString(System.getTimerIntervalTime()));
         printUsage();
      then ();
   case args as _::_
      equation
        {filename,parser} = RTOpts.args(args);
        System.startTimer();
         "10" = parser;
         false=(0==stringLength(filename));
         print("\nParsing10 with file " + filename + "\n");
        // call the lexer
  	   tokens = Lexer10.scan(filename,false); 
  	    // call the parser
  	    (result,astTree10) = Parser10.parse(tokens,filename,false);
  	    // print the AST
  	    printAny(astTree10);
  	    if (result) then
		  	    
		  	    // Run the machine for exercise 10 
		  	    print("\nRun the machine for exercise 10\n");
		  	    program = astTree10;
				     mcode = Trans.transProgram(program); 
			       Emit.emitAssembly(mcode); 
			     //  print("\n" + ast);
	      end if;
	      
  	   // printAny(astTree);        
  	    print("\nargs:" + filename);
        System.stopTimer();
       //  print(str::args_1);
        print("\n Total time:" + realString(System.getTimerIntervalTime()));
         printUsage();
      then ();         
    case args as _::_
      equation
        {filename,parser} = RTOpts.args(args);
       // System.startTimer();
         "" = parser;
          false=(0==stringLength(filename));
        // call the lexer
  	   // tokens = Lexer.scan(filename,true); 
  	    printAny(tokens);
  	    // call the parser
  	   // (result,astTree) = Parser.parse(tokens,filename,false);
  	    // print the AST
  	  //  printAny(program.astProgram);
  	    // Run the machine for exercise 10 
  	    print("\nRun the machine for exercise 10\n");
  	    //program = astTree;
		    // mcode = Trans.transProgram(program); 
	      // Emit.emitAssembly(mcode);
	      // print("\n" + ast);
	    
	      
  	   // printAny(astTree);        
  	    print("\nargs:" + filename);
       // System.stopTimer();
       //  print(str::args_1);
         //printAny(System.getTimerIntervalTime());
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