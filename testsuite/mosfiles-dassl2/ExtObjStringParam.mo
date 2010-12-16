model ExtObjStringParam
 
  class MyData
    extends ExternalObject;

    function constructor
      input String fileName;
      output MyData table;
      external "C" table = constructor(fileName) annotation(Library = "ExtObjStringParam.ext.o", Include = "#include \"ExtObjStringParam.ext.h\"");
    end constructor;

    function destructor
      input MyData table;
      external "C" destructor(table) annotation(Library = "ExtObjStringParam.ext.o", Include = "#include \"ExtObjStringParam.ext.h\"");
    end destructor;

  end MyData;
 
  parameter String DataFile = "sampledata.xml"; 
  MyData table = MyData(DataFile);

end ExtObjStringParam;
