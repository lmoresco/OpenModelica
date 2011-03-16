// name: ListReductionInterpret
// cflags: +g=MetaModelica +d=nogen
// status: correct
// teardown_command: rm -rf ListReduction_*

class ListReduction
  function myMin
    input Real r1,r2;
    output Real r := min(r1,r2);
  end myMin;

function f
  output String s := "\n";
protected
  String sList,sArr;
  list<Real> reals1 := {1,2,3}, reals2 := {-3.0,-2,-1,0,1,2,3};
  Real realsArr1[3] := {1,2,3}, realsArr2[:] := {-3.0,-2,-1,0,1,2,3}, realsArr3[3];
algorithm
  s := s + anyString(list(1.0*r for r in reals1));s := s + "\n";
  s := s + anyString(listReverse(1.0*r for r in reals1));s := s + "\n";
  s := s + anyString(listReverse(list(1.0*r for r in reals1)));s := s + "\n";
  s := s + anyString(listReverse(listReverse(1.0*r for r guard false or true in reals1)));s := s + "\n";
  s := s + anyString(list(3.5*r for r guard r>0 in reals2));s := s + "\n";
/*
  s := s + anyString(myMin(0,0) + myMin(3.5*r for r guard realAbs(r)<3 in reals2));s := s + "\n";
*/
  s := s + anyString(sum(3.5*r for r guard true and false in reals2));s := s + "\n";
  realsArr3 := array(1.0*r for r in reals1);
  s := s + "{" + sum(realString(r) + "," for r in realsArr3) + "}";s := s + "\n";
  s := s + anyString(min(1.0*r for r in reals1));s := s + "\n";
  s := s + anyString(max(1.0*r for r guard false or true in reals1));s := s + "\n";
  s := s + anyString(realMax(1.5*r for r guard false or true in reals1));s := s + "\n";
  s := s + anyString(sum(3.5*r for r guard r>0 in reals2));s := s + "\n";
  s := s + anyString(product(3.5*r for r guard r>0 in reals2));s := s + "\n";
  s := s + anyString(realMin(r for r guard r>2 in reals1));s := s + "\n";

  // return; // nogen does not seem to work with some of the other reductions :(

  sList := s; s := "\n";

  s := s + anyString(list(1.0*r for r in realsArr1));s := s + "\n";
  s := s + anyString(listReverse(1.0*r for r in realsArr1));s := s + "\n";
  s := s + anyString(listReverse(list(1.0*r for r in realsArr1)));s := s + "\n";
  s := s + anyString(listReverse(listReverse(1.0*r for r guard false or true in realsArr1)));s := s + "\n";
  s := s + anyString(list(3.5*r for r guard r>0 in realsArr2));s := s + "\n";
/*
  s := s + anyString(myMin(0,0) + myMin(3.5*r for r guard realAbs(r)<3 in realsArr2));s := s + "\n";
*/
  s := s + anyString(sum(3.5*r for r guard true and false in realsArr2));s := s + "\n";
  realsArr3 := array(1.0*r for r in realsArr1);
  s := s + "{" + sum(realString(r) + "," for r in realsArr3) + "}";s := s + "\n";
  s := s + anyString(min(1.0*r for r in realsArr1));s := s + "\n";
  s := s + anyString(max(1.0*r for r guard false or true in realsArr1));s := s + "\n";
  s := s + anyString(realMax(1.5*r for r guard false or true in realsArr1));s := s + "\n";
  s := s + anyString(sum(3.5*r for r guard r>0 in realsArr2));s := s + "\n";
  s := s + anyString(product(3.5*r for r guard r>0 in realsArr2));s := s + "\n";
  s := s + anyString(realMin(r for r guard r>2 in realsArr1));s := s + "\n";
  sArr := s;
  assert(sList == sArr, "Reductions are different:\nArray:\n" + sArr + "\nList:\n" + sList + "\n");
end f;

  constant String s = f();
end ListReduction;

