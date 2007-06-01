// Testfall Matchcontinue 6

model Match6

  function func
    input String s;
    input Integer i;
    input Boolean b;
    output Integer x;    
  algorithm
    x :=
    matchcontinue (s,i,b)
      local
        String s2;
        Integer i2;
      case ("hej",1,false) then 1;      
      case ("socker",i2,_) then i2; 
      case ("hej",1,false) equation then 3;
      case (_,1,true) then 4;
      case (s2,2,_) then 5;  
    end matchcontinue;
  end func;

  Integer a;
equation 
  a = func("hej",4,true); 
end Match6;

/*
Match6_func_rettype _Match6_func(modelica_string s, modelica_integer i, modelica
_boolean b)
{
  Match6_func_rettype tmp1;
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
  tmp3 = strcmp(tmp4,s);
  if ((tmp3 && BOOLVAR__)) {
    if ((((modelica_integer)i == 1) && BOOLVAR__)) {
      if ((((!b && !(0)) || (b && (0))) && BOOLVAR__)) {
        x = 1;
      }
      else {
        if ((((!b && !(0)) || (b && (0))) && BOOLVAR__)) {
          x = 3;
        }
        else {
          if ((((!b && !(1)) || (b && (1))) && BOOLVAR__)) {
            x = 4;
          }
        }
      }
    }
    else {
      if ((((modelica_integer)i == 2) && BOOLVAR__)) {
        if (BOOLVAR__) {
          x = 5;
        }
      }
    }
  }
  else {
    init_modelica_string(&tmp6,"socker");
    tmp5 = strcmp(tmp6,s);
    if ((tmp5 && BOOLVAR__)) {
      if (BOOLVAR__) {
        i2 = (modelica_integer)i;
        if (BOOLVAR__) {
          x = (modelica_integer)i2;
        }
      }
      else {
        if ((((modelica_integer)i == 1) && BOOLVAR__)) {
          if ((((!b && !(1)) || (b && (1))) && BOOLVAR__)) {
            x = 4;
          }
        }
        else {
          if ((((modelica_integer)i == 2) && BOOLVAR__)) {
            if (BOOLVAR__) {
              x = 5;
            }
          }
        }
      }
    }
    else {
      if (BOOLVAR__) {
        s2 = s;
        if ((((modelica_integer)i == 1) && BOOLVAR__)) {
          if ((((!b && !(1)) || (b && (1))) && BOOLVAR__)) {
            x = 4;
          }
        }
        else {
          if ((((modelica_integer)i == 2) && BOOLVAR__)) {
            if (BOOLVAR__) {
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
