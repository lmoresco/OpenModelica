// name: WhenNested
// keywords: when, nested
// status: incorrect
//
// Test detection of nested when-statements, which are not allowed.
// Fix for bug 1189: http://openmodelica.ida.liu.se:8080/cb/issue/1189
//

model WhenNested
  Integer x;
  Integer y;
algorithm
  when sample(0, 1) then
    if time > 1 then
      when x > 0 then
        y := 3;
      end when;
    end if;
  end when;
end WhenNested;

// Result:
// Error processing file: WhenNested.mo
// Error: In scope WhenNested: Invalid nested when statements:
// when sample(0, 1) then
//   if time > 1 then 
//     when x > 0 then
//       y:=3;
//   
//   end when;
// 
//   else 
//   end if;
// 
// end when;
// 
// Error: Error occured while flattening model 
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
