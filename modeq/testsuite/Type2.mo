// name:     Type2
// keywords: type,unknown
// status:   incorrect
// 
// What are valid connectors?  According to the report, only classes
// declared with `connector', or classes declared with `class' which
// adher to the restrictions for `connector'.
//
// On the other hand, records always adher to those restrictions.
// 

record A
  Real x;
end A;

connector C = A;
