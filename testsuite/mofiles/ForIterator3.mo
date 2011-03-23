// name: ForIterator3
// status: correct
class ForIterator3
  constant String s1[3,4] = {i+j for i in {"a","b","c"}, j in {"d","e","f","g"}};
  constant String s2 = sum(i+j for i in {"a","b","c"}, j in {"d","e","f","g"});
  constant String s3[:,:,:,:] = {i+j+k+l for i in {"a","b","c"}, j in {"d","e","f","g"}, k in {"h"}, l in {"1","2","3","4"}};
end ForIterator3;

// Result:
// class ForIterator3
//   constant String s1[1,1] = "ad";
//   constant String s1[1,2] = "ae";
//   constant String s1[1,3] = "af";
//   constant String s1[1,4] = "ag";
//   constant String s1[2,1] = "bd";
//   constant String s1[2,2] = "be";
//   constant String s1[2,3] = "bf";
//   constant String s1[2,4] = "bg";
//   constant String s1[3,1] = "cd";
//   constant String s1[3,2] = "ce";
//   constant String s1[3,3] = "cf";
//   constant String s1[3,4] = "cg";
//   constant String s2 = "adaeafagbdbebfbgcdcecfcg";
//   constant String s3[1,1,1,1] = "adh1";
//   constant String s3[1,1,1,2] = "adh2";
//   constant String s3[1,1,1,3] = "adh3";
//   constant String s3[1,1,1,4] = "adh4";
//   constant String s3[1,2,1,1] = "aeh1";
//   constant String s3[1,2,1,2] = "aeh2";
//   constant String s3[1,2,1,3] = "aeh3";
//   constant String s3[1,2,1,4] = "aeh4";
//   constant String s3[1,3,1,1] = "afh1";
//   constant String s3[1,3,1,2] = "afh2";
//   constant String s3[1,3,1,3] = "afh3";
//   constant String s3[1,3,1,4] = "afh4";
//   constant String s3[1,4,1,1] = "agh1";
//   constant String s3[1,4,1,2] = "agh2";
//   constant String s3[1,4,1,3] = "agh3";
//   constant String s3[1,4,1,4] = "agh4";
//   constant String s3[2,1,1,1] = "bdh1";
//   constant String s3[2,1,1,2] = "bdh2";
//   constant String s3[2,1,1,3] = "bdh3";
//   constant String s3[2,1,1,4] = "bdh4";
//   constant String s3[2,2,1,1] = "beh1";
//   constant String s3[2,2,1,2] = "beh2";
//   constant String s3[2,2,1,3] = "beh3";
//   constant String s3[2,2,1,4] = "beh4";
//   constant String s3[2,3,1,1] = "bfh1";
//   constant String s3[2,3,1,2] = "bfh2";
//   constant String s3[2,3,1,3] = "bfh3";
//   constant String s3[2,3,1,4] = "bfh4";
//   constant String s3[2,4,1,1] = "bgh1";
//   constant String s3[2,4,1,2] = "bgh2";
//   constant String s3[2,4,1,3] = "bgh3";
//   constant String s3[2,4,1,4] = "bgh4";
//   constant String s3[3,1,1,1] = "cdh1";
//   constant String s3[3,1,1,2] = "cdh2";
//   constant String s3[3,1,1,3] = "cdh3";
//   constant String s3[3,1,1,4] = "cdh4";
//   constant String s3[3,2,1,1] = "ceh1";
//   constant String s3[3,2,1,2] = "ceh2";
//   constant String s3[3,2,1,3] = "ceh3";
//   constant String s3[3,2,1,4] = "ceh4";
//   constant String s3[3,3,1,1] = "cfh1";
//   constant String s3[3,3,1,2] = "cfh2";
//   constant String s3[3,3,1,3] = "cfh3";
//   constant String s3[3,3,1,4] = "cfh4";
//   constant String s3[3,4,1,1] = "cgh1";
//   constant String s3[3,4,1,2] = "cgh2";
//   constant String s3[3,4,1,3] = "cgh3";
//   constant String s3[3,4,1,4] = "cgh4";
// end ForIterator3;
// endResult
