// name:     ArrayDim1
// keywords: algorithm, equation
// status:   correct


model ArrayDim1
  import Modelica.SIunits.Voltage;
  parameter Integer n = 1;
  parameter Integer m = 2;
  parameter Integer k = 3;

  // 3-dimensional position vector
  Real[3] positionvector = {1, 2, 3};

  // transformation matrix
  Real[3,3] identitymatrix = {{1,0,0},{0,1,0},{0,0,1}};

  // A 3-dimensional array
  Integer[n,m,k] arr3d;

  // A boolean vector
  Boolean[2] truthvalues = {false, true};

  // A vector of voltage values
  Voltage[10] voltagevector;

equation
  voltagevector = {1,2,3,4,5,6,7,8,9,0}
  for i in 1:n loop
    for j in 1:m loop
      for l in 1:k loop
        arr3d[i,j,l] = i+j+l;
      end for;
    end for;
  end for;
end ArrayDim1;

