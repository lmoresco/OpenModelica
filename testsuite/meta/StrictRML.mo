package StrictRML
  function fn1
    input Real ri;
    output Real ro;
  algorithm
    ro := matchcontinue (ri,ri2)
      case _ then 2.0;
      else ri;
    end matchcontinue;
  end fn1;
  function fn2
    input Real ri;
    output Real ro;
  algorithm
    (ro1,ro2) := matchcontinue ri
      case _ then 2.0;
      else ri;
    end matchcontinue;
  end fn2;
  function fn3
    input Real ri;
    output Real ro;
  algorithm
    _ := matchcontinue 1
      case _ then 2.0;
      else ri;
    end matchcontinue;
  end fn3;
  function fn4
    input Real ri;
    output Real ro;
  algorithm
    3 := matchcontinue ri
      case _ then 2.0;
      else ri;
    end matchcontinue;
  end fn4;
  function fn5
    input Real ri;
    output Real ro;
  algorithm
    ro := matchcontinue ro
      case _ then 2.0;
      else ri;
    end matchcontinue;
  end fn5;
  function fn6
    input Real ri;
    output Real ro;
  algorithm
    ri := matchcontinue ri
      case _ then 2.0;
      else ri;
    end matchcontinue;
  end fn6;
end StrictRML;
