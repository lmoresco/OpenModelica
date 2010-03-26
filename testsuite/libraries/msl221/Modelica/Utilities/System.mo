within Modelica.Utilities;
package System "Interaction with environment"
  extends Modelica.Icons.Library;
  annotation(preferedView="info", Documentation(info="
<HTML>
<p>
This package contains functions to interact with the environment.
</p>
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  function getWorkDirectory "Get full path name of work directory"
    extends Modelica.Icons.Function;
    output String directory "Full path name of work directory";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));

    external "C" directory=ModelicaInternal_getcwd(0) ;
    annotation(Documentation(info="<html>
 
</html>"));
  end getWorkDirectory;

  function setWorkDirectory "Set work directory"
    extends Modelica.Icons.Function;
    input String directory "New work directory";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));

    external "C" ModelicaInternal_chdir(directory) ;
    annotation(Documentation(info="<html>
  
</html>"));
  end setWorkDirectory;

  function getEnvironmentVariable "Get content of environment variable"
    extends Modelica.Icons.Function;
    input String name "Name of environment variable";
    input Boolean convertToSlash=false "True, if native directory separators in 'result' shall be changed to '/'";
    output String content "Content of environment variable (empty, if not existent)";
    output Boolean exist "= true, if environment variable exists; = false, if it does not exist";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));

    external "C" ModelicaInternal_getenv(name,convertToSlash,content,exist) ;
    annotation(Documentation(info="<html>
  
</html>"));
  end getEnvironmentVariable;

  function setEnvironmentVariable "Set content of local environment variable"
    extends Modelica.Icons.Function;
    input String name "Name of environment variable";
    input String content "Value of the environment variable";
    input Boolean convertFromSlash=false "True, if '/' in content shall be changed to the native directory separator";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));

    external "C" ModelicaInternal_setenv(name,content,convertFromSlash) ;
    annotation(Documentation(info="<html>
    
</html>"));
  end setEnvironmentVariable;

  function command "Execute command in default shell"
    extends Modelica.Icons.Function;
    input String string "String to be passed to shell";
    output Integer result "Return value from command (depends on environment)";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));

    external "C" result=system(string) ;
    annotation(Documentation(info="<html>
 
</html>"));
  end command;

  function exit "Terminate execution of Modelica environment"
    extends Modelica.Icons.Function;
    input Integer status=0 "Result to be returned by environment (0 means success)";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));

    external "C" ModelicaInternal_exit(status) ;

  end exit;

end System;
