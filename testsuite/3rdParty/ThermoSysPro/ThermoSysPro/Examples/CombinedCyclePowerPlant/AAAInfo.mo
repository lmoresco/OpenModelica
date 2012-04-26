within ThermoSysPro.Examples.CombinedCyclePowerPlant;


class AAAInfo "Info" 
      annotation (DocumentationClass=true, Documentation(info="<html>
<p><b><font style=\"font-size: 12pt; color: #008000; \">Combined cycle power plant model </font></b></p>
<p><h4>Licensed by EDF under the Modelica License 2. </h4></p>
<p>Copyright &copy; EDF 2002 - 2012</p>
<p><i>This Modelica package is free software and the use is completely at your own risk; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <u>ThermoSysPro.UsersGuide.ModelicaLicense2</u> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a></i>. </p>
<p>Two models of the same combined cycle power plant are provided to simulate two different transients:</p>
<p><ul>
<li>CombinedCycle_Load_100_50, to simulate a load decrease from 100&percnt; to 50&percnt;</li>
<li>CombinedCycle_TripTAC, to simulate a full combustion turbine trip</li>
</ul></p>
<p>Initialization scripts are provided in order to set the correct iteration values. These scripts must be executed after model compilation and before model simulation.</p>
<p>The initialization script to be executed depends on the version of Dymola:</p>
<p><ul>
<li>Dymola 6.1: CombinedCycle_init_D6.1.mos</li>
<li>Dymola 7.4 FD01: CombinedCycle_init_D7.4_FD01.mos</li>
<li>Dymola 2012: CombinedCycle_init_D2012.mos</li>
</ul></p>
<p>They can be found in the directory ThermoSysPro\\Examples\\CombinedCyclePowerPlant\\</p>
<p>Starting from Dymola 7.4 FD01, you should execute the script AJ_D74_FD1.mos in order to get full advantage of the simulation speed-up provided by the analytic jacobian.This script should be run before model compilation.</p>
<p>Before executing the scripts, you should first set the default working directory to ThermoSysPro\\Examples\\CombinedCyclePowerPlant\\ using the Change Directory command in the File menu.</p>
<p>So the full procedure is:</p>
<p><ol>
<li>Open the model</li>
<li>Change the default working directory to ThermoSysPro\\Examples\\CombinedCyclePowerPlant\\</li>
<li>Execute script AJ_D74_FD1.mos for versions of Dymola starting from 7.4 FD01</li>
<li>Compile the model</li>
<li>Execute initialization script depending on Dymola version (e.g. CombinedCycle_init_D2012.mos for Dymola 2012)</li>
<li>Set simulation time to 2000 s or more</li>
<li>Simulate the model</li>
</ol></p>
<p>A conference paper explaining the two models can be found here: <a href=\"https://www.modelica.org/events/modelica2011/Proceedings/pages/papers/15_2_ID_115_a_fv.pdf\">https://www.modelica.org/events/modelica2011/Proceedings/pages/papers/15_2_ID_115_a_fv.pdf</a>. </p>
</html>"));
end AAAInfo;

