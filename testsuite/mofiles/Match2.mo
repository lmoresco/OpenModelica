// Testfall Matchcontinue 2

model Match2 

  function func
    input Integer x;
    input Boolean y;    
    output Integer z;    
  algorithm
    z :=
    matchcontinue (x,y)
      local
      case (11,true) then 1;
      case (1222,false) then 2;
      case (_,_) then 4;
    end matchcontinue;
  end func;

  Integer a;
equation 

  a = func(11,true);  
end Match2;

/*
Match2_func_rettype _Match2_func(modelica_integer x, modelica_boolean y)
{
  Match2_func_rettype tmp1;
  state tmp2;
  modelica_integer z;
  modelica_boolean BOOLVAR__;
  modelica_boolean DUMMIE__;
  modelica_boolean ELSEEXISTS__;

  tmp2 = get_memory_state();

  if ((((modelica_integer)x == 11) && BOOLVAR__)) {
    if ((((!y && !(1)) || (y && (1))) && BOOLVAR__)) {
      z = 1;
    }
    else {
      if (BOOLVAR__) {
        z = 4;
      }
    }
  }
  else {
    if ((((modelica_integer)x == 1222) && BOOLVAR__)) {
      if ((((!y && !(0)) || (y && (0))) && BOOLVAR__)) {
        z = 2;
      }
      else {
        if (BOOLVAR__) {
          z = 4;
        }
      }
    }
    else {
      if (BOOLVAR__) {
        if (BOOLVAR__) {
          z = 4;
        }
      }
    }
  }
  z = (modelica_integer)z;

  _return:

  tmp1.targ1 = z;
  restore_memory_state(tmp2);
  return tmp1;

}
 */
