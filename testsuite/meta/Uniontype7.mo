record foo
    Integer i;
    Real r;
    String s;
    Boolean b;
end foo;

uniontype UT
  record REC1
    foo y;
    Integer x;
  end REC1;   
  
  record REC2
    Real z;
  end REC2;  
end UT;

model Uniontype7
    
    function test
      input Integer s;
      output Integer k;
    protected
      UT re;
      foo f;
    algorithm
      f := foo(1,1.0,"1.0",false);
      re := REC1(f,1);
      re := REC1(foo(2,2.0,"2.0",true),2);
      k := 5;
    end test;
    
    Integer a;
  equation
    a = test(5);
end Uniontype7;
