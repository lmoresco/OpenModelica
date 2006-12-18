// name:     SimplePeriodicSampler
// keywords: sample
// status:   correct
// 
// <insert description here>
// 

model Sampler
  parameter Real sample_interval = 0.1        "Sample period";
  Real x(start=5);
  Real y;
equation
  der(x) = -x;
  when sample(0, sample_interval) then
    y = x;
  end when;
end Sampler;


// fclass Sampler
// parameter Real sample_interval = 1 "Sample period";
// Real x(start = 5.0);
// Real y;
// equation
//   der(x) = -x;
//   when sample(0,sample_interval) then
//   y = x;
//   end when;
// end Sampler;
