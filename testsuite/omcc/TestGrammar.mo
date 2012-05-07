
function addval
  input Integer a=1;
  input Integer b=1;
  output Integer c;
  algorithm
  c:=a+b;
  end addval;
  
class add
Integer d;
equation
d=addval();
end add;
