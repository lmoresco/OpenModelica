// name:Test4.mo 
// keywords: This tests the restricted class-block
// status: correct
 
 block multiply
 input Real x;
 input Real y(start=0);
 output Real result;
equation
 result = x*y;
end multiply;

// succeed
// omcc- v.2012