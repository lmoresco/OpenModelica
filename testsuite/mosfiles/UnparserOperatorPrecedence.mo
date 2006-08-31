model UnparserOperatorPrecedence
 
equation 
  X=not (A and (B or C));
  X=not A and B or C;
end UnparserOperatorPrecedence;
