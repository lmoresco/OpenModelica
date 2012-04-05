class C Real x; end C;
record B String name; Integer age; end B;
block Mul input Real x; output Real result; equation result = x; end Mul;
type vector3D = Real[3](each start = 5, nominal = {1, 2, 3, 4, 5});
function div input Real x; output Real result; algorithm result := x; end div;


