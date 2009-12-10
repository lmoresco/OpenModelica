// name: OperatorSimple
// keywords: operator
// status: correct
//
// Tests simple operator overloading
//

record Complex
  Real re;
  Real im;

  operator '*'
    funtion mul
      input Complex c1;
      input Complex c2;
      output Complex result;
    algorithm
      result := Complex(re=c1.re*c2.re - c1.im*c2*im,
                        im=c1.re*c2.im + c1.im*c2.re);
    end mul;
  end '*';
end Complex;

model OperatorSimple
  Complex c1,c2,c2;
equation
  c1 = Complex(re=2.0,im=3.0);
  c2 = Complex(re=7.0,im=3.14);
  c3 = c1 * c2;
end OperatorSimple;
