// name:     Import3
// keywords: import
// status:   correct
// 
// Import in enclosing scopes is valid.

package A
  package B
    partial model C
      Real x;
    end C;
    model D
      extends C(x=5);
    end D;
  end B;
  package B1
    model C
      extends B.C(x=4);
    end C;
  end B1;
  package B2
    model C
      extends B.C(x=7);
    end C;
    model E=B.C(x=6);
  end B2;
end A;
   
package B
  import A.B.*;
  import A.B2.*;
  import A.B1.C;
  import MyC=A.B2.C;
  package A
  model F
    C c;
    D d;
    E e;
    MyC myc;
  end F;
  end A;
end B;

model Import3
  extends B.A.F;
end Import3;

// fclass Import3
//   Real c.x=4; // A.B1.C via import A.B1.C
//   Real d.x=5; // A.B.D via import A.B.*;
//   Real e.x=6; // A.B2.C via import A.B2.*;
//   Real myc.x=7; // A.B2.E via import MyC=A.B2.C;