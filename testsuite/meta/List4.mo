// name: List4
// cflags: +g=MetaModelica
// status: correct
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
         7 = func2(var5);
         (_,_,7) = func3(var5);
        then 7;
      case (_) then (9);          
    end matchcontinue; 
  end func1; 
  
  Integer c1,c2;
equation 
  c1 = func1(7); 
  c2 = func2(9); 
end List4;
// Result:
// function List4.func1
//   input Integer a;
//   output Integer out1;
// algorithm
//   _ := #VALUEBLOCK#;
// end List4.func1;
// 
// function List4.func2
//   input Integer k;
//   output Integer f;
// algorithm
//   f := k;
// end List4.func2;
// 
// function List4.func3
//   input Integer a;
//   output Integer b;
//   output Integer c;
//   output Integer d;
// algorithm
//   b := a;
//   c := a;
//   d := a;
// end List4.func3;
// 
// class List4
//   Integer c1;
//   Integer c2;
// equation
//   c1 = 7;
//   c2 = 9;
// end List4;
// endResult
