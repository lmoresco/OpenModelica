// name:     loadFileInteractiveQualified
// keywords: within test
// status: correct
//
// within test, first should load loadFileInteractiveQualifiedInit.mo
//

within Something.Somewhere;

class Stuff

  Real x;
  Real y;

end Stuff;

class Stuff2 
  extends Stuff;
  Real z;
end Stuff2;


class BlaBla
  import HelloWorld.*;
  type X = Y;
  record Z
   Real x;
   Real y;
  end Z;
end BlaBla;

