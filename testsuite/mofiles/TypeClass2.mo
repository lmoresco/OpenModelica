// name: TypeClass2
// keywords: type
// status: incorrect
//
// Tests type declaration from a regular class, should be illegal
//

class IllegalClass
  Integer i;
end IllegalClass;

type IllegalType = IllegalClass;

model TypeClass2
  IllegalType it;
equation
  it.i = 1;
end TypeClass2;
