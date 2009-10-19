package Polymorphic

  function ident
    input  Type_a x;
    output Type_a y;
    replaceable type Type_a subtypeof Any;
    // type Type_a = polymorphic<Any>;
  algorithm
    y := x;
  end ident;

end Polymorphic;
