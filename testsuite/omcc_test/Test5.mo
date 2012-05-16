// name:Test5.mo 
// keywords:This tests the MetaModelica construct-uniontype
// status: correct
 
 uniontype Number
record INT Integer int; end INT;
record RATIONAL Integer dividend, divisor; end RATIONAL;
record REAL Real real; end REAL;
record COMPLEX Real re,im; end COMPLEX;
end Number;


// succeed
// omcc- v.2012