function parseClassComment
  input String str;
  output String ostr;
algorithm
  ostr := matchcontinue str
    local
      String file,filename,pack,description,rcs,rest;
    case str
      equation
        (4,_::file::rest::filename::_) = System.regex(str, ".*file: *([^\n]*\n)(.*)\",\"../../Compiler/([A-Za-z0-9]*/[A-Za-z0-9]*.mo)",16,true,false);
        (3,_::pack::rest::_) = System.regex(rest, ".*package: *([^\n]*\n)(.*)",16,true,false);
        (3,_::description::rest::_) = System.regex(rest, ".*description: *([^\n]*\n)(.*)",16,true,false);
        (3,_::rcs::rest::_) = System.regex(rest, ".*([$]Id:[^\n]*\n?)(.*)",16,true,false);
        ostr = stringAppendList({"<h3>",pack,"</h3><p>",description,"</p><p>",filename,"</p><p><pre>",rest,"</pre></p>"});
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
  str := stringDelimitList(List.sort(strs,compFn),"<hr />");
end sortAppendLst;
