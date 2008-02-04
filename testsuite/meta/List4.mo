// Pattern matching with left-hand side expressions
// Need to be fixed: A function call (with several
// return values) does not work corretly inside a valueblock 
// right now, due to implicit/explicit instantiation of functions ...
model List4
  
  function func2
    input Integer k;
    output Integer f;
  algorithm
    f := k;
  end func2; 
  
  function func3 
    input Integer a;
    output Integer b;
    output Integer c;
    output Integer d;
  algorithm
    b := a;
    c := a;
    d := a;
  end func3;
  
  function func1
    input Integer a;
    output Integer out1;
  algorithm 
   out1 := matchcontinue (a)
      case (var5) 
        local
          Integer var5; 
        equation 
          //int1 = func2(7);
          //(9) = func2(9);
         (7) = func2(var5);
         _ = func2(var5);
         1 = func2(var5);
         (_,_,3) = func3(var5);
        then 7;  
      case (_) then (9);          
    end matchcontinue; 
  end func1; 
  
  Integer c1;
equation 
  c1 = func1(7); 
end List4;