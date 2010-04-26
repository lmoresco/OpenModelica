package ModelicaServices
  "Models and functions used in the Modelica Standard Library requiring a tool specific implementation"

package Animation "Models and functions for 3-dim. animation"

model Shape
  "Different visual shapes with variable size; all data have to be set as modifiers (see info layer)"
  extends
    Modelica.Utilities.Internal.PartialModelicaServices.Animation.PartialShape;

    import T = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;
    import SI = Modelica.SIunits;
    import Modelica.Mechanics.MultiBody.Frames;
    import Modelica.Mechanics.MultiBody.Types;

    function PackShape
      input Types.ShapeType shapeType;
      output Real pack;
    algorithm 
      pack:=1.2;
    end PackShape;
    
    function PackMaterial
      input Real material1;
      input Real material2;
      input Real material3;
      input Types.SpecularCoefficient sp;
      output Real mat;
    algorithm 
      mat:=material1 + material2 + material3 + sp;
    end PackMaterial;

protected
  Real abs_n_x(final unit="1")=Modelica.Math.Vectors.length(
                             lengthDirection);
  Real e_x[3](each final unit="1")=noEvent(if abs_n_x < 1.e-10 then {1,0,0} else lengthDirection
      /abs_n_x);
  Real n_z_aux[3](each final unit="1")=cross(e_x, widthDirection);
  Real e_y[3](each final unit="1")=noEvent(cross(Modelica.Math.Vectors.normalize(
                                             cross(e_x, if n_z_aux*n_z_aux
       > 1.0e-6 then widthDirection else (if abs(e_x[1]) > 1.0e-6 then {0,1,
      0} else {1,0,0}))), e_x));
  output Real Form;
public
  output Real rxvisobj[3](each final unit="1")
    "x-axis unit vector of shape, resolved in world frame";
  output Real ryvisobj[3](each final unit="1")
    "y-axis unit vector of shape, resolved in world frame";
  output SI.Position rvisobj[3]
    "position vector from world frame to shape frame, resolved in world frame";

protected
  output SI.Length size[3] "{length,width,height} of shape";
  output Real Material;
  output Real Extra;

equation
  /* Outputs to file. */
  Form = (987000 + PackShape(shapeType))*1E20;
  /*
  rxry = Frames.TransformationMatrices.to_exy(
    Frames.TransformationMatrices.absoluteRotation(R.T,
    Frames.TransformationMatrices.from_nxy(lengthDirection, widthDirection)));
  rxvisobj = rxry[:, 1];
  ryvisobj = rxry[:, 2];
*/
  rxvisobj = transpose(R.T)*e_x;
  ryvisobj = transpose(R.T)*e_y;
  rvisobj = r + T.resolve1(R.T, r_shape);
  size = {length,width,height};
  Material = PackMaterial(color[1]/255.0, color[2]/255.0, color[3]/255.0,
    specularCoefficient);
  Extra = extra;
end Shape;
end Animation;
end ModelicaServices;

