// name: Test8.mo
// keywords:This tests the conditional statement-if and elseif
// status: correct
 
 function class3
  Integer x = 17;
  algorithm
    if(x==17)then 
    print("\n success");
    else if (x<17)then
    print("\n failure");
    end if;
  end if;
end class3;


// succeed
// omcc- v.2012