// name: EndUnknown
// status: correct

model EndUnknown

  function simpson "Simpson's numerical integration formula"
    input Real vals[:] "function values";
    input Real a "Lower limit";
    input Real b "Upper limit";
    output Real res;
    algorithm 
    //assert(size(vals,1) >= 3,"Not enough points for Simpson integration!");
    if size(vals, 1) >= 3 then
      res := (b - a)/(size(vals, 1) - 1)*(vals[1] + 2*sum(i for i in vals[3:2:end - 1])
        + 4*sum(i for i in vals[2:2:end - 1]) + vals[end])/3;
    else
      res := (b - a)*sum(vals)/2;
    end if;
  end simpson;

  parameter Real a = simpson({0.4, 0.3, 0.1, 0.2, 0.3},0,1);
  Real x(start=1);
equation
  der(x) = -a * x;
end EndUnknown;

// Result:
// function EndUnknown.simpson "Simpson's numerical integration formula"
//   input Real[:] vals "function values";
//   input Real a "Lower limit";
//   input Real b "Upper limit";
//   output Real res;
// algorithm
//   if size(vals,1) >= 3 then
//     res := (vals[1] + 2.0 * <reduction>sum(i for i in vals[3:2:(size(vals,1)) + -1]) + 4.0 * <reduction>sum(i for i in vals[2:2:(size(vals,1)) + -1]) + vals[size(vals,1)] * (b - a)) / (/*REAL*/(size(vals,1) + -1) * 3.0);
//   else
//     res := (b - a * sum(vals)) / 2.0;
//   end if;
// end EndUnknown.simpson;
// 
// class EndUnknown
//   parameter Real a = 0.241666666666667;
//   Real x(start = 1.0);
// equation
//   der(x) = (-a) * x;
// end EndUnknown;
// endResult
