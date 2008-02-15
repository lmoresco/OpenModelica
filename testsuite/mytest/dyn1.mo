function dyn1int
  input Integer inA;
  input Integer inB;
  output Integer outC;
algorithm
  outC := (inA + inB);
end dyn1int;

function dyn1real
  input Real inA;
  input Real inB;
  output Real outC;
algorithm
  outC := (inA + inB);
end dyn1real;

function dyn1str
  input String inA;
  input String inB;
  output String outC;
algorithm
  outC := (inA +& inB);
end dyn1str;

function dyn1strlst
  input list<String> inLst;
  output String outStr;
algorithm
  outStr := matchcontinue (inLst)
    local
      String item, rest_str;
      list<String> rest;
    case {} then "";
    case {item} then item;
    case (item :: rest)
      equation
        rest_str = dyn1strlst(rest);
        item = item +& "," +& rest_str;
    then item;
  end matchcontinue;
end dyn1strlst;
