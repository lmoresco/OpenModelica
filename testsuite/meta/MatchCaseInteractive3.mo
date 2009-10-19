package MatchCaseInteractive3

uniontype UT
  record REC1
    Integer x;
  end REC1;
end UT;

constant UT myConst = REC1(3);
constant Integer myIntConst = 3;

function retMyConst
  output UT out;
algorithm
  out := myConst;
end retMyConst;

uniontype Select
  
  record FirstAlternative
    String x1;
    String x2;
  end FirstAlternative;

  record SecondAlternative
    Select x1;
    Select x2;
  end SecondAlternative;
  
  record ThirdAlternative
    Select next;
  end ThirdAlternative;
end Select;

constant Select mySelect = ThirdAlternative(
	  SecondAlternative(
	    FirstAlternative("one", "First"),
	    FirstAlternative("two", "Second")));

function printSelect
  input Select selectVar;
algorithm
  _ := matchcontinue(selectVar)
    local
      String cmp1,cmp2;
    case (FirstAlternative(cmp1, cmp2)) 
      equation
        print("FirstAlternative(");
        print("\"");
        print(cmp1);
        print("\"");
        print(", ");
        print("\"");
        print(cmp2);
        print("\"");
        print(")");
      then ();
    case (SecondAlternative(cmp1, cmp2)) 
      local 
        Select cmp1, cmp2;
      equation
        print("SecondAlternative(");
        printSelect(cmp1);
        print(", ");
        printSelect(cmp2);
        print(")");
      then ();
    case ThirdAlternative(cmp1)
      local
        Select cmp1;
      equation
        print("ThirdAlternative(");
        printSelect(cmp1);
        print(")");
      then ();
  end matchcontinue;
end printSelect;


end MatchCaseInteractive3;
