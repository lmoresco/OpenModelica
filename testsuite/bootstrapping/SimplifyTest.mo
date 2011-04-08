package SimplifyTest "Run ExpressionSimplify.simplify on some sample expressions"
  import DAE.*;
  /*    Exp addMul = 
"x * 1.0 + 1.0 * x + 1.0 + 1.0 + 1.0 + 1.0 + 1.0 + x * 1.0 + 1.0 * x + x * x * 1.0 + (x * 1.0 + 1.0 * x) * x + 1.0 + 1.0 + 1.0";
"rxAddrx + add5r1 + rxAddrx + rxPow2Mul1 + rxAddrxMulrx + add3r1"
 */

  function printResult
    input tuple<String,String> res;
  protected
    String s1,s2;
  algorithm
    (s1,s2) := res;
    print(stringAppendList({"simplify(",s1,") = ",s2,"\n"}));
  end printResult;

  function test
  protected
    list<Exp> base,simpl;
    list<String> baseStr,simplStr;
    Exp i1 = ICONST(1);
    Exp i2 = ICONST(2);
    Exp i3 = ICONST(3);
    Exp add1_2 = BINARY(i1,ADD(ET_INT()),i2);
    Exp r1 = RCONST(1.0);
    Exp rx = CREF(CREF_IDENT("x",ET_REAL(),{}),ET_REAL());
    Exp rxMulr1 = BINARY(rx,MUL(ET_REAL()),r1) "x*1.0";
    Exp r1Mulrx = BINARY(r1,MUL(ET_REAL()),rx) "1.0*x";
    Exp rxAddrx = BINARY(rxMulr1,ADD(ET_REAL()),r1Mulrx) "x*1.0 + 1.0*x";
    Exp rxAddrxMulrx = BINARY(rxAddrx,MUL(ET_REAL()),rx) "(x*1.0 + 1.0*x)*x";
    Exp add2r1 = BINARY(r1,ADD(ET_REAL()),r1) "1.0+1.0";
    Exp add3r1 = BINARY(r1,ADD(ET_REAL()),add2r1) "1.0+1.0+1.0";
    Exp add4r1 = BINARY(r1,ADD(ET_REAL()),add3r1) "1.0+1.0+1.0+1.0";
    Exp add5r1 = BINARY(r1,ADD(ET_REAL()),add4r1) "1.0+1.0+1.0+1.0+1.0";
    Exp rxPow2 = BINARY(rx,MUL(ET_REAL()),rx) "x*x";
    Exp rxPow2Mul1 = BINARY(rxPow2,MUL(ET_REAL()),r1) "x*x*1.0";
    Exp bigExp = BINARY(rxAddrx,ADD(ET_REAL()),BINARY(add5r1,ADD(ET_REAL()),BINARY(rxAddrx,ADD(ET_REAL()),BINARY(rxPow2Mul1,ADD(ET_REAL()),BINARY(rxAddrxMulrx,ADD(ET_REAL()),add3r1)))));
  algorithm
    base     := {i1,i2,i3,add1_2,r1,rx,rxMulr1,r1Mulrx,rxAddrx,rxAddrxMulrx,add2r1,add3r1,add4r1,add5r1,rxPow2,rxPow2Mul1,bigExp};
    simpl    := ExpressionSimplify.simplifyList(base,{});
    baseStr  := Util.listMap(base, ExpressionDump.printExpStr);
    simplStr := Util.listMap(simpl, ExpressionDump.printExpStr);
    Util.listMap0(Util.listThreadTuple(baseStr,simplStr), printResult);
  end test;
end SimplifyTest;
