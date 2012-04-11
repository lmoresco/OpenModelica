class C Real x; end C;
record B String name; Integer age; end B;
block Mul input Real x; output Real result; equation result = x; end Mul;
type vector3D = Real[3](each start = 5, nominal = {1, 2, 3, 4, 5});
function div input Real x; output Real result; algorithm result := x; end div;
type size = enumeration(Small, Medium, Large);
model M "A class comment" parameter Integer i = 1; Real r = 4 if i > 0 "A component comment"; end M;
model ReplaceableClass replaceable model M1 end M1; end ReplaceableClass;
connector RealSignal replaceable type SignalType = Real; extends SignalType; end RealSignal;