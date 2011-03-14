// name:     RecordConstant2
// keywords: record, constant
// status:   correct
// 
// Checks that it's possible to look up components through nestled record
// constants.
//

package P
  record R1
    Real r;
  end R1;

  record R2
    R1 r1;
  end R2;

  constant R2 cr(r1 = R1(r = 2.0));
end P;

model RecordConstant1
  constant Real r2 = P.cr.r1.r;
end RecordConstant1;

// Result:
// function P.R1 "Automatically generated record constructor for P.R1"
// input Real r;
// output R1 res;
// end P.R1;
// 
// class RecordConstant1
//   constant Real r2 = 2.0;
// end RecordConstant1;
// endResult
