// name:Test12.mo 
// keywords: This tests the guard statements
// status: correct
 
 
 class new
 Boolean v[n];
 Boolean x;
 Integer I;
equation
 x= if(I>=1 and I<=n) then v[I] else false;
end new; 


// succeed
// omcc- v.2012