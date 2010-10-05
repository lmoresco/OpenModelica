// name: WhenNestedEquation
// keywords: when, nested, equation
// status: incorrect
//
// Test detection of nested when-equations, which are not allowed.
// Fix for bug 1189: http://openmodelica.ida.liu.se:8080/cb/issue/1189
//

model ErrorNestedWhen
  Real x,y1,y2;
equation 
  when x > 2 then
    when y1 > 3 then
      y2=sin(x);
    end when;
  end when;
end ErrorNestedWhen;

// Result:
// Error processing file: WhenNestedEquation.mo
// [WhenNestedEquation.mo:12:3-16:11:writable] Error: In scope ErrorNestedWhen: Invalid nested when statements:
// when x > 2 then
// when y1 > 3 then
// y2 = sin(x);
// end when;
// end when;
// 
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
