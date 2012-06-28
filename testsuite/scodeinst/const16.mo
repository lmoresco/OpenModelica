// name: const16.mo
// keywords:
// status: correct
//

package P
  package P
    constant Integer j = 2;

    package P
      constant Integer i = j;
    end P;
  end P;

  model M
    Real x = P.P.i;
  end M;
end P;

model M
  extends P.M;
end M;

// Result:
// 
// EXPANDED FORM:
// 
// class M
//   Real x = 2;
// end M;
// 
// 
// Found 1 components and 0 parameters.
// class M
//   Real x = 2.0;
// end M;
// endResult
