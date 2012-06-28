// name: dim10.mo
// keywords:
// status: correct
//


model M
  Real x[:, :] = {{1, 2, 3}, {1, 2, 3}};
end M;

// Result:
// 
// EXPANDED FORM:
// 
// class M
//   Real x[1,1] = 1;
//   Real x[1,2] = 2;
//   Real x[1,3] = 3;
//   Real x[2,1] = 1;
//   Real x[2,2] = 2;
//   Real x[2,3] = 3;
// end M;
// 
// 
// Found 6 components and 0 parameters.
// class M
//   Real x[1,1] = 1.0;
//   Real x[1,2] = 2.0;
//   Real x[1,3] = 3.0;
//   Real x[2,1] = 1.0;
//   Real x[2,2] = 2.0;
//   Real x[2,3] = 3.0;
// end M;
// endResult
