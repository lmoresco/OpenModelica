// name:     ArrayDim3
// keywords: algorithm, equation
// status:   correct
//
// Drmodelica: 
// 

model ArrayDim3
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

equation
  for i in 1:n loop
    for j in 1:m loop
      for l in 1:k loop
        arr3d[i,j,l] = i+j+l;
      end for;
    end for;
  end for;
end ArrayDim3;


// fclass ArrayDim3
// parameter Integer n = 1;
// parameter Integer m = 2;
// parameter Integer k = 3;
// Real positionvector[1] = 1.0;
// Real positionvector[2] = 2.0;
// Real positionvector[3] = 3.0;
// Real identitymatrix[1,1] = 1.0;
// Real identitymatrix[1,2] = 0.0;
// Real identitymatrix[1,3] = 0.0;
// Real identitymatrix[2,1] = 0.0;
// Real identitymatrix[2,2] = 1.0;
// Real identitymatrix[2,3] = 0.0;
// Real identitymatrix[3,1] = 0.0;
// Real identitymatrix[3,2] = 0.0;
// Real identitymatrix[3,3] = 1.0;
// Integer arr3d[1,1,1];
// Integer arr3d[1,1,2];
// Integer arr3d[1,1,3];
// Integer arr3d[1,2,1];
// Integer arr3d[1,2,2];
// Integer arr3d[1,2,3];
// Boolean truthvalues[1] = false;
// Boolean truthvalues[2] = true;
// equation
//   arr3d[1,1,1] = 3;
//   arr3d[1,1,2] = 4;
//   arr3d[1,1,3] = 5;
//   arr3d[1,2,1] = 4;
//   arr3d[1,2,2] = 5;
//   arr3d[1,2,3] = 6;
// end ArrayDim3;
