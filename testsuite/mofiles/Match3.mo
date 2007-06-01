// Testfall Matchcontinue 3

model Match3 

  function func
    input Integer x;
    input Integer y;    
    output Integer z;    
  algorithm
    z :=
    matchcontinue (x,y)
      local
        Integer i;
        Integer r1,r2;
      case (i as 11,r1) then i;
      case (_,23) then 1;
      case (_,r2 as _) then 4;
    end matchcontinue;
  end func;

  Integer a;
equation 

  a = func(11,12);  
end Match3;

/*
Match3_func_rettype _Match3_func(modelica_integer x, modelica_integer y)
{
  Match3_func_rettype tmp1;
  state tmp2;
  modelica_integer z;
  modelica_integer i;
  modelica_integer r1;
  modelica_integer r2;
  modelica_boolean BOOLVAR__;
  modelica_boolean DUMMIE__;
  modelica_boolean ELSEEXISTS__;

  tmp2 = get_memory_state();

  if ((((modelica_integer)x == 11) && BOOLVAR__)) {
    if (BOOLVAR__) {
      r1 = (modelica_integer)y;
      i = (modelica_integer)x;
      z = (modelica_integer)i;
    }
    else {
      if ((((modelica_integer)y == 23) && BOOLVAR__)) {
        z = 1;
      }
      else {
        if (BOOLVAR__) {
          r2 = (modelica_integer)y;
          z = 4;
        }
      }
    }
  }
  else {
    if (BOOLVAR__) {
      if ((((modelica_integer)y == 23) && BOOLVAR__)) {
        z = 1;
      }
      else {
        if (BOOLVAR__) {
          r2 = (modelica_integer)y;
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