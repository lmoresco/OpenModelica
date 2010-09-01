// name:     SliceAssignment
// keywords: slice, assignment
// status:   correct
// 
// Checks that correct code is generated for slice assignments.
// 

model SliceAssignment
  parameter Real data[:, 3] = {{0.0, 1.0, 2.0}, {3.0, 4.0, 5.0}, {6.0, 7.0, 8.0}};
  parameter Real x[:] = data[:, 1];
  parameter Real y[:] = data[:, 2];
  parameter Real z[:] = data[:, 3];
end SliceAssignment;
