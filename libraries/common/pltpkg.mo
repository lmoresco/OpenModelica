
within Modelica;

package pltpkg
  
  function pltTable
    input Real table[:,:];
    input String columnLabels[size(table,2)-1];
    input String title="Plot by OpenModelica";
    input Boolean grid = true;
    input Boolean legend = true;
    input Boolean logX = false;
    input Boolean logY = false;
    input Boolean points = true;
    input String yLabel="";
    input String interpolation="linear";
    output Boolean b;
    
    external "C" b = pltTable(table, size(table, 1), size(table, 2), columnLabels, size(legend, 1), title, yLabel,legend, grid, logX, logY, interpolation, points)
    annotation(Library = "sendData");
  end pltTable;

  function plt
    input String var;
    input String mdl = "";
    input String title = "Plot by OpenModelica";
    input String xLabel = "time";
    input String yLabel = "";
    input Boolean legend = true;
    input Boolean grid = true;
    input Boolean logX = false;
    input Boolean logY = false;
    input String interpolation = "linear";
    input Boolean drawPoints = true;
    input String range = "0.0,0.0,0.0,0.0";
    output Boolean b;

    external "C" b = plt(var, mdl, title, xLabel, yLabel,legend, grid, logX, logY, interpolation,drawPoints, range) 
    annotation(Library = "sendData");
  end plt;

  function pltParametric
    input String var1;
    input String var2;
    input String mdl = "";
    input String title = "Plot by OpenModelica";
    input String xLabel = "time";
    input String yLabel = "";
    input Boolean legend = true;
    input Boolean grid = true;
    input Boolean logX = false;
    input Boolean logY = false;
    input String interpolation = "linear";
    input Boolean drawPoints = true;
    input String range = "0.0,0.0,0.0,0.0";
    external "C" b = pltParametric(var1, var2, mdl, title, xLabel, yLabel,legend, grid, logX, logY, interpolation, drawPoints, range) 
    annotation(Library = "sendData");
  end pltParametric;

  function hold
    input Boolean on = true;
    output Boolean b;
    external "C" b = hold(on) annotation(Library = "sendData");
  end hold;

  function clear
    output Boolean b;
    external "C" b = clear() annotation(Library = "sendData");
  end clear;

  function ellipse
    input Real x0;
    input Real y0;
    input Real x1;
    input Real y1;
    input String color = "black";
    input Integer colorR = -1;
    input Integer colorG = -1;
    input Integer colorB = -1;
    // input Integer colorRGB[3] = {-1, -1, -1};
    input String fillColor = "white";
    input Integer fillColorR = -1;
    input Integer fillColorG = -1;
    input Integer fillColorB = -1;
    // input Integer fillColorRGB[3] = {-1, -1, -1};
    output Boolean b;
    
    external "C" b = ellipse(x0,y0, x1, y1, color,colorR, colorG, colorB, 3, fillColor, fillColorR, fillColorG, fillColorB,3) 
    annotation(Library = "sendData");
  end ellipse;

  function rect
    input Real x0;
    input Real y0;
    input Real x1;
    input Real y1;
    input String color = "black";
    input Integer colorR = -1;
    input Integer colorG = -1;
    input Integer colorB = -1;
    input String fillColor = "white";
    input Integer fillColorR = -1;
    input Integer fillColorG = -1;
    input Integer fillColorB = -1;
    output Boolean b;
    
    external "C" b = rect(x0, y0, x1, y1, color, colorR, colorG, colorB, fillColor, fillColorR, fillColorG, fillColorB)
    annotation(Library = "sendData");
  end rect;

  function line
    input Real x0;
    input Real y0;
    input Real x1;
    input Real y1;
    input String color = "black";
    input Integer colorR = -1;
    input Integer colorG = -1;
    input Integer colorB = -1;
    input String fillColor = "black";
    input Integer fillColorR = -1;
    input Integer fillColorG = -1;
    input Integer fillColorB = -1;
    output Boolean b;
    
    external "C" b = line(x0, y0, x1, y1, color, colorR, colorG, colorB, fillColor, fillColorR, fillColorG, fillColorB)
    annotation(Library = "-L$OPENMODELICAHOME/ -lsendData -lQtCore4 -lQtNetwork4 -lQtGui4");
  end line;

  function wait
    input Integer msecs;
    output Boolean b;
    
    external "C" b = pltWait(msecs) annotation(Library = "sendData");
  end wait;

end pltpkg;