// name: ArrayLogic
// keywords: array, operators, logic
// status: correct
//
// Tests vectorization of logical operators and, or, and not.
//

model ArrayLogic
  Boolean b[:] = {false, true};
  Boolean b2[:] = {true, false};
  Boolean nb[:] = not b;
  Boolean ab[:] = b and b2;
  Boolean ob[:] = b or b2;
  Boolean nb2[:,:] = not fill(b, 2);
  Boolean ab2[:,:] = fill(b, 2) and fill(b2, 2);
  Boolean ob2[:,:] = fill(b, 2) or fill(b2, 2);
end ArrayLogic;

// Result:
// class ArrayLogic
//   Boolean b[1] = false;
//   Boolean b[2] = true;
//   Boolean b2[1] = true;
//   Boolean b2[2] = false;
//   Boolean nb[1] = not b[1];
//   Boolean nb[2] = not b[2];
//   Boolean ab[1] = b[1] and b2[1];
//   Boolean ab[2] = b[2] and b2[2];
//   Boolean ob[1] = b[1] or b2[1];
//   Boolean ob[2] = b[2] or b2[2];
//   Boolean nb2[1,1] = not b[1];
//   Boolean nb2[1,2] = not b[2];
//   Boolean nb2[2,1] = not b[1];
//   Boolean nb2[2,2] = not b[2];
//   Boolean ab2[1,1] = b[1] and b2[1];
//   Boolean ab2[1,2] = b[2] and b2[2];
//   Boolean ab2[2,1] = b[1] and b2[1];
//   Boolean ab2[2,2] = b[2] and b2[2];
//   Boolean ob2[1,1] = b[1] or b2[1];
//   Boolean ob2[1,2] = b[2] or b2[2];
//   Boolean ob2[2,1] = b[1] or b2[1];
//   Boolean ob2[2,2] = b[2] or b2[2];
// end ArrayLogic;
// endResult
