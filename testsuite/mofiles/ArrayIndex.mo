// name:     ArrayIndex
// keywords: array, index
// status:   correct
// 
// This is a simple test of basic array handling. Bug reported by Hannes Edinger
// 

class myTestClass
  connector acausalConnectorR
    Real value;
  end acausalConnectorR;

  class encapsulatedArrayR2
    acausalConnectorR IN;
    acausalConnectorR OUT;
  protected 
    Real v[3]={1.1,2.2,3.3};
  equation 
    OUT.value=v[integer(IN.value)];
  end encapsulatedArrayR2;

  class someThingR
    parameter Real value=2.7;
    acausalConnectorR OUT;
  equation 
    OUT.value=value;
  end someThingR;

  model a2
    encapsulatedArrayR2 myTable;
    someThingR mySomeThingR;
  equation 
    connect(mySomeThingR.OUT,myTable.IN);
  end a2;

end myTestClass;
model myTestClass_a2
  extends myTestClass.a2;
end myTestClass_a2;
// Result:
// fclass myTestClass_a2
//   Real myTable.IN.value;
//   Real myTable.OUT.value;
//   protected Real myTable.v[1] = 1.1;
//   protected Real myTable.v[2] = 2.2;
//   protected Real myTable.v[3] = 3.3;
//   parameter Real mySomeThingR.value = 2.7;
//   Real mySomeThingR.OUT.value;
// equation
//   myTable.OUT.value = myTable.v[integer(myTable.IN.value)];
//   mySomeThingR.OUT.value = mySomeThingR.value;
//   mySomeThingR.OUT.value = myTable.IN.value;
// end myTestClass_a2;
// endResult
