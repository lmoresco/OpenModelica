package SimplifyTest "Run Exp.simplify on some sample expressions"
  import DAE.*;
  constant Exp i1 = ICONST(1);
  constant Exp i2 = ICONST(2);
  constant Exp i3 = ICONST(3);
  constant Exp add1_2 = BINARY(i1,ADD(ET_INT()),i2);

  function printResult
    input tuple<String,String> res;
  algorithm
    (s1,s2) := res;
    print(stringAppendList({"simplify(",s1,") = ",s2,"\n"}));
  end printResult;

  function test
    list<Exp> base,simpl;
    list<String> baseStr,simplStr;
  algorithm
    /*base     := {i1,i2,i3,add1_2};
    simpl    := Util.listMap(base, Exp.simplify);
    baseStr  := Util.listMap(base, Exp.printExpStr);
    simplStr := Util.listMap(simpl, Exp.printExpStr);
    Util.listMap0(Util.listThreadTuple(baseStr,simplStr), printResult);*/
  end test;
end SimplifyTest;
