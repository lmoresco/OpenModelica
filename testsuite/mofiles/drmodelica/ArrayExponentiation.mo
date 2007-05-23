// name:     ArrayExponentiation
// keywords: array
// status:   correct

class Exp
	Real e1[2, 2];
	Real e2[2, 2];
equation

	e1 = {{1, 2}, {1, 2}} ^ 0;
	// Result: {{1, 0}, {0, 1}}

	e2 = [1, 2; 1, 2] ^ 2;
	// Result: {{3, 6}, {3, 6}}
end Exp;