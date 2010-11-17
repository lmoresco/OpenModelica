model XmlDumpComment
	parameter Real A;
	parameter Real B;
	Real x
    "evaluated to 0 if A < B";
equation
	x = if (A < B) then 0 else 1;
end XmlDumpComment;
