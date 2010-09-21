package MatchCase11

  function func
    input Integer i;
    output Integer b; 
  algorithm
    b := matchcontinue (i)
      case (1) then fail();
    end matchcontinue;
  end func; 

end MatchCase11;
