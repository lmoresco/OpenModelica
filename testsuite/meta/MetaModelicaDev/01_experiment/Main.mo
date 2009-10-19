package Main

import Types;
import Functions;

function main
  /* Code taken from the old RML/MetaModelica compiler. These were the arguments provided to the executable.
   * This version of the course uses OpenModelica scripts to provide input instead. */
  input list<String> arg;
  output Integer out;
algorithm
 out := 
 matchcontinue arg
  case (n_str::_) 
   local 
    Integer i, n; 
    String str, n_str;
   equation
     // factorial 
     print("Factorial of " +& n_str +& " is: ");
     n = stringInt(n_str);    
     i = Functions.factorial(n);
     str = intString(i);
     print(str); 
     // test function
     print("\nCalling Functions.test(\"one\"):   " +& intString(Functions.test("one")));
     print("\nCalling Functions.test(\"two\"):   " +& intString(Functions.test("two")));
     print("\nCalling Functions.test(\"three\"): " +& intString(Functions.test("three")));
     print("\nCalling Functions.test(\"other\"): " +& intString(Functions.test("other")));
     print("\n");
     
     mainSimple();
     mainOption();
     mainTuple();
     mainList();
     mainOneRecord();
     mainSelect();
   then i;
 end matchcontinue; 
end main;

function mainSimple
algorithm
  print("Types.aliasConstant: ");
  Functions.printAlias(Types.aliasConstant);
  print("\n");
end mainSimple;

function mainOption
algorithm
  print("Types.optionAliasConstant: ");
  Functions.printOptionType(Types.optionAliasConstant);

  print("\nTypes.optionAliasConstantNone: ");
  Functions.printOptionType(Types.optionAliasConstantNone);
  print("\n");
end mainOption;

function mainTuple
algorithm
  print("Types.tupleConstant: ");
  Functions.printTupleType(Types.tupleConstant);
  print("\n");
end mainTuple;

function mainList
algorithm
  print("Types.listConstant: {");
  Functions.printListType(Types.listConstant);
  print("}\n");
end mainList;

function mainOneRecord
algorithm
  print("Types.oneRecord: ");
  Functions.printOneRecord(Types.oneRecord);
  print("\n");
end mainOneRecord;

function mainSelect
algorithm
  print("Types.select: ");
  Functions.printSelect(Types.select);
  print("\n");
end mainSelect;
  
end Main;
