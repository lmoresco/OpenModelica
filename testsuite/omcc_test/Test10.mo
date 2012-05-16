// name:Test10.mo
// keywords: This tests the conditional statement- nested if with deep nesting
// status: correct
 
 function class3
 protected
  Integer x = 17;
  Real y=20.0;
  algorithm
    if(x==17.0)then 
    print("\n success");
      if (x>17.0)then
       print("\n success");
      else
       print("\n failure");
    end if;
      if(y<20.0) then 
        print("\n success");
       else
        print("\n failure");
      end if;      
  end if;
end class3;


// succeed
// omcc- v.2012