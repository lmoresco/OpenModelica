// name: ExternalFunction8
// status: correct
// teardown_command: rm -f ExternalFunction8_*

class ExternalFunction8
  function fn
    output Real rs[3];
  external "C" rs=my123() annotation(Include="double* my123() {const double my123[3] = {1.0,2.0,3.0}; return (double*) my123;}");
  end fn;

  constant Real rs[3] = fn();
end ExternalFunction8;

// Result:
// function ExternalFunction6.fn
//   input Integer i1;
//   output Integer i;
// 
//   external "C";
// end ExternalFunction6.fn;
// 
// class ExternalFunction6
//   constant Integer i = 4;
// end ExternalFunction6;
// endResult
