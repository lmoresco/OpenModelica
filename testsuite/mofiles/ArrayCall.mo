// name: ArrayCall
// status: correct
// Tests that there are no ASUB expressions in the function

class ArrayCall
  function fn
    input Real r;
    output Real array[10];
    annotation(__OpenModelica_EarlyInline = true);
  algorithm
    array := cos(r*(1.0:10.0));
  end fn;
  Real x[10] = fn(time);
end ArrayCall;

// Result:
// class ArrayCall
//   Real x[1] = cos(time);
//   Real x[2] = cos(time * 2.0);
//   Real x[3] = cos(time * 3.0);
//   Real x[4] = cos(time * 4.0);
//   Real x[5] = cos(time * 5.0);
//   Real x[6] = cos(time * 6.0);
//   Real x[7] = cos(time * 7.0);
//   Real x[8] = cos(time * 8.0);
//   Real x[9] = cos(time * 9.0);
//   Real x[10] = cos(time * 10.0);
// end ArrayCall;
// endResult
