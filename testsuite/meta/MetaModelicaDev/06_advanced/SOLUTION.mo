package Main

import Types;
import Functions;

function main
  input list<String> arg;
algorithm
  _ := matchcontinue arg
    local 
      list<Integer> orderedIntList;
      list<String> orderedStringList, stringList, strRealLst, strIntLst;      
      list<Real> orderedRealList, realList;            
    case (_) 
      equation
        // your code here:
        // order the initial Int list
        orderedIntList    = Functions.orderList(Types.intList, Functions.compareInt);
        // transform the ordered list to String for printing
        strIntLst = Functions.map1(orderedIntList, Functions.transformInt2String);
        print("Int String List:");
        Functions.map0(strIntLst, Functions.printElement);
        
        // transforming the initial int list to a String list
        stringList = Functions.map1(Types.intList, Functions.transformInt2String);
        // order the transformed String list        
        orderedStringList = Functions.orderList(stringList, Functions.compareString);
        print("\nOrdered String List:");
        Functions.map0(orderedStringList, Functions.printElement);
        
        // transforming the int list to a Real list
        realList = Functions.map1(Types.intList, Functions.transformInt2Real);
        // order the transformed Real list
        orderedRealList = Functions.orderList(realList, Functions.compareReal);
        strRealLst = Functions.map1(orderedRealList, Functions.transformReal2String);
        print("\nOrdered Real List:");
        Functions.map0(strIntLst, Functions.printElement);
        print("\n");
      then ();
  end matchcontinue; 
end main;

end Main;

package Functions

function compareInt
  input Integer i1;
  input Integer i2;
  output Boolean b;
algorithm
  b := i1 < i2;
end compareInt;

function compareReal
  input Real r1;
  input Real r2;
  output Boolean b;
algorithm
  b := r1 <. r2;
end compareReal;

function compareString
  input String s1;
  input String s2;
  output Boolean b;
algorithm
  b := matchcontinue (s1, s2)
    local Integer z;
    case (s1, s2)
      equation
        0 = stringCompare(s1, s2);
      then false;
    case (s1, s2)
      equation
        z = stringCompare(s1, s2);
        true = (z < 0);
      then true;
    case (s1, s2)
      equation
        z = stringCompare(s1, s2);
        false = (z < 0);
      then false;        
  end matchcontinue;
end compareString;

function quicksort
  replaceable type Type_a subtypeof Any;
  input  list<Type_a> inList;
  input  list<Type_a> accList;  
  partial function FuncType 
    input Type_a el1;
    input Type_a el2;
    output Boolean cmp;
  end FuncType;
  input FuncType comparator;
  output list<Type_a> outList;
algorithm
  outList := matchcontinue (inList, accList, comparator)
    local
      list<Type_a> l, smaller, greater, acc, lst1, lst2, lst3;
      Type_a x;
    case ({}, acc, _) then acc;
    case (x::l, acc, comparator) 
      equation
        (smaller, greater) = partition (x, l, comparator);
        lst1 = quicksort (greater, acc, comparator);
        lst2 = x::lst1;
        lst3 = quicksort (smaller, lst2, comparator);
      then lst3;
  end matchcontinue;
end quicksort;
  
function partition 
  replaceable type Type_a subtypeof Any;
  input  Type_a inList;
  input  list<Type_a> accList;
  partial function FuncType 
    input Type_a el1;
    input Type_a el2;
    output Boolean cmp;
  end FuncType;
  input FuncType comparator;
  output list<Type_a> outList1;
  output list<Type_a> outList2;  
algorithm
  (outList1,outList2) := matchcontinue (inList, accList, comparator)
    local 
      Type_a x, y;
      list<Type_a> l, smaller, greater;
    case (x, {}, _) then ({}, {}); 
    case (x, y::l, comparator)  
      equation
        (smaller, greater) = partition (x, l, comparator);
        true = comparator(y, x);
      then (y::smaller, greater);
    case (x, y::l, comparator)  
      equation
        (smaller, greater) = partition (x, l, comparator);
        false = comparator(y, x);
      then (smaller, y::greater);
  end matchcontinue;
end partition;

function orderList
  replaceable type Type_a subtypeof Any;
  input  list<Type_a> inList;
  partial function FuncType 
    input Type_a el1;
    input Type_a el2;
    output Boolean cmp;
  end FuncType;
  input FuncType comparator;
  output list<Type_a> outList;
algorithm
  outList := matchcontinue (inList, comparator)
    local list<Type_a> lst, lstResult;
    case ({}, _) then {};
    case (lst, comparator)
      equation 
        lstResult = quicksort(lst, {}, comparator);
      then lstResult;
  end matchcontinue;
end orderList;

// transformer functions
function transformInt2Real
  input Integer i;
  output Real r;
algorithm
  r := intReal(i);
end transformInt2Real;

function transformInt2String
  input Integer i;
  output String s;
algorithm
  s := intString(i);
end transformInt2String;

function transformReal2String
  input Real r;
  output String s;
algorithm
  s := realString(r);
end transformReal2String;

// mapping functions
function map1
  replaceable type Type_a subtypeof Any;
  replaceable type Type_b subtypeof Any;
  input  list<Type_a> inList;
  partial function FuncType 
    input  Type_a elIn;
    output Type_b elOut;
  end FuncType;
  input FuncType f;
  output list<Type_b> outList;
algorithm
  outList := matchcontinue(inList, f)
    local 
      list<Type_b> lst;
      list<Type_a> rest;
      Type_a x;
      Type_b y;
    case ({},_) then {};
    case (x::rest, f) 
      equation
        y = f(x);
        lst = map1(rest, f);
      then y::lst;
  end matchcontinue;
end map1;

function map0
  replaceable type Type_a subtypeof Any;
  input  list<Type_a> inList;
  partial function FuncType 
    input  Type_a elIn;
  end FuncType;
  input FuncType f;
algorithm
  _ := matchcontinue(inList, f)
    local 
      list<Type_a> rest;
      Type_a x;
    case ({},_) then ();
    case (x::rest, f) 
      equation
        f(x);
        map0(rest, f);
      then ();
  end matchcontinue;
end map0;

function printElement
  input String str;
algorithm
  print(str);
  print(" ");
end printElement;

end Functions;
