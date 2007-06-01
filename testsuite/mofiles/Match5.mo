// Testfall Matchcontinue 5

model Match5   

  function func
    input String b;
    input Integer i;
    input Integer int;
    output Integer x;    
  algorithm
    x :=
    matchcontinue (b,i,int)
      local
        String s2;
        Integer i2;
      case ("hej",1,3) then 1;      
      case ("socker",1,4) then i2; 
      case ("hej",1,6) then 3;
      case (_,1,8) then 4;
      case (s2,2,0) then 5;
    end matchcontinue;
  end func;

  Integer a;
equation 
  a = func("hej",4,7);  
end Match5;


/*
Match5_func_rettype _Match5_func(modelica_string b, modelica_integer i, modelica
_integer int)
{
  Match5_func_rettype tmp1;
  state tmp2;
  modelica_integer x;
  modelica_string s2;
  modelica_integer i2;
  modelica_boolean BOOLVAR__;
  modelica_boolean DUMMIE__;
  modelica_boolean ELSEEXISTS__;
  modelica_string tmp4;
  modelica_integer tmp3;
  modelica_string tmp6;
  modelica_integer tmp5;

  tmp2 = get_memory_state();

  init_modelica_string(&tmp4,"hej");
  tmp3 = strcmp(tmp4,b);
  if ((tmp3 && BOOLVAR__)) {
    if ((((modelica_integer)i == 1) && BOOLVAR__)) {
      if ((((modelica_integer)int == 3) && BOOLVAR__)) {
        x = 1;
      }
      else {
        if ((((modelica_integer)int == 6) && BOOLVAR__)) {
          x = 3;
        }
        else {
          if ((((modelica_integer)int == 8) && BOOLVAR__)) {
            x = 4;
          }
        }
      }
    }
    else {
      if ((((modelica_integer)i == 2) && BOOLVAR__)) {
        if ((((modelica_integer)int == 0) && BOOLVAR__)) {
          x = 5;
        }
      }
    }
  }
  else {
    init_modelica_string(&tmp6,"socker");
    tmp5 = strcmp(tmp6,b);
    if ((tmp5 && BOOLVAR__)) {
      if ((((modelica_integer)i == 1) && BOOLVAR__)) {
        if ((((modelica_integer)int == 4) && BOOLVAR__)) {
          x = (modelica_integer)i2;
        }
        else {
          if ((((modelica_integer)int == 8) && BOOLVAR__)) {
            x = 4;
          }
        }
      }
      else {
        if ((((modelica_integer)i == 2) && BOOLVAR__)) {
          if ((((modelica_integer)int == 0) && BOOLVAR__)) {
            x = 5;
          }
        }
      }
    }
    else {
      if (BOOLVAR__) {
        s2 = b;
        if ((((modelica_integer)i == 1) && BOOLVAR__)) {
          if ((((modelica_integer)int == 8) && BOOLVAR__)) {
            x = 4;
          }
        }
        else {
          if ((((modelica_integer)i == 2) && BOOLVAR__)) {
            if ((((modelica_integer)int == 0) && BOOLVAR__)) {
              x = 5;
            }
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
