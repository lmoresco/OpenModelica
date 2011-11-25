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
//   Real x[2] = cos(2.0 * time);
//   Real x[3] = cos(3.0 * time);
//   Real x[4] = cos(4.0 * time);
//   Real x[5] = cos(5.0 * time);
//   Real x[6] = cos(6.0 * time);
//   Real x[7] = cos(7.0 * time);
//   Real x[8] = cos(8.0 * time);
//   Real x[9] = cos(9.0 * time);
//   Real x[10] = cos(10.0 * time);
// end ArrayCall;
// endResult
