// Testfall Matchcontinue 1

model Match1 
  
  record REC
    Integer recInt;
  end REC;
 
  public function func 
    input REC r;
    output Boolean o;
  algorithm
    o := matchcontinue (r)
      case (REC(1)) then true;
      case (REC(_)) then false;
    end matchcontinue;
  end func;  
  
  Boolean a;
equation
  a = func(REC(1));
end Match1;

/* 
Problem with getTag builtin function
*/