package TestPackage 
  class MeshData 
    extends ExternalObject;
    function constructor 
      annotation (Include="#include <meshext.h>", Library="meshext");
      input Real xPolygon[:, 2];
      input Integer bc[size(xPolygon, 1)];
      input Real refine=0.5;
      //  h in (0,1) controls the refinement of triangles, less is finer
      output MeshData mesh;
    external "C" mesh = create_mesh2d_data(xPolygon, size(xPolygon, 1),
        size(xPolygon, 2), bc, size(bc, 1), refine);
      
    end constructor;
    
    function destructor "Release storage of table" 
      annotation (Include="#include <meshext.h>", Library="meshext");
      input MeshData mesh;
    external "C" free_mesh2d_data(mesh);
    end destructor;
  end MeshData;

  function getSizes "Reads sizes mesh-data 2D" 
    annotation (Include="#include <meshext.h>", Library="meshext");
    input MeshData mesh;
    output Integer s[3] "Sizes of mesh-data {vertices, edges, triangles}";
  external "C" get_mesh2d_sizes(mesh, s, size(s, 1));
    
  end getSizes;

  function getVertex "Reads one vertex coordinate" 
    annotation (Include="#include <meshext.h>", Library="meshext");
    input MeshData mesh;
    input Integer i "Vertex index";
    output Real v[3];
  external "C" get_mesh2d_vertex(mesh, i, v, size(v, 1));
  end getVertex;
end TestPackage;
