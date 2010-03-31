// name:     Function12
// keywords: function, short class def
// status:   correct
// 
// This tests function as short class definition.


package Modelica

  package Math

    function atan2 "four quadrant inverse tangent"
  input Real u1;
  input Real u2;
  output Real y;

  external "C" y=atan2(u1,u2) ;

end atan2;
end Math;
end Modelica;

model BaseSampler
  input Real u;
  Boolean doSample;
  function f= Modelica.Math.atan2;
protected 
  discrete Real x;

equation 
  when doSample then
    x=f(pre(x), u);
  end when;
end BaseSampler;
// Result:
// function BaseSampler.f
// input Real u1;
// input Real u2;
// output Real y;
// end BaseSampler.f;
// 
// fclass BaseSampler
// input Real u;
// Boolean doSample;
// protected discrete Real x;
// equation
//   when doSample then
//   x = BaseSampler.f(pre(x),u);
//   end when;
// end BaseSampler;
// endResult
