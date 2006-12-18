// name:     DoubleWhenSequential
// keywords: when
// status:   correct
// 
// algorithm sections not yet implemented
// 

model DoubleWhenSequential
  Boolean close;          // Possible conflicting definitions resolved by
  //parameter Real time = 2;      // sequential assignments in an algorithm section
algorithm
  when time <= 2 then
    close := true;
  end when;

  when time <= 2 then
    close := false;
  end when;
end DoubleWhenSequential;


// fclass DoubleWhenSequential
// Boolean close;
// algorithm
//   when time <= 2.0 do
//     close := true;
//   end when;
//   when time <= 2.0 do
//     close := false;
//   end when;
// end DoubleWhenSequential;
