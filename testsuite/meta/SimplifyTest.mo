package SimplifyTest "Run ExpressionSimplify.simplify on some sample expressions"
  import DAE.*;
  constant Exp i1 = ICONST(1);
  constant Exp i2 = ICONST(2);
  constant Exp i3 = ICONST(3);
  constant Exp add1_2 = BINARY(i1,ADD(ET_INT()),i2);
  constant Exp r1 = RCONST(1.0);
  constant Exp rx = CREF(CREF_IDENT("x",ET_REAL(),{}),ET_REAL());
  constant Exp rxMulr1 = BINARY(rx,MUL(ET_REAL()),r1);
  constant Exp r1Mulrx = BINARY(r1,MUL(ET_REAL()),rx);
/*  constant Exp addMul = 
"x * 1.0 + 1.0 * x + 1.0 + 1.0 + 1.0 + 1.0 + 1.0 + x * 1.0 + 1.0 * x + x * x * 1.0 + (x * 1.0 + 1.0 * x) * x + 1.0 + 1.0 + 1.0"; */

  function printResult
    input tuple<String,String> res;
    String s1,s2;
  algorithm
    (s1,s2) := res;
    print(stringAppendList({"simplify(",s1,") = ",s2,"\n"}));
  end printResult;

  function test
    list<Exp> base,simpl;
    list<String> baseStr,simplStr;
  algorithm
    base     := {i1,i2,i3,add1_2,r1,rx,rxMulr1,r1Mulrx};
    simpl    := Util.listMap(base, ExpressionSimplify.simplify);
    baseStr  := Util.listMap(base, ExpressionDump.printExpStr);
    simplStr := Util.listMap(simpl, ExpressionDump.printExpStr);
    Util.listMap0(Util.listThreadTuple(baseStr,simplStr), printResult);
  end test;
end SimplifyTest;
