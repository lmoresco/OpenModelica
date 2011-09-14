// name: EmptyArraySubscript
// status: correct
//
// Tests that t[i] is not part of flat Modelica

block blogg
  parameter input Integer n;
  input Boolean t[:];
  output Boolean b;
algorithm
  b:=true;
  for i in 1:n loop
    if t[i] then
      b:=false;
    end if;
  end for;
end blogg;

model EmptyArraySubscript
  parameter Integer nIn = 0;
  parameter Integer n =0;
  Boolean tIn[n];
  blogg glog(n=nIn,t=tIn);
  Boolean bOut;
equation
   bOut = glog.b;
end EmptyArraySubscript;

// Result:
// class EmptyArraySubscript
//   parameter Integer nIn = 0;
//   parameter Integer n = 0;
//   parameter input Integer glog.n = nIn;
//   output Boolean glog.b;
//   Boolean bOut;
// equation
//   bOut = glog.b;
// algorithm
//   glog.b := true;
//   for i in 1:glog.n loop
//     if {}[i] then
//       glog.b := false;
//     end if;
//   end for;
// end EmptyArraySubscript;
// endResult
