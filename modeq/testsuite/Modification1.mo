// name:     Modification1
// keywords: modification
// status:   correct
// 
// This file tests simple modifications of variables
//

type Real = RealType;

model Motor

  model Foo
    parameter Real q;
  end Foo;
  
  parameter Real j = 1.0;
  Foo f(q=2.0);

end Motor;

model Modification1
  Motor m(j = 3.0);
  Motor n(f(q=5.0));
end Modification1;

// fclass Modification1
// equation
//   m.j   = 3.0;
//   m.f.q = 2.0;
//   n.j   = 1.0;
//   n.f.q = 5.0;
// end Modification1;
