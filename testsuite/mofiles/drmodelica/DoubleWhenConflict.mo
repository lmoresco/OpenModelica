// name:     DoubleWhenConflict
// keywords: equations when
// status:   incorrect
// 
// Close defined by two equations
//

model DoubleWhenConflict
  Boolean close; // Erroneous model:
  parameter Real x = 5;
algorithm
  when x >= 5 then
    close := true;
  end when;
algorithm
  when x <= 5 then
    close := false;
  end when;
end DoubleWhenConflict;