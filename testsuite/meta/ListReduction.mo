// name: ListReduction
// cflags: +g=MetaModelica +d=noevalfunc
// status: correct
// teardown_command: rm -rf ListReduction_*

class ListReduction
  function fn1
    input list<Real> reals1;
    output list<Real> reals2 := list(1.0*r for r in reals1);
  end fn1;
  function fn2
    input list<Real> reals1;
    output list<Real> reals2 := listReverse(1.0*r for r in reals1);
  end fn2;
  function fn3
    input list<Real> reals1;
    output list<Real> reals2 := listReverse(list(1.0*r for r in reals1));
  end fn3;
  function fn4
    input list<Real> reals1;
    output list<Real> reals2 := listReverse(listReverse(1.0*r for r in reals1));
  end fn4;
list<Real> r1 = fn1({1,2,3});
list<Real> r2 = fn2({1,2,3});
list<Real> r3 = fn3({1,2,3});
list<Real> r4 = fn4({1,2,3});
end ListReduction;

// Result:
// function ListReduction.fn1
//   input list<#Real> reals1;
//   output list<#Real> reals2 = <reduction>list(r for r in reals1);
// end ListReduction.fn1;
// 
// function ListReduction.fn2
//   input list<#Real> reals1;
//   output list<#Real> reals2 = <reduction>listReverse(r for r in reals1);
// end ListReduction.fn2;
// 
// function ListReduction.fn3
//   input list<#Real> reals1;
//   output list<#Real> reals2 = <reduction>listReverse(r for r in reals1);
// end ListReduction.fn3;
// 
// function ListReduction.fn4
//   input list<#Real> reals1;
//   output list<#Real> reals2 = <reduction>list(r for r in reals1);
// end ListReduction.fn4;
// 
// class ListReduction
//   list<#Real> r1 = List(#(1.0),#(2.0),#(3.0));
//   list<#Real> r2 = List(#(3.0),#(2.0),#(1.0));
//   list<#Real> r3 = List(#(3.0),#(2.0),#(1.0));
//   list<#Real> r4 = List(#(1.0),#(2.0),#(3.0));
// end ListReduction;
// endResult
