// name:     ConstructFunc
// keywords: array
// status:   correct
// 
// Array constructs.
// 

class ConstructFunc
  Real z[2,3]  = zeros(2, 3);  // Constructs the matrix {{0,0,0}, {0,0,0}}
  Real o[3]    = ones(3);      // Constructs the vector {1, 1, 1}
  Real f[2,2]  = fill(2.1,2,2); // Constructs the matrix {{2.1, 2.1}, {2.1, 2.1}}
  Boolean check[3, 4]  = fill(true, 3, 4);   // Fills a Boolean matrix
  Real id[3,3]    = identity(3);    // Creates the matrix {{1,0,0}, {0,1,0}, {0, 0, 1}}
  Real di[3,3] = diagonal({1, 2, 3}); // Creates the matrix {{1, 0, 0}, {0, 2, 0}, {0, 0, 3}}
  Real ls[5] = linspace(0.0, 8.0, 5);  // Computes the vector {0.0, 2.0, 4.0, 6.0, 8.0}
end ConstructFunc;

// Result:
// fclass ConstructFunc
// Real z[1,1] = 0.0;
// Real z[1,2] = 0.0;
// Real z[1,3] = 0.0;
// Real z[2,1] = 0.0;
// Real z[2,2] = 0.0;
// Real z[2,3] = 0.0;
// Real o[1] = 1.0;
// Real o[2] = 1.0;
// Real o[3] = 1.0;
// Real f[1,1] = 2.1;
// Real f[1,2] = 2.1;
// Real f[2,1] = 2.1;
// Real f[2,2] = 2.1;
// Boolean check[1,1] = true;
// Boolean check[1,2] = true;
// Boolean check[1,3] = true;
// Boolean check[1,4] = true;
// Boolean check[2,1] = true;
// Boolean check[2,2] = true;
// Boolean check[2,3] = true;
// Boolean check[2,4] = true;
// Boolean check[3,1] = true;
// Boolean check[3,2] = true;
// Boolean check[3,3] = true;
// Boolean check[3,4] = true;
// Real id[1,1] = 1.0;
// Real id[1,2] = 0.0;
// Real id[1,3] = 0.0;
// Real id[2,1] = 0.0;
// Real id[2,2] = 1.0;
// Real id[2,3] = 0.0;
// Real id[3,1] = 0.0;
// Real id[3,2] = 0.0;
// Real id[3,3] = 1.0;
// Real di[1,1] = 1.0;
// Real di[1,2] = 0.0;
// Real di[1,3] = 0.0;
// Real di[2,1] = 0.0;
// Real di[2,2] = 2.0;
// Real di[2,3] = 0.0;
// Real di[3,1] = 0.0;
// Real di[3,2] = 0.0;
// Real di[3,3] = 3.0;
// Real ls[1] = 0.0;
// Real ls[2] = 2.0;
// Real ls[3] = 4.0;
// Real ls[4] = 6.0;
// Real ls[5] = 8.0;
// end ConstructFunc;
// endResult
