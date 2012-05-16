// name: Test9.mo  
// keywords: This tests the conditional statement with nested if blocks
// status: correct
 
 function class3
  Integer x = 17;
  algorithm
    if(x==17.0)then 
    print("\n success");
      if (x>17.0)then
       print("\n success");
      else
       print("\n failure");
    end if;
  end if;
end class3;


// succeed
// omcc- v.2012