// Result:
// function ListReduction.f
//   output String s = "
// ";
//   protected String sList;
//   protected String sArr;
//   protected list<#Real> reals1 = List(#(1.0),#(2.0),#(3.0));
//   protected list<#Real> reals2 = List(#(-3.0),#(-2.0),#(-1.0),#(0.0),#(1.0),#(2.0),#(3.0));
//   protected Real[3] realsArr1 = {1.0,2.0,3.0};
//   protected Real[7] realsArr2 = {-3.0,-2.0,-1.0,0.0,1.0,2.0,3.0};
//   protected Real[3] realsArr3;
// algorithm
//   s := s + anyString(<reduction>list(r for r in List(#(1.0),#(2.0),#(3.0))));
//   s := s + "
// ";
//   s := s + anyString(<reduction>listReverse(r for r in List(#(1.0),#(2.0),#(3.0))));
//   s := s + "
// ";
//   s := s + anyString(<reduction>listReverse(r for r in List(#(1.0),#(2.0),#(3.0))));
//   s := s + "
// ";
//   s := s + anyString(<reduction>list(r for r in List(#(1.0),#(2.0),#(3.0))));
//   s := s + "
// ";
//   s := s + anyString(<reduction>list(#(3.5 * (unbox(r))) for r guard (unbox(r)) > (0.0) in List(#(-3.0),#(-2.0),#(-1.0),#(0.0),#(1.0),#(2.0),#(3.0))));
//   s := s + "
// ";
//   s := s + anyString(#(0.0));
//   s := s + "
// ";
//   realsArr3 := <reduction>array(unbox(r) for r in List(#(1.0),#(2.0),#(3.0)));
//   s := s + "{" + realString(realsArr3[1]) + "," + realString(realsArr3[2]) + "," + realString(realsArr3[3]) + "," + "}";
//   s := s + "
// ";
//   s := s + anyString(#(<reduction>min(unbox(r) for r in List(#(1.0),#(2.0),#(3.0)))));
//   s := s + "
// ";
//   s := s + anyString(#(<reduction>max(unbox(r) for r in List(#(1.0),#(2.0),#(3.0)))));
//   s := s + "
// ";
//   s := s + anyString(#(<reduction>realMax(1.5 * (unbox(r)) for r in List(#(1.0),#(2.0),#(3.0)))));
//   s := s + "
// ";
//   s := s + anyString(#(<reduction>sum(3.5 * (unbox(r)) for r guard (unbox(r)) > (0.0) in List(#(-3.0),#(-2.0),#(-1.0),#(0.0),#(1.0),#(2.0),#(3.0)))));
//   s := s + "
// ";
//   s := s + anyString(#(<reduction>product(3.5 * (unbox(r)) for r guard (unbox(r)) > (0.0) in List(#(-3.0),#(-2.0),#(-1.0),#(0.0),#(1.0),#(2.0),#(3.0)))));
//   s := s + "
// ";
//   s := s + anyString(#(<reduction>realMin(unbox(r) for r guard (unbox(r)) > (2.0) in List(#(1.0),#(2.0),#(3.0)))));
//   s := s + "
// ";
//   sList := s;
//   s := "
// ";
//   s := s + anyString(<reduction>list(#(r) for r in {1.0,2.0,3.0}));
//   s := s + "
// ";
//   s := s + anyString(<reduction>listReverse(#(r) for r in {1.0,2.0,3.0}));
//   s := s + "
// ";
//   s := s + anyString(<reduction>listReverse(#(r) for r in {1.0,2.0,3.0}));
//   s := s + "
// ";
//   s := s + anyString(<reduction>list(#(r) for r in {1.0,2.0,3.0}));
//   s := s + "
// ";
//   s := s + anyString(<reduction>list(#(3.5 * r) for r guard r > 0.0 in {-3.0,-2.0,-1.0,0.0,1.0,2.0,3.0}));
//   s := s + "
// ";
//   s := s + anyString(#(0.0));
//   s := s + "
// ";
//   realsArr3 := {1.0,2.0,3.0};
//   s := s + "{" + realString(realsArr3[1]) + "," + realString(realsArr3[2]) + "," + realString(realsArr3[3]) + "," + "}";
//   s := s + "
// ";
//   s := s + anyString(#(min({1.0,2.0,3.0})));
//   s := s + "
// ";
//   s := s + anyString(#(max({1.0,2.0,3.0})));
//   s := s + "
// ";
//   s := s + anyString(#(<reduction>realMax(1.5 * r for r in {1.0,2.0,3.0})));
//   s := s + "
// ";
//   s := s + anyString(#(<reduction>sum(3.5 * r for r guard r > 0.0 in {-3.0,-2.0,-1.0,0.0,1.0,2.0,3.0})));
//   s := s + "
// ";
//   s := s + anyString(#(<reduction>product(3.5 * r for r guard r > 0.0 in {-3.0,-2.0,-1.0,0.0,1.0,2.0,3.0})));
//   s := s + "
// ";
//   s := s + anyString(#(<reduction>realMin(r for r guard r > 2.0 in {1.0,2.0,3.0})));
//   s := s + "
// ";
//   sArr := s;
//   assert( sList == sArr, "Reductions are different:
// Array:
// " + sArr + "
// List:
// " + sList + "
// ");
// end ListReduction.f;
// 
// class ListReduction
//   constant String s = "
// {1.0,2.0,3.0}
// {3.0,2.0,1.0}
// {3.0,2.0,1.0}
// {1.0,2.0,3.0}
// {3.5,7.0,10.5}
// 0.0
// {1.0,2.0,3.0,}
// 1.0
// 3.0
// 4.5
// 21.0
// 257.25
// 3.0
// ";
// end ListReduction;
// endResult