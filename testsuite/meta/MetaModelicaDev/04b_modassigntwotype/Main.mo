package Main " file: Main.mo "
  
import Absyn;
import Parse;
import Eval;

protected function printvalue
  input Eval.Value in_value;
algorithm 
  _ :=
  matchcontinue (in_value)
    local
      String x_1;
      Integer x;
    case (Eval.INTval(x))
      equation 
        x_1 = intString(x);
        print(x_1);
      then ();
    case (Eval.REALval(x))
      local Real x;
      equation 
        x_1 = realString(x);
        print(x_1);
      then ();
    case _
      equation
        print("Main.printvalue failed\n");
      then ();
  end matchcontinue;
end printvalue;

protected function eval_loop
  input Eval.Env in_env;
algorithm 
  _ :=
  matchcontinue (in_env)
    local
      Absyn.Exp ast;
      list<tuple<String,Eval.Value>> env2,env;
      Eval.Value value;
    case (env)
      equation 
        print("[Parse. Enter an expression, then press CTRL+z (Windows) or CTRL+d (Linux).]\n");
        ast = Parse.parse();
        (env2,value) = Eval.eval(env, ast);
        printvalue(value);
        print("\n");
      then ();
  end matchcontinue;
end eval_loop;

public function main "Main"
  input StringList in_stringlist;
  output Integer i;
protected 
  type StringList = list<String>;
algorithm 
  i :=
  matchcontinue (in_stringlist)
    case _
      equation 
        eval_loop(Eval.init_env); 
      then 0;
  end matchcontinue;
end main;
end Main;

