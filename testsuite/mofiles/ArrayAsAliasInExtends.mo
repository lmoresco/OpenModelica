// name:     ArrayAsAliasInExtends
// keywords: testing that array as alias used in extends works properly
// status:   correct
// 
// Array as alias used in extends checks, enumeration used as array size, enumeration indexing, etc.
// this is partially correct as modifications doesn't seem to be kept!
// Needs to be investigated further.

type NowLetsSee = enumeration(one, two, three);

type Alias = Real[NowLetsSee](unit="fish/s");

type Orientation 
  extends Alias annotation(dummyAnn = true);
  // have an annotation here too to test that 
  // keeping the annotation in SCode doesn't 
  // interfere with normal operation!
  annotation(dumyAnn = false); 
  
  // have the equalityConstraint function here too
  function equalityConstraint
    input Orientation x;
    output Real y;
  algorithm
    y := x[NowLetsSee.one]+x[NowLetsSee.two]+x[NowLetsSee.three];
  end equalityConstraint;
end Orientation;

package Mine

  constant Orientation R={1,2,3};
  
  model Theirs
    parameter Orientation R1 = R;    
    Real x = Orientation.equalityConstraint(R);
  end Theirs;
  
end Mine;


model ArrayAsAliasInExtends
  extends Mine.Theirs;
end ArrayAsAliasInExtends;


// fclass ArrayAsAliasInExtends
// parameter Real R1[1] = 1.0;
// parameter Real R1[2] = 2.0;
// parameter Real R1[3] = 3.0;
// Real x = 6.0;
// end ArrayAsAliasInExtends;