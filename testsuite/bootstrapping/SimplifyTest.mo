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
    Exp add1_2 = BINARY(i1,ADD(T_INTEGER_DEFAULT),i2);
    Exp r1 = RCONST(1.0);
    Exp rx = CREF(CREF_IDENT("x",T_REAL_DEFAULT,{}),T_REAL_DEFAULT);
    Exp rxMulr1 = BINARY(rx,MUL(T_REAL_DEFAULT),r1) "x*1.0";
    Exp r1Mulrx = BINARY(r1,MUL(T_REAL_DEFAULT),rx) "1.0*x";
    Exp rxAddrx = BINARY(rxMulr1,ADD(T_REAL_DEFAULT),r1Mulrx) "x*1.0 + 1.0*x";
    Exp rxAddrxMulrx = BINARY(rxAddrx,MUL(T_REAL_DEFAULT),rx) "(x*1.0 + 1.0*x)*x";
    Exp add2r1 = BINARY(r1,ADD(T_REAL_DEFAULT),r1) "1.0+1.0";
    Exp add3r1 = BINARY(r1,ADD(T_REAL_DEFAULT),add2r1) "1.0+1.0+1.0";
    Exp add4r1 = BINARY(r1,ADD(T_REAL_DEFAULT),add3r1) "1.0+1.0+1.0+1.0";
    Exp add5r1 = BINARY(r1,ADD(T_REAL_DEFAULT),add4r1) "1.0+1.0+1.0+1.0+1.0";
    Exp rxPow2 = BINARY(rx,MUL(T_REAL_DEFAULT),rx) "x*x";
    Exp rxPow2Mul1 = BINARY(rxPow2,MUL(T_REAL_DEFAULT),r1) "x*x*1.0";
    Exp bigExp = BINARY(rxAddrx,ADD(T_REAL_DEFAULT),BINARY(add5r1,ADD(T_REAL_DEFAULT),BINARY(rxAddrx,ADD(T_REAL_DEFAULT),BINARY(rxPow2Mul1,ADD(T_REAL_DEFAULT),BINARY(rxAddrxMulrx,ADD(T_REAL_DEFAULT),add3r1)))));
  algorithm
    base     := {i1,i2,i3,add1_2,r1,rx,rxMulr1,r1Mulrx,rxAddrx,rxAddrxMulrx,add2r1,add3r1,add4r1,add5r1,rxPow2,rxPow2Mul1,bigExp};
    simpl    := ExpressionSimplify.simplifyList(base,{});
    baseStr  := List.map(base, ExpressionDump.printExpStr);
    simplStr := List.map(simpl, ExpressionDump.printExpStr);
    List.map_0(List.threadTuple(baseStr,simplStr), printResult);
  end test;
end SimplifyTest;
