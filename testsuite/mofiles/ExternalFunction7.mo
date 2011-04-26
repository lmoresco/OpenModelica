// name: ExternalFunction7
// status: correct
// teardown_command: rm -f ExternalFunction7_*

class ExternalFunction7
  function fn
    output Real r;
  external "C" r=mySum123({1.0,2.0,3.0}) annotation(Include="double mySum123(const double *rs) {return rs[0] + rs[1] + rs[2];}");
  end fn;

  constant Real r = fn();
end ExternalFunction7;

// Result:
// function ExternalFunction7.fn
//   output Real r;
// 
//   external "C";
// end ExternalFunction7.fn;
// 
// class ExternalFunction7
//   constant Real r = 6.0;
// end ExternalFunction7;
// endResult
