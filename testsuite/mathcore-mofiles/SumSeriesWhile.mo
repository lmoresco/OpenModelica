// name:     SumSeriesWhile
// keywords: while statement
// status:   correct

model SumSeries
  parameter Real eps = 1.E-6;
  Integer i;
  Real sum;
  Real delta;
algorithm
  i := 1;
  delta := exp(-0.01 * i);
  while delta >= eps loop
    sum := sum + delta;
    i := i + 1;
    delta := exp(-0.01 * i);
  end while;
end SumSeries;

// Result:
// fclass SumSeries
// parameter Real eps = 1e-06;
// Integer i;
// Real sum;
// Real delta;
// algorithm
//   i := 1;
//   delta := exp(-(0.01 * Real(i)));
//   while delta >= eps loop
//     sum := sum + delta;
//     i := i + 1;
//     delta := exp(-(0.01 * Real(i)));
//   end while;
// end SumSeries;
// endResult
