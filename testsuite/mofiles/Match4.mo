// Testfall Matchcontinue 4

model Match4   

  function func
    input String s;
    output Integer x;    
  algorithm
    x :=
    matchcontinue (s)
      local
        String s2;
      case ("hej") then 1;      
      case ("socker") then 2; 
      case ("hej") then 3;
      case (_) then 4;
      case (s2) then 5;
    end matchcontinue;
  end func;

  Integer a;
equation 
  a = func("hej");  
end Match4;

/*
Match4_func_rettype _Match4_func(modelica_string s)
{
  Match4_func_rettype tmp1;
  state tmp2;
  modelica_integer x;
  modelica_string s2;
  modelica_boolean BOOLVAR__;
  modelica_boolean DUMMIE__;
  modelica_boolean ELSEEXISTS__;
  modelica_string tmp4;
  modelica_integer tmp3;
  modelica_string tmp6;
  modelica_integer tmp5;
  modelica_string tmp8;
  modelica_integer tmp7;

  tmp2 = get_memory_state();

  init_modelica_string(&tmp4,"hej");
  tmp3 = strcmp(tmp4,s);
  if ((tmp3 && BOOLVAR__)) {
    x = 1;
  }
  else {
    init_modelica_string(&tmp6,"socker");
    tmp5 = strcmp(tmp6,s);
    if ((tmp5 && BOOLVAR__)) {
      x = 2;
    }
    else {
      init_modelica_string(&tmp8,"hej");
      tmp7 = strcmp(tmp8,s);
      if ((tmp7 && BOOLVAR__)) {
        x = 3;
      }
      else {
        if (BOOLVAR__) {
          x = 4;
        }
        else {
          if (BOOLVAR__) {
            s2 = s;
            x = 5;
          }
        }
      }
    }
  }
  x = (modelica_integer)x;

  _return:

  tmp1.targ1 = x;
  restore_memory_state(tmp2);
  return tmp1;

}
*/