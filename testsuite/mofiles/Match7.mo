// Testfall Matchcontinue 7

model Match7

  function func
    input String s;
    input Integer i;
    input Boolean b;
    output Integer x1; 
    output Integer x2;   
  algorithm
    (x1,x2) :=
    matchcontinue (s,i,b)
      local
        String s2;
        Integer i2;
      case ("hej",1,false) then (1,2);      
    end matchcontinue;
  end func;

  Integer a,b;
equation 
  (a,b) = func("hej",4,true);  
end Match7;

/*
Match7_func_rettype _Match7_func(modelica_string s, modelica_integer i, modelica
_boolean b)
{
  Match7_func_rettype tmp1;
  state tmp2;
  modelica_integer x1;
  modelica_integer x2;
  modelica_string s2;
  modelica_integer i2;
  modelica_boolean BOOLVAR__;
  modelica_boolean DUMMIE__;
  modelica_boolean ELSEEXISTS__;
  modelica_string tmp4;
  modelica_integer tmp3;

  tmp2 = get_memory_state();

  init_modelica_string(&tmp4,"hej");
  tmp3 = strcmp(tmp4,s);
  if ((tmp3 && BOOLVAR__)) {
    if ((((modelica_integer)i == 1) && BOOLVAR__)) {
      if ((((!b && !(0)) || (b && (0))) && BOOLVAR__)) {
        x1 = 1;
        x2 = 2;
      }
    }
  }
  x1 = (modelica_integer)x1;

  _return:

  tmp1.targ1 = x1;
  tmp1.targ2 = x2;
  restore_memory_state(tmp2);
  return tmp1;

}
 */