package Modelica "Modelica Standard Library (Version 3.1)"
extends Modelica.Icons.Library;

  package Blocks
  "Library of basic input/output control blocks (continuous, discrete, logical, table blocks)"
  import SI = Modelica.SIunits;
  extends Modelica.Icons.Library2;

    package Continuous
    "Library of continuous control blocks with internal states"
      import Modelica.Blocks.Interfaces;
      import Modelica.SIunits;
      extends Modelica.Icons.Library;

      block PI "Proportional-Integral controller"
        import Modelica.Blocks.Types.Init;
        parameter Real k=1 "Gain";
        parameter SIunits.Time T(start=1,min=Modelica.Constants.small)
        "Time Constant (T>0 required)";
        parameter Modelica.Blocks.Types.Init initType=Modelica.Blocks.Types.Init.NoInit
        "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)";
        parameter Real x_start=0 "Initial or guess value of state";
        parameter Real y_start=0 "Initial value of output";

        extends Interfaces.SISO;
        output Real x(start=x_start) "State of block";

      initial equation
        if initType == Init.SteadyState then
          der(x) = 0;
        elseif initType == Init.InitialState then
          x = x_start;
        elseif initType == Init.InitialOutput then
          y = y_start;
        end if;
      equation
        der(x) = u/T;
        y = k*(x + u);
      end PI;
    end Continuous;

    package Interfaces
    "Library of connectors and partial models for input/output blocks"
      import Modelica.SIunits;
        extends Modelica.Icons.Library;

    connector RealInput = input Real "'input Real' as connector";

    connector RealOutput = output Real "'output Real' as connector";

    connector BooleanInput = input Boolean "'input Boolean' as connector";

    connector BooleanOutput = output Boolean "'output Boolean' as connector";

        partial block BlockIcon "Basic graphical layout of input/output block"


        end BlockIcon;

        partial block SO "Single Output continuous control block"
          extends BlockIcon;

          RealOutput y "Connector of Real output signal";

        end SO;

        partial block SISO
      "Single Input Single Output continuous control block"
          extends BlockIcon;

          RealInput u "Connector of Real input signal";
          RealOutput y "Connector of Real output signal";
        end SISO;

        partial block BooleanBlockIcon
      "Basic graphical layout of Boolean block"


        end BooleanBlockIcon;
    end Interfaces;

    package Logical
    "Library of components with Boolean input and output signals"
        extends Modelica.Icons.Library;

      block TerminateSimulation
      "Terminate simulation if condition is fullfilled"

        Modelica.Blocks.Interfaces.BooleanOutput condition=false
        "Terminate simulation when condition becomes true";
        parameter String terminationText = "... End condition reached"
        "Text that will be displayed when simulation is terminated";

      equation
        when condition then
           terminate(terminationText);
        end when;
      end TerminateSimulation;
    end Logical;

    package Math "Library of mathematical functions as input/output blocks"
      import Modelica.SIunits;
      import Modelica.Blocks.Interfaces;
      extends Modelica.Icons.Library;

          block Gain "Output the product of a gain value with the input signal"

            parameter Real k(start=1) "Gain value multiplied with input signal";
    public
            Interfaces.RealInput u "Input signal connector";
            Interfaces.RealOutput y "Output signal connector";

          equation
            y = k*u;
          end Gain;

          block Feedback
      "Output difference between commanded and feedback input"

            input Interfaces.RealInput u1;
            input Interfaces.RealInput u2;
            output Interfaces.RealOutput y;

          equation
            y = u1 - u2;
          end Feedback;

          block Add3 "Output the sum of the three inputs"
            extends Interfaces.BlockIcon;

            parameter Real k1=+1 "Gain of upper input";
            parameter Real k2=+1 "Gain of middle input";
            parameter Real k3=+1 "Gain of lower input";
            input Interfaces.RealInput u1 "Connector 1 of Real input signals";
            input Interfaces.RealInput u2 "Connector 2 of Real input signals";
            input Interfaces.RealInput u3 "Connector 3 of Real input signals";
            output Interfaces.RealOutput y "Connector of Real output signals";

          equation
            y = k1*u1 + k2*u2 + k3*u3;
          end Add3;
    end Math;

    package Routing "Library of blocks to combine and extract signals"
      extends Icons.Library;

      model RealPassThrough "Pass a Real signal through without modification"

        extends Modelica.Blocks.Interfaces.BlockIcon;

        Modelica.Blocks.Interfaces.RealInput u "Input signal";
        Modelica.Blocks.Interfaces.RealOutput y "Output signal";
      equation
        y = u;
      end RealPassThrough;

      model BooleanPassThrough
      "Pass a Boolean signal through without modification"
        extends Modelica.Blocks.Interfaces.BooleanBlockIcon;

        Modelica.Blocks.Interfaces.BooleanInput u "Input signal";
        Modelica.Blocks.Interfaces.BooleanOutput y "Output signal";
      equation
        y = u;
      end BooleanPassThrough;
    end Routing;

    package Sources
    "Library of signal source blocks generating Real and Boolean signals"
      import Modelica.Blocks.Interfaces;
      import Modelica.SIunits;
          extends Modelica.Icons.Library;

          block Constant "Generate constant signal of type Real"
            parameter Real k(start=1) "Constant output value";
            extends Interfaces.SO;

          equation
            y = k;
          end Constant;

      block KinematicPTP2
      "Move as fast as possible from start to end position within given kinematic constraints with output signals q, qd=der(q), qdd=der(qd)"
        import SI = Modelica.SIunits;
        parameter Real q_begin[:] = {0} "Start position";
        parameter Real q_end[:] "End position";
        parameter Real qd_max[:](each final min=Modelica.Constants.small)
        "Maximum velocities der(q)";
        parameter Real qdd_max[:](each final min=Modelica.Constants.small)
        "Maximum accelerations der(qd)";
        parameter Modelica.SIunits.Time startTime=0
        "Time instant at which movement starts";

        extends Modelica.Blocks.Interfaces.BlockIcon;
        final parameter Integer nout=max([size(q_begin, 1); size(q_end, 1); size(
            qd_max, 1); size(qdd_max, 1)])
        "Number of output signals (= dimension of q, qd, qdd, moving)";
        output Modelica.SIunits.Time endTime
        "Time instant at which movement stops";

        Modelica.Blocks.Interfaces.RealOutput q[nout]
        "Reference position of path planning";
        Modelica.Blocks.Interfaces.RealOutput qd[nout]
        "Reference speed of path planning";
        Modelica.Blocks.Interfaces.RealOutput qdd[nout]
        "Reference acceleration of path planning";
        Modelica.Blocks.Interfaces.BooleanOutput moving[nout]
        "= true, if end position not yet reached; = false, if end position reached or axis is completely at rest";

    protected
        parameter Real p_q_begin[nout]=(if size(q_begin, 1) == 1 then ones(nout)*
            q_begin[1] else q_begin);
        parameter Real p_q_end[nout]=(if size(q_end, 1) == 1 then ones(nout)*
            q_end[1] else q_end);
        parameter Real p_qd_max[nout]=(if size(qd_max, 1) == 1 then ones(nout)*
            qd_max[1] else qd_max);
        parameter Real p_qdd_max[nout]=(if size(qdd_max, 1) == 1 then ones(nout)*
            qdd_max[1] else qdd_max);
        parameter Real p_deltaq[nout]=p_q_end - p_q_begin;
        constant Real eps=10*Modelica.Constants.eps;
        Boolean motion_ref;
        Real sd_max_inv;
        Real sdd_max_inv;
        Real sd_max;
        Real sdd_max;
        Real sdd;
        Real aux1[nout];
        Real aux2[nout];
        SI.Time Ta1;
        SI.Time Ta2;
        SI.Time Tv;
        SI.Time Te;
        Boolean noWphase;
        SI.Time Ta1s;
        SI.Time Ta2s;
        SI.Time Tvs;
        SI.Time Tes;
        Real sd_max2;
        Real s1;
        Real s2;
        Real s3;
        Real s;
        Real sd;
        Real r_s;
        Real r_sd;
        Real r_sdd;

        function position
           input Real q_qd_qdd[3]
          "Required values for position, speed, acceleration";
           input Real dummy
          "Just to have one input signal that should be differentiated to avoid possible problems in the Modelica tool (is not used)";
           output Real q;
        algorithm
          q :=q_qd_qdd[1];
        end position;

        function position_der
           input Real q_qd_qdd[3]
          "Required values for position, speed, acceleration";
           input Real dummy
          "Just to have one input signal that should be differentiated to avoid possible problems in the Modelica tool (is not used)";
           input Real dummy_der;
           output Real qd;
        algorithm
          qd :=q_qd_qdd[2];
        end position_der;

        function position_der2
           input Real q_qd_qdd[3]
          "Required values for position, speed, acceleration";
           input Real dummy
          "Just to have one input signal that should be differentiated to avoid possible problems in the Modelica tool (is not used)";
           input Real dummy_der;
           input Real dummy_der2;
           output Real qdd;
        algorithm
          qdd :=q_qd_qdd[3];
        end position_der2;
      equation
        for i in 1:nout loop
          aux1[i] = p_deltaq[i]/p_qd_max[i];
          aux2[i] = p_deltaq[i]/p_qdd_max[i];
        end for;

        sd_max_inv = max(abs(aux1));
        sdd_max_inv = max(abs(aux2));

        if sd_max_inv <= eps or sdd_max_inv <= eps then
          sd_max = 0;
          sdd_max = 0;
          Ta1 = 0;
          Ta2 = 0;
          noWphase = false;
          Tv = 0;
          Te = 0;
          Ta1s = 0;
          Ta2s = 0;
          Tvs = 0;
          Tes = 0;
          sd_max2 = 0;
          s1 = 0;
          s2 = 0;
          s3 = 0;
          r_sdd = 0;
          r_sd = 0;
          r_s = 0;
        else
          sd_max = 1/max(abs(aux1));
          sdd_max = 1/max(abs(aux2));
          Ta1 = sqrt(1/sdd_max);
          Ta2 = sd_max/sdd_max;
          noWphase = Ta2 >= Ta1;
          Tv = if noWphase then Ta1 else 1/sd_max;
          Te = if noWphase then Ta1 + Ta1 else Tv + Ta2;
          Ta1s = Ta1 + startTime;
          Ta2s = Ta2 + startTime;
          Tvs = Tv + startTime;
          Tes = Te + startTime;
          sd_max2 = sdd_max*Ta1;
          s1 = sdd_max*(if noWphase then Ta1*Ta1 else Ta2*Ta2)/2;
          s2 = s1 + (if noWphase then sd_max2*(Te - Ta1) - (sdd_max/2)*(Te - Ta1)
            ^2 else sd_max*(Tv - Ta2));
          s3 = s2 + sd_max*(Te - Tv) - (sdd_max/2)*(Te - Tv)*(Te - Tv);

          if time < startTime then
            r_sdd = 0;
            r_sd = 0;
            r_s = 0;
          elseif noWphase then
            if time < Ta1s then
              r_sdd = sdd_max;
              r_sd = sdd_max*(time - startTime);
              r_s = (sdd_max/2)*(time - startTime)*(time - startTime);
            elseif time < Tes then
              r_sdd = -sdd_max;
              r_sd = sd_max2 - sdd_max*(time - Ta1s);
              r_s = s1 + sd_max2*(time - Ta1s) - (sdd_max/2)*(time - Ta1s)*(time
                 - Ta1s);
            else
              r_sdd = 0;
              r_sd = 0;
              r_s = s2;
            end if;
          elseif time < Ta2s then
            r_sdd = sdd_max;
            r_sd = sdd_max*(time - startTime);
            r_s = (sdd_max/2)*(time - startTime)*(time - startTime);
          elseif time < Tvs then
            r_sdd = 0;
            r_sd = sd_max;
            r_s = s1 + sd_max*(time - Ta2s);
          elseif time < Tes then
            r_sdd = -sdd_max;
            r_sd = sd_max - sdd_max*(time - Tvs);
            r_s = s2 + sd_max*(time - Tvs) - (sdd_max/2)*(time - Tvs)*(time - Tvs);
          else
            r_sdd = 0;
            r_sd = 0;
            r_s = s3;
          end if;

        end if;

        // acceleration
        qdd = p_deltaq*sdd;
        qd = p_deltaq*sd;
        q = p_q_begin + p_deltaq*s;
        endTime = Tes;

        s = position({r_s, r_sd, r_sdd}, time);
        sd = der(s);
        sdd = der(sd);

        // report when axis is moving
        motion_ref = time <= endTime;
        for i in 1:nout loop
          moving[i] = if abs(q_begin[i] - q_end[i]) > eps then motion_ref else false;
        end for;

      end KinematicPTP2;
    end Sources;

    package Types
    "Library of constants and types with choices, especially to build menus"
      extends Modelica.Icons.Library;

      type Init = enumeration(
        NoInit
          "No initialization (start values are used as guess values with fixed=false)", 

        SteadyState
          "Steady state initialization (derivatives of states are zero)",
        InitialState "Initialization with initial states",
        InitialOutput
          "Initialization with initial outputs (and steady state of the states if possibles)")
      "Enumeration defining initialization of a block";
    end Types;
  end Blocks;

  package Electrical
  "Library of electrical models (analog, digital, machines, multi-phase)"
  extends Modelica.Icons.Library2;

    package Analog "Library for analog electrical models"
    import SI = Modelica.SIunits;
    extends Modelica.Icons.Library2;

      package Basic
      "Basic electrical components such as resistor, capacitor, transformer"
        extends Modelica.Icons.Library;

        model Ground "Ground node"
          Interfaces.Pin p;
        equation
          p.v = 0;
        end Ground;

      model Resistor "Ideal linear electrical resistor"
        parameter Modelica.SIunits.Resistance R(start=1)
          "Resistance R_ref at temperature T_ref";
        parameter Modelica.SIunits.Temperature T_ref=300.15
          "Reference temperature";
        parameter Modelica.SIunits.LinearTemperatureCoefficient alpha=0
          "Temperature coefficient of resistance (R_actual = R_ref*(1 + alpha*(heatPort.T - T_ref))";

        extends Modelica.Electrical.Analog.Interfaces.OnePort;
        extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = T_ref);
        Modelica.SIunits.Resistance R_actual
          "Resistance = R_ref*(1 + alpha*(intenalHeatPort.T - T_ref))";
      equation
        assert((1 + alpha*(T_heatPort - T_ref)) >= Modelica.Constants.eps, "Temperature outside scope of model!");
        R_actual = R*(1 + alpha*(T_heatPort - T_ref));
        v = R_actual*i;
        LossPower = v*i;
      end Resistor;

        model Capacitor "Ideal linear electrical capacitor"
          extends Interfaces.OnePort;
          parameter SI.Capacitance C(start=1) "Capacitance";

        equation
          i = C*der(v);
        end Capacitor;

        model Inductor "Ideal linear electrical inductor"
          extends Interfaces.OnePort;
          parameter SI.Inductance L(start=1) "Inductance";
        equation
          L*der(i) = v;
        end Inductor;

        model EMF "Electromotoric force (electric/mechanic transformer)"
          parameter Boolean useSupport=false
          "= true, if support flange enabled, otherwise implicitly grounded";
          parameter SI.ElectricalTorqueConstant k(start=1)
          "Transformation coefficient";
          SI.Voltage v "Voltage drop between the two pins";
          SI.Current i "Current flowing from positive to negative pin";
          SI.Angle phi
          "Angle of shaft flange with respect to support (= flange.phi - support.phi)";
          SI.AngularVelocity w "Angular velocity of flange relative to support";
          Interfaces.PositivePin p;
          Interfaces.NegativePin n;
          Modelica.Mechanics.Rotational.Interfaces.Flange_b flange;
          Mechanics.Rotational.Interfaces.Support support if useSupport
          "Support/housing of emf shaft";
      protected
          Mechanics.Rotational.Components.Fixed fixed if not useSupport;
          Mechanics.Rotational.Interfaces.InternalSupport internalSupport(tau=-flange.tau);
        equation
          v = p.v - n.v;
          0 = p.i + n.i;
          i = p.i;

          phi = flange.phi - internalSupport.phi;
          w = der(phi);
          k*w = v;
          flange.tau = -k*i;
          connect(internalSupport.flange, support);
          connect(internalSupport.flange,fixed. flange);
        end EMF;
      end Basic;

      package Ideal
      "Ideal electrical elements such as switches, diode, transformer, operational amplifier"
        extends Modelica.Icons.Library;

        model IdealOpAmp "Ideal operational amplifier (norator-nullator pair)"
          SI.Voltage v1 "Voltage drop over the left port";
          SI.Voltage v2 "Voltage drop over the right port";
          SI.Current i1
          "Current flowing from pos. to neg. pin of the left port";
          SI.Current i2
          "Current flowing from pos. to neg. pin of the right port";
          Interfaces.PositivePin p1 "Positive pin of the left port";
          Interfaces.NegativePin n1 "Negative pin of the left port";
          Interfaces.PositivePin p2 "Positive pin of the right port";
          Interfaces.NegativePin n2 "Negative pin of the right port";
        equation
          v1 = p1.v - n1.v;
          v2 = p2.v - n2.v;
          0 = p1.i + n1.i;
          0 = p2.i + n2.i;
          i1 = p1.i;
          i2 = p2.i;
          v1 = 0;
          i1 = 0;
        end IdealOpAmp;
      end Ideal;

      package Interfaces
      "Connectors and partial models for Analog electrical components"
        extends Modelica.Icons.Library;

        connector Pin "Pin of an electrical component"
          SI.Voltage v "Potential at the pin";
          flow SI.Current i "Current flowing into the pin";
        end Pin;

        connector PositivePin "Positive pin of an electric component"
          SI.Voltage v "Potential at the pin";
          flow SI.Current i "Current flowing into the pin";
        end PositivePin;

        connector NegativePin "Negative pin of an electric component"
          SI.Voltage v "Potential at the pin";
          flow SI.Current i "Current flowing into the pin";
        end NegativePin;

        partial model OnePort
        "Component with two electrical pins p and n and current i from p to n"

          SI.Voltage v "Voltage drop between the two pins (= p.v - n.v)";
          SI.Current i "Current flowing from pin p to pin n";
          PositivePin p
          "Positive pin (potential p.v > n.v for positive voltage drop v)";
          NegativePin n "Negative pin";
        equation
          v = p.v - n.v;
          0 = p.i + n.i;
          i = p.i;
        end OnePort;

        partial model ConditionalHeatPort
        "Partial model to include a conditional HeatPort in order to describe the power loss via a thermal network"

          parameter Boolean useHeatPort = false "=true, if HeatPort is enabled";
          parameter Modelica.SIunits.Temperature T=293.15
          "Fixed device temperature if useHeatPort = false";
          Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T(start=T)=T_heatPort, Q_flow=-LossPower) if useHeatPort;
          Modelica.SIunits.Power LossPower
          "Loss power leaving component via HeatPort";
          Modelica.SIunits.Temperature T_heatPort "Temperature of HeatPort";
        equation
          if not useHeatPort then
             T_heatPort = T;
          end if;

        end ConditionalHeatPort;
      end Interfaces;

      package Sensors "Potential, voltage, current, and power sensors"
        extends Modelica.Icons.Library;

        model CurrentSensor "Sensor to measure the current in a branch"
          extends Modelica.Icons.RotationalSensor;

          Interfaces.PositivePin p "positive pin";
          Interfaces.NegativePin n "negative pin";
          Modelica.Blocks.Interfaces.RealOutput i
          "current in the branch from p to n as output signal";

        equation
          p.v = n.v;
          p.i = i;
          n.i = -i;
        end CurrentSensor;
      end Sensors;

      package Sources
      "Time-dependend and controlled voltage and current sources"
        extends Modelica.Icons.Library;

        model SignalVoltage
        "Generic voltage source using the input signal as source voltage"

          Interfaces.PositivePin p;
          Interfaces.NegativePin n;
          Modelica.Blocks.Interfaces.RealInput v
          "Voltage between pin p and n (= p.v - n.v) as input signal";
          SI.Current i "Current flowing from pin p to pin n";
        equation
          v = p.v - n.v;
          0 = p.i + n.i;
          i = p.i;
        end SignalVoltage;
      end Sources;
    end Analog;
  end Electrical;

  package Mechanics
  "Library of 1-dim. and 3-dim. mechanical components (multi-body, rotational, translational)"
  extends Modelica.Icons.Library2;

    package MultiBody "Library to model 3-dimensional mechanical systems"
    import SI = Modelica.SIunits;
    extends Modelica.Icons.Library;

    model World
      "World coordinate system + gravity field + default animation definition"

      import SI = Modelica.SIunits;
      import Modelica.Mechanics.MultiBody.Types.GravityTypes;
      import Modelica.Mechanics.MultiBody.Types;

        Interfaces.Frame_b frame_b
        "Coordinate system fixed in the origin of the world frame";


      parameter Boolean enableAnimation=true
        "= true, if animation of all components is enabled";
      parameter Boolean animateWorld=true
        "= true, if world coordinate system shall be visualized";
      parameter Boolean animateGravity=true
        "= true, if gravity field shall be visualized (acceleration vector or field center)";
      parameter Types.AxisLabel label1="x" "Label of horizontal axis in icon";
      parameter Types.AxisLabel label2="y" "Label of vertical axis in icon";
      parameter Types.GravityTypes gravityType=GravityTypes.UniformGravity
        "Type of gravity field";
      parameter SI.Acceleration g=9.81 "Constant gravity acceleration";
      parameter Types.Axis n={0,-1,0}
        "Direction of gravity resolved in world frame (gravity = g*n/length(n))";
      parameter Real mue(
        unit="m3/s2",
        min=0) = 3.986e14
        "Gravity field constant (default = field constant of earth)";
      parameter Boolean driveTrainMechanics3D=true
        "= true, if 3-dim. mechanical effects of Parts.Mounting1D/Rotor1D/BevelGear1D shall be taken into account";

      parameter SI.Distance axisLength=nominalLength/2
        "Length of world axes arrows";
      parameter SI.Distance axisDiameter=axisLength/defaultFrameDiameterFraction
        "Diameter of world axes arrows";
      parameter Boolean axisShowLabels=true "= true, if labels shall be shown";
      input Types.Color axisColor_x=Modelica.Mechanics.MultiBody.Types.Defaults.FrameColor
        "Color of x-arrow";
      input Types.Color axisColor_y=axisColor_x;
      input Types.Color axisColor_z=axisColor_x "Color of z-arrow";

      parameter SI.Position gravityArrowTail[3]={0,0,0}
        "Position vector from origin of world frame to arrow tail, resolved in world frame";
      parameter SI.Length gravityArrowLength=axisLength/2
        "Length of gravity arrow";
      parameter SI.Diameter gravityArrowDiameter=gravityArrowLength/
          defaultWidthFraction "Diameter of gravity arrow";
      input Types.Color gravityArrowColor={0,230,0} "Color of gravity arrow";
      parameter SI.Diameter gravitySphereDiameter=12742000
        "Diameter of sphere representing gravity center (default = mean diameter of earth)";
      input Types.Color gravitySphereColor={0,230,0} "Color of gravity sphere";

      parameter SI.Length nominalLength=1
        "\"Nominal\" length of multi-body system";
      parameter SI.Length defaultAxisLength=nominalLength/5
        "Default for length of a frame axis (but not world frame)";
      parameter SI.Length defaultJointLength=nominalLength/10
        "Default for the fixed length of a shape representing a joint";
      parameter SI.Length defaultJointWidth=nominalLength/20
        "Default for the fixed width of a shape representing a joint";
      parameter SI.Length defaultForceLength=nominalLength/10
        "Default for the fixed length of a shape representing a force (e.g. damper)";
      parameter SI.Length defaultForceWidth=nominalLength/20
        "Default for the fixed width of a shape represening a force (e.g. spring, bushing)";
      parameter SI.Length defaultBodyDiameter=nominalLength/9
        "Default for diameter of sphere representing the center of mass of a body";
      parameter Real defaultWidthFraction=20
        "Default for shape width as a fraction of shape length (e.g., for Parts.FixedTranslation)";
      parameter SI.Length defaultArrowDiameter=nominalLength/40
        "Default for arrow diameter (e.g., of forces, torques, sensors)";
      parameter Real defaultFrameDiameterFraction=40
        "Default for arrow diameter of a coordinate system as a fraction of axis length";
      parameter Real defaultSpecularCoefficient(min=0) = 0.7
        "Default reflection of ambient light (= 0: light is completely absorbed)";
      parameter Real defaultN_to_m(unit="N/m", min=0) = 1000
        "Default scaling of force arrows (length = force/defaultN_to_m)";
      parameter Real defaultNm_to_m(unit="N.m/m", min=0) = 1000
        "Default scaling of torque arrows (length = torque/defaultNm_to_m)";

      /* The World object can only use the Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape model, but no
     other models in package Modelica.Mechanics.MultiBody.Visualizers, since the other models access
     data of the "outer Modelica.Mechanics.MultiBody.World world" object, i.e., there are
     mutually dependent classes. For this reason, the higher level visualization
     objects cannot be used.
  */
    protected
      parameter Integer ndim=if enableAnimation and animateWorld then 1 else 0;
      parameter Integer ndim2=if enableAnimation and animateWorld and 
          axisShowLabels then 1 else 0;

      // Parameters to define axes
      parameter SI.Length headLength=min(axisLength, axisDiameter*Types.Defaults.
          FrameHeadLengthFraction);
      parameter SI.Length headWidth=axisDiameter*Types.Defaults.
          FrameHeadWidthFraction;
      parameter SI.Length lineLength=max(0, axisLength - headLength);
      parameter SI.Length lineWidth=axisDiameter;

      // Parameters to define axes labels
      parameter SI.Length scaledLabel=Modelica.Mechanics.MultiBody.Types.Defaults.FrameLabelHeightFraction*
          axisDiameter;
      parameter SI.Length labelStart=1.05*axisLength;

      // x-axis
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape x_arrowLine(
        shapeType="cylinder",
        length=lineLength,
        width=lineWidth,
        height=lineWidth,
        lengthDirection={1,0,0},
        widthDirection={0,1,0},
        color=axisColor_x,
        specularCoefficient=0) if enableAnimation and animateWorld;
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape x_arrowHead(
        shapeType="cone",
        length=headLength,
        width=headWidth,
        height=headWidth,
        lengthDirection={1,0,0},
        widthDirection={0,1,0},
        color=axisColor_x,
        r={lineLength,0,0},
        specularCoefficient=0) if enableAnimation and animateWorld;
      Modelica.Mechanics.MultiBody.Visualizers.Internal.Lines x_label(
        lines=scaledLabel*{[0, 0; 1, 1],[0, 1; 1, 0]},
        diameter=axisDiameter,
        color=axisColor_x,
        r_lines={labelStart,0,0},
        n_x={1,0,0},
        n_y={0,1,0},
        specularCoefficient=0) if enableAnimation and animateWorld and axisShowLabels;

      // y-axis
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape y_arrowLine(
        shapeType="cylinder",
        length=lineLength,
        width=lineWidth,
        height=lineWidth,
        lengthDirection={0,1,0},
        widthDirection={1,0,0},
        color=axisColor_y,
        specularCoefficient=0) if enableAnimation and animateWorld;
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape y_arrowHead(
        shapeType="cone",
        length=headLength,
        width=headWidth,
        height=headWidth,
        lengthDirection={0,1,0},
        widthDirection={1,0,0},
        color=axisColor_y,
        r={0,lineLength,0},
        specularCoefficient=0) if enableAnimation and animateWorld;
      Modelica.Mechanics.MultiBody.Visualizers.Internal.Lines y_label(
        lines=scaledLabel*{[0, 0; 1, 1.5],[0, 1.5; 0.5, 0.75]},
        diameter=axisDiameter,
        color=axisColor_y,
        r_lines={0,labelStart,0},
        n_x={0,1,0},
        n_y={-1,0,0},
        specularCoefficient=0) if enableAnimation and animateWorld and axisShowLabels;

      // z-axis
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape z_arrowLine(
        shapeType="cylinder",
        length=lineLength,
        width=lineWidth,
        height=lineWidth,
        lengthDirection={0,0,1},
        widthDirection={0,1,0},
        color=axisColor_z,
        specularCoefficient=0) if enableAnimation and animateWorld;
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape z_arrowHead(
        shapeType="cone",
        length=headLength,
        width=headWidth,
        height=headWidth,
        lengthDirection={0,0,1},
        widthDirection={0,1,0},
        color=axisColor_z,
        r={0,0,lineLength},
        specularCoefficient=0) if enableAnimation and animateWorld;
      Modelica.Mechanics.MultiBody.Visualizers.Internal.Lines z_label(
        lines=scaledLabel*{[0, 0; 1, 0],[0, 1; 1, 1],[0, 1; 1, 0]},
        diameter=axisDiameter,
        color=axisColor_z,
        r_lines={0,0,labelStart},
        n_x={0,0,1},
        n_y={0,1,0},
        specularCoefficient=0) if enableAnimation and animateWorld and axisShowLabels;

      // Uniform gravity visualization
      parameter SI.Length gravityHeadLength=min(gravityArrowLength,
          gravityArrowDiameter*Types.Defaults.ArrowHeadLengthFraction);
      parameter SI.Length gravityHeadWidth=gravityArrowDiameter*Types.Defaults.ArrowHeadWidthFraction;
      parameter SI.Length gravityLineLength=max(0, gravityArrowLength - gravityHeadLength);
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape gravityArrowLine(
        shapeType="cylinder",
        length=gravityLineLength,
        width=gravityArrowDiameter,
        height=gravityArrowDiameter,
        lengthDirection=n,
        widthDirection={0,1,0},
        color=gravityArrowColor,
        r_shape=gravityArrowTail,
        specularCoefficient=0) if enableAnimation and animateGravity and gravityType == GravityTypes.UniformGravity;
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape gravityArrowHead(
        shapeType="cone",
        length=gravityHeadLength,
        width=gravityHeadWidth,
        height=gravityHeadWidth,
        lengthDirection=n,
        widthDirection={0,1,0},
        color=gravityArrowColor,
        r_shape=gravityArrowTail + Modelica.Math.Vectors.normalize(
                                                    n)*gravityLineLength,
        specularCoefficient=0) if enableAnimation and animateGravity and gravityType == GravityTypes.UniformGravity;

      // Point gravity visualization
      parameter Integer ndim_pointGravity=if enableAnimation and animateGravity
           and gravityType == 2 then 1 else 0;
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape gravitySphere(
        shapeType="sphere",
        r_shape={-gravitySphereDiameter/2,0,0},
        lengthDirection={1,0,0},
        length=gravitySphereDiameter,
        width=gravitySphereDiameter,
        height=gravitySphereDiameter,
        color=gravitySphereColor,
        specularCoefficient=0) if enableAnimation and animateGravity and gravityType == GravityTypes.PointGravity;

      function gravityAcceleration = gravityAccelerationTypes (
          gravityType=gravityType,
          g=g*Modelica.Math.Vectors.normalize(
                                         n),
          mue=mue);

    protected
      function gravityAccelerationTypes
        "Gravity field acceleration depending on field type and position"
        import Modelica.Mechanics.MultiBody.Types.GravityTypes;
        extends Modelica.Icons.Function;
        input SI.Position r[3]
          "Position vector from world frame to actual point, resolved in world frame";
        input GravityTypes gravityType "Type of gravity field";
        input SI.Acceleration g[3]
          "Constant gravity acceleration, resolved in world frame, if gravityType=1";
        input Real mue(unit="m3/s2")
          "Field constant of point gravity field, if gravityType=2";
        output SI.Acceleration gravity[3]
          "Gravity acceleration at point r, resolved in world frame";
      algorithm
        gravity := if gravityType == GravityTypes.UniformGravity then g else 
                   if gravityType == GravityTypes.PointGravity then 
                      -(mue/(r*r))*(r/Modelica.Math.Vectors.length(
                                                    r)) else 
                        zeros(3);
      end gravityAccelerationTypes;
    equation
      Connections.root(frame_b.R);

      assert(Modelica.Math.Vectors.length(
                           n) > 1.e-10,
        "Parameter n of World object is wrong (lenght(n) > 0 required)");
      frame_b.r_0 = zeros(3);
      frame_b.R = Frames.nullRotation();
    end World;

      package Examples
      "Examples that demonstrate the usage of the MultiBody library"
      extends Modelica.Icons.Library;

        package Systems
        "Examples of complete system models including 3-dimensional mechanics"
        extends Modelica.Icons.Library;

          package RobotR3
          "Library to demonstrate robot system models based on the Manutec r3 robot"

            model oneAxis
            "Model of one axis of robot (controller, motor, gearbox) with simple load"

              import SI = Modelica.SIunits;
              extends Modelica.Icons.Example;
              parameter SI.Mass mLoad(min=0)=15 "Mass of load";
              parameter Real kp=5 "Gain of position controller of axis 2";
              parameter Real ks=0.5 "Gain of speed controller of axis 2";
              parameter SI.Time Ts=0.05
              "Time constant of integrator of speed controller of axis 2";
              parameter Real startAngle(unit="deg") = 0 "Start angle of axis 2";
              parameter Real endAngle(unit="deg") = 120 "End angle of axis 2";

              parameter SI.Time swingTime=0.5
              "Additional time after reference motion is in rest before simulation is stopped";
              parameter SI.AngularVelocity refSpeedMax=3
              "Maximum reference speed";
              parameter SI.AngularAcceleration refAccMax=10
              "Maximum reference acceleration";


              Components.AxisType1 axis(
                w=5500,
                ratio=210,
                c=8,
                cd=0.01,
                Rv0=0.5,
                Rv1=(0.1/130),
                kp=kp,
                ks=ks,
                Ts=Ts);
              Modelica.Mechanics.Rotational.Components.Inertia load(
                                                         J=1.3*mLoad);
              Components.PathPlanning1 pathPlanning(
                swingTime=swingTime,
                angleBegDeg=startAngle,
                angleEndDeg=endAngle,
                speedMax=refSpeedMax,
                accMax=refAccMax);
          protected
              Components.ControlBus controlBus;
            equation
              connect(axis.flange, load.flange_a);
              connect(pathPlanning.controlBus, controlBus);
              connect(controlBus.axisControlBus1, axis.axisControlBus);
            end oneAxis;

            model fullRobot
            "6 degree of freedom robot with path planning, controllers, motors, brakes, gears and mechanics"


              import SI = Modelica.SIunits;

              parameter SI.Mass mLoad(min=0) = 15 "Mass of load";
              parameter SI.Position rLoad[3]={0.1,0.25,0.1}
              "Distance from last flange to load mass";
              parameter SI.Acceleration g=9.81 "Gravity acceleration";
              parameter SI.Time refStartTime=0 "Start time of reference motion";
              parameter SI.Time refSwingTime=0.5
              "Additional time after reference motion is in rest before simulation is stopped";

              parameter Real startAngle1(unit="deg") = -60
              "Start angle of axis 1";
              parameter Real startAngle2(unit="deg") = 20
              "Start angle of axis 2";
              parameter Real startAngle3(unit="deg") = 90
              "Start angle of axis 3";
              parameter Real startAngle4(unit="deg") = 0
              "Start angle of axis 4";
              parameter Real startAngle5(unit="deg") = -110
              "Start angle of axis 5";
              parameter Real startAngle6(unit="deg") = 0
              "Start angle of axis 6";

              parameter Real endAngle1(unit="deg") = 60 "End angle of axis 1";
              parameter Real endAngle2(unit="deg") = -70 "End angle of axis 2";
              parameter Real endAngle3(unit="deg") = -35 "End angle of axis 3";
              parameter Real endAngle4(unit="deg") = 45 "End angle of axis 4";
              parameter Real endAngle5(unit="deg") = 110 "End angle of axis 5";
              parameter Real endAngle6(unit="deg") = 45 "End angle of axis 6";

              parameter SI.AngularVelocity refSpeedMax[6]={3,1.5,5,3.1,3.1,4.1}
              "Maximum reference speeds of all joints";
              parameter SI.AngularAcceleration refAccMax[6]={15,15,15,60,60,60}
              "Maximum reference accelerations of all joints";

              parameter Real kp1=5 "Gain of position controller";
              parameter Real ks1=0.5 "Gain of speed controller";
              parameter SI.Time Ts1=0.05
              "Time constant of integrator of speed controller";
              parameter Real kp2=5 "Gain of position controller";
              parameter Real ks2=0.5 "Gain of speed controller";
              parameter SI.Time Ts2=0.05
              "Time constant of integrator of speed controller";
              parameter Real kp3=5 "Gain of position controller";
              parameter Real ks3=0.5 "Gain of speed controller";
              parameter SI.Time Ts3=0.05
              "Time constant of integrator of speed controller";
              parameter Real kp4=5 "Gain of position controller";
              parameter Real ks4=0.5 "Gain of speed controller";
              parameter SI.Time Ts4=0.05
              "Time constant of integrator of speed controller";
              parameter Real kp5=5 "Gain of position controller";
              parameter Real ks5=0.5 "Gain of speed controller";
              parameter SI.Time Ts5=0.05
              "Time constant of integrator of speed controller";
              parameter Real kp6=5 "Gain of position controller";
              parameter Real ks6=0.5 "Gain of speed controller";
              parameter SI.Time Ts6=0.05
              "Time constant of integrator of speed controller";
              Components.MechanicalStructure mechanics(
                mLoad=mLoad,
                rLoad=rLoad,
                g=g);
              Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.PathPlanning6
              pathPlanning(
                naxis=6,
                angleBegDeg={startAngle1,startAngle2,startAngle3,startAngle4,startAngle5,
                    startAngle6},
                angleEndDeg={endAngle1,endAngle2,endAngle3,endAngle4,endAngle5,endAngle6},
                speedMax=refSpeedMax,
                accMax=refAccMax,
                startTime=refStartTime,
                swingTime=refSwingTime);

              RobotR3.Components.AxisType1 axis1(
                w=4590,
                ratio=-105,
                c=43,
                cd=0.005,
                Rv0=0.4,
                Rv1=(0.13/160),
                kp=kp1,
                ks=ks1,
                Ts=Ts1);
              RobotR3.Components.AxisType1 axis2(
                w=5500,
                ratio=210,
                c=8,
                cd=0.01,
                Rv1=(0.1/130),
                Rv0=0.5,
                kp=kp2,
                ks=ks2,
                Ts=Ts2);

              RobotR3.Components.AxisType1 axis3(
                w=5500,
                ratio=60,
                c=58,
                cd=0.04,
                Rv0=0.7,
                Rv1=(0.2/130),
                kp=kp3,
                ks=ks3,
                Ts=Ts3);
              RobotR3.Components.AxisType2 axis4(
                k=0.2365,
                w=6250,
                D=0.55,
                J=1.6e-4,
                ratio=-99,
                Rv0=21.8,
                Rv1=9.8,
                peak=26.7/21.8,
                kp=kp4,
                ks=ks4,
                Ts=Ts4);
              RobotR3.Components.AxisType2 axis5(
                k=0.2608,
                w=6250,
                D=0.55,
                J=1.8e-4,
                ratio=79.2,
                Rv0=30.1,
                Rv1=0.03,
                peak=39.6/30.1,
                kp=kp5,
                ks=ks5,
                Ts=Ts5);
              RobotR3.Components.AxisType2 axis6(
                k=0.0842,
                w=7400,
                D=0.27,
                J=4.3e-5,
                ratio=-99,
                Rv0=10.9,
                Rv1=3.92,
                peak=16.8/10.9,
                kp=kp6,
                ks=ks6,
                Ts=Ts6);
          protected
              Components.ControlBus controlBus;
            equation
              connect(axis2.flange, mechanics.axis2);
              connect(axis1.flange, mechanics.axis1);
              connect(axis3.flange, mechanics.axis3);
              connect(axis4.flange, mechanics.axis4);
              connect(axis5.flange, mechanics.axis5);
              connect(axis6.flange, mechanics.axis6);
              connect(controlBus, pathPlanning.controlBus);
              connect(controlBus.axisControlBus1, axis1.axisControlBus);

              connect(controlBus.axisControlBus2, axis2.axisControlBus);

              connect(controlBus.axisControlBus3, axis3.axisControlBus);

              connect(controlBus.axisControlBus4, axis4.axisControlBus);
              connect(controlBus.axisControlBus5, axis5.axisControlBus);
              connect(controlBus.axisControlBus6, axis6.axisControlBus);
            end fullRobot;
            extends Modelica.Icons.Library;
            import SI = Modelica.SIunits;

            package Components "Library of components of the robot"
              extends Modelica.Icons.Library;

              expandable connector AxisControlBus "Data bus for one robot axis"
                extends Modelica.Icons.SignalSubBus;

              end AxisControlBus;

              expandable connector ControlBus "Data bus for all axes of robot"
                extends Modelica.Icons.SignalBus;

              end ControlBus;

              model PathPlanning1
              "Generate reference angles for fastest kinematic movement"

                import SI = Modelica.SIunits;
                import Cv = Modelica.SIunits.Conversions;
                parameter Real angleBegDeg(unit="deg") = 0 "Start angle";
                parameter Real angleEndDeg(unit="deg") = 1 "End angle";
                parameter SI.AngularVelocity speedMax = 3 "Maximum axis speed";
                parameter SI.AngularAcceleration accMax = 2.5
                "Maximum axis acceleration";
                parameter SI.Time startTime=0 "Start time of movement";
                parameter SI.Time swingTime=0.5
                "Additional time after reference motion is in rest before simulation is stopped";
                final parameter SI.Angle angleBeg=Cv.from_deg(angleBegDeg)
                "Start angles";
                final parameter SI.Angle angleEnd=Cv.from_deg(angleEndDeg)
                "End angles";
                ControlBus controlBus;
                Modelica.Blocks.Sources.KinematicPTP2 path(
                  q_end={angleEnd},
                  qd_max={speedMax},
                  qdd_max={accMax},
                  startTime=startTime,
                  q_begin={angleBeg});
                PathToAxisControlBus pathToAxis1(final nAxis=1, final axisUsed=1);


                Blocks.Logical.TerminateSimulation terminateSimulation(condition=time >= path.endTime
                       + swingTime);
              equation
                connect(path.q, pathToAxis1.q);
                connect(path.qd, pathToAxis1.qd);
                connect(path.qdd, pathToAxis1.qdd);
                connect(path.moving, pathToAxis1.moving);
                connect(pathToAxis1.axisControlBus, controlBus.axisControlBus1);
              end PathPlanning1;

              model PathPlanning6
              "Generate reference angles for fastest kinematic movement"

                import SI = Modelica.SIunits;
                import Cv = Modelica.SIunits.Conversions;
                parameter Integer naxis=6 "number of driven axis";
                parameter Real angleBegDeg[naxis](unit="deg") = zeros(naxis)
                "Start angles";
                parameter Real angleEndDeg[naxis](unit="deg") = ones(naxis)
                "End angles";
                parameter SI.AngularVelocity speedMax[naxis]=fill(3, naxis)
                "Maximum axis speed";
                parameter SI.AngularAcceleration accMax[naxis]=fill(2.5, naxis)
                "Maximum axis acceleration";
                parameter SI.Time startTime=0 "Start time of movement";
                parameter SI.Time swingTime=0.5
                "Additional time after reference motion is in rest before simulation is stopped";
                final parameter SI.Angle angleBeg[:]=Cv.from_deg(angleBegDeg)
                "Start angles";
                final parameter SI.Angle angleEnd[:]=Cv.from_deg(angleEndDeg)
                "End angles";
                ControlBus controlBus;
                Modelica.Blocks.Sources.KinematicPTP2 path(
                  q_end=angleEnd,
                  qd_max=speedMax,
                  qdd_max=accMax,
                  startTime=startTime,
                  q_begin=angleBeg);
                PathToAxisControlBus pathToAxis1(nAxis=naxis, axisUsed=1);
                PathToAxisControlBus pathToAxis2(nAxis=naxis, axisUsed=2);
                PathToAxisControlBus pathToAxis3(nAxis=naxis, axisUsed=3);
                PathToAxisControlBus pathToAxis4(nAxis=naxis, axisUsed=4);
                PathToAxisControlBus pathToAxis5(nAxis=naxis, axisUsed=5);
                PathToAxisControlBus pathToAxis6(nAxis=naxis, axisUsed=6);


                Blocks.Logical.TerminateSimulation terminateSimulation(condition=time >= path.endTime
                       + swingTime);
              equation
                connect(path.q, pathToAxis1.q);
                connect(path.qd, pathToAxis1.qd);
                connect(path.qdd, pathToAxis1.qdd);
                connect(path.moving, pathToAxis1.moving);
                connect(path.q, pathToAxis2.q);
                connect(path.qd, pathToAxis2.qd);
                connect(path.qdd, pathToAxis2.qdd);
                connect(path.moving, pathToAxis2.moving);
                connect(path.q, pathToAxis3.q);
                connect(path.qd, pathToAxis3.qd);
                connect(path.qdd, pathToAxis3.qdd);
                connect(path.moving, pathToAxis3.moving);
                connect(path.q, pathToAxis4.q);
                connect(path.qd, pathToAxis4.qd);
                connect(path.qdd, pathToAxis4.qdd);
                connect(path.moving, pathToAxis4.moving);
                connect(path.q, pathToAxis5.q);
                connect(path.qd, pathToAxis5.qd);
                connect(path.qdd, pathToAxis5.qdd);
                connect(path.moving, pathToAxis5.moving);
                connect(path.q, pathToAxis6.q);
                connect(path.qd, pathToAxis6.qd);
                connect(path.qdd, pathToAxis6.qdd);
                connect(path.moving, pathToAxis6.moving);
                connect(pathToAxis1.axisControlBus, controlBus.axisControlBus1);
                connect(pathToAxis2.axisControlBus, controlBus.axisControlBus2);
                connect(pathToAxis3.axisControlBus, controlBus.axisControlBus3);
                connect(pathToAxis4.axisControlBus, controlBus.axisControlBus4);
                connect(pathToAxis5.axisControlBus, controlBus.axisControlBus5);
                connect(pathToAxis6.axisControlBus, controlBus.axisControlBus6);
              end PathPlanning6;

              model PathToAxisControlBus
              "Map path planning to one axis control bus"
                extends Blocks.Interfaces.BlockIcon;

                parameter Integer nAxis=6 "Number of driven axis";
                parameter Integer axisUsed=1
                "Map path planning of axisUsed to axisControlBus";
                Blocks.Interfaces.RealInput q[nAxis];
                Blocks.Interfaces.RealInput qd[nAxis];
                Blocks.Interfaces.RealInput qdd[nAxis];
                AxisControlBus axisControlBus;
                Blocks.Routing.RealPassThrough q_axisUsed;
                Blocks.Routing.RealPassThrough qd_axisUsed;
                Blocks.Routing.RealPassThrough qdd_axisUsed;
                Blocks.Interfaces.BooleanInput moving[nAxis];
                Blocks.Routing.BooleanPassThrough motion_ref_axisUsed;
              equation
                connect(q_axisUsed.u, q[axisUsed]);
                connect(qd_axisUsed.u, qd[axisUsed]);
                connect(qdd_axisUsed.u, qdd[axisUsed]);
                connect(motion_ref_axisUsed.u, moving[axisUsed]);
                connect(motion_ref_axisUsed.y, axisControlBus.motion_ref);
                connect(qdd_axisUsed.y, axisControlBus.acceleration_ref);
                connect(qd_axisUsed.y, axisControlBus.speed_ref);
                connect(q_axisUsed.y, axisControlBus.angle_ref);
              end PathToAxisControlBus;

              model GearType1
              "Motor inertia and gearbox model for r3 joints 1,2,3 "
                extends
                Modelica.Mechanics.Rotational.Interfaces.PartialTwoFlanges;
                parameter Real i=-105 "gear ratio";
                parameter Real c(unit="N.m/rad") = 43 "Spring constant";
                parameter Real d(unit="N.m.s/rad") = 0.005 "Damper constant";
                parameter SI.Torque Rv0=0.4
                "Viscous friction torque at zero velocity";
                parameter Real Rv1(unit="N.m.s/rad") = (0.13/160)
                "Viscous friction coefficient (R=Rv0+Rv1*abs(qd))";
                parameter Real peak=1
                "Maximum static friction torque is peak*Rv0 (peak >= 1)";
                SI.AngularAcceleration a_rel=der(spring.w_rel)
                "Relative angular acceleration of spring";
                constant SI.AngularVelocity unitAngularVelocity = 1;
                constant SI.Torque unitTorque = 1;


                Modelica.Mechanics.Rotational.Components.IdealGear gear(
                                                             ratio=i, useSupport=false);
                Modelica.Mechanics.Rotational.Components.SpringDamper spring(
                                                                  c=c, d=d);
                Modelica.Mechanics.Rotational.Components.BearingFriction
                bearingFriction(                                              tau_pos=[0,
                       Rv0/unitTorque; 1, (Rv0 + Rv1*unitAngularVelocity)/unitTorque],
                    useSupport=false);
              equation
                connect(spring.flange_b, gear.flange_a);
                connect(bearingFriction.flange_b, spring.flange_a);
                connect(gear.flange_b, flange_b);
                connect(bearingFriction.flange_a, flange_a);
              initial equation
                spring.w_rel = 0;
                a_rel = 0;
              end GearType1;

              model GearType2
              "Motor inertia and gearbox model for r3 joints 4,5,6  "
                extends
                Modelica.Mechanics.Rotational.Interfaces.PartialTwoFlanges;
                parameter Real i=-99 "Gear ratio";
                parameter SI.Torque Rv0=21.8
                "Viscous friction torque at zero velocity";
                parameter Real Rv1=9.8
                "Viscous friction coefficient in [Nms/rad] (R=Rv0+Rv1*abs(qd))";
                parameter Real peak=(26.7/21.8)
                "Maximum static friction torque is peak*Rv0 (peak >= 1)";

                constant SI.AngularVelocity unitAngularVelocity = 1;
                constant SI.Torque unitTorque = 1;
                Modelica.Mechanics.Rotational.Components.IdealGear gear(
                                                             ratio=i, useSupport=false);
                Modelica.Mechanics.Rotational.Components.BearingFriction
                bearingFriction(                                              tau_pos=[0,
                       Rv0/unitTorque; 1, (Rv0 + Rv1*unitAngularVelocity)/unitTorque], peak=peak,
                  useSupport=false);
              equation
                connect(gear.flange_b, bearingFriction.flange_a);
                connect(bearingFriction.flange_b, flange_b);
                connect(gear.flange_a, flange_a);
              end GearType2;

              model Motor
              "Motor model including current controller of r3 motors "
                extends Modelica.Icons.MotorIcon;
                parameter SI.Inertia J(min=0)=0.0013
                "Moment of inertia of motor";
                parameter Real k=1.1616 "Gain of motor";
                parameter Real w=4590 "Time constant of motor";
                parameter Real D=0.6 "Damping constant of motor";
                parameter SI.AngularVelocity w_max=315 "Maximum speed of motor";
                parameter SI.Current i_max=9 "Maximum current of motor";


                Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_motor;
                Modelica.Electrical.Analog.Sources.SignalVoltage Vs;
                Modelica.Electrical.Analog.Ideal.IdealOpAmp diff;
                Modelica.Electrical.Analog.Ideal.IdealOpAmp power;
                Electrical.Analog.Basic.EMF emf( k=k, useSupport=false);
                Modelica.Electrical.Analog.Basic.Inductor La(L=(250/(2*D*w)));
                Modelica.Electrical.Analog.Basic.Resistor Ra(R=250);
                Modelica.Electrical.Analog.Basic.Resistor Rd2(R=100);
                Modelica.Electrical.Analog.Basic.Capacitor C(C=0.004*D/w);
                Modelica.Electrical.Analog.Ideal.IdealOpAmp OpI;
                Modelica.Electrical.Analog.Basic.Resistor Rd1(R=100);
                Modelica.Electrical.Analog.Basic.Resistor Ri(R=10);
                Modelica.Electrical.Analog.Basic.Resistor Rp1(R=200);
                Modelica.Electrical.Analog.Basic.Resistor Rp2(R=50);
                Modelica.Electrical.Analog.Basic.Resistor Rd4(R=100);
                Modelica.Electrical.Analog.Sources.SignalVoltage hall2;
                Modelica.Electrical.Analog.Basic.Resistor Rd3(R=100);
                Modelica.Electrical.Analog.Basic.Ground g1;
                Modelica.Electrical.Analog.Basic.Ground g2;
                Modelica.Electrical.Analog.Basic.Ground g3;
                Modelica.Electrical.Analog.Sensors.CurrentSensor hall1;
                Modelica.Electrical.Analog.Basic.Ground g4;
                Modelica.Electrical.Analog.Basic.Ground g5;
                Modelica.Mechanics.Rotational.Sensors.AngleSensor phi;
                Modelica.Mechanics.Rotational.Sensors.SpeedSensor speed;
                Modelica.Mechanics.Rotational.Components.Inertia Jmotor(
                                                             J=J);
                Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisControlBus
                axisControlBus;
                Blocks.Math.Gain convert1(k=1);
                Blocks.Math.Gain convert2(k=1);
              initial equation
                // initialize motor in steady state
                der(C.v) = 0;
                der(La.i) = 0;

              equation
                connect(La.n, emf.p);
                connect(Ra.n, La.p);
                connect(Rd2.n, diff.n1);
                connect(C.n, OpI.p2);
                connect(OpI.p2, power.p1);
                connect(Vs.p, Rd2.p);
                connect(diff.n1, Rd1.p);
                connect(Rd1.n, diff.p2);
                connect(diff.p2, Ri.p);
                connect(Ri.n, OpI.n1);
                connect(OpI.n1, C.p);
                connect(power.n1, Rp1.p);
                connect(power.p2, Rp1.n);
                connect(Rp1.p, Rp2.p);
                connect(power.p2, Ra.p);
                connect(Rd3.p, hall2.p);
                connect(Rd3.n, diff.p1);
                connect(Rd3.n, Rd4.p);
                connect(Vs.n, g1.p);
                connect(g2.p, hall2.n);
                connect(Rd4.n, g3.p);
                connect(g3.p, OpI.p1);
                connect(g5.p, Rp2.n);
                connect(emf.n, hall1.p);
                connect(hall1.n, g4.p);
                connect(emf.flange, phi.flange);
                connect(emf.flange, speed.flange);
                connect(OpI.n2, power.n2);
                connect(OpI.p1, OpI.n2);
                connect(OpI.p1, diff.n2);
                connect(Jmotor.flange_b, flange_motor);
                connect(phi.phi, axisControlBus.motorAngle);
                connect(speed.w, axisControlBus.motorSpeed);
                connect(hall1.i, axisControlBus.current);
                connect(hall1.i, convert1.u);
                connect(convert1.y, hall2.v);
                connect(convert2.u, axisControlBus.current_ref);
                connect(convert2.y, Vs.v);
                connect(emf.flange, Jmotor.flange_a);
              end Motor;

              model Controller "P-PI cascade controller for one axis"
                parameter Real kp=10 "Gain of position controller";
                parameter Real ks=1 "Gain of speed controller";
                parameter SI.Time Ts=0.01
                "Time constant of integrator of speed controller";
                parameter Real ratio=1 "Gear ratio of gearbox";

                Modelica.Blocks.Math.Gain gain1(k=ratio);
                Modelica.Blocks.Continuous.PI PI(k=ks, T=Ts);
                Modelica.Blocks.Math.Feedback feedback1;
                Modelica.Blocks.Math.Gain P(k=kp);
                Modelica.Blocks.Math.Add3 add3(k3=-1);
                Modelica.Blocks.Math.Gain gain2(k=ratio);
                Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisControlBus
                axisControlBus;
              equation
                connect(gain1.y, feedback1.u1);
                connect(feedback1.y, P.u);
                connect(P.y, add3.u2);
                connect(gain2.y, add3.u1);
                connect(add3.y, PI.u);
                connect(gain2.u, axisControlBus.speed_ref);
                connect(gain1.u, axisControlBus.angle_ref);
                connect(feedback1.u2, axisControlBus.motorAngle);
                connect(add3.u3, axisControlBus.motorSpeed);
                connect(PI.y, axisControlBus.current_ref);
              end Controller;

              model AxisType1 "Axis model of the r3 joints 1,2,3 "
                extends AxisType2(redeclare GearType1 gear(c=c, d=cd));
                parameter Real c(unit="N.m/rad") = 43 "Spring constant";
                parameter Real cd(unit="N.m.s/rad") = 0.005 "Damper constant";
              end AxisType1;

              model AxisType2 "Axis model of the r3 joints 4,5,6 "
                parameter Real kp=10 "Gain of position controller";
                parameter Real ks=1 "Gain of speed controller";
                parameter SI.Time Ts=0.01
                "Time constant of integrator of speed controller";
                parameter Real k=1.1616 "Gain of motor";
                parameter Real w=4590 "Time constant of motor";
                parameter Real D=0.6 "Damping constant of motor";
                parameter SI.Inertia J(min=0) = 0.0013
                "Moment of inertia of motor";
                parameter Real ratio=-105 "Gear ratio";
                parameter SI.Torque Rv0=0.4
                "Viscous friction torque at zero velocity in [Nm]";
                parameter Real Rv1(unit="N.m.s/rad") = (0.13/160)
                "Viscous friction coefficient in [Nms/rad]";
                parameter Real peak=1
                "Maximum static friction torque is peak*Rv0 (peak >= 1)";

                Modelica.Mechanics.Rotational.Interfaces.Flange_b flange;
                replaceable GearType2 gear(
                  Rv0=Rv0,
                  Rv1=Rv1,
                  peak=peak,
                  i=ratio);
                Motor motor(
                  J=J,
                  k=k,
                  w=w,
                  D=D);
                RobotR3.Components.Controller controller(
                  kp=kp,
                  ks=ks,
                  Ts=Ts,
                  ratio=ratio);
                Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisControlBus
                axisControlBus;
                Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor;
                Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor;
                Modelica.Mechanics.Rotational.Sensors.AccSensor accSensor;
                Modelica.Mechanics.Rotational.Components.InitializeFlange
                initializeFlange(                            stateSelect=StateSelect.prefer);
                Blocks.Sources.Constant const(k=0);
              equation
                connect(gear.flange_b, flange);
                connect(gear.flange_b, angleSensor.flange);
                connect(gear.flange_b, speedSensor.flange);
                connect(motor.flange_motor, gear.flange_a);
                connect(gear.flange_b, accSensor.flange);
                connect(controller.axisControlBus, axisControlBus);
                connect(motor.axisControlBus, axisControlBus);
                connect(angleSensor.phi, axisControlBus.angle);
                connect(speedSensor.w, axisControlBus.speed);
                connect(accSensor.a, axisControlBus.acceleration);
                connect(axisControlBus.angle_ref, initializeFlange.phi_start);
                connect(axisControlBus.speed_ref, initializeFlange.w_start);
                connect(initializeFlange.flange, flange);
                connect(const.y, initializeFlange.a_start);
              end AxisType2;

              model MechanicalStructure
              "Model of the mechanical part of the r3 robot (without animation)"

                parameter Boolean animation=true
                "= true, if animation shall be enabled";
                parameter SI.Mass mLoad(min=0)=15 "Mass of load";
                parameter SI.Position rLoad[3]={0,0.25,0}
                "Distance from last flange to load mass>";
                parameter SI.Acceleration g=9.81 "Gravity acceleration";
                SI.Angle q[6] "Joint angles";
                SI.AngularVelocity qd[6] "Joint speeds";
                SI.AngularAcceleration qdd[6] "Joint accelerations";
                SI.Torque tau[6] "Joint driving torques";
                //r0={0,0.351,0},

                Modelica.Mechanics.Rotational.Interfaces.Flange_a axis1;
                Modelica.Mechanics.Rotational.Interfaces.Flange_a axis2;
                Modelica.Mechanics.Rotational.Interfaces.Flange_a axis3;
                Modelica.Mechanics.Rotational.Interfaces.Flange_a axis4;
                Modelica.Mechanics.Rotational.Interfaces.Flange_a axis5;
                Modelica.Mechanics.Rotational.Interfaces.Flange_a axis6;
                inner Modelica.Mechanics.MultiBody.World world(
                  g=(g)*Modelica.Math.Vectors.length(
                                                ({0,-1,0})),
                  n={0,-1,0},
                  animateWorld=false,
                  animateGravity=false,
                  enableAnimation=animation);
                Modelica.Mechanics.MultiBody.Joints.Revolute r1(n={0,1,0},useAxisFlange=true,
                    animation=animation);
                Modelica.Mechanics.MultiBody.Joints.Revolute r2(n={1,0,0},useAxisFlange=true,
                    animation=animation);
                Modelica.Mechanics.MultiBody.Joints.Revolute r3(n={1,0,0},useAxisFlange=true,
                    animation=animation);
                Modelica.Mechanics.MultiBody.Joints.Revolute r4(n={0,1,0},useAxisFlange=true,
                    animation=animation);
                Modelica.Mechanics.MultiBody.Joints.Revolute r5(n={1,0,0},useAxisFlange=true,
                    animation=animation);
                Modelica.Mechanics.MultiBody.Joints.Revolute r6(n={0,1,0},useAxisFlange=true,
                    animation=animation);
                Modelica.Mechanics.MultiBody.Parts.BodyShape b0(
                  r={0,0.351,0},
                  shapeType="0",
                  r_shape={0,0,0},
                  lengthDirection={1,0,0},
                  widthDirection={0,1,0},
                  length=0.225,
                  width=0.3,
                  height=0.3,
                  color={0,0,255},
                  animation=animation,
                  animateSphere=false,
                  r_CM={0,0,0},
                  m=1);
                Modelica.Mechanics.MultiBody.Parts.BodyShape b1(
                  r={0,0.324,0.3},
                  I_22=1.16,
                  shapeType="1",
                  lengthDirection={1,0,0},
                  widthDirection={0,1,0},
                  length=0.25,
                  width=0.15,
                  height=0.2,
                  animation=animation,
                  animateSphere=false,
                  color={255,0,0},
                  r_CM={0,0,0},
                  m=1);
                Modelica.Mechanics.MultiBody.Parts.BodyShape b2(
                  r={0,0.65,0},
                  r_CM={0.172,0.205,0},
                  m=56.5,
                  I_11=2.58,
                  I_22=0.64,
                  I_33=2.73,
                  I_21=-0.46,
                  shapeType="2",
                  r_shape={0,0,0},
                  lengthDirection={1,0,0},
                  widthDirection={0,1,0},
                  length=0.5,
                  width=0.2,
                  height=0.15,
                  animation=animation,
                  animateSphere=false,
                  color={255,178,0});
                Modelica.Mechanics.MultiBody.Parts.BodyShape b3(
                  r={0,0.414,-0.155},
                  r_CM={0.064,-0.034,0},
                  m=26.4,
                  I_11=0.279,
                  I_22=0.245,
                  I_33=0.413,
                  I_21=-0.070,
                  shapeType="3",
                  r_shape={0,0,0},
                  lengthDirection={1,0,0},
                  widthDirection={0,1,0},
                  length=0.15,
                  width=0.15,
                  height=0.15,
                  animation=animation,
                  animateSphere=false,
                  color={255,0,0});
                Modelica.Mechanics.MultiBody.Parts.BodyShape b4(
                  r={0,0.186,0},
                  r_CM={0,0,0},
                  m=28.7,
                  I_11=1.67,
                  I_22=0.081,
                  I_33=1.67,
                  shapeType="4",
                  r_shape={0,0,0},
                  lengthDirection={1,0,0},
                  widthDirection={0,1,0},
                  length=0.73,
                  width=0.1,
                  height=0.1,
                  animation=animation,
                  animateSphere=false,
                  color={255,178,0});
                Modelica.Mechanics.MultiBody.Parts.BodyShape b5(
                  r={0,0.125,0},
                  r_CM={0,0,0},
                  m=5.2,
                  I_11=1.25,
                  I_22=0.81,
                  I_33=1.53,
                  shapeType="5",
                  r_shape={0,0,0},
                  lengthDirection={1,0,0},
                  widthDirection={0,1,0},
                  length=0.225,
                  width=0.075,
                  height=0.1,
                  animation=animation,
                  animateSphere=false,
                  color={0,0,255});
                Modelica.Mechanics.MultiBody.Parts.BodyShape b6(
                  r={0,0,0},
                  r_CM={0.05,0.05,0.05},
                  m=0.5,
                  shapeType="6",
                  r_shape={0,0,0},
                  lengthDirection={1,0,0},
                  widthDirection={0,1,0},
                  animation=animation,
                  animateSphere=false,
                  color={0,0,255});
                Modelica.Mechanics.MultiBody.Parts.BodyShape load(
                  r_CM=rLoad,
                  m=mLoad,
                  r_shape={0,0,0},
                  widthDirection={1,0,0},
                  width=0.05,
                  height=0.05,
                  color={255,0,0},
                  lengthDirection=rLoad,
                  length=Modelica.Math.Vectors.length(              rLoad),
                  animation=animation);
              equation
                connect(r6.frame_b, b6.frame_a);
                q = {r1.phi,r2.phi,r3.phi,r4.phi,r5.phi,r6.phi};
                qd = der(q);
                qdd = der(qd);
                tau = {r1.axis.tau,r2.axis.tau,r3.axis.tau,r4.axis.tau,r5.axis.tau,r6.
                  axis.tau};
                connect(load.frame_a, b6.frame_b);
                connect(world.frame_b, b0.frame_a);
                connect(b0.frame_b, r1.frame_a);
                connect(b1.frame_b, r2.frame_a);
                connect(r1.frame_b, b1.frame_a);
                connect(r2.frame_b, b2.frame_a);
                connect(b2.frame_b, r3.frame_a);
                connect(r2.axis, axis2);
                connect(r1.axis, axis1);
                connect(r3.frame_b, b3.frame_a);
                connect(b3.frame_b, r4.frame_a);
                connect(r3.axis, axis3);
                connect(r4.axis, axis4);
                connect(r4.frame_b, b4.frame_a);
                connect(b4.frame_b, r5.frame_a);
                connect(r5.axis, axis5);
                connect(r5.frame_b, b5.frame_a);
                connect(b5.frame_b, r6.frame_a);
                connect(r6.axis, axis6);
              end MechanicalStructure;

              package InternalConnectors
              "Internal models that should not be used"
                expandable connector AxisControlBus
                "Data bus for one robot axis"
                  extends
                  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisControlBus;
                  import SI = Modelica.SIunits;

                  Boolean motion_ref
                  "= true, if reference motion is not in rest";
                  SI.Angle angle_ref "Reference angle of axis flange";
                  SI.Angle angle "Angle of axis flange";
                  SI.AngularVelocity speed_ref "Reference speed of axis flange";
                  SI.AngularVelocity speed "Speed of axis flange";
                  SI.AngularAcceleration acceleration_ref
                  "Reference acceleration of axis flange";
                  SI.AngularAcceleration acceleration
                  "Acceleration of axis flange";
                  SI.Current current_ref "Reference current of motor";
                  SI.Current current "Current of motor";
                  SI.Angle motorAngle "Angle of motor flange";
                  SI.AngularVelocity motorSpeed "Speed of motor flange";
                end AxisControlBus;

                expandable connector ControlBus
                "Data bus for all axes of robot"
                  extends
                  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.ControlBus;
                  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisControlBus
                  axisControlBus1 "Bus of axis 1";
                  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisControlBus
                  axisControlBus2 "Bus of axis 2";
                  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisControlBus
                  axisControlBus3 "Bus of axis 3";
                  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisControlBus
                  axisControlBus4 "Bus of axis 4";
                  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisControlBus
                  axisControlBus5 "Bus of axis 5";
                  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.AxisControlBus
                  axisControlBus6 "Bus of axis 6";

                /*
  parameter Integer naxis=6 "Number of axes";
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.Internal.AxisControlBus
    axisControlBus[naxis];
*/
                end ControlBus;
              end InternalConnectors;

            end Components;


          end RobotR3;
        end Systems;
      end Examples;

      package Frames "Functions to transform rotational frame quantities"
        extends Modelica.Icons.Library;

        record Orientation
        "Orientation object defining rotation from a frame 1 into a frame 2"

          import SI = Modelica.SIunits;
          extends Modelica.Icons.Record;
          Real T[3, 3] "Transformation matrix from world frame to local frame";
          SI.AngularVelocity w[3]
          "Absolute angular velocity of local frame, resolved in local frame";

          encapsulated function equalityConstraint
          "Return the constraint residues to express that two frames have the same orientation"

            import Modelica;
            import Modelica.Mechanics.MultiBody.Frames;
            extends Modelica.Icons.Function;
            input Frames.Orientation R1
            "Orientation object to rotate frame 0 into frame 1";
            input Frames.Orientation R2
            "Orientation object to rotate frame 0 into frame 2";
            output Real residue[3]
            "The rotation angles around x-, y-, and z-axis of frame 1 to rotate frame 1 into frame 2 for a small rotation (should be zero)";
          algorithm
            residue := {
               Modelica.Math.atan2(cross(R1.T[1, :], R1.T[2, :])*R2.T[2, :],R1.T[1,:]*R2.T[1,:]),
               Modelica.Math.atan2(-cross(R1.T[1, :],R1.T[2, :])*R2.T[1, :],R1.T[2,:]*R2.T[2,:]),
               Modelica.Math.atan2(R1.T[2, :]*R2.T[1, :],R1.T[3,:]*R2.T[3,:])};
          end equalityConstraint;


        end Orientation;

        function angularVelocity2
        "Return angular velocity resolved in frame 2 from orientation object"

          extends Modelica.Icons.Function;
          input Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          output Modelica.SIunits.AngularVelocity w[3]
          "Angular velocity of frame 2 with respect to frame 1 resolved in frame 2";
        algorithm
          w := R.w;
        end angularVelocity2;

        function resolve1 "Transform vector from frame 2 to frame 1"
          extends Modelica.Icons.Function;
          input Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          input Real v2[3] "Vector in frame 2";
          output Real v1[3] "Vector in frame 1";
        algorithm
          v1 := transpose(R.T)*v2;
        end resolve1;

        function resolve2 "Transform vector from frame 1 to frame 2"
          extends Modelica.Icons.Function;
          input Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          input Real v1[3] "Vector in frame 1";
          output Real v2[3] "Vector in frame 2";
        algorithm
          v2 := R.T*v1;
        end resolve2;

        function nullRotation
        "Return orientation object that does not rotate a frame"
          extends Modelica.Icons.Function;
          output Orientation R
          "Orientation object such that frame 1 and frame 2 are identical";
        algorithm
          R := Orientation(T=identity(3),w= zeros(3));
        end nullRotation;

        function absoluteRotation
        "Return absolute orientation object from another absolute and a relative orientation object"

          extends Modelica.Icons.Function;
          input Orientation R1
          "Orientation object to rotate frame 0 into frame 1";
          input Orientation R_rel
          "Orientation object to rotate frame 1 into frame 2";
          output Orientation R2
          "Orientation object to rotate frame 0 into frame 2";
        algorithm
          R2 := Orientation(T=R_rel.T*R1.T,w= resolve2(R_rel, R1.w) + R_rel.w);
        end absoluteRotation;

        function planarRotation
        "Return orientation object of a planar rotation"
          import Modelica.Math;
          extends Modelica.Icons.Function;
          input Real e[3](each final unit="1")
          "Normalized axis of rotation (must have length=1)";
          input Modelica.SIunits.Angle angle
          "Rotation angle to rotate frame 1 into frame 2 along axis e";
          input Modelica.SIunits.AngularVelocity der_angle "= der(angle)";
          output Orientation R
          "Orientation object to rotate frame 1 into frame 2";
        algorithm
          R := Orientation(T=[e]*transpose([e]) + (identity(3) - [e]*transpose([e]))*
            Math.cos(angle) - skew(e)*Math.sin(angle),w= e*der_angle);

        end planarRotation;

        function planarRotationAngle
        "Return angle of a planar rotation, given the rotation axis and the representations of a vector in frame 1 and frame 2"

          extends Modelica.Icons.Function;
          input Real e[3](each final unit="1")
          "Normalized axis of rotation to rotate frame 1 around e into frame 2 (must have length=1)";
          input Real v1[3]
          "A vector v resolved in frame 1 (shall not be parallel to e)";
          input Real v2[3]
          "Vector v resolved in frame 2, i.e., v2 = resolve2(planarRotation(e,angle),v1)";
          output Modelica.SIunits.Angle angle
          "Rotation angle to rotate frame 1 into frame 2 along axis e in the range: -pi <= angle <= pi";
        algorithm
          /* Vector v is resolved in frame 1 and frame 2 according to:
        (1)  v2 = (e*transpose(e) + (identity(3) - e*transpose(e))*cos(angle) - skew(e)*sin(angle))*v1;
                = e*(e*v1) + (v1 - e*(e*v1))*cos(angle) - cross(e,v1)*sin(angle)
       Equation (1) is multiplied with "v1" resulting in (note: e*e = 1)
            v1*v2 = (e*v1)*(e*v2) + (v1*v1 - (e*v1)*(e*v1))*cos(angle)
       and therefore:
        (2) cos(angle) = ( v1*v2 - (e*v1)*(e*v2)) / (v1*v1 - (e*v1)*(e*v1))
       Similiarly, equation (1) is multiplied with cross(e,v1), i.e., a
       a vector that is orthogonal to e and to v1:
              cross(e,v1)*v2 = - cross(e,v1)*cross(e,v1)*sin(angle)
       and therefore:
          (3) sin(angle) = -cross(e,v1)*v2/(cross(e,v1)*cross(e,v1));
       We have e*e=1; Therefore:
          (4) v1*v1 - (e*v1)*(e*v1) = |v1|^2 - (|v1|*cos(e,v1))^2
       and
          (5) cross(e,v1)*cross(e,v1) = (|v1|*sin(e,v1))^2
                                      = |v1|^2*(1 - cos(e,v1)^2)
                                      = |v1|^2 - (|v1|*cos(e,v1))^2
       The denominators of (2) and (3) are identical, according to (4) and (5).
       Furthermore, the denominators are always positive according to (5).
       Therefore, in the equation "angle = atan2(sin(angle), cos(angle))" the
       denominators of sin(angle) and cos(angle) can be removed,
       resulting in:
          angle = atan2(-cross(e,v1)*v2, v1*v2 - (e*v1)*(e*v2));
    */
          angle := Modelica.Math.atan2(-cross(e, v1)*v2, v1*v2 - (e*v1)*(e*v2));
        end planarRotationAngle;

        function axesRotations
        "Return fixed rotation object to rotate in sequence around fixed angles along 3 axes"

          import TM =
          Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;
          extends Modelica.Icons.Function;
          input Integer sequence[3](
            min={1,1,1},
            max={3,3,3}) = {1,2,3}
          "Sequence of rotations from frame 1 to frame 2 along axis sequence[i]";
          input Modelica.SIunits.Angle angles[3]
          "Rotation angles around the axes defined in 'sequence'";
          input Modelica.SIunits.AngularVelocity der_angles[3] "= der(angles)";
          output Orientation R
          "Orientation object to rotate frame 1 into frame 2";
        algorithm
          /*
  R := absoluteRotation(absoluteRotation(axisRotation(sequence[1], angles[1],
    der_angles[1]), axisRotation(sequence[2], angles[2], der_angles[2])),
    axisRotation(sequence[3], angles[3], der_angles[3]));
*/
          R := Orientation(T=TM.axisRotation(sequence[3], angles[3])*TM.axisRotation(
            sequence[2], angles[2])*TM.axisRotation(sequence[1], angles[1]),w=
            Frames.axis(sequence[3])*der_angles[3] + TM.resolve2(TM.axisRotation(
            sequence[3], angles[3]), Frames.axis(sequence[2])*der_angles[2]) +
            TM.resolve2(TM.axisRotation(sequence[3], angles[3])*TM.axisRotation(
            sequence[2], angles[2]), Frames.axis(sequence[1])*der_angles[1]));
        end axesRotations;

        function axesRotationsAngles
        "Return the 3 angles to rotate in sequence around 3 axes to construct the given orientation object"

          import SI = Modelica.SIunits;

          extends Modelica.Icons.Function;
          input Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          input Integer sequence[3](
            min={1,1,1},
            max={3,3,3}) = {1,2,3}
          "Sequence of rotations from frame 1 to frame 2 along axis sequence[i]";
          input SI.Angle guessAngle1=0
          "Select angles[1] such that |angles[1] - guessAngle1| is a minimum";
          output SI.Angle angles[3]
          "Rotation angles around the axes defined in 'sequence' such that R=Frames.axesRotation(sequence,angles); -pi < angles[i] <= pi";
      protected
          Real e1_1[3](each final unit="1")
          "First rotation axis, resolved in frame 1";
          Real e2_1a[3](each final unit="1")
          "Second rotation axis, resolved in frame 1a";
          Real e3_1[3](each final unit="1")
          "Third rotation axis, resolved in frame 1";
          Real e3_2[3](each final unit="1")
          "Third rotation axis, resolved in frame 2";
          Real A
          "Coefficient A in the equation A*cos(angles[1])+B*sin(angles[1]) = 0";
          Real B
          "Coefficient B in the equation A*cos(angles[1])+B*sin(angles[1]) = 0";
          SI.Angle angle_1a "Solution 1 for angles[1]";
          SI.Angle angle_1b "Solution 2 for angles[1]";
          TransformationMatrices.Orientation T_1a
          "Orientation object to rotate frame 1 into frame 1a";
        algorithm
          /* The rotation object R is constructed by:
     (1) Rotating frame 1 along axis e1 (= axis sequence[1]) with angles[1]
         arriving at frame 1a.
     (2) Rotating frame 1a along axis e2 (= axis sequence[2]) with angles[2]
         arriving at frame 1b.
     (3) Rotating frame 1b along axis e3 (= axis sequence[3]) with angles[3]
         arriving at frame 2.
     The goal is to determine angles[1:3]. This is performed in the following way:
     1. e2 and e3 are perpendicular to each other, i.e., e2*e3 = 0;
        Both vectors are resolved in frame 1 (T_ij is transformation matrix
        from frame j to frame i; e1_1*e2_1a = 0, since the vectors are
        perpendicular to each other):
           e3_1 = T_12*e3_2
                = R[sequence[3],:];
           e2_1 = T_11a*e2_1a
                = ( e1_1*transpose(e1_1) + (identity(3) - e1_1*transpose(e1_1))*cos(angles[1])
                    + skew(e1_1)*sin(angles[1]) )*e2_1a
                = e2_1a*cos(angles[1]) + cross(e1_1, e2_1a)*sin(angles[1]);
        From this follows finally an equation for angles[1]
           e2_1*e3_1 = 0
                     = (e2_1a*cos(angles[1]) + cross(e1_1, e2_1a)*sin(angles[1]))*e3_1
                     = (e2_1a*e3_1)*cos(angles[1]) + cross(e1_1, e2_1a)*e3_1*sin(angles[1])
                     = A*cos(angles[1]) + B*sin(angles[1])
                       with A = e2_1a*e3_1, B = cross(e1_1, e2_1a)*e3_1
        This equation has two solutions in the range -pi < angles[1] <= pi:
           sin(angles[1]) =  k*A/sqrt(A*A + B*B)
           cos(angles[1]) = -k*B/sqrt(A*A + B*B)
                        k = +/-1
           tan(angles[1]) = k*A/(-k*B)
        that is:
           angles[1] = atan2(k*A, -k*B)
        If A and B are both zero at the same time, there is a singular configuration
        resulting in an infinite number of solutions for angles[1] (every value
        is possible).
     2. angles[2] is determined with function Frames.planarRotationAngle.
        This function requires to provide e_3 in frame 1a and in frame 1b:
          e3_1a = Frames.resolve2(planarRotation(e1_1,angles[1]), e3_1);
          e3_1b = e3_2
     3. angles[3] is determined with function Frames.planarRotationAngle.
        This function requires to provide e_2 in frame 1b and in frame 2:
          e2_1b = e2_1a
          e2_2  = Frames.resolve2( R, Frames.resolve1(planarRotation(e1_1,angles[1]), e2_1a));
  */
          assert(sequence[1] <> sequence[2] and sequence[2] <> sequence[3],
            "input argument 'sequence[1:3]' is not valid");
          e1_1 := if sequence[1] == 1 then {1,0,0} else if sequence[1] == 2 then {0,1,
            0} else {0,0,1};
          e2_1a := if sequence[2] == 1 then {1,0,0} else if sequence[2] == 2 then {0,
            1,0} else {0,0,1};
          e3_1 := R.T[sequence[3], :];
          e3_2 := if sequence[3] == 1 then {1,0,0} else if sequence[3] == 2 then {0,1,
            0} else {0,0,1};

          A := e2_1a*e3_1;
          B := cross(e1_1, e2_1a)*e3_1;
          if abs(A) <= 1.e-12 and abs(B) <= 1.e-12 then
            angles[1] := guessAngle1;
          else
            angle_1a := Modelica.Math.atan2(A, -B);
            angle_1b := Modelica.Math.atan2(-A, B);
            angles[1] := if abs(angle_1a - guessAngle1) <= abs(angle_1b - guessAngle1) then 
                    angle_1a else angle_1b;
          end if;
          T_1a := TransformationMatrices.planarRotation(e1_1, angles[1]);
          angles[2] := planarRotationAngle(e2_1a, TransformationMatrices.resolve2(
            T_1a, e3_1), e3_2);
          angles[3] := planarRotationAngle(e3_2, e2_1a,
            TransformationMatrices.resolve2(R.T, TransformationMatrices.resolve1(T_1a,
             e2_1a)));

        end axesRotationsAngles;

        function from_Q
        "Return orientation object R from quaternion orientation object Q"

          extends Modelica.Icons.Function;
          input Quaternions.Orientation Q
          "Quaternions orientation object to rotate frame 1 into frame 2";
          input Modelica.SIunits.AngularVelocity w[3]
          "Angular velocity from frame 2 with respect to frame 1, resolved in frame 2";
          output Orientation R
          "Orientation object to rotate frame 1 into frame 2";
        algorithm
          /*
  T := (2*Q[4]*Q[4] - 1)*identity(3) + 2*([Q[1:3]]*transpose([Q[1:3]]) - Q[4]*
    skew(Q[1:3]));
*/
          R := Orientation([2*(Q[1]*Q[1] + Q[4]*Q[4]) - 1, 2*(Q[1]*Q[2] + Q[3]*Q[4]),
             2*(Q[1]*Q[3] - Q[2]*Q[4]); 2*(Q[2]*Q[1] - Q[3]*Q[4]), 2*(Q[2]*Q[2] + Q[4]
            *Q[4]) - 1, 2*(Q[2]*Q[3] + Q[1]*Q[4]); 2*(Q[3]*Q[1] + Q[2]*Q[4]), 2*(Q[3]
            *Q[2] - Q[1]*Q[4]), 2*(Q[3]*Q[3] + Q[4]*Q[4]) - 1],w= w);
        end from_Q;

        function to_Q
        "Return quaternion orientation object Q from orientation object R"

          extends Modelica.Icons.Function;
          input Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          input Quaternions.Orientation Q_guess=Quaternions.nullRotation()
          "Guess value for output Q (there are 2 solutions; the one closer to Q_guess is used";
          output Quaternions.Orientation Q
          "Quaternions orientation object to rotate frame 1 into frame 2";
        algorithm
          Q := Quaternions.from_T(R.T, Q_guess);
        end to_Q;

        function axis "Return unit vector for x-, y-, or z-axis"
          extends Modelica.Icons.Function;
          input Integer axis(min=1, max=3) "Axis vector to be returned";
          output Real e[3](each final unit="1") "Unit axis vector";
        algorithm
          e := if axis == 1 then {1,0,0} else (if axis == 2 then {0,1,0} else {0,0,1});
        end axis;

        package Quaternions
        "Functions to transform rotational frame quantities based on quaternions (also called Euler parameters)"
          extends Modelica.Icons.Library;

          type Orientation
          "Orientation type defining rotation from a frame 1 into a frame 2 with quaternions {p1,p2,p3,p0}"

            extends Internal.QuaternionBase;

            encapsulated function equalityConstraint
            "Return the constraint residues to express that two frames have the same quaternion orientation"

              import Modelica;
              import Modelica.Mechanics.MultiBody.Frames.Quaternions;
              extends Modelica.Icons.Function;
              input Quaternions.Orientation Q1
              "Quaternions orientation object to rotate frame 0 into frame 1";
              input Quaternions.Orientation Q2
              "Quaternions orientation object to rotate frame 0 into frame 2";
              output Real residue[3]
              "The half of the rotation angles around x-, y-, and z-axis of frame 1 to rotate frame 1 into frame 2 for a small rotation (shall be zero)";
            algorithm
              residue := [Q1[4], Q1[3], -Q1[2], -Q1[1]; -Q1[3], Q1[4], Q1[1], -Q1[2];
                 Q1[2], -Q1[1], Q1[4], -Q1[3]]*Q2;
            end equalityConstraint;

          end Orientation;

          type der_Orientation = Real[4] (each unit="1/s")
          "First time derivative of Quaternions.Orientation";

          function orientationConstraint
          "Return residues of orientation constraints (shall be zero)"
            extends Modelica.Icons.Function;
            input Quaternions.Orientation Q
            "Quaternions orientation object to rotate frame 1 into frame 2";
            output Real residue[1] "Residue constraint (shall be zero)";
          algorithm
            residue := {Q*Q - 1};
          end orientationConstraint;

          function angularVelocity2
          "Compute angular velocity resolved in frame 2 from quaternions orientation object and its derivative"

            extends Modelica.Icons.Function;
            input Quaternions.Orientation Q
            "Quaternions orientation object to rotate frame 1 into frame 2";
            input der_Orientation der_Q "Derivative of Q";
            output Modelica.SIunits.AngularVelocity w[3]
            "Angular velocity of frame 2 with respect to frame 1 resolved in frame 2";
          algorithm
            w := 2*([Q[4], Q[3], -Q[2], -Q[1]; -Q[3], Q[4], Q[1], -Q[2]; Q[2], -Q[1],
               Q[4], -Q[3]]*der_Q);
          end angularVelocity2;

          function nullRotation
          "Return quaternions orientation object that does not rotate a frame"

            extends Modelica.Icons.Function;
            output Quaternions.Orientation Q
            "Quaternions orientation object to rotate frame 1 into frame 2";
          algorithm
            Q := {0,0,0,1};
          end nullRotation;

          function from_T
          "Return quaternions orientation object Q from transformation matrix T"

            extends Modelica.Icons.Function;
            input Real T[3, 3]
            "Transformation matrix to transform vector from frame 1 to frame 2 (v2=T*v1)";
            input Quaternions.Orientation Q_guess=nullRotation()
            "Guess value for Q (there are 2 solutions; the one close to Q_guess is used";
            output Quaternions.Orientation Q
            "Quaternions orientation object to rotate frame 1 into frame 2 (Q and -Q have same transformation matrix)";
        protected
            Real paux;
            Real paux4;
            Real c1;
            Real c2;
            Real c3;
            Real c4;
            constant Real p4limit=0.1;
            constant Real c4limit=4*p4limit*p4limit;
          algorithm
            /*
   Note, for quaternions, Q and -Q have the same transformation matrix.
   Calculation of quaternions from transformation matrix T:
   It is guaranteed that c1>=0, c2>=0, c3>=0, c4>=0 and
   that not all of them can be zero at the same time
   (e.g. if 3 of them are zero, the 4th variable is 1).
   Since the sqrt(..) has to be performed on one of these variables,
   it is applied on a variable which is far enough from zero.
   This guarantees that the sqrt(..) is never taken near zero
   and therefore the derivative of sqrt(..) can never be infinity.
   There is an ambiguity for quaternions, since Q and -Q
   lead to the same transformation matrix. The ambiguity
   is resolved here by selecting the Q that is closer to
   the input argument Q_guess.
*/
            c1 := 1 + T[1, 1] - T[2, 2] - T[3, 3];
            c2 := 1 + T[2, 2] - T[1, 1] - T[3, 3];
            c3 := 1 + T[3, 3] - T[1, 1] - T[2, 2];
            c4 := 1 + T[1, 1] + T[2, 2] + T[3, 3];

            if c4 > c4limit or (c4 > c1 and c4 > c2 and c4 > c3) then
              paux := sqrt(c4)/2;
              paux4 := 4*paux;
              Q := {(T[2, 3] - T[3, 2])/paux4,(T[3, 1] - T[1, 3])/paux4,(T[1, 2] - T[
                2, 1])/paux4,paux};

            elseif c1 > c2 and c1 > c3 and c1 > c4 then
              paux := sqrt(c1)/2;
              paux4 := 4*paux;
              Q := {paux,(T[1, 2] + T[2, 1])/paux4,(T[1, 3] + T[3, 1])/paux4,(T[2, 3]
                 - T[3, 2])/paux4};

            elseif c2 > c1 and c2 > c3 and c2 > c4 then
              paux := sqrt(c2)/2;
              paux4 := 4*paux;
              Q := {(T[1, 2] + T[2, 1])/paux4,paux,(T[2, 3] + T[3, 2])/paux4,(T[3, 1]
                 - T[1, 3])/paux4};

            else
              paux := sqrt(c3)/2;
              paux4 := 4*paux;
              Q := {(T[1, 3] + T[3, 1])/paux4,(T[2, 3] + T[3, 2])/paux4,paux,(T[1, 2]
                 - T[2, 1])/paux4};
            end if;

            if Q*Q_guess < 0 then
              Q := -Q;
            end if;
          end from_T;
        end Quaternions;

        package TransformationMatrices "Functions for transformation matrices"
          extends Modelica.Icons.Library;

          type Orientation
          "Orientation type defining rotation from a frame 1 into a frame 2 with a transformation matrix"

            extends Internal.TransformationMatrix;

            encapsulated function equalityConstraint
            "Return the constraint residues to express that two frames have the same orientation"

              import Modelica;
              import Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;
              extends Modelica.Icons.Function;
              input TransformationMatrices.Orientation T1
              "Orientation object to rotate frame 0 into frame 1";
              input TransformationMatrices.Orientation T2
              "Orientation object to rotate frame 0 into frame 2";
              output Real residue[3]
              "The rotation angles around x-, y-, and z-axis of frame 1 to rotate frame 1 into frame 2 for a small rotation (should be zero)";
            algorithm
              residue := {cross(T1[1, :], T1[2, :])*T2[2, :],-cross(T1[1, :], T1[2, :])
                *T2[1, :],T1[2, :]*T2[1, :]};
            end equalityConstraint;
          end Orientation;

          function resolve1 "Transform vector from frame 2 to frame 1"
            extends Modelica.Icons.Function;
            input TransformationMatrices.Orientation T
            "Orientation object to rotate frame 1 into frame 2";
            input Real v2[3] "Vector in frame 2";
            output Real v1[3] "Vector in frame 1";
          algorithm
            v1 := transpose(T)*v2;
          end resolve1;

          function resolve2 "Transform vector from frame 1 to frame 2"
            extends Modelica.Icons.Function;
            input TransformationMatrices.Orientation T
            "Orientation object to rotate frame 1 into frame 2";
            input Real v1[3] "Vector in frame 1";
            output Real v2[3] "Vector in frame 2";
          algorithm
            v2 := T*v1;
          end resolve2;

          function absoluteRotation
          "Return absolute orientation object from another absolute and a relative orientation object"

            extends Modelica.Icons.Function;
            input TransformationMatrices.Orientation T1
            "Orientation object to rotate frame 0 into frame 1";
            input TransformationMatrices.Orientation T_rel
            "Orientation object to rotate frame 1 into frame 2";
            output TransformationMatrices.Orientation T2
            "Orientation object to rotate frame 0 into frame 2";
          algorithm
            T2 := T_rel*T1;
          end absoluteRotation;

          function planarRotation
          "Return orientation object of a planar rotation"
            import Modelica.Math;
            extends Modelica.Icons.Function;
            input Real e[3](each final unit="1")
            "Normalized axis of rotation (must have length=1)";
            input Modelica.SIunits.Angle angle
            "Rotation angle to rotate frame 1 into frame 2 along axis e";
            output TransformationMatrices.Orientation T
            "Orientation object to rotate frame 1 into frame 2";
          algorithm
            T := [e]*transpose([e]) + (identity(3) - [e]*transpose([e]))*Math.cos(
              angle) - skew(e)*Math.sin(angle);
          end planarRotation;

          function axisRotation
          "Return rotation object to rotate around one frame axis"
            import Modelica.Math.*;
            extends Modelica.Icons.Function;
            input Integer axis(min=1, max=3) "Rotate around 'axis' of frame 1";
            input Modelica.SIunits.Angle angle
            "Rotation angle to rotate frame 1 into frame 2 along 'axis' of frame 1";
            output TransformationMatrices.Orientation T
            "Orientation object to rotate frame 1 into frame 2";
          algorithm
            T := if axis == 1 then [1, 0, 0; 0, cos(angle), sin(angle); 0, -sin(angle),
               cos(angle)] else if axis == 2 then [cos(angle), 0, -sin(angle); 0, 1,
              0; sin(angle), 0, cos(angle)] else [cos(angle), sin(angle), 0; -sin(
              angle), cos(angle), 0; 0, 0, 1];
          end axisRotation;

          function from_nxy
          "Return orientation object from n_x and n_y vectors"
            extends Modelica.Icons.Function;
            input Real n_x[3](each final unit="1")
            "Vector in direction of x-axis of frame 2, resolved in frame 1";
            input Real n_y[3](each final unit="1")
            "Vector in direction of y-axis of frame 2, resolved in frame 1";
            output TransformationMatrices.Orientation T
            "Orientation object to rotate frame 1 into frame 2";
        protected
            Real abs_n_x=sqrt(n_x*n_x);
            Real e_x[3](each final unit="1")=if abs_n_x < 1.e-10 then {1,0,0} else n_x/abs_n_x;
            Real n_z_aux[3](each final unit="1")=cross(e_x, n_y);
            Real n_y_aux[3](each final unit="1")=if n_z_aux*n_z_aux > 1.0e-6 then n_y else (if abs(e_x[1])
                 > 1.0e-6 then {0,1,0} else {1,0,0});
            Real e_z_aux[3](each final unit="1")=cross(e_x, n_y_aux);
            Real e_z[3](each final unit="1")=e_z_aux/sqrt(e_z_aux*e_z_aux);
          algorithm
            T := {e_x,cross(e_z, e_x),e_z};
          end from_nxy;
        end TransformationMatrices;

        package Internal
        "Internal definitions that may be removed or changed (do not use)"
          extends Modelica.Icons.Library;

          type TransformationMatrix = Real[3, 3];

          type QuaternionBase = Real[4];

          function resolve1_der "Derivative of function Frames.resolve1(..)"
            import Modelica.Mechanics.MultiBody.Frames;
            extends Modelica.Icons.Function;
            input Orientation R
            "Orientation object to rotate frame 1 into frame 2";
            input Real v2[3] "Vector resolved in frame 2";
            input Real v2_der[3] "= der(v2)";
            output Real v1_der[3] "Derivative of vector v resolved in frame 1";
          algorithm
            v1_der := Frames.resolve1(R, v2_der + cross(R.w, v2));
          end resolve1_der;

          function resolve2_der "Derivative of function Frames.resolve2(..)"
            import Modelica.Mechanics.MultiBody.Frames;
            extends Modelica.Icons.Function;
            input Orientation R
            "Orientation object to rotate frame 1 into frame 2";
            input Real v1[3] "Vector resolved in frame 1";
            input Real v1_der[3] "= der(v1)";
            output Real v2_der[3] "Derivative of vector v resolved in frame 2";
          algorithm
            v2_der := Frames.resolve2(R, v1_der) - cross(R.w, Frames.resolve2(R, v1));
          end resolve2_der;
        end Internal;
      end Frames;

      package Interfaces
      "Connectors and partial models for 3-dim. mechanical components"
        extends Modelica.Icons.Library;

        connector Frame
        "Coordinate system fixed to the component with one cut-force and cut-torque (no icon)"
          import SI = Modelica.SIunits;
          SI.Position r_0[3]
          "Position vector from world frame to the connector frame origin, resolved in world frame";
          Frames.Orientation R
          "Orientation object to rotate the world frame into the connector frame";
          flow SI.Force f[3] "Cut-force resolved in connector frame";
          flow SI.Torque t[3] "Cut-torque resolved in connector frame";
        end Frame;

        connector Frame_a
        "Coordinate system fixed to the component with one cut-force and cut-torque (filled rectangular icon)"
          extends Frame;

        end Frame_a;

        connector Frame_b
        "Coordinate system fixed to the component with one cut-force and cut-torque (non-filled rectangular icon)"
          extends Frame;

        end Frame_b;
      end Interfaces;

      package Joints "Components that constrain the motion between two frames"
        import SI = Modelica.SIunits;
        extends Modelica.Icons.Library;

        model Revolute
        "Revolute joint (1 rotational degree-of-freedom, 2 potential states, optional axis flange)"

          import SI = Modelica.SIunits;

          Modelica.Mechanics.Rotational.Interfaces.Flange_a axis if useAxisFlange
          "1-dim. rotational flange that drives the joint";
          Modelica.Mechanics.Rotational.Interfaces.Flange_b support if useAxisFlange
          "1-dim. rotational flange of the drive support (assumed to be fixed in the world frame, NOT in the joint)";

          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
          "Coordinate system fixed to the joint with one cut-force and cut-torque";
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b
          "Coordinate system fixed to the joint with one cut-force and cut-torque";

          parameter Boolean useAxisFlange=false
          "= true, if axis flange is enabled";
          parameter Boolean animation=true
          "= true, if animation shall be enabled (show axis as cylinder)";
          parameter Modelica.Mechanics.MultiBody.Types.Axis n={0,0,1}
          "Axis of rotation resolved in frame_a (= same as in frame_b)";
          constant SI.Angle phi_offset=0
          "Relative angle offset (angle = phi_offset + phi)";
          parameter SI.Distance cylinderLength=world.defaultJointLength
          "Length of cylinder representing the joint axis";
          parameter SI.Distance cylinderDiameter=world.defaultJointWidth
          "Diameter of cylinder representing the joint axis";
          input Modelica.Mechanics.MultiBody.Types.Color cylinderColor=Modelica.Mechanics.MultiBody.Types.Defaults.JointColor
          "Color of cylinder representing the joint axis";
          input Modelica.Mechanics.MultiBody.Types.SpecularCoefficient
          specularCoefficient =                                                              world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";
          parameter StateSelect stateSelect=StateSelect.prefer
          "Priority to use joint angle phi and w=der(phi) as states";

          SI.Angle phi(start=0, final stateSelect=stateSelect)
          "Relative rotation angle from frame_a to frame_b";
          SI.AngularVelocity w(start=0, stateSelect=stateSelect)
          "First derivative of angle phi (relative angular velocity)";
          SI.AngularAcceleration a(start=0)
          "Second derivative of angle phi (relative angular acceleration)";
          SI.Torque tau "Driving torque in direction of axis of rotation";
          SI.Angle angle "= phi_offset + phi";

      protected
          outer Modelica.Mechanics.MultiBody.World world;
          parameter Real e[3](each final unit="1")=Modelica.Math.Vectors.normalize(
                                               n)
          "Unit vector in direction of rotation axis, resolved in frame_a (= same as in frame_b)";
          Frames.Orientation R_rel
          "Relative orientation object from frame_a to frame_b or from frame_b to frame_a";
          Visualizers.Advanced.Shape cylinder(
            shapeType="cylinder",
            color=cylinderColor,
            specularCoefficient=specularCoefficient,
            length=cylinderLength,
            width=cylinderDiameter,
            height=cylinderDiameter,
            lengthDirection=e,
            widthDirection={0,1,0},
            r_shape=-e*(cylinderLength/2),
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;

      protected
          Modelica.Mechanics.Rotational.Components.Fixed fixed
          "support flange is fixed to ground";
          Rotational.Interfaces.InternalSupport internalAxis(tau=tau);
          Rotational.Sources.ConstantTorque constantTorque(tau_constant=0) if not useAxisFlange;
        equation
          Connections.branch(frame_a.R, frame_b.R);

          assert(cardinality(frame_a) > 0,
            "Connector frame_a of revolute joint is not connected");
          assert(cardinality(frame_b) > 0,
            "Connector frame_b of revolute joint is not connected");

          angle = phi_offset + phi;
          w = der(phi);
          a = der(w);

          // relationships between quantities of frame_a and of frame_b
          frame_b.r_0 = frame_a.r_0;

          if rooted(frame_a.R) then
            R_rel = Frames.planarRotation(e, phi_offset + phi, w);
            frame_b.R = Frames.absoluteRotation(frame_a.R, R_rel);
            frame_a.f = -Frames.resolve1(R_rel, frame_b.f);
            frame_a.t = -Frames.resolve1(R_rel, frame_b.t);
          else
            R_rel = Frames.planarRotation(-e, phi_offset + phi, w);
            frame_a.R = Frames.absoluteRotation(frame_b.R, R_rel);
            frame_b.f = -Frames.resolve1(R_rel, frame_a.f);
            frame_b.t = -Frames.resolve1(R_rel, frame_a.t);
          end if;

          // d'Alemberts principle
          tau = -frame_b.t*e;

          // Connection to internal connectors
          phi = internalAxis.phi;

          connect(fixed.flange, support);
          connect(internalAxis.flange, axis);
          connect(constantTorque.flange, internalAxis.flange);
        end Revolute;
      end Joints;

      package Parts
      "Rigid components such as bodies with mass and inertia and massless rods"
        import SI = Modelica.SIunits;
        extends Modelica.Icons.Library;

        model FixedTranslation
        "Fixed translation of frame_b with respect to frame_a"

          import SI = Modelica.SIunits;
          import Modelica.Mechanics.MultiBody.Types;
          Interfaces.Frame_a frame_a
          "Coordinate system fixed to the component with one cut-force and cut-torque";
          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the component with one cut-force and cut-torque";

          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter SI.Position r[3](start={0,0,0})
          "Vector from frame_a to frame_b resolved in frame_a";
          parameter Types.ShapeType shapeType="cylinder" " Type of shape";
          parameter SI.Position r_shape[3]={0,0,0}
          " Vector from frame_a to shape origin, resolved in frame_a";
          parameter Types.Axis lengthDirection=r - r_shape
          " Vector in length direction of shape, resolved in frame_a";
          parameter Types.Axis widthDirection={0,1,0}
          " Vector in width direction of shape, resolved in frame_a";
          parameter SI.Length length=Modelica.Math.Vectors.length(
                                                   r - r_shape)
          " Length of shape";
          parameter SI.Distance width=length/world.defaultWidthFraction
          " Width of shape";
          parameter SI.Distance height=width " Height of shape.";
          parameter Types.ShapeExtra extra=0.0
          " Additional parameter depending on shapeType (see docu of Visualizers.Advanced.Shape).";
          input Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.RodColor
          " Color of shape";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";


      protected
          outer Modelica.Mechanics.MultiBody.World world;
          Visualizers.Advanced.Shape shape(
            shapeType=shapeType,
            color=color,
            specularCoefficient=specularCoefficient,
            r_shape=r_shape,
            lengthDirection=lengthDirection,
            widthDirection=widthDirection,
            length=length,
            width=width,
            height=height,
            extra=extra,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;
        equation
          Connections.branch(frame_a.R, frame_b.R);
          assert(cardinality(frame_a) > 0 or cardinality(frame_b) > 0,
            "Neither connector frame_a nor frame_b of FixedTranslation object is connected");

          frame_b.r_0 = frame_a.r_0 + Frames.resolve1(frame_a.R, r);
          frame_b.R = frame_a.R;

          /* Force and torque balance */
          zeros(3) = frame_a.f + frame_b.f;
          zeros(3) = frame_a.t + frame_b.t + cross(r, frame_b.f);
        end FixedTranslation;

        model Body
        "Rigid body with mass, inertia tensor and one frame connector (12 potential states)"

          import SI = Modelica.SIunits;
          import C = Modelica.Constants;
          import Modelica.Math.*;
          import Modelica.Mechanics.MultiBody.Types;
          import Modelica.Mechanics.MultiBody.Frames;
          Interfaces.Frame_a frame_a "Coordinate system fixed at body";
          parameter Boolean animation=true
          "= true, if animation shall be enabled (show cylinder and sphere)";
          parameter SI.Position r_CM[3](start={0,0,0})
          "Vector from frame_a to center of mass, resolved in frame_a";
          parameter SI.Mass m(min=0, start = 1) "Mass of rigid body";
          parameter SI.Inertia I_11(min=0) = 0.001
          " (1,1) element of inertia tensor";
          parameter SI.Inertia I_22(min=0) = 0.001
          " (2,2) element of inertia tensor";
          parameter SI.Inertia I_33(min=0) = 0.001
          " (3,3) element of inertia tensor";
          parameter SI.Inertia I_21(min=-C.inf)=0
          " (2,1) element of inertia tensor";
          parameter SI.Inertia I_31(min=-C.inf)=0
          " (3,1) element of inertia tensor";
          parameter SI.Inertia I_32(min=-C.inf)=0
          " (3,2) element of inertia tensor";

          SI.Position r_0[3](start={0,0,0}, stateSelect=if enforceStates then 
                      StateSelect.always else StateSelect.avoid)
          "Position vector from origin of world frame to origin of frame_a";
          SI.Velocity v_0[3](start={0,0,0}, stateSelect=if enforceStates then StateSelect.always else 
                      StateSelect.avoid)
          "Absolute velocity of frame_a, resolved in world frame (= der(r_0))";
          SI.Acceleration a_0[3](start={0,0,0})
          "Absolute acceleration of frame_a resolved in world frame (= der(v_0))";

          parameter Boolean angles_fixed = false
          "= true, if angles_start are used as initial values, else as guess values";
          parameter SI.Angle angles_start[3]={0,0,0}
          "Initial values of angles to rotate frame_a around 'sequence_start' axes into frame_b";
          parameter Types.RotationSequence sequence_start={1,2,3}
          "Sequence of rotations to rotate frame_a into frame_b at initial time";

          parameter Boolean w_0_fixed = false
          "= true, if w_0_start are used as initial values, else as guess values";
          parameter SI.AngularVelocity w_0_start[3]={0,0,0}
          "Initial or guess values of angular velocity of frame_a resolved in world frame";

          parameter Boolean z_0_fixed = false
          "= true, if z_0_start are used as initial values, else as guess values";
          parameter SI.AngularAcceleration z_0_start[3]={0,0,0}
          "Initial values of angular acceleration z_0 = der(w_0)";

          parameter SI.Diameter sphereDiameter=world.defaultBodyDiameter
          "Diameter of sphere";
          input Types.Color sphereColor=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor
          "Color of sphere";
          parameter SI.Diameter cylinderDiameter=sphereDiameter/Types.Defaults.
              BodyCylinderDiameterFraction "Diameter of cylinder";
          input Types.Color cylinderColor=sphereColor "Color of cylinder";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";
          parameter Boolean enforceStates=false
          " = true, if absolute variables of body object shall be used as states (StateSelect.always)";
          parameter Boolean useQuaternions=true
          " = true, if quaternions shall be used as potential states otherwise use 3 angles as potential states";
          parameter Types.RotationSequence sequence_angleStates={1,2,3}
          " Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states";

          final parameter SI.Inertia I[3, 3]=[I_11, I_21, I_31; I_21, I_22, I_32;
              I_31, I_32, I_33] "inertia tensor";
          final parameter Frames.Orientation R_start=Modelica.Mechanics.MultiBody.Frames.axesRotations(
              sequence_start, angles_start, zeros(3))
          "Orientation object from world frame to frame_a at initial time";
          final parameter SI.AngularAcceleration z_a_start[3]=Frames.resolve2(R_start, z_0_start)
          "Initial values of angular acceleration z_a = der(w_a), i.e., time derivative of angular velocity resolved in frame_a";

          SI.AngularVelocity w_a[3](start=Frames.resolve2(R_start, w_0_start),
                                    fixed=fill(w_0_fixed,3),
                                    stateSelect=if enforceStates then (if useQuaternions then 
                                    StateSelect.always else StateSelect.never) else StateSelect.avoid)
          "Absolute angular velocity of frame_a resolved in frame_a";
          SI.AngularAcceleration z_a[3](start=Frames.resolve2(R_start, z_0_start),fixed=fill(z_0_fixed,3))
          "Absolute angular acceleration of frame_a resolved in frame_a";
          SI.Acceleration g_0[3] "Gravity acceleration resolved in world frame";

      protected
          outer Modelica.Mechanics.MultiBody.World world;

          // Declarations for quaternions (dummies, if quaternions are not used)
          parameter Frames.Quaternions.Orientation Q_start=Frames.to_Q(R_start)
          "Quaternion orientation object from world frame to frame_a at initial time";
          Frames.Quaternions.Orientation Q(start=Q_start, stateSelect=if 
                enforceStates then (if useQuaternions then StateSelect.prefer else 
                StateSelect.never) else StateSelect.avoid)
          "Quaternion orientation object from world frame to frame_a (dummy value, if quaternions are not used as states)";

          // Declaration for 3 angles
          parameter SI.Angle phi_start[3]=if sequence_start[1] ==
              sequence_angleStates[1] and sequence_start[2] == sequence_angleStates[2]
               and sequence_start[3] == sequence_angleStates[3] then angles_start else 
               Frames.axesRotationsAngles(R_start, sequence_angleStates)
          "Potential angle states at initial time";
          SI.Angle phi[3](start=phi_start, stateSelect=if enforceStates then (if 
                useQuaternions then StateSelect.never else StateSelect.always) else 
                StateSelect.avoid)
          "Dummy or 3 angles to rotate world frame into frame_a of body";
          SI.AngularVelocity phi_d[3](stateSelect=if enforceStates then (if 
                useQuaternions then StateSelect.never else StateSelect.always) else 
                StateSelect.avoid) "= der(phi)";
          SI.AngularAcceleration phi_dd[3] "= der(phi_d)";

          // Declarations for animation
          Visualizers.Advanced.Shape cylinder(
            shapeType="cylinder",
            color=cylinderColor,
            specularCoefficient=specularCoefficient,
            length=if Modelica.Math.Vectors.length(r_CM) > sphereDiameter/2 then 
                      Modelica.Math.Vectors.length(r_CM) - (if cylinderDiameter > 1.1*
                sphereDiameter then sphereDiameter/2 else 0) else 0,
            width=cylinderDiameter,
            height=cylinderDiameter,
            lengthDirection=r_CM,
            widthDirection={0,1,0},
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;
          Visualizers.Advanced.Shape sphere(
            shapeType="sphere",
            color=sphereColor,
            specularCoefficient=specularCoefficient,
            length=sphereDiameter,
            width=sphereDiameter,
            height=sphereDiameter,
            lengthDirection={1,0,0},
            widthDirection={0,1,0},
            r_shape=r_CM - {1,0,0}*sphereDiameter/2,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation and sphereDiameter > 0;
        initial equation
          if angles_fixed then
            // Initialize positional variables
            if not Connections.isRoot(frame_a.R) then
              // frame_a.R is computed somewhere else
              zeros(3) = Frames.Orientation.equalityConstraint(frame_a.R, R_start);
            elseif useQuaternions then
              // frame_a.R is computed from quaternions Q
              zeros(3) = Frames.Quaternions.Orientation.equalityConstraint(Q, Q_start);
            else
              // frame_a.R is computed from the 3 angles 'phi'
              phi = phi_start;
            end if;
          end if;

        equation
          if enforceStates then
            Connections.root(frame_a.R);
          else
            Connections.potentialRoot(frame_a.R);
          end if;
          r_0 = frame_a.r_0;

          if not Connections.isRoot(frame_a.R) then
            // Body does not have states
            // Dummies
            Q = {0,0,0,1};
            phi = zeros(3);
            phi_d = zeros(3);
            phi_dd = zeros(3);
          elseif useQuaternions then
            // Use Quaternions as states (with dynamic state selection)
            frame_a.R = Frames.from_Q(Q, Frames.Quaternions.angularVelocity2(Q, der(Q)));
            {0} = Frames.Quaternions.orientationConstraint(Q);

            // Dummies
            phi = zeros(3);
            phi_d = zeros(3);
            phi_dd = zeros(3);
          else
            // Use Cardan angles as states
            phi_d = der(phi);
            phi_dd = der(phi_d);
            frame_a.R = Frames.axesRotations(sequence_angleStates, phi, phi_d);

            // Dummies
            Q = {0,0,0,1};
          end if;

          // gravity acceleration at center of mass resolved in world frame
          g_0 = world.gravityAcceleration(frame_a.r_0 + Frames.resolve1(frame_a.R,
            r_CM));

          // translational kinematic differential equations
          v_0 = der(frame_a.r_0);
          a_0 = der(v_0);

          // rotational kinematic differential equations
          w_a = Frames.angularVelocity2(frame_a.R);
          z_a = der(w_a);

          /* Newton/Euler equations with respect to center of mass
            a_CM = a_a + cross(z_a, r_CM) + cross(w_a, cross(w_a, r_CM));
            f_CM = m*(a_CM - g_a);
            t_CM = I*z_a + cross(w_a, I*w_a);
       frame_a.f = f_CM
       frame_a.t = t_CM + cross(r_CM, f_CM);
    Inserting the first three equations in the last two results in:
  */
          frame_a.f = m*(Frames.resolve2(frame_a.R, a_0 - g_0) + cross(z_a, r_CM) +
            cross(w_a, cross(w_a, r_CM)));
          frame_a.t = I*z_a + cross(w_a, I*w_a) + cross(r_CM, frame_a.f);
        end Body;

        model BodyShape
        "Rigid body with mass, inertia tensor, different shapes for animation, and two frame connectors (12 potential states)"

          import SI = Modelica.SIunits;
          import C = Modelica.Constants;
          import Modelica.Mechanics.MultiBody.Types;

          Interfaces.Frame_a frame_a
          "Coordinate system fixed to the component with one cut-force and cut-torque";
          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the component with one cut-force and cut-torque";

          parameter Boolean animation=true
          "= true, if animation shall be enabled (show shape between frame_a and frame_b and optionally a sphere at the center of mass)";
          parameter Boolean animateSphere=true
          "= true, if mass shall be animated as sphere provided animation=true";
          parameter SI.Position r[3](start={0,0,0})
          "Vector from frame_a to frame_b resolved in frame_a";
          parameter SI.Position r_CM[3](start={0,0,0})
          "Vector from frame_a to center of mass, resolved in frame_a";
          parameter SI.Mass m(min=0, start = 1) "Mass of rigid body";
          parameter SI.Inertia I_11(min=0) = 0.001
          " (1,1) element of inertia tensor";
          parameter SI.Inertia I_22(min=0) = 0.001
          " (2,2) element of inertia tensor";
          parameter SI.Inertia I_33(min=0) = 0.001
          " (3,3) element of inertia tensor";
          parameter SI.Inertia I_21(min=-C.inf) = 0
          " (2,1) element of inertia tensor";
          parameter SI.Inertia I_31(min=-C.inf) = 0
          " (3,1) element of inertia tensor";
          parameter SI.Inertia I_32(min=-C.inf) = 0
          " (3,2) element of inertia tensor";

          SI.Position r_0[3](start={0,0,0}, stateSelect=if enforceStates then 
                      StateSelect.always else StateSelect.avoid)
          "Position vector from origin of world frame to origin of frame_a";
          SI.Velocity v_0[3](start={0,0,0}, stateSelect=if enforceStates then StateSelect.always else 
                      StateSelect.avoid)
          "Absolute velocity of frame_a, resolved in world frame (= der(r_0))";
          SI.Acceleration a_0[3](start={0,0,0})
          "Absolute acceleration of frame_a resolved in world frame (= der(v_0))";

          parameter Boolean angles_fixed = false
          "= true, if angles_start are used as initial values, else as guess values";
          parameter SI.Angle angles_start[3]={0,0,0}
          "Initial values of angles to rotate frame_a around 'sequence_start' axes into frame_b";
          parameter Types.RotationSequence sequence_start={1,2,3}
          "Sequence of rotations to rotate frame_a into frame_b at initial time";

          parameter Boolean w_0_fixed = false
          "= true, if w_0_start are used as initial values, else as guess values";
          parameter SI.AngularVelocity w_0_start[3]={0,0,0}
          "Initial or guess values of angular velocity of frame_a resolved in world frame";

          parameter Boolean z_0_fixed = false
          "= true, if z_0_start are used as initial values, else as guess values";
          parameter SI.AngularAcceleration z_0_start[3]={0,0,0}
          "Initial values of angular acceleration z_0 = der(w_0)";

          parameter Types.ShapeType shapeType="cylinder" " Type of shape";
          parameter SI.Position r_shape[3]={0,0,0}
          " Vector from frame_a to shape origin, resolved in frame_a";
          parameter Types.Axis lengthDirection=r - r_shape
          " Vector in length direction of shape, resolved in frame_a";
          parameter Types.Axis widthDirection={0,1,0}
          " Vector in width direction of shape, resolved in frame_a";
          parameter SI.Length length=Modelica.Math.Vectors.length(
                                                   r - r_shape)
          " Length of shape";
          parameter SI.Distance width=length/world.defaultWidthFraction
          " Width of shape";
          parameter SI.Distance height=width " Height of shape.";
          parameter Types.ShapeExtra extra=0.0
          " Additional parameter depending on shapeType (see docu of Visualizers.Advanced.Shape).";
          input Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor
          " Color of shape";
          parameter SI.Diameter sphereDiameter=2*width " Diameter of sphere";
          input Types.Color sphereColor=color " Color of sphere of mass";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";
          parameter Boolean enforceStates=false
          " = true, if absolute variables of body object shall be used as states (StateSelect.always)";
          parameter Boolean useQuaternions=true
          " = true, if quaternions shall be used as potential states otherwise use 3 angles as potential states";
          parameter Types.RotationSequence sequence_angleStates={1,2,3}
          " Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states";

          FixedTranslation frameTranslation(r=r, animation=false);
          Body body(
            r_CM=r_CM,
            m=m,
            I_11=I_11,
            I_22=I_22,
            I_33=I_33,
            I_21=I_21,
            I_31=I_31,
            I_32=I_32,
            animation=false,
            sequence_start=sequence_start,
            angles_fixed=angles_fixed,
            angles_start=angles_start,
            w_0_fixed=w_0_fixed,
            w_0_start=w_0_start,
            z_0_fixed=z_0_fixed,
            z_0_start=z_0_start,
            useQuaternions=useQuaternions,
            enforceStates=enforceStates,
            sequence_angleStates=sequence_angleStates);
      protected
          outer Modelica.Mechanics.MultiBody.World world;
          Visualizers.Advanced.Shape shape1(
            shapeType=shapeType,
            color=color,
            specularCoefficient=specularCoefficient,
            length=length,
            width=width,
            height=height,
            lengthDirection=lengthDirection,
            widthDirection=widthDirection,
            r_shape=r_shape,
            extra=extra,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;
          Visualizers.Advanced.Shape shape2(
            shapeType="sphere",
            color=sphereColor,
            specularCoefficient=specularCoefficient,
            length=sphereDiameter,
            width=sphereDiameter,
            height=sphereDiameter,
            lengthDirection={1,0,0},
            widthDirection={0,1,0},
            r_shape=r_CM - {1,0,0}*sphereDiameter/2,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation and animateSphere;
        equation
          r_0 = frame_a.r_0;
          v_0 = der(r_0);
          a_0 = der(v_0);
          connect(frame_a, frameTranslation.frame_a);
          connect(frame_b, frameTranslation.frame_b);
          connect(frame_a, body.frame_a);
        end BodyShape;
      end Parts;

      package Types
      "Constants and types with choices, especially to build menus"
        extends Modelica.Icons.Library;

        type Axis = Modelica.Icons.TypeReal[3](each final unit="1")
        "Axis vector with choices for menus";

        type AxisLabel = Modelica.Icons.TypeString
        "Label of axis with choices for menus";

        type RotationSequence = Modelica.Icons.TypeInteger[3] (min={1,1,1}, max={3,3,3})
        "Sequence of planar frame rotations with choices for menus";

        type Color = Modelica.Icons.TypeInteger[3] (each min=0, each max=255)
        "RGB representation of color (will be improved with a color editor)";

        type SpecularCoefficient = Modelica.Icons.TypeReal
        "Reflection of ambient light (= 0: light is completely absorbed)";

        type ShapeType = Modelica.Icons.TypeString
        "Type of shape (box, sphere, cylinder, pipecylinder, cone, pipe, beam, gearwheel, spring, dxf-file)";

        type ShapeExtra = Modelica.Icons.TypeReal
        "Reflection of ambient light (= 0: light is completely absorbed)";

        type GravityTypes = enumeration(
          NoGravity "No gravity field",
          UniformGravity "Uniform gravity field",
          PointGravity "Point gravity field")
        "Enumeration defining the type of the gravity field";

        package Defaults
        "Default settings of the MultiBody library via constants"
          extends Modelica.Icons.Library;

          constant Types.Color BodyColor={0,128,255}
          "Default color for body shapes that have mass (light blue)";

          constant Types.Color RodColor={155,155,155}
          "Default color for massless rod shapes (grey)";

          constant Types.Color JointColor={255,0,0}
          "Default color for elementary joints (red)";

          constant Types.Color FrameColor={0,0,0}
          "Default color for frame axes and labels (black)";

          constant Real FrameHeadLengthFraction=5.0
          "Frame arrow head length / arrow diameter";

          constant Real FrameHeadWidthFraction=3.0
          "Frame arrow head width / arrow diameter";

          constant Real FrameLabelHeightFraction=3.0
          "Height of frame label / arrow diameter";

          constant Real ArrowHeadLengthFraction=4.0
          "Arrow head length / arrow diameter";

          constant Real ArrowHeadWidthFraction=3.0
          "Arrow head width / arrow diameter";

          constant SI.Diameter BodyCylinderDiameterFraction=3
          "Default for body cylinder diameter as a fraction of body sphere diameter";
        end Defaults;
      end Types;

      package Visualizers "3-dimensional visual objects used for animation"
        extends Modelica.Icons.Library;

        package Advanced
        "Visualizers that require basic knowledge about Modelica in order to use them"
          extends Modelica.Icons.Library;

          model Shape
          "Different visual shapes with variable size; all data have to be set as modifiers (see info layer)"

             extends
            Modelica.Utilities.Internal.PartialModelicaServices.Animation.PartialShape;
             extends ModelicaServices.Animation.Shape;

          end Shape;
        end Advanced;

        package Internal
        "Visualizers that will be replaced by improved versions in the future (don't use them)"
          extends Modelica.Icons.Library;

          model Lines
          "Visualizing a set of lines as cylinders with variable size, e.g., used to display characters (no Frame connector)"

            import SI = Modelica.SIunits;
            import Modelica.Mechanics.MultiBody;
            import Modelica.Mechanics.MultiBody.Types;
            import Modelica.Mechanics.MultiBody.Frames;
            import T =
            Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;
            input Modelica.Mechanics.MultiBody.Frames.Orientation R=Frames.nullRotation()
            "Orientation object to rotate the world frame into the object frame";
            input SI.Position r[3]={0,0,0}
            "Position vector from origin of world frame to origin of object frame, resolved in world frame";
            input SI.Position r_lines[3]={0,0,0}
            "Position vector from origin of object frame to the origin of 'lines' frame, resolved in object frame";
            input Real n_x[3](each final unit="1")={1,0,0}
            "Vector in direction of x-axis of 'lines' frame, resolved in object frame";
            input Real n_y[3](each final unit="1")={0,1,0}
            "Vector in direction of y-axis of 'lines' frame, resolved in object frame";
            input SI.Position lines[:, 2, 2]=zeros(0, 2, 2)
            "List of start and end points of cylinders resolved in an x-y frame defined by n_x, n_y, e.g., {[0,0;1,1], [0,1;1,0], [2,0; 3,1]}";
            input SI.Length diameter(min=0) = 0.05
            "Diameter of the cylinders defined by lines";
            input Modelica.Mechanics.MultiBody.Types.Color color={0,128,255}
            "Color of cylinders";
            input Types.SpecularCoefficient specularCoefficient = 0.7
            "Reflection of ambient light (= 0: light is completely absorbed)";
        protected
            parameter Integer n=size(lines, 1) "Number of cylinders";
            T.Orientation R_rel=T.from_nxy(n_x, n_y);
            T.Orientation R_lines=T.absoluteRotation(R.T, R_rel);
            Modelica.SIunits.Position r_abs[3]=r + T.resolve1(R.T, r_lines);
            Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape cylinders[n](
              each shapeType="cylinder",
              lengthDirection={T.resolve1(R_rel, vector([lines[i, 2, :] - lines[i, 1,
                   :]; 0])) for i in 1:n},
              length={Modelica.Math.Vectors.length(
                                              lines[i, 2, :] - lines[i, 1, :]) for i in 
                      1:n},
              r={r_abs + T.resolve1(R_lines, vector([lines[i, 1, :]; 0])) for i in 1:
                  n},
              each width=diameter,
              each height=diameter,
              each widthDirection={0,1,0},
              each color=color,
              each R=R,
              each specularCoefficient=specularCoefficient);

          end Lines;
        end Internal;
      end Visualizers;
    end MultiBody;

    package Rotational
    "Library to model 1-dimensional, rotational mechanical systems"
      extends Modelica.Icons.Library2;
      import SI = Modelica.SIunits;

      package Components "Components for 1D rotational mechanical drive trains"
        extends Modelica.Icons.Library2;

        model Fixed "Flange fixed in housing at a given angle"
          parameter SI.Angle phi0=0 "Fixed offset angle of housing";

          Interfaces.Flange_b flange "(right) flange fixed in housing";

        equation
          flange.phi = phi0;
        end Fixed;

        model Inertia "1D-rotational component with inertia"
          import SI = Modelica.SIunits;
          Rotational.Interfaces.Flange_a flange_a "Left flange of shaft";
          Rotational.Interfaces.Flange_b flange_b "Right flange of shaft";
          parameter SI.Inertia J(min=0, start=1) "Moment of inertia";
          parameter StateSelect stateSelect=StateSelect.default
          "Priority to use phi and w as states";
          SI.Angle phi(stateSelect=stateSelect)
          "Absolute rotation angle of component";
          SI.AngularVelocity w(stateSelect=stateSelect)
          "Absolute angular velocity of component (= der(phi))";
          SI.AngularAcceleration a
          "Absolute angular acceleration of component (= der(w))";


        equation
          phi = flange_a.phi;
          phi = flange_b.phi;
          w = der(phi);
          a = der(w);
          J*a = flange_a.tau + flange_b.tau;
        end Inertia;

        model SpringDamper "Linear 1D rotational spring and damper in parallel"
          import SI = Modelica.SIunits;
          parameter SI.RotationalSpringConstant c(final min=0, start=1.0e5)
          "Spring constant";
          parameter SI.RotationalDampingConstant d(final min=0, start=0)
          "Damping constant";
          parameter SI.Angle phi_rel0=0 "Unstretched spring angle";
          extends
          Modelica.Mechanics.Rotational.Interfaces.PartialCompliantWithRelativeStates;


        equation
          tau = c*(phi_rel - phi_rel0) + d*w_rel;
        end SpringDamper;

        model BearingFriction "Coulomb friction in bearings "
          extends
          Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport2;

          parameter Real tau_pos[:, 2]=[0, 1]
          "[w,tau] Positive sliding friction characteristic (w>=0)";
          parameter Real peak(final min=1) = 1
          "peak*tau_pos[1,2] = Maximum friction torque for w==0";

          extends Rotational.Interfaces.PartialFriction;

          SI.Angle phi
          "Angle between shaft flanges (flange_a, flange_b) and support";
          SI.Torque tau "Friction torque";
          SI.AngularVelocity w
          "Absolute angular velocity of flange_a and flange_b";
          SI.AngularAcceleration a
          "Absolute angular acceleration of flange_a and flange_b";

        equation
          // Constant auxiliary variables
          tau0 = Modelica.Math.tempInterpol1(0, tau_pos, 2);
          tau0_max = peak*tau0;
          free = false;

          phi = flange_a.phi - phi_support;
          flange_b.phi = flange_a.phi;

          // Angular velocity and angular acceleration of flanges
          w = der(phi);
          a = der(w);
          w_relfric = w;
          a_relfric = a;

          // Friction torque
          flange_a.tau + flange_b.tau - tau = 0;

          // Friction torque
          tau = if locked then sa*unitTorque else (if startForward then 
            Modelica.Math.tempInterpol1(w, tau_pos, 2) else if startBackward then -
            Modelica.Math.tempInterpol1(-w, tau_pos, 2) else if pre(mode) == Forward then 
                  Modelica.Math.tempInterpol1(w, tau_pos, 2) else -
            Modelica.Math.tempInterpol1(-w, tau_pos, 2));
        end BearingFriction;

        model IdealGear "Ideal gear without inertia"
          extends
          Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport2;
          parameter Real ratio(start=1)
          "Transmission ratio (flange_a.phi/flange_b.phi)";
          Modelica.SIunits.Angle phi_a
          "Angle between left shaft flange and support";
          Modelica.SIunits.Angle phi_b
          "Angle between right shaft flange and support";


        equation
          phi_a = flange_a.phi - phi_support;
          phi_b = flange_b.phi - phi_support;
          phi_a = ratio*phi_b;
          0 = ratio*flange_a.tau + flange_b.tau;
        end IdealGear;

        model InitializeFlange
        "Initializes a flange with pre-defined angle, speed and angular acceleration (usually, this is reference data from a control bus)"
          extends Modelica.Blocks.Interfaces.BlockIcon;
          parameter Boolean use_phi_start = true
          "= true, if initial angle is defined by input phi_start, otherwise not initialized";
          parameter Boolean use_w_start = true
          "= true, if initial speed is defined by input w_start, otherwise not initialized";
          parameter Boolean use_a_start = true
          "= true, if initial angular acceleration is defined by input a_start, otherwise not initialized";

          parameter StateSelect stateSelect=StateSelect.default
          "Priority to use flange angle and speed as states";

          Modelica.Blocks.Interfaces.RealInput phi_start if use_phi_start
          "Initial angle of flange";
          Modelica.Blocks.Interfaces.RealInput w_start if use_w_start
          "Initial speed of flange";
          Modelica.Blocks.Interfaces.RealInput a_start if use_a_start
          "Initial angular acceleration of flange";
          Interfaces.Flange_b flange "Flange that is initialized";

          Modelica.SIunits.Angle phi_flange(stateSelect=stateSelect)=flange.phi
          "Flange angle";
          Modelica.SIunits.AngularVelocity w_flange(stateSelect=stateSelect)= der(phi_flange)
          "= der(phi_flange)";

      protected
          encapsulated model Set_phi_start "Set phi_start"
            import Modelica;
            extends Modelica.Blocks.Interfaces.BlockIcon;
            Modelica.Blocks.Interfaces.RealInput phi_start "Start angle";

            Modelica.Mechanics.Rotational.Interfaces.Flange_b flange;
          initial equation
            flange.phi = phi_start;
          equation
            flange.tau = 0;
          end Set_phi_start;

          encapsulated model Set_w_start "Set w_start"
            import Modelica;
            extends Modelica.Blocks.Interfaces.BlockIcon;
            Modelica.Blocks.Interfaces.RealInput w_start
            "Start angular velocity";

            Modelica.Mechanics.Rotational.Interfaces.Flange_b flange;
          initial equation
            der(flange.phi) = w_start;
          equation
            flange.tau = 0;
          end Set_w_start;

          encapsulated model Set_a_start "Set a_start"
            import Modelica;
            extends Modelica.Blocks.Interfaces.BlockIcon;
            Modelica.Blocks.Interfaces.RealInput a_start
            "Start angular acceleration";

            Modelica.Mechanics.Rotational.Interfaces.Flange_b flange(phi(stateSelect=StateSelect.avoid));

            Modelica.SIunits.AngularVelocity w = der(flange.phi);
          initial equation
            der(w) = a_start;
          equation
            flange.tau = 0;
          end Set_a_start;

          encapsulated model Set_flange_tau "Set flange.tau to zero"
            import Modelica;
            extends Modelica.Blocks.Interfaces.BlockIcon;
            Modelica.Mechanics.Rotational.Interfaces.Flange_b flange;
          equation
            flange.tau = 0;
          end Set_flange_tau;
      protected
          Set_phi_start set_phi_start if use_phi_start;
          Set_w_start set_w_start if use_w_start;
          Set_a_start set_a_start if use_a_start;
          Set_flange_tau set_flange_tau;
        equation
          connect(set_phi_start.phi_start, phi_start);
          connect(set_phi_start.flange, flange);
          connect(set_w_start.flange, flange);
          connect(set_w_start.w_start, w_start);
          connect(set_a_start.a_start, a_start);
          connect(set_a_start.flange, flange);
          connect(set_flange_tau.flange, flange);
        end InitializeFlange;
      end Components;

      package Sources "Sources to drive 1D rotational mechanical components"
        extends Modelica.Icons.Library2;

        model ConstantTorque "Constant torque, not dependent on speed"
          extends Rotational.Interfaces.PartialTorque;
          parameter Modelica.SIunits.Torque tau_constant
          "Constant torque (if negative, torque is acting as load)";
          Modelica.SIunits.Torque tau
          "Accelerating torque acting at flange (= -flange.tau)";
        equation
          tau = -flange.tau;
          tau = tau_constant;
        end ConstantTorque;
      end Sources;

      package Sensors
      "Sensors to measure variables in 1D rotational mechanical components"
        extends Modelica.Icons.Library2;

        model AngleSensor "Ideal sensor to measure the absolute flange angle"

          extends Rotational.Interfaces.PartialAbsoluteSensor;
          Modelica.Blocks.Interfaces.RealOutput phi "Absolute angle of flange";
        equation
          phi = flange.phi;
        end AngleSensor;

        model SpeedSensor
        "Ideal sensor to measure the absolute flange angular velocity"

          extends Rotational.Interfaces.PartialAbsoluteSensor;
          Modelica.Blocks.Interfaces.RealOutput w
          "Absolute angular velocity of flange";

        equation
          w = der(flange.phi);
        end SpeedSensor;

        model AccSensor
        "Ideal sensor to measure the absolute flange angular acceleration"

          extends Rotational.Interfaces.PartialAbsoluteSensor;
          SI.AngularVelocity w "Absolute angular velocity of flange";
          Modelica.Blocks.Interfaces.RealOutput a
          "Absolute angular acceleration of flange";

        equation
          w = der(flange.phi);
          a = der(w);
        end AccSensor;
      end Sensors;

      package Interfaces
      "Connectors and partial models for 1D rotational mechanical components"
        extends Modelica.Icons.Library;

        connector Flange_a
        "1-dim. rotational flange of a shaft (filled square icon)"
          SI.Angle phi "Absolute rotation angle of flange";
          flow SI.Torque tau "Cut torque in the flange";
        end Flange_a;

        connector Flange_b
        "1-dim. rotational flange of a shaft (non-filled square icon)"
          SI.Angle phi "Absolute rotation angle of flange";
          flow SI.Torque tau "Cut torque in the flange";
        end Flange_b;

        connector Support "Support/housing of a 1-dim. rotational shaft"

          SI.Angle phi "Absolute rotation angle of the support/housing";
          flow SI.Torque tau "Reaction torque in the support/housing";

        end Support;

        model InternalSupport
        "Adapter model to utilize conditional support connector"
          input Modelica.SIunits.Torque tau
          "External support torque (must be computed via torque balance in model where InternalSupport is used; = flange.tau)";
          Modelica.SIunits.Angle phi "External support angle (= flange.phi)";
          Flange_a flange
          "Internal support flange (must be connected to the conditional support connector for useSupport=true and to conditional fixed model for useSupport=false)";
        equation
          flange.tau = tau;
          flange.phi = phi;
        end InternalSupport;

        partial model PartialTwoFlanges
        "Partial model for a component with two rotational 1-dim. shaft flanges"
          Flange_a flange_a "Flange of left shaft";
          Flange_b flange_b "Flange of right shaft";
        end PartialTwoFlanges;

        partial model PartialCompliantWithRelativeStates
        "Partial model for the compliant connection of two rotational 1-dim. shaft flanges where the relative angle and speed are used as preferred states"

          Modelica.SIunits.Angle phi_rel(start=0, stateSelect=stateSelect, nominal=phi_nominal)
          "Relative rotation angle (= flange_b.phi - flange_a.phi)";
          Modelica.SIunits.AngularVelocity w_rel(start=0, stateSelect=stateSelect)
          "Relative angular velocity (= der(phi_rel))";
          Modelica.SIunits.AngularAcceleration a_rel(start=0)
          "Relative angular acceleration (= der(w_rel))";
          Modelica.SIunits.Torque tau "Torque between flanges (= flange_b.tau)";
          Flange_a flange_a
          "Left flange of compliant 1-dim. rotational component";
          Flange_b flange_b
          "Right flange of compliant 1-dim. rotational component";

          parameter SI.Angle phi_nominal(displayUnit="rad")=1e-4
          "Nominal value of phi_rel (used for scaling)";
          parameter StateSelect stateSelect=StateSelect.prefer
          "Priority to use phi_rel and w_rel as states";


        equation
          phi_rel = flange_b.phi - flange_a.phi;
          w_rel = der(phi_rel);
          a_rel = der(w_rel);
          flange_b.tau = tau;
          flange_a.tau = -tau;
        end PartialCompliantWithRelativeStates;

        partial model PartialElementaryOneFlangeAndSupport2
        "Partial model for a component with one rotational 1-dim. shaft flange and a support used for textual modeling, i.e., for elementary models"
          parameter Boolean useSupport=false
          "= true, if support flange enabled, otherwise implicitly grounded";
          Flange_b flange "Flange of shaft";
          Support support(phi = phi_support, tau = -flange.tau) if useSupport
          "Support/housing of component";
      protected
          Modelica.SIunits.Angle phi_support "Absolute angle of support flange";
        equation
          if not useSupport then
             phi_support = 0;
          end if;
        end PartialElementaryOneFlangeAndSupport2;

        partial model PartialElementaryTwoFlangesAndSupport2
        "Partial model for a component with two rotational 1-dim. shaft flanges and a support used for textual modeling, i.e., for elementary models"
          parameter Boolean useSupport=false
          "= true, if support flange enabled, otherwise implicitly grounded";
          Flange_a flange_a "Flange of left shaft";
          Flange_b flange_b "Flange of right shaft";
          Support support(phi = phi_support, tau=-flange_a.tau-flange_b.tau) if useSupport
          "Support/housing of component";
      protected
          Modelica.SIunits.Angle phi_support "Absolute angle of support flange";
        equation
          if not useSupport then
             phi_support = 0;
          end if;

        end PartialElementaryTwoFlangesAndSupport2;

        partial model PartialTorque
        "Partial model of a torque acting at the flange (accelerates the flange)"
          extends
          Modelica.Mechanics.Rotational.Interfaces.PartialElementaryOneFlangeAndSupport2;
          Modelica.SIunits.Angle phi
          "Angle of flange with respect to support (= flange.phi - support.phi)";

        equation
          phi = flange.phi - phi_support;
        end PartialTorque;

        partial model PartialAbsoluteSensor
        "Partial model to measure a single absolute flange variable"

          Flange_a flange
          "Flange of shaft from which sensor information shall be measured";

        equation
          0 = flange.tau;
        end PartialAbsoluteSensor;

        partial model PartialFriction
        "Partial model of Coulomb friction elements"

          // parameter SI.AngularVelocity w_small=1 "Relative angular velocity near to zero (see model info text)";
          parameter SI.AngularVelocity w_small=1.0e10
          "Relative angular velocity near to zero if jumps due to a reinit(..) of the velocity can occur (set to low value only if such impulses can occur)";
        // Equations to define the following variables have to be defined in subclasses
          SI.AngularVelocity w_relfric
          "Relative angular velocity between frictional surfaces";
          SI.AngularAcceleration a_relfric
          "Relative angular acceleration between frictional surfaces";
        //SI.Torque tau "Friction torque (positive, if directed in opposite direction of w_rel)";
          SI.Torque tau0 "Friction torque for w=0 and forward sliding";
          SI.Torque tau0_max "Maximum friction torque for w=0 and locked";
          Boolean free "true, if frictional element is not active";
        // Equations to define the following variables are given in this class
          Real sa(final unit="1")
          "Path parameter of friction characteristic tau = f(a_relfric)";
          Boolean startForward(start=false, fixed=true)
          "true, if w_rel=0 and start of forward sliding";
          Boolean startBackward(start=false, fixed=true)
          "true, if w_rel=0 and start of backward sliding";
          Boolean locked(start=false) "true, if w_rel=0 and not sliding";
          constant Integer Unknown=3 "Value of mode is not known";
          constant Integer Free=2 "Element is not active";
          constant Integer Forward=1 "w_rel > 0 (forward sliding)";
          constant Integer Stuck=0
          "w_rel = 0 (forward sliding, locked or backward sliding)";
          constant Integer Backward=-1 "w_rel < 0 (backward sliding)";
          Integer mode(
            final min=Backward,
            final max=Unknown,
            start=Unknown, fixed=true);
      protected
          constant SI.AngularAcceleration unitAngularAcceleration = 1;
          constant SI.Torque unitTorque = 1;
        equation
        /* Friction characteristic
   locked is introduced to help the Modelica translator determining
   the different structural configurations,
   if for each configuration special code shall be generated)
*/
          startForward = pre(mode) == Stuck and (sa > tau0_max/unitTorque or pre(startForward)
             and sa > tau0/unitTorque) or pre(mode) == Backward and w_relfric > w_small or 
            initial() and (w_relfric > 0);
          startBackward = pre(mode) == Stuck and (sa < -tau0_max/unitTorque or pre(
            startBackward) and sa < -tau0/unitTorque) or pre(mode) == Forward and w_relfric <
            -w_small or initial() and (w_relfric < 0);
          locked = not free and not (pre(mode) == Forward or startForward or pre(
            mode) == Backward or startBackward);

          a_relfric/unitAngularAcceleration = if locked then               0 else 
                                              if free then                 sa else 
                                              if startForward then         sa - tau0_max/unitTorque else 
                                              if startBackward then        sa + tau0_max/unitTorque else 
                                              if pre(mode) == Forward then sa - tau0_max/unitTorque else 
                                                                           sa + tau0_max/unitTorque;

        /* Friction torque has to be defined in a subclass. Example for a clutch:
   tau = if locked then sa else
         if free then   0 else
         cgeo*fn*(if startForward then          Math.tempInterpol1( w_relfric, mue_pos, 2) else
                  if startBackward then        -Math.tempInterpol1(-w_relfric, mue_pos, 2) else
                  if pre(mode) == Forward then  Math.tempInterpol1( w_relfric, mue_pos, 2) else
                                               -Math.tempInterpol1(-w_relfric, mue_pos, 2));
*/
        // finite state machine to determine configuration
          mode = if free then Free else 
            (if (pre(mode) == Forward  or pre(mode) == Free or startForward)  and w_relfric > 0 then 
               Forward else 
             if (pre(mode) == Backward or pre(mode) == Free or startBackward) and w_relfric < 0 then 
               Backward else 
               Stuck);
        end PartialFriction;
      end Interfaces;
    end Rotational;
  end Mechanics;

  package Thermal
  "Library of thermal system components to model heat transfer and simple thermo-fluid pipe flow"
    extends Modelica.Icons.Library;

    package HeatTransfer
    "Library of 1-dimensional heat transfer with lumped elements"
      import Modelica.SIunits.Conversions.*;
      extends Modelica.Icons.Library2;

      package Interfaces "Connectors and partial models"
        extends Modelica.Icons.Library2;

        partial connector HeatPort "Thermal port for 1-dim. heat transfer"
          Modelica.SIunits.Temperature T "Port temperature";
          flow Modelica.SIunits.HeatFlowRate Q_flow
          "Heat flow rate (positive if flowing from outside into the component)";
        end HeatPort;

        connector HeatPort_a
        "Thermal port for 1-dim. heat transfer (filled rectangular icon)"

          extends HeatPort;

        end HeatPort_a;
      end Interfaces;
    end HeatTransfer;
  end Thermal;

  package Math
  "Library of mathematical functions (e.g., sin, cos) and of functions operating on vectors and matrices"
  import SI = Modelica.SIunits;
  extends Modelica.Icons.Library2;

  package Vectors "Library of functions operating on vectors"
    extends Modelica.Icons.Library;

    function length
    "Return length of a vectorReturn length of a vector (better as norm(), if further symbolic processing is performed)"
      extends Modelica.Icons.Function;
      input Real v[:] "Vector";
      output Real result "Length of vector v";
    algorithm
      result := sqrt(v*v);
    end length;

    function normalize
    "Return normalized vector such that length = 1Return normalized vector such that length = 1 and prevent zero-division for zero vector"
      extends Modelica.Icons.Function;
      input Real v[:] "Vector";
      input Real eps = 100*Modelica.Constants.eps
      "if |v| < eps then result = v/eps";
      output Real result[size(v, 1)] "Input vector v normalized to length=1";

    algorithm
      result := smooth(0,if length(v) >= eps then v/length(v) else v/eps);
    end normalize;
  end Vectors;

  function sin "Sine"
    extends baseIcon1;
    input SI.Angle u;
    output Real y;


  external "C" y=  sin(u);
  end sin;

  function cos "Cosine"
    extends baseIcon1;
    input SI.Angle u;
    output Real y;


  external "C" y=  cos(u);
  end cos;

  function asin "Inverse sine (-1 <= u <= 1)"
    extends baseIcon2;
    input Real u;
    output SI.Angle y;


  external "C" y=  asin(u);
  end asin;

  function atan2 "Four quadrant inverse tangent"
    extends baseIcon2;
    input Real u1;
    input Real u2;
    output SI.Angle y;


  external "C" y=  atan2(u1, u2);
  end atan2;

  partial function baseIcon1
    "Basic icon for mathematical function with y-axis on left side"

  end baseIcon1;

  partial function baseIcon2
    "Basic icon for mathematical function with y-axis in middle"

  end baseIcon2;

  function tempInterpol1
    "Temporary function for linear interpolation (will be removed)"
    input Real u "input value (first column of table)";
    input Real table[:, :] "table to be interpolated";
    input Integer icol "column of table to be interpolated";
    output Real y "interpolated input value (icol column of table)";
  protected
    Integer i;
    Integer n "number of rows of table";
    Real u1;
    Real u2;
    Real y1;
    Real y2;
  algorithm
    n := size(table, 1);

    if n <= 1 then
      y := table[1, icol];

    else
      // Search interval

      if u <= table[1, 1] then
        i := 1;

      else
        i := 2;
        // Supports duplicate table[i, 1] values
        // in the interior to allow discontinuities.
        // Interior means that
        // if table[i, 1] = table[i+1, 1] we require i>1 and i+1<n

        while i < n and u >= table[i, 1] loop
          i := i + 1;

        end while;
        i := i - 1;

      end if;

      // Get interpolation data
      u1 := table[i, 1];
      u2 := table[i + 1, 1];
      y1 := table[i, icol];
      y2 := table[i + 1, icol];

      assert(u2 > u1, "Table index must be increasing");
      // Interpolate
      y := y1 + (y2 - y1)*(u - u1)/(u2 - u1);

    end if;

  end tempInterpol1;
  end Math;

  package Utilities
  "Library of utility functions dedicated to scripting (operating on files, streams, strings, system)"
    extends Modelica.Icons.Library;

    package Internal
    "Internal components that a user should usually not directly utilize"

    partial package PartialModelicaServices
      "Interfaces of components requiring a tool specific implementation"
      package Animation "Models and functions for 3-dim. animation"

      partial model PartialShape
          "Different visual shapes with variable size; all data have to be set as modifiers"

        import SI = Modelica.SIunits;
        import Modelica.Mechanics.MultiBody.Frames;
        import Modelica.Mechanics.MultiBody.Types;

        parameter Types.ShapeType shapeType="box"
            "Type of shape (box, sphere, cylinder, pipecylinder, cone, pipe, beam, gearwheel, spring)";
        input Frames.Orientation R=Frames.nullRotation()
            "Orientation object to rotate the world frame into the object frame";
        input SI.Position r[3]={0,0,0}
            "Position vector from origin of world frame to origin of object frame, resolved in world frame";
        input SI.Position r_shape[3]={0,0,0}
            "Position vector from origin of object frame to shape origin, resolved in object frame";
        input Real lengthDirection[3](each final unit="1")={1,0,0}
            "Vector in length direction, resolved in object frame";
        input Real widthDirection[3](each final unit="1")={0,1,0}
            "Vector in width direction, resolved in object frame";
        input SI.Length length=0 "Length of visual object";
        input SI.Length width=0 "Width of visual object";
        input SI.Length height=0 "Height of visual object";
        input Types.ShapeExtra extra=0.0
            "Additional size data for some of the shape types";
        input Real color[3]={255,0,0} "Color of shape";
        input Types.SpecularCoefficient specularCoefficient = 0.7
            "Reflection of ambient light (= 0: light is completely absorbed)";
        // Real rxry[3, 2];

      end PartialShape;
      end Animation;

    end PartialModelicaServices;
    end Internal;
  end Utilities;

  package Constants
  "Library of mathematical constants and constants of nature (e.g., pi, eps, R, sigma)"
    import SI = Modelica.SIunits;
    import NonSI = Modelica.SIunits.Conversions.NonSIunits;
    extends Modelica.Icons.Library2;

    final constant Real pi=2*Modelica.Math.asin(1.0);

    final constant Real eps=1.e-15 "Biggest number such that 1.0 + eps = 1.0";

    final constant Real small=1.e-60
    "Smallest number such that small and -small are representable on the machine";

    final constant Real inf=1.e+60
    "Biggest Real number such that inf and -inf are representable on the machine";
  end Constants;

  package Icons "Library of icons"

    partial package Library "Icon for library"

    end Library;

    partial package Library2
    "Icon for library where additional icon elements shall be added"

    end Library2;

    partial model Example "Icon for an example model"

    equation

    end Example;

    partial function Function "Icon for a function"

    end Function;

    partial record Record "Icon for a record"

    end Record;

    type TypeReal "Icon for a Real type"
        extends Real;
    end TypeReal;

    type TypeInteger "Icon for an Integer type"
        extends Integer;
    end TypeInteger;

    type TypeString "Icon for a String type"
        extends String;
    end TypeString;

    partial model RotationalSensor
    "Icon representing rotational measurement device"

    equation

    end RotationalSensor;

    partial model MotorIcon "Icon for electrical motor"

    equation

    end MotorIcon;

    connector SignalBus "Icon for signal bus"


    end SignalBus;

    connector SignalSubBus "Icon for signal sub-bus"


    end SignalSubBus;
  end Icons;

  package SIunits
  "Library of type and unit definitions based on SI units according to ISO 31-1992"
    extends Modelica.Icons.Library2;

    package Conversions
    "Conversion functions to/from non SI units and type definitions of non SI units"
      extends Modelica.Icons.Library2;

      package NonSIunits "Type definitions of non SI units"
        extends Modelica.Icons.Library2;

        type Angle_deg = Real (final quantity="Angle", final unit="deg")
        "Angle in degree";
      end NonSIunits;

      function from_deg "Convert from degree to radian"
        extends ConversionIcon;
        input NonSIunits.Angle_deg degree "degree value";
        output Angle radian "radian value";
      algorithm
        radian := (Modelica.Constants.pi/180.0)*degree;
      end from_deg;

      partial function ConversionIcon "Base icon for conversion functions"
      end ConversionIcon;
    end Conversions;

    type Angle = Real (
        final quantity="Angle",
        final unit="rad",
        displayUnit="deg");

    type Length = Real (final quantity="Length", final unit="m");

    type Position = Length;

    type Distance = Length (min=0);

    type Diameter = Length(min=0);

    type Time = Real (final quantity="Time", final unit="s");

    type AngularVelocity = Real (
        final quantity="AngularVelocity",
        final unit="rad/s");

    type AngularAcceleration = Real (final quantity="AngularAcceleration", final unit
        =      "rad/s2");

    type Velocity = Real (final quantity="Velocity", final unit="m/s");

    type Acceleration = Real (final quantity="Acceleration", final unit="m/s2");

    type Mass = Real (
        quantity="Mass",
        final unit="kg",
        min=0);

    type MomentOfInertia = Real (final quantity="MomentOfInertia", final unit=
            "kg.m2");

    type Inertia = MomentOfInertia;

    type Force = Real (final quantity="Force", final unit="N");

    type Torque = Real (final quantity="Torque", final unit="N.m");

    type ElectricalTorqueConstant = Real(final quantity="ElectricalTorqueConstant", final unit
        =                                                                                       "N.m/A");

    type RotationalSpringConstant=Real(final quantity="RotationalSpringConstant", final unit
        =                                                                                    "N.m/rad");

    type RotationalDampingConstant=Real(final quantity="RotationalDampingConstant", final unit
        =                                                                                      "N.m.s/rad");

    type Power = Real (final quantity="Power", final unit="W");

    type ThermodynamicTemperature = Real (
        final quantity="ThermodynamicTemperature",
        final unit="K",
        min = 0,
        displayUnit="degC")
    "Absolute temperature (use type TemperatureDifference for relative temperatures)";

    type Temperature = ThermodynamicTemperature;

    type LinearTemperatureCoefficient = Real(final quantity = "LinearTemperatureCoefficient", final unit
        =                                                                                                "1/K");

    type HeatFlowRate = Real (final quantity="Power", final unit="W");

    type ElectricCurrent = Real (final quantity="ElectricCurrent", final unit="A");

    type Current = ElectricCurrent;

    type ElectricPotential = Real (final quantity="ElectricPotential", final unit
        =  "V");

    type Voltage = ElectricPotential;

    type Capacitance = Real (
        final quantity="Capacitance",
        final unit="F",
        min=0);

    type Inductance = Real (
        final quantity="Inductance",
        final unit="H");

    type Resistance = Real (
        final quantity="Resistance",
        final unit="Ohm");
  end SIunits;
end Modelica;
package Modelica_Mechanics_MultiBody_Examples_Systems
 extends Modelica.Mechanics.MultiBody.Examples.Systems;
  annotation(experiment(
    StopTime=1,
    NumberOfIntervals=500,
    Tolerance=0.0001,
    Algorithm="dassl"),uses(Modelica(version="3.1")));
end Modelica_Mechanics_MultiBody_Examples_Systems;
