// Testfall MetaModelica list

model ListTest 
  
  record REC  
    Integer recInt;   
  end REC;
  
  function func 
    input Integer inArg; 
    output Boolean outArg;  
    list<Boolean> boolList;  
    list<Integer> intList,intList2,intList3; 
  algorithm  
    boolList := {true,false}; 
    intList := (1 :: (2 :: (4 :: {})));
    intList2 := (2 :: intList);
    intList3 := {1,2,3,4,5};  
    outArg := true; 
  end func; 
  
  Boolean d;
equation 
  d = func(1);
end ListTest;

/* 
ListTest_func_rettype _ListTest_func(modelica_integer inArg)
{
	ListTest_func_rettype tmp1;	
	state tmp2; 
	modelica_boolean outArg;  
	void* boolList;
	void* intList;
  void* intList2;
  void* intList3;
  void* tmp3;
	void* tmp4;
	void* tmp5; 
	void* tmp6;
	
	tmp2 = get_memory_state();  
	tmp3 = mk_cons((1),mk_cons((0),mk_nil())); 
	boolList = tmp3;  
	tmp4 = mk_cons(1,mk_cons(2,mk_cons(4,mk_nil()))); 
	intList = tmp4;  
	tmp5 = mk_cons(2,intList); 
	intList2 = tmp5;  
	tmp6 = mk_cons(1,mk_cons(2,mk_cons(3,mk_cons(4,mk_cons(5,mk_nil())))));
	intList3 = tmp6;
	outArg = (1);
	
	_return; 
	
	tmp1.targ1 = outArg; 
	restore_memory_state(tmp2);  
	return tmp1;
	
}
*/