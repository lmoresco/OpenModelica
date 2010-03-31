// name:     VectorizeSeveralArguments
// keywords: array
// status:   incorrect
// 
// Drmodelica: 7.8  Applied to Arrays  element-wise (p. 229)
// 
class SeveralArguments

	Real a = 1, b = 0, c = 1, d = 0, e = 1, f = 0;

	Real at[3] = atan2({a, b, c}, {d, e, f}); 
	// Result: {atan2(a, d), atan2(b, e), atan2(c, f)}

	Real atAdd[2] = atan2Add(2, {a, b}, {d, e}); 
	// Result: {2 + atan2(a, d), 2 + atan2(b, e)}

end SeveralArguments;
// endResult
