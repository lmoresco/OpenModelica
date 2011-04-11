function parseClassComment
  input String str;
  output String ostr;
algorithm
  ostr := matchcontinue str
    local
      String file,pack,description,rcs,rest;
    case str
      equation
        (3,_::file::rest::_) = System.regex(str, ".*file: *([^\n]*\n)(.*)\",\"../../Compiler/",16,true,false);
        (3,_::pack::rest::_) = System.regex(rest, ".*package: *([^\n]*\n)(.*)",16,true,false);
        (3,_::description::rest::_) = System.regex(rest, ".*description: *([^\n]*\n)(.*)",16,true,false);
        (3,_::rcs::rest::_) = System.regex(rest, ".*(RCS:[^\n]*\n)(.*)",16,true,false);
        ostr = stringAppendList({"<tr><td>",pack,"</td><td>",description,"</td><td>",rest,"</td>"});
      then ostr;
    else "<tr><td><b>##Bad description: " + str + "</b></td></tr>";
  end matchcontinue;
end parseClassComment;

function compFn
  input String s1,s2;
  output Boolean b;
algorithm
  b := s1 > s2;
end compFn;

function sortAppendLst
  input list<String> strs;
  output String str;
algorithm
  str := stringAppendList(Util.sort(strs,compFn));
end sortAppendLst;
