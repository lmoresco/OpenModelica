model test 
  type myType = Real(unit="V",min=0,max=1e5,start=1,fixed=true,nominal=1.5,stateSelect=StateSelect.avoid);
  myType x; 
  extends test2; 
end test;
model test2 
  type myType2 = Real(quantity="B",displayUnit="b");
  myType2 y; 
end test2;
