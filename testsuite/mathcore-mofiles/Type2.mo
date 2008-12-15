// name:     Type2
// keywords: type,unknown
// status:   correct
// 
// What are valid connectors?  According to the report, only classes
// declared with `connector', or classes declared with `class' which
// adher to the restrictions for `connector'.
//
// The basic question is what classes a connector class may inherit from.
// 

record A
  Real x;
end A;

connector Type2 = A;
