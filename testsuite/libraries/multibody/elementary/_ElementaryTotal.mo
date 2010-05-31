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

    package Interfaces
    "Library of connectors and partial models for input/output blocks"
      import Modelica.SIunits;
        extends Modelica.Icons.Library;

    connector RealInput = input Real "'input Real' as connector";

    connector RealOutput = output Real "'output Real' as connector";

        partial block BlockIcon "Basic graphical layout of input/output block"


        end BlockIcon;

        partial block SO "Single Output continuous control block"
          extends BlockIcon;

          RealOutput y "Connector of Real output signal";

        end SO;

        partial block MO "Multiple Output continuous control block"
          extends BlockIcon;

          parameter Integer nout(min=1) = 1 "Number of outputs";
          RealOutput y[nout] "Connector of Real output signals";

        end MO;
    end Interfaces;

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

          block Sine "Generate sine signal"
            parameter Real amplitude=1 "Amplitude of sine wave";
            parameter SIunits.Frequency freqHz(start=1)
        "Frequency of sine wave";
            parameter SIunits.Angle phase=0 "Phase of sine wave";
            parameter Real offset=0 "Offset of output signal";
            parameter SIunits.Time startTime=0
        "Output = offset for time < startTime";
            extends Interfaces.SO;
    protected
            constant Real pi=Modelica.Constants.pi;

          equation
            y = offset + (if time < startTime then 0 else amplitude*
              Modelica.Math.sin(2*pi*freqHz*(time - startTime) + phase));
          end Sine;

      model CombiTimeTable
      "Table look-up with respect to time and linear/perodic extrapolation methods (data from matrix/file)"

        parameter Boolean tableOnFile=false
        "= true, if table is defined on file or in function usertab";
        parameter Real table[:, :] = fill(0.0,0,2)
        "Table matrix (time = first column; e.g. table=[0,2])";
        parameter String tableName="NoName"
        "Table name on file or in function usertab (see docu)";
        parameter String fileName="NoName" "File where matrix is stored";
        parameter Integer columns[:]=2:size(table, 2)
        "Columns of table to be interpolated";
        parameter Modelica.Blocks.Types.Smoothness smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments
        "Smoothness of table interpolation";
        parameter Modelica.Blocks.Types.Extrapolation extrapolation=Modelica.Blocks.Types.Extrapolation.LastTwoPoints
        "Extrapolation of data outside the definition range";
        parameter Real offset[:]={0} "Offsets of output signals";
        parameter Modelica.SIunits.Time startTime=0
        "Output = offset for time < startTime";
        extends Modelica.Blocks.Interfaces.MO(final nout=max([size(columns, 1); size(offset, 1)]));
        final parameter Real t_min(fixed=false)
        "Minimum abscissa value defined in table";
        final parameter Real t_max(fixed=false)
        "Maximum abscissa value defined in table";

    protected
        final parameter Real p_offset[nout]=(if size(offset, 1) == 1 then ones(nout)
             *offset[1] else offset);

        Integer tableID;

        function tableTimeInit
        "Initialize 1-dim. table where first column is time (for details see: Modelica/C-Sources/ModelicaTables.h)"
          input String tableName;
          input String fileName;
          input Real table[ :, :];
          input Real startTime;
          input Modelica.Blocks.Types.Smoothness smoothness;
          input Modelica.Blocks.Types.Extrapolation extrapolation;
          output Integer tableID;
        external "C" tableID = ModelicaTables_CombiTimeTable_init(
                       tableName, fileName, table, size(table, 1), size(table, 2),
                       startTime, smoothness, extrapolation);
        end tableTimeInit;

        function tableTimeIpo
        "Interpolate 1-dim. table where first column is time (for details see: Modelica/C-Sources/ModelicaTables.h)"
          input Integer tableID;
          input Integer icol;
          input Real timeIn;
          output Real value;
        external "C" value = 
                           ModelicaTables_CombiTimeTable_interpolate(tableID, icol, timeIn);
        end tableTimeIpo;

        function tableTimeTmin
        "Return minimum time value of 1-dim. table where first column is time (for details see: Modelica/C-Sources/ModelicaTables.h)"
          input Integer tableID;
          output Real Tmin "minimum time value in table";
        external "C" Tmin = 
                          ModelicaTables_CombiTimeTable_minimumTime(tableID);
        end tableTimeTmin;

        function tableTimeTmax
        "Return maximum time value of 1-dim. table where first column is time (for details see: Modelica/C-Sources/ModelicaTables.h)"
          input Integer tableID;
          output Real Tmax "maximum time value in table";
        external "C" Tmax = 
                          ModelicaTables_CombiTimeTable_maximumTime(tableID);
        end tableTimeTmax;

      equation
        if tableOnFile then
          assert(tableName<>"NoName", "tableOnFile = true and no table name given");
        end if;
        if not tableOnFile then
          assert(size(table,1) > 0 and size(table,2) > 0, "tableOnFile = false and parameter table is an empty matrix");
        end if;
        for i in 1:nout loop
          y[i] = p_offset[i] + tableTimeIpo(tableID, columns[i], time);
        end for;
        when initial() then
          tableID=tableTimeInit((if not tableOnFile then "NoName" else tableName),
                                (if not tableOnFile then "NoName" else fileName), table,
                                startTime, smoothness, extrapolation);
        end when;
      initial equation
          t_min=tableTimeTmin(tableID);
          t_max=tableTimeTmax(tableID);
      end CombiTimeTable;
    end Sources;

    package Types
    "Library of constants and types with choices, especially to build menus"
      extends Modelica.Icons.Library;

      type Smoothness = enumeration(
        LinearSegments "Table points are linearly interpolated",
        ContinuousDerivative
          "Table points are interpolated such that the first derivative is continuous")
      "Enumeration defining the smoothness of table interpolation";

    type Extrapolation = enumeration(
        HoldLastPoint "Hold the last table point outside of the table scope",
        LastTwoPoints
          "Extrapolate linearly through the last two table points outside of the table scope", 

        Periodic "Repeat the table scope periodically")
      "Enumeration defining the extrapolation of time table interpolation";
    end Types;
  end Blocks;

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

        package Elementary
        "Elementary examples to demonstrate various features of the MultiBody library"
        extends Modelica.Icons.Library;

          model DoublePendulum
          "Simple double pendulum with two revolute joints and two bodies"

            extends Modelica.Icons.Example;
            inner Modelica.Mechanics.MultiBody.World world;
            Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(useAxisFlange=true,phi(fixed=true),
                w(fixed=true));
            Modelica.Mechanics.Rotational.Components.Damper damper(
                                                        d=0.1);
            Modelica.Mechanics.MultiBody.Parts.BodyBox boxBody1(r={0.5,0,0}, width=0.06);
            Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(phi(fixed=true), w(
                  fixed=true));
            Modelica.Mechanics.MultiBody.Parts.BodyBox boxBody2(r={0.5,0,0}, width=0.06);
          equation

            connect(damper.flange_b, revolute1.axis);
            connect(revolute1.support, damper.flange_a);
            connect(revolute1.frame_b, boxBody1.frame_a);
            connect(revolute2.frame_b, boxBody2.frame_a);
            connect(boxBody1.frame_b, revolute2.frame_a);
            connect(world.frame_b, revolute1.frame_a);
          end DoublePendulum;

          model ForceAndTorque "Demonstrate usage of ForceAndTorque element"
            extends Modelica.Icons.Example;
            inner World world(animateGravity=false);
            Parts.BodyCylinder body(r={1,0,0});
            Parts.Fixed fixed1(r={0,-0.5,0}, width=0.03);
            Parts.FixedRotation fixedRotation(n={0,0,1}, angle=30);
            Forces.ForceAndTorque forceAndTorque(Nm_to_m=120, N_to_m=1200,
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_resolve);
            Joints.Revolute revolute2(n={0,1,0},
              phi(fixed=true),
              w(fixed=true));
            Modelica.Blocks.Sources.Constant torque[3](k={-100,100,0});
            Joints.Revolute revolute1(phi(fixed=true), w(fixed=true));
            Parts.Fixed fixed2(width=0.03, r={1.5,0.25,0});
            Modelica.Blocks.Sources.Constant force[3](k={0,1000,0});
          equation
            connect(revolute2.frame_b, body.frame_a);
            connect(forceAndTorque.frame_b, body.frame_b);
            connect(fixed1.frame_b, revolute1.frame_a);
            connect(revolute1.frame_b, revolute2.frame_a);
            connect(fixed2.frame_b, forceAndTorque.frame_a);
            connect(fixedRotation.frame_a, fixed1.frame_b);
            connect(forceAndTorque.frame_resolve, fixedRotation.frame_b);
            connect(force.y, forceAndTorque.force);
            connect(torque.y, forceAndTorque.torque);
          end ForceAndTorque;

          model FreeBody
          "Free flying body attached by two springs to environment"
            extends Modelica.Icons.Example;
            parameter Boolean animation=true
            "= true, if animation shall be enabled";
            inner Modelica.Mechanics.MultiBody.World world;
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation bar2(r={0.8,0,0}, animation=false);
            Modelica.Mechanics.MultiBody.Forces.Spring spring1(
              width=0.1,
              coilWidth=0.005,
              numberOfWindings=5,
              c=20,
              s_unstretched=0);
            Modelica.Mechanics.MultiBody.Parts.BodyShape body(
              m=1,
              I_11=1,
              I_22=1,
              I_33=1,
              r={0.4,0,0},
              r_CM={0.2,0,0},
              width=0.05,
              r_0(start={0.2,-0.5,0.1}, each fixed=true),
              v_0(each fixed=true),
              angles_fixed=true,
              w_0_fixed=true,
              angles_start={0.174532925199433,0.174532925199433,0.174532925199433});
            Modelica.Mechanics.MultiBody.Forces.Spring spring2(
              c=20,
              s_unstretched=0,
              width=0.1,
              coilWidth=0.005,
              numberOfWindings=5);
          equation
            connect(bar2.frame_a, world.frame_b);
            connect(spring1.frame_b, body.frame_a);
            connect(bar2.frame_b, spring2.frame_a);
            connect(spring1.frame_a, world.frame_b);
            connect(body.frame_b, spring2.frame_b);
          end FreeBody;

          model InitSpringConstant
          "Determine spring constant such that system is in steady state at given position"

            extends Modelica.Icons.Example;
            inner Modelica.Mechanics.MultiBody.World world(gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.
                  UniformGravity);
            Modelica.Mechanics.MultiBody.Joints.Revolute rev(useAxisFlange=true,n={0,0,1},
              phi(fixed=true),
              w(fixed=true),
              a(fixed=true));
            Modelica.Mechanics.Rotational.Components.Damper damper(
                                                        d=0.1);
            Modelica.Mechanics.MultiBody.Parts.BodyShape body(
              r={1,0,0},
              r_CM={0.5,0,0},
              m=1);
            Modelica.Mechanics.MultiBody.Parts.Fixed fixed(r={1,0.2,0}, width=0.02);
            Modelica.Mechanics.MultiBody.Forces.Spring spring(s_unstretched=0.1, c(fixed=false) = 100);

          equation

            connect(world.frame_b, rev.frame_a);
            connect(damper.flange_b, rev.axis);
            connect(rev.support, damper.flange_a);
            connect(rev.frame_b, body.frame_a);
            connect(fixed.frame_b, spring.frame_a);
            connect(body.frame_b, spring.frame_b);
          end InitSpringConstant;

          model LineForceWithTwoMasses
          "Demonstrate line force with two point masses using a JointUPS and alternatively a LineForceWithTwoMasses component"

            import SI = Modelica.SIunits;

            extends Modelica.Icons.Example;
            parameter Modelica.SIunits.Mass m=1 "Mass of point masses";
            SI.Force rod_f_diff[3]=rod1.frame_b.f - rod3.frame_b.f
            "Difference of cut-forces in rod1 and rod3";
            SI.Force body_f_diff[3]=bodyBox1.frame_b.f - bodyBox2.frame_b.f
            "Difference of cut-forces in bodyBox1 and bodyBox2";

            inner Modelica.Mechanics.MultiBody.World world;
            Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(phi(fixed=true), w(
                  fixed=true));
            Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox1(r={0.7,0,0});
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation rod1(
              r={0,-0.9,0},
              width=0.01,
              animation=false);
            Modelica.Mechanics.MultiBody.Joints.Assemblies.JointUPS jointUPS(nAxis_ia={0.7,1.2,0}, animation=
                 true);
            Modelica.Mechanics.MultiBody.Parts.Body body1(
              r_CM=0.2*jointUPS.eAxis_ia,
              cylinderDiameter=0.05,
              animation=true,
              m=m,
              I_11=0,
              I_22=0,
              I_33=0);
            Modelica.Mechanics.MultiBody.Parts.Body body2(
              r_CM=-0.2*jointUPS.eAxis_ia,
              cylinderDiameter=0.05,
              animation=true,
              m=m,
              I_11=0,
              I_22=0,
              I_33=0);
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation rod2(
              r={0,0.3,0},
              width=0.01,
              animation=false);
            Modelica.Mechanics.Translational.Components.Damper damper1(
                                                            d=3);
            Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(phi(fixed=true), w(
                  fixed=true));
            Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox2(r={0.7,0,0});
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation rod3(
              width=0.01,
              r={0,-0.9,0.3},
              animation=false);
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation rod4(
              width=0.01,
              r={0,0.3,0.3},
              animation=false);
            Modelica.Mechanics.Translational.Components.Damper damper2(
                                                            d=3);
            Modelica.Mechanics.MultiBody.Forces.LineForceWithTwoMasses
            lineForceWithTwoMasses(
              L_a=0.2,
              L_b=0.2,
              cylinderLength_a=0.2,
              cylinderLength_b=1.2,
              massDiameterFaction=2.2,
              m_a=m,
              m_b=m);
          equation
            connect(jointUPS.bearing, damper1.flange_a);
            connect(jointUPS.axis, damper1.flange_b);
            connect(jointUPS.frame_ib, body2.frame_a);
            connect(world.frame_b, rod2.frame_a);
            connect(world.frame_b, rod1.frame_a);
            connect(rod2.frame_b, revolute1.frame_a);
            connect(revolute1.frame_b, bodyBox1.frame_a);
            connect(bodyBox1.frame_b, jointUPS.frame_b);
            connect(body1.frame_a, jointUPS.frame_ia);
            connect(rod1.frame_b, jointUPS.frame_a);
            connect(rod4.frame_b, revolute2.frame_a);
            connect(revolute2.frame_b, bodyBox2.frame_a);
            connect(world.frame_b, rod4.frame_a);
            connect(rod3.frame_a, rod4.frame_a);
            connect(lineForceWithTwoMasses.frame_a, rod3.frame_b);
            connect(lineForceWithTwoMasses.frame_b, bodyBox2.frame_b);
            connect(lineForceWithTwoMasses.flange_b, damper2.flange_b);
            connect(lineForceWithTwoMasses.flange_a, damper2.flange_a);
          end LineForceWithTwoMasses;

          model Pendulum "Simple pendulum with one revolute joint and one body"
            extends Modelica.Icons.Example;
            inner Modelica.Mechanics.MultiBody.World world(gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.
                  UniformGravity);
            Modelica.Mechanics.MultiBody.Joints.Revolute rev(n={0,0,1},useAxisFlange=true,
              phi(fixed=true),
              w(fixed=true));
            Modelica.Mechanics.Rotational.Components.Damper damper(
                                                        d=0.1);
            Modelica.Mechanics.MultiBody.Parts.Body body(m=1.0, r_CM={0.5,0,0});
          equation
            connect(world.frame_b, rev.frame_a);
            connect(damper.flange_b, rev.axis);
            connect(rev.support, damper.flange_a);
            connect(body.frame_a, rev.frame_b);
          end Pendulum;

          model PendulumWithSpringDamper "Simple spring/damper/mass system"
            extends Modelica.Icons.Example;
            parameter Boolean animation=true
            "= true, if animation shall be enabled";
            inner Modelica.Mechanics.MultiBody.World world(axisLength=0.6);
            Modelica.Mechanics.MultiBody.Parts.Body body1(
              m=1,
              animation=animation,
              I_11=1,
              I_22=1,
              I_33=1,
              r_CM={0,0,0},
              cylinderDiameter=0.05,
              sphereDiameter=0.2);
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation bar1(animation=animation, r={0.3,0,0});
            Modelica.Mechanics.MultiBody.Forces.Spring spring1(
              coilWidth=0.01,
              numberOfWindings=5,
              c=20,
              s_unstretched=0.2);
            Modelica.Mechanics.MultiBody.Forces.Damper damper1(
              d=1,
              length_a=0.1,
              diameter_a=0.08,
              animation=false);
            Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(fixed=true), w(
                  fixed=true));
            Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(
              boxWidth=0.04,
              boxColor={255,65,65},
              s(fixed=true, start=0.5),
              v(fixed=true));
          equation
            connect(world.frame_b, bar1.frame_a);
            connect(revolute.frame_a, bar1.frame_b);
            connect(prismatic.frame_a, revolute.frame_b);
            connect(damper1.frame_a, bar1.frame_b);
            connect(damper1.frame_b, prismatic.frame_b);
            connect(spring1.frame_a, bar1.frame_b);
            connect(spring1.frame_b, prismatic.frame_b);
            connect(body1.frame_a, prismatic.frame_b);
          end PendulumWithSpringDamper;

          model PointGravity "Two point masses in a point gravity field"
            import SI = Modelica.SIunits;
            extends Modelica.Icons.Example;
            inner Modelica.Mechanics.MultiBody.World world(
              mue=1,
              gravitySphereDiameter=0.1,
              gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.PointGravity);
            Modelica.Mechanics.MultiBody.Parts.Body body1(
              m=1,
              sphereDiameter=0.1,
              I_11=0.1,
              I_22=0.1,
              I_33=0.1,
              r_0(start={0,0.6,0}, each fixed=true),
              v_0(start={1,0,0}, each fixed=true),
              angles_fixed=true,
              w_0_fixed=true,
              r_CM={0,0,0});
            Modelica.Mechanics.MultiBody.Parts.Body body2(
              m=1,
              sphereDiameter=0.1,
              I_11=0.1,
              I_22=0.1,
              I_33=0.1,
              r_0(start={0.6,0.6,0}, each fixed=true),
              v_0(start={0.6,0,0}, each fixed=true),
              angles_fixed=true,
              w_0_fixed=true,
              r_CM={0,0,0});
          equation

          end PointGravity;

          model PointGravityWithPointMasses
          "Two point masses in a point gravity field (rotation of bodies is neglected)"
            import SI = Modelica.SIunits;
            extends Modelica.Icons.Example;
            inner Modelica.Mechanics.MultiBody.World world(
              mue=1,
              gravitySphereDiameter=0.1,
              gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.PointGravity);
            Modelica.Mechanics.MultiBody.Parts.PointMass body1(
              m=1,
              sphereDiameter=0.1,
              r_0(start={0,0.6,0}, each fixed=true),
              v_0(start={1,0,0}, each fixed=true));
            Modelica.Mechanics.MultiBody.Parts.PointMass body2(
              m=1,
              sphereDiameter=0.1,
              r_0(start={0.6,0.6,0}, each fixed=true),
              v_0(start={0.6,0,0}, each fixed=true));
            Modelica.Mechanics.MultiBody.Parts.PointMass body3(
              m=1,
              sphereDiameter=0.1,
              r_0(start={0,0.8,0}, each fixed=true),
              v_0(start={0.6,0,0}, each fixed=true));
            Modelica.Mechanics.MultiBody.Parts.PointMass body4(
              m=1,
              sphereDiameter=0.1,
              r_0(start={0.3,0.8,0}, each fixed=true),
              v_0(start={0.6,0,0}, each fixed=true));
            Forces.Spring spring(showMass=false, c=10);
          equation

            connect(spring.frame_a, body3.frame_a);
            connect(spring.frame_b, body4.frame_a);
          end PointGravityWithPointMasses;

          model PointGravityWithPointMasses2
          "Rigidly connected point masses in a point gravity field"
            extends Modelica.Icons.Example;
            model PointMass = Modelica.Mechanics.MultiBody.Parts.PointMass (m=1, sphereColor={
                    255,0,0}) "Point mass used at all places of this example";

            PointMass pointMass1(r_0(start={3,0,0}, each fixed=true), v_0(start={0,0,-1}, each fixed=true));

            PointMass pointMass2;
            PointMass pointMass3(r_0(start={2,1,0}, each fixed=true), v_0(start={0,0,-1}, each fixed=true));
            PointMass pointMass4;
            PointMass pointMass5;
            PointMass pointMass6;

            Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r={1,0,0});
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r={-1,0,0});
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r={0,1,0});
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation3(r={0,-1,0});
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation4(r={0,0,1});
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation5(r={0,0,-1});


            inner World world(gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.PointGravity, mue=5);
            Joints.FreeMotion freeMotion;

          model SystemWithStandardBodies
            "For comparison purposes, an equivalent model with Bodies instead of PointMasses"
            extends Modelica.Icons.Example;
            model PointMass = Modelica.Mechanics.MultiBody.Parts.Body(m=1,I_11=0,I_22=0,I_33=0)
              "Body used all places of the comparision model with zero inertia tensor";

            PointMass pointMass1(
                r_0(start={3,0,0}, each fixed=true),
                v_0(start={0,0,-1}, each fixed=true),
                angles_fixed=true,
                w_0_fixed=true,
                r_CM={0,0,0});
            PointMass pointMass2(r_CM={0,0,0});
            PointMass pointMass3(r_CM={0,0,0});
            PointMass pointMass4(r_CM={0,0,0});
            PointMass pointMass5(r_CM={0,0,0});
            PointMass pointMass6(r_CM={0,0,0});

            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
              fixedTranslation(                                                   r={1,0,0});
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
              fixedTranslation1(                                                   r={-1,0,0});
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
              fixedTranslation2(                                                   r={0,1,0});
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
              fixedTranslation3(                                                   r={0,-1,0});
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
              fixedTranslation4(                                                   r={0,0,1});
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
              fixedTranslation5(                                                   r={0,0,-1});


          equation
            connect(fixedTranslation1.frame_a, fixedTranslation.frame_a);
            connect(fixedTranslation1.frame_a, fixedTranslation2.frame_a);
            connect(fixedTranslation3.frame_a, fixedTranslation.frame_a);
            connect(fixedTranslation1.frame_a, fixedTranslation4.frame_a);
            connect(fixedTranslation5.frame_a, fixedTranslation.frame_a);
            connect(fixedTranslation2.frame_b, pointMass3.frame_a);
            connect(fixedTranslation3.frame_b, pointMass4.frame_a);
            connect(pointMass5.frame_a, fixedTranslation4.frame_b);
            connect(fixedTranslation5.frame_b, pointMass6.frame_a);
            connect(fixedTranslation.frame_b, pointMass1.frame_a);
            connect(fixedTranslation1.frame_b, pointMass2.frame_a);
          end SystemWithStandardBodies;

            SystemWithStandardBodies referenceSystem;
          equation
            connect(fixedTranslation1.frame_a, fixedTranslation.frame_a);
            connect(fixedTranslation1.frame_a, fixedTranslation2.frame_a);
            connect(fixedTranslation3.frame_a, fixedTranslation.frame_a);
            connect(fixedTranslation1.frame_a, fixedTranslation4.frame_a);
            connect(fixedTranslation5.frame_a, fixedTranslation.frame_a);
            connect(fixedTranslation2.frame_b, pointMass3.frame_a);
            connect(fixedTranslation3.frame_b, pointMass4.frame_a);
            connect(pointMass5.frame_a, fixedTranslation4.frame_b);
            connect(fixedTranslation5.frame_b, pointMass6.frame_a);
            connect(fixedTranslation.frame_b, pointMass1.frame_a);
            connect(fixedTranslation1.frame_b, pointMass2.frame_a);
            connect(world.frame_b, freeMotion.frame_a);
            connect(freeMotion.frame_b, fixedTranslation1.frame_a);
          end PointGravityWithPointMasses2;

          model SpringDamperSystem "Simple spring/damper/mass system"
            extends Modelica.Icons.Example;
            parameter Boolean animation=true
            "= true, if animation shall be enabled";
            inner Modelica.Mechanics.MultiBody.World world;
            Modelica.Mechanics.MultiBody.Parts.Body body1(
              m=1,
              animation=animation,
              r_CM={0,-0.2,0},
              cylinderDiameter=0.05,
              sphereDiameter=0.15,
              I_11=0.1,
              I_22=0.1,
              I_33=0.1,
              r_0(start={0.3,-0.2,0}, each fixed=true),
              v_0(each fixed=true),
              angles_fixed=true,
              w_0_fixed=true,
              w_0_start(each displayUnit="deg/s") = {0,0,0.03490658503988659});
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation bar1(animation=animation, r={0.3,0,0});
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation bar2(animation=animation, r={0.6,0,0});
            Modelica.Mechanics.MultiBody.Parts.Body body2(
              m=1,
              animation=animation,
              cylinderDiameter=0.05,
              sphereDiameter=0.15,
              r_CM={0,0,0});
            Modelica.Mechanics.MultiBody.Joints.Prismatic p2(useAxisFlange=true,
              n={0,-1,0},
              animation=animation,
              boxWidth=0.05,
              stateSelect=StateSelect.always,
              v(fixed=true),
              s(fixed=true, start=0.1));
            Modelica.Mechanics.MultiBody.Forces.Spring spring2(
              c=30,
              s_unstretched=0.1,
              coilWidth=0.01,
              width=0.1);
            Modelica.Mechanics.MultiBody.Forces.Spring spring1(
              s_unstretched=0.1,
              coilWidth=0.01,
              c=30,
              numberOfWindings=10,
              width=0.1);
            Modelica.Mechanics.MultiBody.Forces.Damper damper1(d=2);
          equation
            connect(world.frame_b, bar1.frame_a);
            connect(bar1.frame_b, bar2.frame_a);
            connect(bar2.frame_b, p2.frame_a);
            connect(p2.frame_b, body2.frame_a);
            connect(bar2.frame_b, spring2.frame_a);
            connect(body2.frame_a, spring2.frame_b);
            connect(damper1.frame_a, bar1.frame_b);
            connect(spring1.frame_a, bar1.frame_b);
            connect(damper1.frame_b, body1.frame_a);
            connect(spring1.frame_b, body1.frame_a);
          end SpringDamperSystem;

          model SpringMassSystem
          "Mass attached with a spring to the world frame"
            extends Modelica.Icons.Example;
            parameter Boolean animation=true
            "= true, if animation shall be enabled";
            inner Modelica.Mechanics.MultiBody.World world;
            Modelica.Mechanics.MultiBody.Joints.Prismatic p1(useAxisFlange=true,
              n={0,-1,0},
              animation=animation,
              boxWidth=0.05,
              s(fixed=true, start=0.1),
              v(fixed=true));
            Modelica.Mechanics.Translational.Components.Spring spring1(
                                                            c=30, s_rel0=0.1);
            Modelica.Mechanics.MultiBody.Parts.Body body1(
              m=1,
              sphereDiameter=0.2,
              animation=animation,
              r_CM={0,0,0});
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation bar1(animation=animation, r={0.3,0,0});
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation bar2(animation=animation, r={0.3,0,0});
            Modelica.Mechanics.MultiBody.Parts.Body body2(
              m=1,
              sphereDiameter=0.2,
              animation=animation,
              r_CM={0,0,0});
            Modelica.Mechanics.MultiBody.Joints.Prismatic p2(useAxisFlange=true,
              n={0,-1,0},
              animation=animation,
              boxWidth=0.05,
              stateSelect=StateSelect.always,
              s(fixed=true, start=0.1),
              v(fixed=true));
            Modelica.Mechanics.MultiBody.Forces.Spring spring2(
              c=30,
              s_unstretched=0.1,
              width=0.1);
          equation
            connect(body1.frame_a, p1.frame_b);
            connect(world.frame_b, bar1.frame_a);
            connect(bar1.frame_b, p1.frame_a);
            connect(spring1.flange_b, p1.axis);
            connect(bar1.frame_b, bar2.frame_a);
            connect(bar2.frame_b, p2.frame_a);
            connect(p2.frame_b, body2.frame_a);
            connect(bar2.frame_b, spring2.frame_a);
            connect(body2.frame_a, spring2.frame_b);
            connect(spring1.flange_a, p1.support);
          end SpringMassSystem;

          model SpringWithMass "Point mass hanging on a spring"
            extends Modelica.Icons.Example;
            inner Modelica.Mechanics.MultiBody.World world(animateGravity=false);
            Modelica.Mechanics.MultiBody.Forces.Spring spring(
              s_unstretched=0.2,
              m=0.5,
              c=40,
              width=0.1,
              massDiameter=0.07);
            Modelica.Mechanics.MultiBody.Parts.Body body(
              r_0(start={0,-0.3,0}, each fixed=true),
              v_0(each fixed=true),
              angles_fixed=true,
              w_0_fixed=true,
              r_CM={0,0,0},
              m=1);
          equation
            connect(world.frame_b, spring.frame_a);
            connect(body.frame_a, spring.frame_b);
          end SpringWithMass;

          model ThreeSprings "3-dim. springs in series and parallel connection"
            extends Modelica.Icons.Example;
            parameter Boolean animation=true
            "= true, if animation shall be enabled";
            inner Modelica.Mechanics.MultiBody.World world(animateWorld=animation);
            Modelica.Mechanics.MultiBody.Parts.Body body1(
              animation=animation,
              r_CM={0,-0.2,0},
              m=0.8,
              I_11=0.1,
              I_22=0.1,
              I_33=0.1,
              sphereDiameter=0.2,
              r_0(start={0.5,-0.3,0}, each fixed=true),
              v_0(each fixed=true),
              angles_fixed=true,
              w_0_fixed=true);
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation bar1(animation=animation, r={0.3,0,0});
            Modelica.Mechanics.MultiBody.Forces.Spring spring1(
              lineForce(r_rel_0(start={-0.2,-0.2,0.2})),
              s_unstretched=0.1,
              width=0.1,
              coilWidth=0.005,
              numberOfWindings=5,
              c=20,
              animation=animation);
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation bar2(animation=animation, r={0,0,0.3});
            Modelica.Mechanics.MultiBody.Forces.Spring spring2(
              s_unstretched=0.1,
              width=0.1,
              coilWidth=0.005,
              numberOfWindings=5,
              c=40,
              animation=animation);
            Modelica.Mechanics.MultiBody.Forces.Spring spring3(
              s_unstretched=0.1,
              width=0.1,
              coilWidth=0.005,
              numberOfWindings=5,
              c=20,
              animation=animation);
          equation
            connect(world.frame_b, bar1.frame_a);
            connect(world.frame_b, bar2.frame_a);
            connect(bar1.frame_b, spring1.frame_a);
            connect(bar2.frame_b, spring3.frame_a);
            connect(spring2.frame_b, body1.frame_a);
            connect(spring3.frame_b, spring1.frame_b);
            connect(spring2.frame_a, spring1.frame_b);
          end ThreeSprings;

          model RollingWheel
          "Single wheel rolling on ground starting from an initial speed"
             extends Modelica.Icons.Example;

            Modelica.Mechanics.MultiBody.Parts.RollingWheel wheel1(
              wheelRadius=0.3,
              wheelMass=2,
              wheel_I_axis=0.06,
              wheel_I_long=0.12,
              hollowFraction=0.6,
              x(start=0.2),
              y(start=0.2),
              der_angles(start={0,5,1}));
            inner Modelica.Mechanics.MultiBody.World world(label2="z", n={0,0,-1});
            Modelica.Mechanics.MultiBody.Visualizers.Ground ground(length=4);
          end RollingWheel;

          model RollingWheelSetDriving
          "Rolling wheel set that is driven by torques driving the wheels"
             extends Modelica.Icons.Example;

            Modelica.Mechanics.MultiBody.Visualizers.Ground ground(
                          length=3, groundColor={0,255,0});
            inner Modelica.Mechanics.MultiBody.World world(label2="z", n={0,0,-1});
            Modelica.Mechanics.MultiBody.Parts.RollingWheelSet wheelSet(
              wheelRadius=0.1,
              wheelMass=0.5,
              wheel_I_axis=0.01,
              wheel_I_long=0.02,
              wheelDistance=0.5,
              x(start=0.1, fixed=true),
              y(start=0.1, fixed=true),
              phi(fixed=true),
              theta1(fixed=true),
              theta2(fixed=true),
              der_theta1(fixed=true),
              der_theta2(fixed=true));
            Modelica.Mechanics.MultiBody.Parts.Body body(m=0.01, r_CM={0,0,0},
              animation=false);
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
            fixedTranslation(    r={0.2,0,0},
              animation=true,
              width=0.04);
            Modelica.Blocks.Sources.Sine sine1(freqHz=1, amplitude=2);
            Modelica.Blocks.Sources.Sine sine2(
              freqHz=1,
              amplitude=2,
              phase=1.5707963267949);
            Modelica.Mechanics.Rotational.Sources.Torque2 torque1;
            Modelica.Mechanics.Rotational.Sources.Torque2 torque2;
            Modelica.Mechanics.MultiBody.Visualizers.FixedShape shape(
              final lengthDirection={0,1,0},
              final widthDirection={1,0,0},
              final shapeType="pipe",
              final r_shape={0,-wheelSet.wheelWidth,0},
              final length=2*wheelSet.wheelWidth,
              final width=2*wheelSet.wheelRadius,
              final height=2*wheelSet.wheelRadius,
              final color={0,128,255},
              final extra=0.8);
          equation
            connect(fixedTranslation.frame_a, wheelSet.frameMiddle);
            connect(fixedTranslation.frame_b, body.frame_a);
            connect(wheelSet.axis1, torque1.flange_a);
            connect(torque1.flange_b, wheelSet.support);
            connect(wheelSet.axis2, torque2.flange_a);
            connect(wheelSet.support, torque2.flange_b);
            connect(sine1.y, torque1.tau);
            connect(sine2.y, torque2.tau);
            connect(shape.frame_a, fixedTranslation.frame_b);
          end RollingWheelSetDriving;

          model RollingWheelSetPulling
          "Rolling wheel set that is pulled by a force"
             extends Modelica.Icons.Example;

            Modelica.Mechanics.MultiBody.Forces.WorldForce force(animation=false);
            Modelica.Mechanics.MultiBody.Visualizers.Ground ground(
                          length=3);
            inner Modelica.Mechanics.MultiBody.World world(label2="z", n={0,0,-1});
            Modelica.Mechanics.MultiBody.Parts.RollingWheelSet wheelSet(
              wheelRadius=0.1,
              wheelMass=0.5,
              wheel_I_axis=0.01,
              wheel_I_long=0.02,
              wheelDistance=0.5,
              x(start=0.1, fixed=true),
              y(start=0.1, fixed=true),
              phi(fixed=true),
              theta1(fixed=true),
              theta2(fixed=true),
              der_theta1(fixed=true),
              der_theta2(fixed=true));
            Modelica.Mechanics.MultiBody.Parts.Body body(m=0.01, r_CM={0,0,0},
              animation=false);
            Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table=[0,1,0,0; 1,1,
                  0,0; 2,0,2,0; 3,0,2,0]);
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
            fixedTranslation(    r={0.2,0,0},
              animation=true,
              width=0.04);
            Modelica.Mechanics.MultiBody.Visualizers.FixedShape shape(
              final lengthDirection={0,1,0},
              final widthDirection={1,0,0},
              final shapeType="pipe",
              final r_shape={0,-wheelSet.wheelWidth,0},
              final length=2*wheelSet.wheelWidth,
              final width=2*wheelSet.wheelRadius,
              final height=2*wheelSet.wheelRadius,
              final color={0,128,255},
              final extra=0.8);
          equation
            connect(combiTimeTable.y, force.force);
            connect(fixedTranslation.frame_a, wheelSet.frameMiddle);
            connect(fixedTranslation.frame_b, body.frame_a);
            connect(force.frame_b, fixedTranslation.frame_b);
            connect(shape.frame_a, fixedTranslation.frame_b);
          end RollingWheelSetPulling;
        end Elementary;
      end Examples;

      package Forces
      "Components that exert forces and/or torques between frames"
        import SI = Modelica.SIunits;
        extends Modelica.Icons.Library;

        model WorldForce
        "External force acting at frame_b, defined by 3 input signals and resolved in frame world, frame_b or frame_resolve"

          import SI = Modelica.SIunits;
          extends Interfaces.PartialOneFrame_b;
          Interfaces.Frame_resolve frame_resolve if 
               resolveInFrame == Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.frame_resolve
          "The input signals are optionally resolved in this frame";
          Modelica.Blocks.Interfaces.RealInput force[3](each final quantity="Force", each
            final unit =   "N")
          "x-, y-, z-coordinates of force resolved in frame defined by resolveInFrame";
          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter Modelica.Mechanics.MultiBody.Types.ResolveInFrameB
          resolveInFrame=
            Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.world
          "Frame in which input force is resolved (1: world, 2: frame_b, 3: frame_resolve)";
          parameter Real N_to_m(unit="N/m") = world.defaultN_to_m
          "Force arrow scaling (length = force/N_to_m)";
          input SI.Diameter diameter=world.defaultArrowDiameter
          "Diameter of force arrow";
          input Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.ForceColor
          "Color of arrow";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";


      protected
          SI.Position f_in_m[3]=frame_b.f/N_to_m
          "Force mapped from N to m for animation";
          Visualizers.Advanced.Arrow arrow(
            diameter=diameter,
            color=color,
            specularCoefficient=specularCoefficient,
            R=frame_b.R,
            r=frame_b.r_0,
            r_tail=f_in_m,
            r_head=-f_in_m) if world.enableAnimation and animation;

      public
          Internal.BasicWorldForce basicWorldForce(resolveInFrame=resolveInFrame);
      protected
          Interfaces.ZeroPosition zeroPosition if 
               not (resolveInFrame == Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.frame_resolve);
        equation
          connect(basicWorldForce.frame_b, frame_b);
          connect(basicWorldForce.force, force);
          connect(basicWorldForce.frame_resolve, frame_resolve);
          connect(zeroPosition.frame_resolve, basicWorldForce.frame_resolve);
        end WorldForce;

        model ForceAndTorque
        "Force and torque acting between two frames, defined by 3+3 input signals and resolved in frame world, frame_a, frame_b or frame_resolve"

          import SI = Modelica.SIunits;
          import Modelica.Mechanics.MultiBody.Types;
          extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;

          Blocks.Interfaces.RealInput force[3](each final quantity="Force", each
            final unit =   "N")
          "x-, y-, z-coordinates of force resolved in frame defined by resolveInFrame";
          Blocks.Interfaces.RealInput torque[3](each final quantity="Torque", each
            final unit =   "N.m")
          "x-, y-, z-coordiantes of torque resolved in frame defined by resolveInFrame";
          Interfaces.Frame_resolve frame_resolve if 
               resolveInFrame == Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_resolve
          "The input signals are optionally resolved in this frame";

          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB
          resolveInFrame=
            Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_b
          "Frame in which input force and torque are resolved (1: world, 2: frame_a, 3: frame_b, 4: frame_resolve)";
          parameter Real N_to_m(unit="N/m") = world.defaultN_to_m
          "Force arrow scaling (length = force/N_to_m)";
          parameter Real Nm_to_m(unit="N.m/m") = world.defaultNm_to_m
          "Torque arrow scaling (length = torque/Nm_to_m)";
          input SI.Diameter forceDiameter=world.defaultArrowDiameter
          "Diameter of force arrow";
          input SI.Diameter torqueDiameter=forceDiameter
          " Diameter of torque arrow";
          input SI.Diameter connectionLineDiameter=forceDiameter
          "Diameter of line connecting frame_a and frame_b";
          input Types.Color forceColor=Modelica.Mechanics.MultiBody.Types.Defaults.ForceColor
          "Color of force arrow";
          input Types.Color torqueColor=Modelica.Mechanics.MultiBody.Types.Defaults.TorqueColor
          "Color of torque arrow";
          input Types.Color connectionLineColor=Modelica.Mechanics.MultiBody.Types.Defaults.SensorColor
          "Color of line connecting frame_a and frame_b";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";


      protected
          SI.Position f_in_m[3]=frame_b.f/N_to_m
          "Force mapped from N to m for animation";
          SI.Position t_in_m[3]=frame_b.t/Nm_to_m
          "Torque mapped from Nm to m for animation";
          Visualizers.Advanced.Arrow forceArrow(
            diameter=forceDiameter,
            color=forceColor,
            specularCoefficient=specularCoefficient,
            R=frame_b.R,
            r=frame_b.r_0,
            r_tail=f_in_m,
            r_head=-f_in_m) if world.enableAnimation and animation;
          Visualizers.Advanced.DoubleArrow torqueArrow(
            diameter=torqueDiameter,
            color=torqueColor,
            specularCoefficient=specularCoefficient,
            R=frame_b.R,
            r=frame_b.r_0,
            r_tail=t_in_m,
            r_head=-t_in_m) if world.enableAnimation and animation;
          Visualizers.Advanced.Shape connectionLine(
            shapeType="cylinder",
            lengthDirection=basicForce.r_0,
            widthDirection={0,1,0},
            length=Modelica.Math.Vectors.length(
                                 basicForce.r_0),
            width=connectionLineDiameter,
            height=connectionLineDiameter,
            color=connectionLineColor,
            specularCoefficient=specularCoefficient,
            r=frame_a.r_0) if world.enableAnimation and animation;

      public
          Internal.BasicForce basicForce(resolveInFrame=resolveInFrame);
          Internal.BasicTorque basicTorque(resolveInFrame=resolveInFrame);
      protected
          Interfaces.ZeroPosition zeroPosition if 
               not (resolveInFrame == Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_resolve);
        equation
          connect(basicForce.frame_a, frame_a);
          connect(basicForce.frame_b, frame_b);
          connect(basicTorque.frame_b, frame_b);
          connect(basicTorque.frame_a, frame_a);
          connect(basicForce.force, force);
          connect(basicTorque.torque, torque);
          connect(basicTorque.frame_resolve, frame_resolve);
          connect(basicForce.frame_resolve, frame_resolve);
          connect(zeroPosition.frame_resolve, basicTorque.frame_resolve);
          connect(zeroPosition.frame_resolve, basicForce.frame_resolve);
        end ForceAndTorque;

        model LineForceWithMass
        "General line force component with an optional point mass on the connection line"

          import SI = Modelica.SIunits;
          import Modelica.Mechanics.MultiBody.Types;
          extends Interfaces.PartialTwoFrames;
          Modelica.Mechanics.Translational.Interfaces.Flange_a flange_b
          "1-dim. translational flange (connect force of Translational library between flange_a and flange_b)";
          Modelica.Mechanics.Translational.Interfaces.Flange_b flange_a
          "1-dim. translational flange (connect force of Translational library between flange_a and flange_b)";

          parameter Boolean animateLine=true "= true, if a line shape between frame_a and frame_b shall be visualized";
          parameter Boolean animateMass=true "= true, if point mass shall be visualized as sphere provided m > 0";
          parameter SI.Mass m(min=0)=0 "Mass of point mass on the connetion line between the origin of frame_a and the origin of frame_b";
          parameter Real lengthFraction(
            unit="1",
            min=0,
            max=1) = 0.5
          "Location of point mass with respect to frame_a as a fraction of the distance from frame_a to frame_b";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient "Reflection of ambient light (= 0: light is completely absorbed)";
          parameter Types.ShapeType lineShapeType="cylinder" " Type of shape visualizing the line from frame_a to frame_b";
          input SI.Length lineShapeWidth=world.defaultArrowDiameter " Width of shape";
          input SI.Length lineShapeHeight=lineShapeWidth " Height of shape";
          parameter Types.ShapeExtra lineShapeExtra=0.0 " Extra parameter for shape";
          input Types.Color lineShapeColor=Modelica.Mechanics.MultiBody.Types.Defaults.SensorColor " Color of line shape";
          input Real massDiameter=world.defaultBodyDiameter " Diameter of point mass sphere";
          input Types.Color massColor=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor " Color of point mass";
          parameter SI.Position s_small=1.E-10 " Prevent zero-division if distance between frame_a and frame_b is zero";
          SI.Distance length "Distance between the origin of frame_a and the origin of frame_b";
          SI.Position r_rel_0[3] "Position vector from frame_a to frame_b resolved in world frame";
          Real e_rel_0[3](each final unit="1") "Unit vector in direction from frame_a to frame_b, resolved in world frame";

      protected
          SI.Force fa "Force from flange_a";
          SI.Force fb "Force from flange_b";
          SI.Position r_CM_0[3](each stateSelect=StateSelect.avoid) "Position vector from world frame to point mass, resolved in world frame";
          SI.Velocity v_CM_0[3](each stateSelect=StateSelect.avoid) "First derivative of r_CM_0";
          SI.Acceleration ag_CM_0[3] "der(v_CM_0) - gravityAcceleration";

          Visualizers.Advanced.Shape lineShape(
            shapeType=lineShapeType,
            color=lineShapeColor,
            specularCoefficient=specularCoefficient,
            length=length,
            width=lineShapeWidth,
            height=lineShapeHeight,
            lengthDirection=e_rel_0,
            widthDirection=Frames.resolve1(frame_a.R, {0,1,0}),
            extra=lineShapeExtra,
            r=frame_a.r_0) if world.enableAnimation and animateLine;

          Visualizers.Advanced.Shape massShape(
            shapeType="sphere",
            color=massColor,
            specularCoefficient=specularCoefficient,
            length=massDiameter,
            width=massDiameter,
            height=massDiameter,
            lengthDirection=e_rel_0,
            widthDirection={0,1,0},
            r_shape=e_rel_0*(length*lengthFraction - massDiameter/2),
            r=frame_a.r_0) if world.enableAnimation and animateMass and m > 0;
        equation
          Connections.potentialRoot(frame_a.R, 100);
          Connections.potentialRoot(frame_b.R, 100);
          assert(noEvent(length > s_small), "
The distance between the origin of frame_a and the origin of frame_b
of a LineForceWithMass component became smaller as parameter s_small
(= a small number, defined in the \"Advanced\" menu). The distance is
set to s_small, although it is smaller, to avoid a division by zero
when computing the direction of the line force. Possible reasons
for this situation:
- At initial time the distance may already be zero: Change the initial
  positions of the bodies connected by this element.
- Hardware stops are not modeled or are modeled not stiff enough.
  Include stops, e.g., stiff springs, or increase the stiffness
  if already present.
- Another error in your model may lead to unrealistically large forces
  and torques that would in reality destroy the stops.
- The flange_b connector might be defined by a pre-defined motion,
  e.g., with Modelica.Mechanics.Translational.Position and the
  predefined flange_b.s is zero or negative.
");

          // Determine relative position vector between the two frames
          r_rel_0 = frame_b.r_0 - frame_a.r_0;
          length = Modelica.Math.Vectors.length(
                                 r_rel_0);
          flange_a.s = 0;
          flange_b.s = length;
          e_rel_0 = r_rel_0/Frames.Internal.maxWithoutEvent(length, s_small);

          // Determine translational flange forces
          if cardinality(flange_a) > 0 and cardinality(flange_b) > 0 then
            fa = flange_a.f;
            fb = flange_b.f;
          elseif cardinality(flange_a) > 0 and cardinality(flange_b) == 0 then
            fa = flange_a.f;
            fb = -fa;
          elseif cardinality(flange_a) == 0 and cardinality(flange_b) > 0 then
            fa = -fb;
            fb = flange_b.f;
          else
            fa = 0;
            fb = 0;
          end if;

          /* Force and torque balance of point mass
     - Kinematics for center of mass CM of point mass including gravity
       r_CM_0 = frame_a.r0 + r_rel_CM_0;
       v_CM_0 = der(r_CM_0);
       ag_CM_0 = der(v_CM_0) - world.gravityAcceleration(r_CM_0);
     - Power balance for the connection line
       (f1=force on frame_a side, f2=force on frame_b side, h=lengthFraction)
       0 = f1*va - m*ag_CM*(va+(vb-va)*h) + f2*vb
         = (f1 - m*ag_CM*(1-h))*va + (f2 - m*ag_CM*h)*vb
       since va and vb are completely indepedent from other
       the paranthesis must vanish:
         f1 := m*ag_CM*(1-h)
         f2 := m*ag_CM*h
     - Force balance on frame_a and frame_b finally results in
         0 = frame_a.f + e_rel_a*fa - f1_a
         0 = frame_b.f + e_rel_b*fb - f2_b
       and therefore
         frame_a.f = -e_rel_a*fa + m*ag_CM_a*(1-h)
         frame_b.f = -e_rel_b*fb + m*ag_CM_b*h
  */
          if m > 0 then
            r_CM_0 = frame_a.r_0 + r_rel_0*lengthFraction;
            v_CM_0 = der(r_CM_0);
            ag_CM_0 = der(v_CM_0) - world.gravityAcceleration(r_CM_0);
            frame_a.f = Frames.resolve2(frame_a.R, (m*(1 - lengthFraction))*ag_CM_0
               - e_rel_0*fa);
            frame_b.f = Frames.resolve2(frame_b.R, (m*lengthFraction)*ag_CM_0 -
              e_rel_0*fb);
          else
            r_CM_0 = zeros(3);
            v_CM_0 = zeros(3);
            ag_CM_0 = zeros(3);
            frame_a.f = -Frames.resolve2(frame_a.R, e_rel_0*fa);
            frame_b.f = -Frames.resolve2(frame_b.R, e_rel_0*fb);
          end if;

          // Provide appropriate equations, if direct connections of line forces
          if Connections.isRoot(frame_a.R) then
            frame_a.R = Frames.nullRotation();
          else
            frame_a.t = zeros(3);
          end if;

          if Connections.isRoot(frame_b.R) then
            frame_b.R = Frames.nullRotation();
          else
            frame_b.t = zeros(3);
          end if;
        end LineForceWithMass;

        model LineForceWithTwoMasses
        "General line force component with two optional point masses on the connection line"

          import SI = Modelica.SIunits;
          import Modelica.Mechanics.MultiBody.Types;

          extends Interfaces.PartialTwoFrames;
          Modelica.Mechanics.Translational.Interfaces.Flange_a flange_b
          "1-dim. translational flange (connect force of Translational library between flange_a and flange_b)";
          Modelica.Mechanics.Translational.Interfaces.Flange_b flange_a
          "1-dim. translational flange (connect force of Translational library between flange_a and flange_b)";

          parameter Boolean animate=true
          "= true, if animation shall be enabled";
          parameter Boolean animateMasses=true
          "= true, if point masses shall be visualized provided animate=true and m_a, m_b > 0";
          parameter SI.Mass m_a(min=0)=0
          "Mass of point mass a on the connetion line between the origin of frame_a and the origin of frame_b";
          parameter SI.Mass m_b(min=0)=0
          "Mass of point mass b on the connetion line between the origin of frame_a and the origin of frame_b";
          parameter SI.Position L_a=0
          "Distance between point mass a and frame_a (positive, if in direction of frame_b)";
          parameter SI.Position L_b=L_a
          "Distance between point mass b and frame_b (positive, if in direction of frame_a)";
          input SI.Diameter cylinderDiameter_a=world.defaultForceWidth
          " Diameter of cylinder at frame_a";
          parameter SI.Length cylinderLength_a=2*L_a
          " Length of cylinder at frame_a";
          input Types.Color color_a={155,155,155}
          " Color of cylinder at frame_a";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";
          input Real diameterFraction=0.8
          " Diameter of cylinder at frame_b with respect to diameter of cylinder at frame_a";
          parameter SI.Length cylinderLength_b=2*L_b
          " Length of cylinder at frame_b";
          input Types.Color color_b={100,100,100}
          " Color of cylinder at frame_b";
          input Real massDiameterFaction=1.7
          " Diameter of point mass spheres with respect to cylinderDiameter_a";
          input Types.Color massColor=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor
          " Color of point masses";
          parameter SI.Position s_small=1.E-10
          " Prevent zero-division if distance between frame_a and frame_b is zero";
          SI.Distance length
          "Distance between the origin of frame_a and the origin of frame_b";
          SI.Position r_rel_0[3]
          "Position vector from frame_a to frame_b resolved in world frame";
          Real e_rel_0[3](each final unit="1")
          "Unit vector in direction from frame_a to frame_b, resolved in world frame";

      protected
          SI.Force fa "Force from flange_a";
          SI.Force fb "Force from flange_b";
          SI.Position r_CM1_0[3](each stateSelect=StateSelect.avoid) "Position vector from world frame to point mass 1, resolved in world frame";
          SI.Position r_CM2_0[3](each stateSelect=StateSelect.avoid) "Position vector from world frame to point mass 2, resolved in world frame";
          SI.Velocity v_CM1_0[3](each stateSelect=StateSelect.avoid) "der(r_CM_1_0) - velocity of point mass 1";
          SI.Velocity v_CM2_0[3](each stateSelect=StateSelect.avoid) "der(r_CM_2_0) - velocity of point mass 2";
          SI.Acceleration ag_CM1_0[3] "der(v_CM1_0) - gravityAcceleration(r_CM1_0)";
          SI.Acceleration ag_CM2_0[3] "der(v_CM2_0) - gravityAcceleration(r_CM2_0)";
          SI.Force aux1_0[3] "Auxiliary force 1";
          SI.Force aux2_0[3] "Auxiliary force 2";

          input SI.Length cylinderDiameter_b=cylinderDiameter_a*diameterFraction;
          input SI.Length massDiameter=cylinderDiameter_a*massDiameterFaction;
          parameter Boolean animateMasses2=world.enableAnimation and animate and animateMasses and m_a > 0 and m_b > 0;
          Visualizers.Advanced.Shape cylinder_a(
            shapeType="cylinder",
            color=color_a,
            specularCoefficient=specularCoefficient,
            length=cylinderLength_a,
            width=cylinderDiameter_a,
            height=cylinderDiameter_a,
            lengthDirection=e_rel_0,
            widthDirection={0,1,0},
            r=frame_a.r_0) if world.enableAnimation and animate;

          Visualizers.Advanced.Shape cylinder_b(
            shapeType="cylinder",
            color=color_b,
            specularCoefficient=specularCoefficient,
            length=cylinderLength_b,
            width=cylinderDiameter_b,
            height=cylinderDiameter_b,
            lengthDirection=-e_rel_0,
            widthDirection={0,1,0},
            r=frame_b.r_0) if world.enableAnimation and animate;

          Visualizers.Advanced.Shape sphere_a(
            shapeType="sphere",
            color=massColor,
            specularCoefficient=specularCoefficient,
            length=massDiameter,
            width=massDiameter,
            height=massDiameter,
            lengthDirection=e_rel_0,
            widthDirection={0,1,0},
            r_shape=e_rel_0*(L_a - massDiameter/2),
            r=frame_a.r_0) if animateMasses2;

          Visualizers.Advanced.Shape sphere_b(
            shapeType="sphere",
            color=massColor,
            specularCoefficient=specularCoefficient,
            length=massDiameter,
            width=massDiameter,
            height=massDiameter,
            lengthDirection=-e_rel_0,
            widthDirection={0,1,0},
            r_shape=-e_rel_0*(L_b - massDiameter/2),
            r=frame_b.r_0) if animateMasses2;
        equation
          Connections.potentialRoot(frame_a.R, 100);
          Connections.potentialRoot(frame_b.R, 100);
          assert(noEvent(length > s_small), "
The distance between the origin of frame_a and the origin of frame_b
of a LineForceWithTwoMasses component became smaller as parameter s_small
(= a small number, defined in the \"Advanced\" menu). The distance is
set to s_small, although it is smaller, to avoid a division by zero
when computing the direction of the line force. Possible reasons
for this situation:
- At initial time the distance may already be zero: Change the initial
  positions of the bodies connected by this element.
- Hardware stops are not modeled or are modeled not stiff enough.
  Include stops, e.g., stiff springs, or increase the stiffness
  if already present.
- Another error in your model may lead to unrealistically large forces
  and torques that would in reality destroy the stops.
- The flange_b connector might be defined by a pre-defined motion,
  e.g., with Modelica.Mechanics.Translational.Position and the
  predefined flange_b.s is zero or negative.
");

          // Determine relative position vector between the two frames
          r_rel_0 = frame_b.r_0 - frame_a.r_0;
          length = Modelica.Math.Vectors.length(
                                 r_rel_0);
          flange_a.s = 0;
          flange_b.s = length;
          e_rel_0 = r_rel_0/Frames.Internal.maxWithoutEvent(length, s_small);

          // Determine translational flange forces
          if cardinality(flange_a) > 0 and cardinality(flange_b) > 0 then
            fa = flange_a.f;
            fb = flange_b.f;
          elseif cardinality(flange_a) > 0 and cardinality(flange_b) == 0 then
            fa = flange_a.f;
            fb = -fa;
          elseif cardinality(flange_a) == 0 and cardinality(flange_b) > 0 then
            fa = -fb;
            fb = flange_b.f;
          else
            fa = 0;
            fb = 0;
          end if;

          /* Force and torque balance of the two point masses
     - Kinematics for center of masses CM1, CM2 of point masses including gravity
       (L = length, va = der(frame_a.r_0), vb = der(frame_b.r_0))
       r_CM1_0 = frame_a.r_0 + e_rel_0*L_a;
       r_CM2_0 = frame_b.r_0 - e_rel_0*L_b;
       v_CM1_0 = der(r_CM1_0);
       v_CM2_0 = der(r_CM2_0);
       ag_CM1_0 = der(v_CM1_0) - world.gravityAcceleration(r_CM1_0);
       ag_CM2_0 = der(v_CM2_0) - world.gravityAcceleration(r_CM2_0);
       der(e_rel_0) = der(r_rel_0/sqrt(r_rel_0*r_rel_0))
                    = 1/L*(I - e_rel_0*e_rel_0')*der(r_rel_0)
                    = 1/L*(I - e_rel_0*e_rel_0')*(vb - va)
       v_CM1_0 = va + L_a/L*(I - e_rel_0*e_rel_0')*(vb - va)
       v_CM2_0 = vb - L_b/L*(I - e_rel_0*e_rel_0')*(vb - va)
     - Power balance for the connection line
       (f1=force on frame_a side, f2=force on frame_b side)
       0 = f1*va - m_a*ag_CM1*v_CM1 + f2*vb - m_b*ag_CM2*v_CM2
         = f1*va - m_a*ag_CM1*(va + L_a/L*(I - e_rel*e_rel')*(vb - va)) +
           f2*vb - m_b*ag_CM2*(vb - L_b/L*(I - e_rel*e_rel')*(vb - va))
         = (f1 - m_a*ag_CM1*(I - L_a/L*(I - e_rel*e_rel'))
               - m_b*ag_CM2*(L_b/L*(I - e_rel*e_rel')))*va +
           (f2 - m_b*ag_CM2*(I - L_b/L*(I - e_rel_0*e_rel_0'))
               - m_a*ag_CM1*(L_a/L*(I - e_rel*e_rel')))*vb
         = va*(f1 - m_a*ag_CM1 +
               (m_a*ag_CM1*L_a/L - m_b*ag_CM2*L_b/L)*(I - e_rel*e_rel')) +
           vb*(f2 - m_b*ag_CM2 +
               (m_b*ag_CM2*L_b/L - m_a*ag_CM1*L_a/L)*(I - e_rel*e_rel'))
       since va and vb are completely independent from other
       the paranthesis must vanish:
         f1 := m_a*ag_CM1 - (m_a*ag_CM1*L_a/L - m_b*ag_CM2*L_b/L)*(I - e_rel*e_rel')
         f2 := m_b*ag_CM2 + (m_a*ag_CM1*L_a/L - m_b*ag_CM2*L_b/L)*(I - e_rel*e_rel')
       or
         aux1 := ag_CM1*(m_a*L_a/L) - ag_CM2*(m_b*L_b/L);
         aux2 := aux1 - (aux1'*e_rel)*e_rel
         f1 := m_a*ag_CM1 - aux2
         f2 := m_b*ag_CM2 + aux2
     - Force balance on frame_a and frame_b finally results in
         0 = frame_a.f + e_rel_a*fa - f1_a
         0 = frame_b.f + e_rel_b*fb - f2_b
       and therefore
         frame_a.f = -e_rel_a*fa + m_a*ag_CM1 - aux2
         frame_b.f = -e_rel_b*fb + m_b*ag_CM2 + aux2
  */
          if m_a > 0 or m_b > 0 then
            r_CM1_0 = frame_a.r_0 + e_rel_0*L_a;
            r_CM2_0 = frame_b.r_0 - e_rel_0*L_b;
            v_CM1_0 = der(r_CM1_0);
            v_CM2_0 = der(r_CM2_0);
            ag_CM1_0 = der(v_CM1_0) - world.gravityAcceleration(r_CM1_0);
            ag_CM2_0 = der(v_CM2_0) - world.gravityAcceleration(r_CM2_0);
            aux1_0 = ag_CM1_0*(m_a*L_a/length) - ag_CM2_0*(m_b*L_b/length);
            aux2_0 = aux1_0 - (aux1_0*e_rel_0)*e_rel_0;
            frame_a.f = Frames.resolve2(frame_a.R, m_a*ag_CM1_0 - aux2_0 - e_rel_0*fa);
            frame_b.f = Frames.resolve2(frame_b.R, m_b*ag_CM2_0 + aux2_0 - e_rel_0*fb);
          else
            r_CM1_0 = zeros(3);
            r_CM2_0 = zeros(3);
            v_CM1_0 = zeros(3);
            v_CM2_0 = zeros(3);
            ag_CM1_0 = zeros(3);
            ag_CM2_0 = zeros(3);
            aux1_0 = zeros(3);
            aux2_0 = zeros(3);
            frame_a.f = -Frames.resolve2(frame_a.R, e_rel_0*fa);
            frame_b.f = -Frames.resolve2(frame_b.R, e_rel_0*fb);
          end if;

          // Provide appropriate equations, if direct connections of line forces
          if Connections.isRoot(frame_a.R) then
            frame_a.R = Frames.nullRotation();
          else
            frame_a.t = zeros(3);
          end if;

          if Connections.isRoot(frame_b.R) then
            frame_b.R = Frames.nullRotation();
          else
            frame_b.t = zeros(3);
          end if;
        end LineForceWithTwoMasses;

        model Spring "Linear translational spring with optional mass"
          import Modelica.Mechanics.MultiBody.Types;
          extends Interfaces.PartialTwoFrames;
          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter Boolean showMass=true
          "= true, if point mass shall be visualized as sphere if animation=true and m>0";

          parameter SI.TranslationalSpringConstant c(final min=0)
          "Spring constant";
          parameter SI.Length s_unstretched=0 "Unstretched spring length";
          parameter SI.Mass m(min=0)=0
          "Spring mass located on the connetion line between the origin of frame_a and the origin of frame_b";
          parameter Real lengthFraction(
            min=0,
            max=1) = 0.5
          "Location of spring mass with respect to frame_a as a fraction of the distance from frame_a to frame_b (=0: at frame_a; =1: at frame_b)";
          input SI.Distance width=world.defaultForceWidth " Width of spring";
          input SI.Distance coilWidth=width/10 " Width of spring coil";
          parameter Integer numberOfWindings=5 " Number of spring windings";
          input Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.SpringColor
          " Color of spring";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";
          input SIunits.Diameter massDiameter=max(0, (width - 2*coilWidth)*0.9)
          " Diameter of mass point sphere";
          input Types.Color massColor=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor
          " Color of mass point";

          Forces.LineForceWithMass lineForce(
            animateLine=animation,
            animateMass=showMass,
            m=m,
            lengthFraction=lengthFraction,
            lineShapeType="spring",
            lineShapeHeight=coilWidth*2,
            lineShapeWidth=width,
            lineShapeExtra=numberOfWindings,
            lineShapeColor=color,
            specularCoefficient=specularCoefficient,
            massDiameter=massDiameter,
            massColor=massColor);
          Modelica.Mechanics.Translational.Components.Spring spring(
                                                         s_rel0=s_unstretched, c=c);

        equation
          connect(lineForce.frame_a, frame_a);
          connect(lineForce.frame_b, frame_b);
          connect(spring.flange_b, lineForce.flange_b);
          connect(spring.flange_a, lineForce.flange_a);

        end Spring;

        model Damper "Linear (velocity dependent) damper"
          import Modelica.Mechanics.MultiBody.Types;
          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter SI.TranslationalDampingConstant d(final min=0, start = 0)
          "Damping constant";
          parameter SI.Distance length_a=world.defaultForceLength
          " Length of cylinder at frame_a side";
          input SIunits.Diameter diameter_a=world.defaultForceWidth
          " Diameter of cylinder at frame_a side";
          input SIunits.Diameter diameter_b=0.6*diameter_a
          " Diameter of cylinder at frame_b side";
          input Types.Color color_a={100,100,100} " Color at frame_a";
          input Types.Color color_b={155,155,155} " Color at frame_b";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";
          extends Interfaces.PartialLineForce;

      protected
          SI.Position r0_b[3]=e_a*noEvent(min(length_a, s));
          Visualizers.Advanced.Shape shape_a(
            shapeType="cylinder",
            color=color_a,
            specularCoefficient=specularCoefficient,
            length=noEvent(min(length_a, s)),
            width=diameter_a,
            height=diameter_a,
            lengthDirection=e_a,
            widthDirection={0,1,0},
            r=frame_a.r_0,
            R=frame_a.R) if 
                           world.enableAnimation and animation;
          Visualizers.Advanced.Shape shape_b(
            shapeType="cylinder",
            color=color_b,
            specularCoefficient=specularCoefficient,
            length=noEvent(max(s - length_a, 0)),
            width=diameter_b,
            height=diameter_b,
            lengthDirection=e_a,
            widthDirection={0,1,0},
            r_shape=r0_b,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;
        equation
          f = d*der(s);
        end Damper;

        package Internal "Internal package, should not be used by user"

          model BasicForce
          "Force acting between two frames, defined by 3 input signals"

            import Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB;
            extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
            Interfaces.Frame_resolve frame_resolve
            "The input signals are optionally resolved in this frame";
            Modelica.Blocks.Interfaces.RealInput force[3](each final quantity="Force", each
              final unit = "N")
            "x-, y-, z-coordinates of force resolved in frame defined by resolveInFrame";
            parameter Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB
            resolveInFrame=
              Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_b
            "Frame in which force is resolved (1: world, 2: frame_a, 3: frame_b, 4: frame_resolve)";

            Modelica.SIunits.Position r_0[3]
            "Position vector from origin of frame_a to origin of frame_b resolved in world frame";
            Modelica.SIunits.Force f_b_0[3] "frame_b.f resoved in world frame";

          equation
            assert(cardinality(frame_resolve) > 0, "Connector frame_resolve must be connected at least once and frame_resolve.r_0/.R must be set");
            frame_resolve.f = zeros(3);
            frame_resolve.t = zeros(3);

             if resolveInFrame == ResolveInFrameAB.frame_a then
                f_b_0     = -Frames.resolve1(frame_a.R, force);
                frame_b.f =  Frames.resolve2(frame_b.R, f_b_0);
             elseif resolveInFrame == ResolveInFrameAB.frame_b then
                f_b_0     = -Frames.resolve1(frame_b.R, force);
                frame_b.f = -force;
             elseif resolveInFrame == ResolveInFrameAB.world then
                f_b_0     = -force;
                frame_b.f =  Frames.resolve2(frame_b.R, f_b_0);
             elseif resolveInFrame == ResolveInFrameAB.frame_resolve then
                f_b_0     = -Frames.resolve1(frame_resolve.R, force);
                frame_b.f = Frames.resolve2(frame_b.R, f_b_0);
             else
                assert(false, "Wrong value for parameter resolveInFrame");
                f_b_0     = zeros(3);
                frame_b.f = zeros(3);
             end if;
             frame_b.t = zeros(3);

             // Force and torque balance
             r_0 = frame_b.r_0 - frame_a.r_0;
             zeros(3) = frame_a.f + Frames.resolve2(frame_a.R, f_b_0);
             zeros(3) = frame_a.t + Frames.resolve2(frame_a.R, cross(r_0, f_b_0));
          end BasicForce;

          model BasicTorque
          "Torque acting between two frames, defined by 3 input signals"

            import SI = Modelica.SIunits;
            import Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB;
            extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
            Interfaces.Frame_resolve frame_resolve
            "The input signals are optionally resolved in this frame";

            Modelica.Blocks.Interfaces.RealInput torque[3](each final quantity="Torque", each
              final unit = "N.m")
            "x-, y-, z-coordiantes of torque resolved in frame defined by resolveInFrame";
            parameter Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB
            resolveInFrame=
              Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_b
            "Frame in which torque is resolved (1: world, 2: frame_a, 3: frame_b, 4: frame_resolve)";

            SI.Position r_0[3]
            "Position vector from origin of frame_a to origin of frame_b resolved in world frame";
            SI.Torque t_b_0[3] "frame_b.t resoved in world frame";


          equation
            assert(cardinality(frame_resolve) > 0, "Connector frame_resolve must be connected at least once and frame_resolve.r_0/.R must be set");
            frame_resolve.f = zeros(3);
            frame_resolve.t = zeros(3);

            r_0 = frame_b.r_0 - frame_a.r_0;
            frame_a.f = zeros(3);
            frame_b.f = zeros(3);

             if resolveInFrame == ResolveInFrameAB.frame_a then
                t_b_0     = -Frames.resolve1(frame_a.R, torque);
                frame_b.t =  Frames.resolve2(frame_b.R, t_b_0);
             elseif resolveInFrame == ResolveInFrameAB.frame_b then
                t_b_0     = -Frames.resolve1(frame_b.R, torque);
                frame_b.t = -torque;
             elseif resolveInFrame == ResolveInFrameAB.world then
                t_b_0     = -torque;
                frame_b.t =  Frames.resolve2(frame_b.R, t_b_0);
             elseif resolveInFrame == ResolveInFrameAB.frame_resolve then
                t_b_0     = -Frames.resolve1(frame_resolve.R, torque);
                frame_b.t =  Frames.resolve2(frame_b.R, t_b_0);
             else
                assert(false, "Wrong value for parameter resolveInFrame");
                t_b_0     = zeros(3);
                frame_b.t = zeros(3);
             end if;

             // torque balance
             zeros(3) = frame_a.t + Frames.resolve2(frame_a.R, t_b_0);
          end BasicTorque;

          model BasicWorldForce
          "External force acting at frame_b, defined by 3 input signals"

            import SI = Modelica.SIunits;
            import Modelica.Mechanics.MultiBody.Types.ResolveInFrameB;
            extends Interfaces.PartialOneFrame_b;
            Interfaces.Frame_resolve frame_resolve
            "The input signals are optionally resolved in this frame";

            Modelica.Blocks.Interfaces.RealInput force[3](each final quantity="Force", each
              final unit = "N")
            "x-, y-, z-coordinates of force resolved in frame defined by resolveInFrame";
            parameter Modelica.Mechanics.MultiBody.Types.ResolveInFrameB
            resolveInFrame=
              Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.world
            "Frame in which force is resolved (1: world, 2: frame_b, 3: frame_resolve)";


          equation
             assert(cardinality(frame_resolve) > 0, "Connector frame_resolve must be connected at least once and frame_resolve.r_0/.R must be set");
             frame_resolve.f = zeros(3);
             frame_resolve.t = zeros(3);

             if resolveInFrame == ResolveInFrameB.world then
                frame_b.f = -Frames.resolve2(frame_b.R, force);
             elseif resolveInFrame == ResolveInFrameB.frame_b then
                frame_b.f = -force;
             elseif resolveInFrame == ResolveInFrameB.frame_resolve then
                frame_b.f = -Frames.resolveRelative(force, frame_resolve.R, frame_b.R);
             else
                assert(false, "Wrong value for parameter resolveInFrame");
                frame_b.f = zeros(3);
             end if;
             frame_b.t = zeros(3);
          end BasicWorldForce;
        end Internal;
      end Forces;

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

        function angularVelocity1
        "Return angular velocity resolved in frame 1 from orientation object"

          extends Modelica.Icons.Function;
          input Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          output Modelica.SIunits.AngularVelocity w[3]
          "Angular velocity of frame 2 with respect to frame 1 resolved in frame 1";
        algorithm
          w := resolve1(R, R.w);
        end angularVelocity1;

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

        function resolveRelative
        "Transform vector from frame 1 to frame 2 using absolute orientation objects of frame 1 and of frame 2"

          extends Modelica.Icons.Function;
          input Real v1[3] "Vector in frame 1";
          input Orientation R1
          "Orientation object to rotate frame 0 into frame 1";
          input Orientation R2
          "Orientation object to rotate frame 0 into frame 2";
          output Real v2[3] "Vector in frame 2";
        algorithm
          v2 := resolve2(R2, resolve1(R1, v1));
        end resolveRelative;

        function resolveDyade1
        "Transform second order tensor from frame 2 to frame 1"
          extends Modelica.Icons.Function;
          input Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          input Real D2[3, 3] "Second order tensor resolved in frame 2";
          output Real D1[3, 3] "Second order tensor resolved in frame 1";
        algorithm
          D1 := transpose(R.T)*D2*R.T;
        end resolveDyade1;

        function nullRotation
        "Return orientation object that does not rotate a frame"
          extends Modelica.Icons.Function;
          output Orientation R
          "Orientation object such that frame 1 and frame 2 are identical";
        algorithm
          R := Orientation(T=identity(3),w= zeros(3));
        end nullRotation;

        function inverseRotation "Return inverse orientation object"
          extends Modelica.Icons.Function;
          input Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          output Orientation R_inv
          "Orientation object to rotate frame 2 into frame 1";
        algorithm
          R_inv := Orientation(T=transpose(R.T),w= -resolve1(R, R.w));
        end inverseRotation;

        function relativeRotation "Return relative orientation object"
          extends Modelica.Icons.Function;
          input Orientation R1
          "Orientation object to rotate frame 0 into frame 1";
          input Orientation R2
          "Orientation object to rotate frame 0 into frame 2";
          output Orientation R_rel
          "Orientation object to rotate frame 1 into frame 2";
        algorithm
          R_rel := Orientation(T=R2.T*transpose(R1.T),w= R2.w - resolve2(R2, resolve1(
             R1, R1.w)));
        end relativeRotation;

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

        function from_nxy
        "Return fixed orientation object from n_x and n_y vectors"
          extends Modelica.Icons.Function;
          input Real n_x[3](each final unit="1")
          "Vector in direction of x-axis of frame 2, resolved in frame 1";
          input Real n_y[3](each final unit="1")
          "Vector in direction of y-axis of frame 2, resolved in frame 1";
          output Orientation R
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
          R := Orientation(T={e_x,cross(e_z, e_x),e_z},w= zeros(3));
        end from_nxy;

        function from_T
        "Return orientation object R from transformation matrix T"
          extends Modelica.Icons.Function;
          input Real T[3, 3]
          "Transformation matrix to transform vector from frame 1 to frame 2 (v2=T*v1)";
          input Modelica.SIunits.AngularVelocity w[3]
          "Angular velocity from frame 2 with respect to frame 1, resolved in frame 2 (skew(w)=T*der(transpose(T)))";
          output Orientation R
          "Orientation object to rotate frame 1 into frame 2";
        algorithm
          R := Orientation(T=T,w= w);
        end from_T;

        function from_Q "Return orientation object R from quaternion orientation object Q"
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

        function to_Q "Return quaternion orientation object Q from orientation object R"
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

          function maxWithoutEvent
          "Maximum of the input arguments, without event and without warning message when differentiating"

            input Real u1;
            input Real u2;
            output Real y;
            //  annotation (Header="#include \"MultiBody.h\"");
        protected
            Integer dummy;
          algorithm
            y := if u1 > u2 then u1 else u2;
            dummy := 0;
          end maxWithoutEvent;

          function maxWithoutEvent_d
          "First derivative of function maxWithoutEvent(..)"
            input Real u1;
            input Real u2;
            input Real u1_d;
            input Real u2_d;
            output Real y_d;
            //annotation (Header="#include \"MultiBody.h\"");
        protected
            Integer dummy;
          algorithm
            y_d := if u1 > u2 then u1_d else u2_d;
            dummy := 0;
          end maxWithoutEvent_d;

          function maxWithoutEvent_dd
          "First derivative of function maxWithoutEvent_d(..)"
            input Real u1;
            input Real u2;
            input Real u1_d;
            input Real u2_d;
            input Real u1_dd;
            input Real u2_dd;
            output Real y_dd;
          algorithm
            y_dd := if u1 > u2 then u1_dd else u2_dd;
          end maxWithoutEvent_dd;

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

          function resolveRelative_der
          "Derivative of function Frames.resolveRelative(..)"
            import Modelica.Mechanics.MultiBody.Frames;
            extends Modelica.Icons.Function;
            input Real v1[3] "Vector in frame 1";
            input Orientation R1
            "Orientation object to rotate frame 0 into frame 1";
            input Orientation R2
            "Orientation object to rotate frame 0 into frame 2";
            input Real v1_der[3] "= der(v1)";
            output Real v2_der[3] "Derivative of vector v resolved in frame 2";
          algorithm
            v2_der := Frames.resolveRelative(v1_der+cross(R1.w,v1), R1, R2)
                      - cross(R2.w, Frames.resolveRelative(v1, R1, R2));

            /* skew(w) = T*der(T'), -skew(w) = der(T)*T'

     v2 = T2*(T1'*v1)
     der(v2) = der(T2)*T1'*v1 + T2*der(T1')*v1 + T2*T1'*der(v1)
             = der(T2)*T2'*T2*T1'*v1 + T2*T1'*T1*der(T1')*v1 + T2*T1'*der(v1)
             = -w2 x (T2*T1'*v1) + T2*T1'*(w1 x v1) + T2*T1'*der(v1)
             = T2*T1'*(der(v1) + w1 x v1) - w2 x (T2*T1'*v1)
  */
          end resolveRelative_der;
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

      connector Frame_resolve "Coordinate system fixed to the component used to express in which
coordinate system a vector is resolved (non-filled rectangular icon)"
        extends Frame;

      end Frame_resolve;

        partial model PartialTwoFrames
        "Base model for components providing two frame connectors + outer world + assert to guarantee that the component is connected"

          Interfaces.Frame_a frame_a
          "Coordinate system fixed to the component with one cut-force and cut-torque";
          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the component with one cut-force and cut-torque";
      protected
          outer Modelica.Mechanics.MultiBody.World world;
        equation
          assert(cardinality(frame_a) > 0,
            "Connector frame_a of component is not connected");
          assert(cardinality(frame_b) > 0,
            "Connector frame_b of component is not connected");

        end PartialTwoFrames;

        partial model PartialTwoFramesDoubleSize
        "Base model for components providing two frame connectors + outer world + assert to guarantee that the component is connected (default icon size is factor 2 larger as usual)"

          Interfaces.Frame_a frame_a
          "Coordinate system fixed to the component with one cut-force and cut-torque";
          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the component with one cut-force and cut-torque";


      protected
          outer Modelica.Mechanics.MultiBody.World world;
        equation
          assert(cardinality(frame_a) > 0,
            "Connector frame_a of component is not connected");
          assert(cardinality(frame_b) > 0,
            "Connector frame_b of component is not connected");
        end PartialTwoFramesDoubleSize;

        partial model PartialOneFrame_b
        "Base model for components providing one frame_b connector + outer world + assert to guarantee that the component is connected"

          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the component with one cut-force and cut-torque";
      protected
          outer Modelica.Mechanics.MultiBody.World world;
        equation
          assert(cardinality(frame_b) > 0,
            "Connector frame_b of component is not connected");

        end PartialOneFrame_b;

        partial model PartialElementaryJoint
        "Base model for elementary joints (has two frames + outer world + assert to guarantee that the joint is connected)"

          Interfaces.Frame_a frame_a
          "Coordinate system fixed to the joint with one cut-force and cut-torque";
          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the joint with one cut-force and cut-torque";

      protected
          outer Modelica.Mechanics.MultiBody.World world;
        equation
          Connections.branch(frame_a.R, frame_b.R);
          assert(cardinality(frame_a) > 0,
            "Connector frame_a of joint object is not connected");
          assert(cardinality(frame_b) > 0,
            "Connector frame_b of joint object is not connected");
        end PartialElementaryJoint;

        partial model PartialLineForce "Base model for line force elements"
          import SI = Modelica.SIunits;
          parameter SI.Position s_small=1.E-6
          " Prevent zero-division if relative distance s=0";
          Interfaces.Frame_a frame_a
          "Coordinate system fixed to the force element with one cut-force and cut-torque";
          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the force element with one cut-force and cut-torque";
          SI.Force f
          "Line force acting on frame_a and on frame_b (positive, if acting on frame_b and directed from frame_a to frame_b)";
          SI.Position s
          "(Guarded) distance between the origin of frame_a and the origin of frame_b (>= s_small))";
          Real e_a[3](each final unit="1")
          "Unit vector on the line connecting the origin of frame_a with the origin of frame_b resolved in frame_a (directed from frame_a to frame_b)";
          Modelica.SIunits.Position r_rel_a[3]
          "Position vector from origin of frame_a to origin of frame_b, resolved in frame_a";
      protected
          outer Modelica.Mechanics.MultiBody.World world;
        equation
          Connections.potentialRoot(frame_a.R, 100);
          Connections.potentialRoot(frame_b.R, 100);

          assert(cardinality(frame_a) > 0,
            "Connector frame_a of line force object is not connected");
          assert(cardinality(frame_b) > 0,
            "Connector frame_b of line force object is not connected");

          // Determine distance s and n_a
          r_rel_a = Frames.resolve2(frame_a.R, frame_b.r_0 - frame_a.r_0);
          s = noEvent(max(Modelica.Math.Vectors.length(
                                        r_rel_a), s_small));
          e_a = r_rel_a/s;

          /* Determine forces and torques at frame_a and frame_b */
          frame_a.f = -e_a*f;
          frame_b.f = -Frames.resolve2(Frames.relativeRotation(frame_a.R, frame_b.R),
             frame_a.f);

          // Additional equations, if direct connections of line forces
          if Connections.isRoot(frame_a.R) then
            frame_a.R = Frames.nullRotation();
          else
            frame_a.t = zeros(3);
          end if;

          if Connections.isRoot(frame_b.R) then
            frame_b.R = Frames.nullRotation();
          else
            frame_b.t = zeros(3);
          end if;

        end PartialLineForce;

        partial model PartialVisualizer
        "Base model for visualizers (has a frame_a on the left side + outer world + assert to guarantee that the component is connected)"

          Interfaces.Frame_a frame_a
          "Coordinate system in which visualization data is resolved";
      protected
          outer Modelica.Mechanics.MultiBody.World world;
        equation
          assert(cardinality(frame_a) > 0,
            "Connector frame_a of visualizer object is not connected");
        end PartialVisualizer;

        model ZeroPosition
        "Set absolute position vector of frame_resolve to a zero vector and the orientation object to a null rotation"
           extends Modelica.Blocks.Interfaces.BlockIcon;
          Interfaces.Frame_resolve frame_resolve;
        equation
          Connections.root(frame_resolve.R);
          frame_resolve.R = Modelica.Mechanics.MultiBody.Frames.nullRotation();
          frame_resolve.r_0 = zeros(3);
        end ZeroPosition;
      end Interfaces;

      package Joints "Components that constrain the motion between two frames"
        import SI = Modelica.SIunits;
        extends Modelica.Icons.Library;

        model Prismatic
        "Prismatic joint (1 translational degree-of-freedom, 2 potential states, optional axis flange)"

          import SI = Modelica.SIunits;
          extends
          Modelica.Mechanics.MultiBody.Interfaces.PartialElementaryJoint;
          Modelica.Mechanics.Translational.Interfaces.Flange_a axis if useAxisFlange
          "1-dim. translational flange that drives the joint";
          Modelica.Mechanics.Translational.Interfaces.Flange_b support if useAxisFlange
          "1-dim. translational flange of the drive drive support (assumed to be fixed in the world frame, NOT in the joint)";

          parameter Boolean useAxisFlange=false
          "= true, if axis flange is enabled";
          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter Modelica.Mechanics.MultiBody.Types.Axis n={1,0,0}
          "Axis of translation resolved in frame_a (= same as in frame_b)";
          constant SI.Position s_offset=0
          "Relative distance offset (distance between frame_a and frame_b = s_offset + s)";
          parameter Types.Axis boxWidthDirection={0,1,0}
          "Vector in width direction of box, resolved in frame_a";
          parameter SI.Distance boxWidth=world.defaultJointWidth
          "Width of prismatic joint box";
          parameter SI.Distance boxHeight=boxWidth
          "Height of prismatic joint box";
          input Types.Color boxColor=Modelica.Mechanics.MultiBody.Types.Defaults.JointColor
          "Color of prismatic joint box";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";
          parameter StateSelect stateSelect=StateSelect.prefer
          "Priority to use distance s and v=der(s) as states";
          final parameter Real e[3](each final unit="1")=Modelica.Math.Vectors.normalize(
                                                     n)
          "Unit vector in direction of prismatic axis n";

          SI.Position s(start=0, final stateSelect=stateSelect)
          "Relative distance between frame_a and frame_b";

          SI.Velocity v(start=0,final stateSelect=stateSelect)
          "First derivative of s (relative velocity)";
          SI.Acceleration a(start=0)
          "Second derivative of s (relative acceleration)";
          SI.Force f "Actuation force in direction of joint axis";


      protected
          Visualizers.Advanced.Shape box(
            shapeType="box",
            color=boxColor,
            specularCoefficient=specularCoefficient,
            length=if noEvent(abs(s + s_offset) > 1.e-6) then s + s_offset else 1.e-6,
            width=boxWidth,
            height=boxHeight,
            lengthDirection=e,
            widthDirection=boxWidthDirection,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;
          Translational.Components.Fixed fixed;
          Translational.Interfaces.InternalSupport internalAxis(f = f);
          Translational.Sources.ConstantForce constantForce(f_constant=0) if not useAxisFlange;
        equation
          v = der(s);
          a = der(v);

          // relationships between kinematic quantities of frame_a and of frame_b
          frame_b.r_0 = frame_a.r_0 + Frames.resolve1(frame_a.R, e*(s_offset + s));
          frame_b.R = frame_a.R;

          // Force and torque balance
          zeros(3) = frame_a.f + frame_b.f;
          zeros(3) = frame_a.t + frame_b.t + cross(e*(s_offset + s), frame_b.f);

          // d'Alemberts principle
          f = -e*frame_b.f;

          // Connection to internal connectors
          s = internalAxis.s;

          connect(fixed.flange, support);
          connect(internalAxis.flange, axis);
          connect(constantForce.flange, internalAxis.flange);
        end Prismatic;

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
          specularCoefficient = world.defaultSpecularCoefficient "Reflection of ambient light (= 0: light is completely absorbed)";
          parameter StateSelect stateSelect=StateSelect.prefer "Priority to use joint angle phi and w=der(phi) as states";

          SI.Angle phi(start=0, final stateSelect=stateSelect) "Relative rotation angle from frame_a to frame_b";
          SI.AngularVelocity w(start=0, stateSelect=stateSelect) "First derivative of angle phi (relative angular velocity)";
          SI.AngularAcceleration a(start=0) "Second derivative of angle phi (relative angular acceleration)";
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

        model FreeMotion
        "Free motion joint (6 degrees-of-freedom, 12 potential states)"

          import Modelica.Math.*;
          import SI = Modelica.SIunits;

          extends Interfaces.PartialTwoFrames;

          parameter Boolean animation=true
          "= true, if animation shall be enabled (show arrow from frame_a to frame_b)";

          SI.Position r_rel_a[3](start={0,0,0}, each stateSelect=if enforceStates then 
                      StateSelect.always else StateSelect.prefer)
          "Position vector from origin of frame_a to origin of frame_b, resolved in frame_a";
          SI.Velocity v_rel_a[3](start={0,0,0}, each stateSelect=if enforceStates then StateSelect.always else 
                      StateSelect.prefer)
          "= der(r_rel_a), i.e., velocity of origin of frame_b with respect to origin of frame_a, resolved in frame_a";
          SI.Acceleration a_rel_a[3](start={0,0,0}) "= der(v_rel_a)";

          parameter Boolean angles_fixed = false
          "= true, if angles_start are used as initial values, else as guess values";
          parameter SI.Angle angles_start[3]={0,0,0}
          "Initial values of angles to rotate frame_a around 'sequence_start' axes into frame_b";
          parameter Types.RotationSequence sequence_start={1,2,3}
          "Sequence of rotations to rotate frame_a into frame_b at initial time";

          parameter Boolean w_rel_a_fixed = false
          "= true, if w_rel_a_start are used as initial values, else as guess values";
          parameter SI.AngularVelocity w_rel_a_start[3]={0,0,0}
          "Initial values of angular velocity of frame_b with respect to frame_a, resolved in frame_a";

          parameter Boolean z_rel_a_fixed = false
          "= true, if z_rel_a_start are used as initial values, else as guess values";
          parameter SI.AngularAcceleration z_rel_a_start[3]={0,0,0}
          "Initial values of angular acceleration z_rel_a = der(w_rel_a)";

          parameter SI.Length arrowDiameter=world.defaultArrowDiameter
          "Diameter of arrow from frame_a to frame_b";
          input Types.Color arrowColor=Modelica.Mechanics.MultiBody.Types.Defaults.SensorColor
          "Color of arrow";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";
          parameter Boolean enforceStates=true
          " = true, if relative variables between frame_a and frame_b shall be used as states";
          parameter Boolean useQuaternions=true
          " = true, if quaternions shall be used as states otherwise use 3 angles as states";
          parameter Types.RotationSequence sequence_angleStates={1,2,3}
          " Sequence of rotations to rotate frame_a into frame_b around the 3 angles used as states";

          final parameter Frames.Orientation R_rel_start=
              Modelica.Mechanics.MultiBody.Frames.axesRotations(sequence_start, angles_start,zeros(3))
          "Orientation object from frame_a to frame_b at initial time";


      protected
          Visualizers.Advanced.Arrow arrow(
            r_head=r_rel_a,
            diameter=arrowDiameter,
            color=arrowColor,
            specularCoefficient=specularCoefficient,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;

          // Declarations for quaternions (dummies, if quaternions are not used)
          parameter Frames.Quaternions.Orientation Q_start=Frames.to_Q(R_rel_start)
          "Quaternion orientation object from frame_a to frame_b at initial time";
          Frames.Quaternions.Orientation Q(start=Q_start, each stateSelect=if 
                enforceStates then (if useQuaternions then StateSelect.prefer else 
                StateSelect.never) else StateSelect.default)
          "Quaternion orientation object from frame_a to frame_b (dummy value, if quaternions are not used as states)";

          // Declaration for 3 angles
          parameter SI.Angle phi_start[3]=if sequence_start[1] ==
              sequence_angleStates[1] and sequence_start[2] == sequence_angleStates[2]
               and sequence_start[3] == sequence_angleStates[3] then angles_start else 
                    Frames.axesRotationsAngles(R_rel_start,
              sequence_angleStates) "Potential angle states at initial time";
          SI.Angle phi[3](start=phi_start, each stateSelect=if enforceStates then (if 
                useQuaternions then StateSelect.never else StateSelect.always) else 
                StateSelect.prefer)
          "Dummy or 3 angles to rotate frame_a into frame_b";
          SI.AngularVelocity phi_d[3](each stateSelect=if enforceStates then (if 
                useQuaternions then StateSelect.never else StateSelect.always) else 
                StateSelect.prefer) "= der(phi)";
          SI.AngularAcceleration phi_dd[3] "= der(phi_d)";

          // Other declarations
          SI.AngularVelocity w_rel_b[3](start=Frames.resolve2(R_rel_start, w_rel_a_start),
                                        fixed=fill(w_rel_a_fixed,3),
                                        each stateSelect=if enforceStates then 
                                        (if useQuaternions then StateSelect.always else 
                                        StateSelect.avoid) else StateSelect.prefer)
          "Dummy or relative angular velocity of frame_b with respect to frame_a, resolved in frame_b";
          Frames.Orientation R_rel
          "Dummy or relative orientation object to rotate from frame_a to frame_b";
          Frames.Orientation R_rel_inv
          "Dummy or relative orientation object to rotate from frame_b to frame_a";

        initial equation
          if angles_fixed then
            // Initialize positional variables
            if not enforceStates then
              // no states defined
              zeros(3) = Frames.Orientation.equalityConstraint(Frames.absoluteRotation(frame_a.R,R_rel_start),frame_b.R);
            elseif useQuaternions then
              // Quaternions Q are used as states
              zeros(3) = Frames.Quaternions.Orientation.equalityConstraint(Q, Q_start);
            else
              // The 3 angles 'phi' are used as states
              phi = phi_start;
            end if;
          end if;

          if z_rel_a_fixed then
            // Initialize acceleration variables
            der(w_rel_b) = Frames.resolve2(R_rel_start, z_rel_a_start);
          end if;

        equation
          // Kinematic differential equations for translational motion
          der(r_rel_a) = v_rel_a;
          der(v_rel_a) = a_rel_a;

          // Kinematic relationships
          frame_b.r_0 = frame_a.r_0 + Frames.resolve1(frame_a.R, r_rel_a);

          // Cut-forces and cut-torques are zero
          frame_a.f = zeros(3);
          frame_a.t = zeros(3);
          frame_b.f = zeros(3);
          frame_b.t = zeros(3);

          if enforceStates then
            Connections.branch(frame_a.R, frame_b.R);

            if rooted(frame_a.R) then
              R_rel_inv = Frames.nullRotation();
              frame_b.R = Frames.absoluteRotation(frame_a.R, R_rel);
            else
              R_rel_inv = Frames.inverseRotation(R_rel);
              frame_a.R = Frames.absoluteRotation(frame_b.R, R_rel_inv);
            end if;

            // Compute relative orientation object
            if useQuaternions then
              // Use Quaternions as states (with dynamic state selection)
              {0} = Frames.Quaternions.orientationConstraint(Q);
              w_rel_b = Frames.Quaternions.angularVelocity2(Q, der(Q));
              R_rel = Frames.from_Q(Q, w_rel_b);

              // Dummies
              phi = zeros(3);
              phi_d = zeros(3);
              phi_dd = zeros(3);

            else
              // Use angles as states
              phi_d = der(phi);
              phi_dd = der(phi_d);
              R_rel = Frames.axesRotations(sequence_angleStates, phi, phi_d);
              w_rel_b = Frames.angularVelocity2(R_rel);

              // Dummies
              Q = zeros(4);
            end if;

          else
            // Free motion joint does not have states
            if w_rel_a_fixed or z_rel_a_fixed then
              w_rel_b = Frames.angularVelocity2(frame_b.R) - Frames.resolve2(frame_b.
                R, Frames.angularVelocity1(frame_a.R));
            else
              // dummy
              w_rel_b = zeros(3);
            end if;

            // Dummies
            R_rel = Frames.nullRotation();
            R_rel_inv = Frames.nullRotation();
            Q = zeros(4);
            phi = zeros(3);
            phi_d = zeros(3);
            phi_dd = zeros(3);
          end if;
        end FreeMotion;

          model RollingWheel "Joint (no mass, no inertia) that describes an ideal rolling wheel (rolling on the plane z=0)"

            import SI = Modelica.SIunits;
            import Modelica.Mechanics.MultiBody.Frames;

            Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Frame fixed in wheel center point. x-Axis: upwards, y-axis: along wheel axis";

            parameter SI.Radius wheelRadius "Wheel radius";
            parameter StateSelect stateSelect=StateSelect.always "Priority to use generalized coordinates as states";

            SI.Position x(start=0, stateSelect=stateSelect) "x-coordinate of wheel axis";
            SI.Position y(start=0, stateSelect=stateSelect) "y-coordinate of wheel axis";
            SI.Position z;

            SI.Angle angles[3](start={0,0,0}, each stateSelect=stateSelect) "Angles to rotate world-frame in to frame_a around z-, y-, x-axis";
            SI.AngularVelocity der_angles[3](start={0,0,0}, each stateSelect=stateSelect) "Derivative of angles";

             SI.Position r_road_0[3] "Position vector from world frame to contact point on road, resolved in world frame";

            // Contact force
            SI.Force f_wheel_0[3] "Contact force acting on wheel, resolved in world frame";
            SI.Force f_n "Contact force acting on wheel in normal direction";
            SI.Force f_lat "Contact force acting on wheel in lateral direction";
            SI.Force f_long "Contact force acting on wheel in longitudinal direction";
            SI.Position err "|r_road_0 - frame_a.r_0| - wheelRadius (must be zero; used for checking)";
      protected
             Real e_axis_0[3] "Unit vector along wheel axis, resolved in world frame";
             SI.Position delta_0[3](start={0,0,-wheelRadius}) "Distance vector from wheel center to contact point";

             // Coordinate system at contact point
             Real e_n_0[3] "Unit vector in normal direction of road at contact point, resolved in world frame";
             Real e_lat_0[3] "Unit vector in lateral direction of wheel at contact point, resolved in world frame";
             Real e_long_0[3] "Unit vector in longitudinal direction of wheel at contact point, resolved in world frame";

             // Road description
             SI.Position s "Road surface parameter 1";
             SI.Position w "Road surface parameter 2";
             Real e_s_0[3] "Road heading at (s,w), resolved in world frame (unit vector)";

             // Slip velocities
             SI.Velocity v_0[3] "Velocity of wheel center, resolved in world frame";
             SI.AngularVelocity w_0[3] "Angular velocity of wheel, resolved in world frame";

             SI.Velocity vContact_0[3] "Velocity of wheel contact point, resolved in world frame";

             // Utility vectors
             Real aux[3];

          equation
             // frame_a.R is computed from generalized coordinates
             Connections.root(frame_a.R);
             frame_a.r_0 = {x,y,z};
             der_angles  = der(angles);
             frame_a.R = Frames.axesRotations({3,2,1}, angles, der_angles);

             // Road description
             r_road_0 = {s,w,0};
             e_n_0    = {0,0,1};
             e_s_0    = {1,0,0};

             // Coordinate system at contact point (e_long_0, e_lat_0, e_n_0)
             e_axis_0  = Frames.resolve1(frame_a.R, {0,1,0});
             aux       = cross(e_n_0, e_axis_0);
             e_long_0 = aux / Modelica.Math.Vectors.length(aux);
             e_lat_0  = cross(e_long_0, e_n_0);

             // Determine point on road where the wheel is in contact with the road
             delta_0 = r_road_0 - frame_a.r_0;
             0 = delta_0*e_axis_0;
             0 = delta_0*e_long_0;

             // One holonomic positional constraint equation (no penetration in to the ground)
             0 = wheelRadius - delta_0*cross(e_long_0, e_axis_0);

             // only for testing
             err = Modelica.Math.Vectors.length(delta_0) - wheelRadius;

             // Slip velocities
             v_0 = der(frame_a.r_0);
             w_0 = Frames.angularVelocity1(frame_a.R);
             vContact_0 = v_0 + cross(w_0, delta_0);

             // Two non-holonomic constraint equations on velocity level (ideal rolling, no slippage)
             0 = vContact_0*e_long_0;
             0 = vContact_0*e_lat_0;

             // Contact force
             f_wheel_0 = f_n*e_n_0 + f_lat*e_lat_0 + f_long*e_long_0;

             // Force and torque balance at the wheel center
             zeros(3) = frame_a.f + Frames.resolve2(frame_a.R, f_wheel_0);
             zeros(3) = frame_a.t + Frames.resolve2(frame_a.R, cross(delta_0, f_wheel_0));

             // Guard against singularity
             assert(abs(e_n_0*e_axis_0) < 0.99, "Wheel lays nearly on the ground (which is a singularity)");
          end RollingWheel;

          model RollingWheelSet
        "Joint (no mass, no inertia) that describes an ideal rolling wheel set (two ideal rolling wheels connected together by an axis)"
            import SI = Modelica.SIunits;
           Modelica.Mechanics.MultiBody.Interfaces.Frame_a frameMiddle
          "Frame fixed in middle of axis connecting both wheels (y-axis: along wheel axis, z-Axis: upwards)";

            parameter Boolean animation=true
          "= true, if animation of wheel set shall be enabled";

            parameter SI.Radius wheelRadius "Radius of one wheel";
            parameter SI.Distance wheelDistance
          "Distance between the two wheels";

            parameter StateSelect stateSelect = StateSelect.default
          "Priority to use the generalized coordinates as states";

            Modelica.SIunits.Position x(start=0, stateSelect=stateSelect)
          "x coordinate for center between wheels";
            Modelica.SIunits.Position y(start=0, stateSelect=stateSelect)
          "y coordinate for center between wheels";
            Modelica.SIunits.Angle phi(start=0, stateSelect=stateSelect)
          "Orientation angle of wheel axis along z-axis";
            Modelica.SIunits.Angle theta1(start=0, stateSelect=stateSelect)
          "Angle of wheel 1";
            Modelica.SIunits.Angle theta2(start=0, stateSelect=stateSelect)
          "Angle of wheel 2";
            Modelica.SIunits.AngularVelocity der_theta1(start=0, stateSelect=stateSelect)
          "Derivative of theta 1";
            Modelica.SIunits.AngularVelocity der_theta2(start=0, stateSelect=stateSelect)
          "Derivative of theta 2";


            Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame1
          "Frame fixed in center point of left wheel (y-axis: along wheel axis, z-Axis: upwards)";
            Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame2
          "Frame fixed in center point of right wheel (y-axis: along wheel axis, z-Axis: upwards)";
            Modelica.Mechanics.MultiBody.Parts.Fixed fixed(                 r={0,0,
                  wheelRadius}, animation=animation);
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation rod1(                 r={
                  0,wheelDistance/2,0}, animation=animation);
            Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(animation=
                  animation);
            Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic2(
              n={0,1,0}, animation=animation);
            Modelica.Mechanics.MultiBody.Joints.Revolute revolute(animation=animation);
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation rod2(                 r={
                  0,-wheelDistance/2,0}, animation=animation);
            Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(
              n={0,1,0},
              useAxisFlange=true,
              animation=animation);
            Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(
              n={0,1,0},
              useAxisFlange=true,
              animation=animation);

          Modelica.Mechanics.MultiBody.Joints.Internal.RollingConstraintVerticalWheel
          rolling1(                               radius=wheelRadius);

          Modelica.Mechanics.MultiBody.Joints.Internal.RollingConstraintVerticalWheel
          rolling2(                               radius=wheelRadius,
                lateralSlidingConstraint=false);
            Modelica.Mechanics.Rotational.Interfaces.Flange_a axis1
          "1-dim. rotational flange that drives the joint";
            Modelica.Mechanics.Rotational.Interfaces.Flange_a axis2
          "1-dim. rotational flange that drives the joint";
            Modelica.Mechanics.MultiBody.Parts.Mounting1D mounting1D;
            Modelica.Mechanics.Rotational.Interfaces.Flange_b support
          "Support of 1D axes";
          equation
            prismatic1.s  = x;
            prismatic2.s  = y;
            revolute.phi  = phi;
            revolute1.phi = theta1;
            revolute2.phi = theta2;
            der_theta1 = der(theta1);
            der_theta2 = der(theta2);

            connect(revolute.frame_b, frameMiddle);
            connect(rod1.frame_a, frameMiddle);
            connect(rod2.frame_a, frameMiddle);
            connect(rod1.frame_b, revolute1.frame_a);
            connect(revolute1.frame_b, frame1);
            connect(revolute2.frame_a, rod2.frame_b);
            connect(revolute2.frame_b, frame2);
            connect(prismatic1.frame_a, fixed.frame_b);
            connect(prismatic1.frame_b, prismatic2.frame_a);
            connect(prismatic2.frame_b, revolute.frame_a);
            connect(rolling1.frame_a, revolute1.frame_b);
            connect(rolling2.frame_a, revolute2.frame_b);
            connect(revolute1.axis, axis1);
            connect(revolute2.axis, axis2);
            connect(frameMiddle, mounting1D.frame_a);
            connect(mounting1D.flange_b, support);
          end RollingWheelSet;

        package Assemblies "Joint aggregations for analytic loop handling"
          import SI = Modelica.SIunits;
          extends Modelica.Icons.Library;

          model JointUPS
          "Universal - prismatic - spherical joint aggregation (no constraints, no potential states)"

            import SI = Modelica.SIunits;
            import Modelica.Mechanics.MultiBody.Types;
            extends Interfaces.PartialTwoFramesDoubleSize;
            Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_ia
            "Coordinate system at origin of frame_a fixed at prismatic joint";
            Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_ib
            "Coordinate system at origin of frame_b fixed at prismatic joint";
            Modelica.Mechanics.Translational.Interfaces.Flange_a axis
            "1-dim. translational flange that drives the prismatic joint";
            Modelica.Mechanics.Translational.Interfaces.Flange_b bearing
            "1-dim. translational flange of the drive bearing of the prismatic joint";

            parameter Boolean animation=true
            "= true, if animation shall be enabled";
            parameter Boolean showUniversalAxes=true
            " = true, if universal joint shall be visualized with two cylinders, otherwise with a sphere (provided animation=true)";
            parameter Modelica.Mechanics.MultiBody.Types.Axis n1_a={0,0,1}
            "Axis 1 of universal joint resolved in frame_a (axis 2 is orthogonal to axis 1 and to line from universal to spherical joint)";
            parameter SI.Position nAxis_ia[3]={1,0,0}
            "Axis vector along line from origin of frame_a to origin of frame_b, resolved in frame_ia";
            parameter SI.Position s_offset=0
            "Relative distance offset (distance between frame_a and frame_b = s(t) + s_offset)";
            parameter SI.Diameter sphereDiameter=world.defaultJointLength
            "Diameter of spheres representing the spherical joints";
            input Types.Color sphereColor=Modelica.Mechanics.MultiBody.Types.Defaults.JointColor
            "Color of spheres representing the spherical joints";
            parameter SI.Diameter axisDiameter=sphereDiameter/Types.Defaults.
                JointRodDiameterFraction
            "Diameter of cylinder on the connecting line from frame_a to frame_b";
            input Types.Color axisColor=Modelica.Mechanics.MultiBody.Types.Defaults.SensorColor
            "Color of cylinder on the connecting line from frame_a to frame_b";
            input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
            "Reflection of ambient light (= 0: light is completely absorbed)";
            parameter SI.Distance cylinderLength=world.defaultJointLength
            "Length of cylinders representing the two universal joint axes";
            parameter SI.Distance cylinderDiameter=world.defaultJointWidth
            "Diameter of cylinders representing the two universal joint axes";
           input Types.Color cylinderColor=Modelica.Mechanics.MultiBody.Types.Defaults.JointColor
            "Color of cylinders representing the two universal joint axes";

            parameter Boolean checkTotalPower=false
            "= true, if total power flowing into this component shall be determined (must be zero)";
            final parameter Real eAxis_ia[3](each final unit="1")=Modelica.Math.Vectors.normalize(
                                                              nAxis_ia)
            "Unit vector from origin of frame_a to origin of frame_b, resolved in frame_ia";
            final parameter Real e2_ia[3](each final unit="1")=Modelica.Math.Vectors.normalize(
                                                           cross(n1_a, eAxis_ia))
            "Unit vector in direction of second rotation axis of universal joint, resolved in frame_ia";
            final parameter Real e3_ia[3](each final unit="1")=cross(eAxis_ia, e2_ia)
            "Unit vector perpendicular to eAxis_ia and e2_ia, resolved in frame_ia";
            SI.Position s
            "Relative distance between frame_a and frame_b along axis nAxis = s + s_offset";
            SI.Force f "= axis.f (driving force in the axis; = -bearing.f)";
            SI.Length axisLength "Distance between frame_a and frame_b";
            SI.Power totalPower
            "Total power flowing into this element, if checkTotalPower=true (otherwise dummy)";

        protected
            SI.Force f_c_a[3] "frame_ia.f resolved in frame_a";
            SI.Torque t_cd_a[3] "frame_ia.t + frame_ib.t resolved in frame_a";
            SI.Force f_bd_a[3] "frame_b.f + frame_ib.f resolved in frame_a";
            SI.Position rAxis_0[3]
            "Position vector from origin of frame_a to origin of frame_b resolved in world frame";
            SI.Position rAxis_a[3]
            "Position vector from origin of frame_a to origin of frame_b resolved in frame_a";
            Real eAxis_a[3](each final unit="1")
            "Unit vector in direction of rAxis_a, resolved in frame_a";
            Real e2_a[3](each final unit="1")
            "Unit vector in direction of second rotation axis of universal joint, resolved in frame_a";
            Real e3_a[3](each final unit="1")
            "Unit vector perpendicular to eAxis_a and e2_a, resolved in frame_a";
            Real n2_a[3](each final unit="1")
            "Vector in direction of second rotation axis of universal joint, resolved in frame_a";
            Real length2_n2_a(unit="m2") "Square of length of vector n2_a";
            SI.Length length_n2_a "Length of vector n2_a";
            Real der_rAxis_a_L[3](each unit="1/s") "= der(rAxis_a)/axisLength";
            SI.AngularVelocity w_rel_ia1[3];
            Frames.Orientation R_ia1_a;
            Frames.Orientation R_ia2_a;
            Frames.Orientation R_ia_a "Rotation from frame_a to frame_ia";
            // Real T_ia_a[3, 3] "Transformation matrix from frame_a to frame_ia";

            Visualizers.Advanced.Shape axisCylinder(
              shapeType="cylinder",
              color=axisColor,
              specularCoefficient=specularCoefficient,
              length=axisLength,
              width=axisDiameter,
              height=axisDiameter,
              lengthDirection=eAxis_ia,
              widthDirection=e2_ia,
              r=frame_ia.r_0,
              R=frame_ia.R) if world.enableAnimation and animation;
            Visualizers.Advanced.Shape sphericalShape_b(
              shapeType="sphere",
              color=sphereColor,
              specularCoefficient=specularCoefficient,
              length=sphereDiameter,
              width=sphereDiameter,
              height=sphereDiameter,
              lengthDirection={1,0,0},
              widthDirection={0,1,0},
              r_shape={-0.5,0,0}*sphereDiameter,
              r=frame_b.r_0,
              R=frame_b.R) if world.enableAnimation and animation;
            Visualizers.Advanced.Shape sphericalShape_a(
              shapeType="sphere",
              color=sphereColor,
              specularCoefficient=specularCoefficient,
              length=sphereDiameter,
              width=sphereDiameter,
              height=sphereDiameter,
              lengthDirection={1,0,0},
              widthDirection={0,1,0},
              r_shape={-0.5,0,0}*sphereDiameter,
              r=frame_a.r_0,
              R=frame_a.R) if world.enableAnimation and animation;
            Visualizers.Advanced.Shape universalShape1(
              shapeType="cylinder",
              color=cylinderColor,
              specularCoefficient=specularCoefficient,
              length=cylinderLength,
              width=cylinderDiameter,
              height=cylinderDiameter,
              lengthDirection=n1_a,
              widthDirection={0,1,0},
              r_shape=-n1_a*(cylinderLength/2),
              r=frame_a.r_0,
              R=frame_a.R) if world.enableAnimation and animation and showUniversalAxes;
            Visualizers.Advanced.Shape universalShape2(
              shapeType="cylinder",
              color=cylinderColor,
              specularCoefficient=specularCoefficient,
              length=cylinderLength,
              width=cylinderDiameter,
              height=cylinderDiameter,
              lengthDirection=e2_ia,
              widthDirection={0,1,0},
              r_shape=-e2_ia*(cylinderLength/2),
              r=frame_ia.r_0,
              R=frame_ia.R) if world.enableAnimation and animation and showUniversalAxes;
          equation
            Connections.branch(frame_a.R, frame_ia.R);
            Connections.branch(frame_ia.R, frame_ib.R);

            // Translational flanges
            axisLength = s + s_offset;
            bearing.s = 0;
            axis.s = s;
            axis.f = f;

            // Position vector rAxis from frame_a to frame_b
            rAxis_0 = frame_b.r_0 - frame_a.r_0;
            rAxis_a = Frames.resolve2(frame_a.R, rAxis_0);

            /* Determine relative Rotation R_rel_c from frame_a to frame_ia
     and absolute rotation of frame_a.R.
  */
            axisLength = sqrt(rAxis_0*rAxis_0);
            assert(axisLength > 1.0e-15, "
Distance between frame_a and frame_b of a JointUPS joint
became zero. This is not allowed. If this occurs during
initialization, the initial conditions are probably wrong.");

            eAxis_a = rAxis_a/axisLength;
            n2_a = cross(n1_a, eAxis_a);
            length2_n2_a = n2_a*n2_a;
            assert(noEvent(length2_n2_a > 1.e-10), "
A Modelica.Mechanics.MultiBody.Joints.Assemblies.JointUPS joint (consisting of
a universal, prismatic and spherical joint) is in the singular
configuration of the universal joint. This means that axis 1 of
the universal joint defined via parameter \"n1_a\" is parallel to vector
\"eAxis_ia\" that is directed from the origin of frame_a to the
origin of frame_b. You may try to use another \"n1_a\" vector.
");
            length_n2_a = sqrt(length2_n2_a);
            e2_a = n2_a/length_n2_a;
            e3_a = cross(eAxis_a, e2_a);

            /* The statements below are an efficient implementation of the
     original equations:
       T_ia_a = [eAxis_ia, e2_ia, e3_ia]*transpose([eAxis_a, e2_a, e3_a]);
       R_ia_a = Frames.from_T(T_ia_a,
                     Frames.TransformationMatrices.angularVelocity2(T_ia_a, der(T_ia_a)));
   To perform this, the rotation is split into two parts:
     R_ia_a : Rotation object from frame_a to frame_ia
     R_ia1_a: Rotation object from frame_a to frame_ia1
                (frame that is fixed in frame_ia such that x-axis
                is along the rod axis)
                T = transpose([eAxis_a, e2_a, e3_a]; w = w_rel_ia1
     R_ia2_a: Fixed rotation object from frame_ia1 to frame_ia
                T = [eAxis_a, e2_ia, e3_ia]; w = zeros(3)

   The difficult part is to compute w_rel_ia1:
      w_rel_ia1 = [  e3_a*der(e2_a);
                    -e3_a*der(eAxis_a);
                     e2_a*der(eAxis_a)]
   der(eAxis_a) is directly given, since eAxis_a is a function
   of translational quantities only.
      der(eAxis_a) = (der(rAxis_a) - eAxis_a*(eAxis_a*der(rAxis_a)))/axisLength
      der(n2_a)    = cross(n1_a, der(eAxis_a))
      der(e2_a)    = (der(n2_a) - e2_a*(e2_a*der(n2_a)))/length_n2_a
   Inserting these equations in w_rel_ia1 results in:
      e3_a*der(eAxis_a) = e3_a*der(rAxis_a)/axisLength       // e3_a*eAxis_a = 0
      e2_a*der(eAxis_a) = e2_a*der(rAxis_a)/axisLength       // e2_a*eAxis_a = 0
      e3_a*der(e2_a)    = e3_a*der(n2_a)/lenght_n2_a       // e3_a*e2_a = 0
                        = e3_a*cross(n1_a, der(eAxis_a))/length_n2_a
                        = e3_a*cross(n1_a, der(rAxis_a) - eAxis_a*(eAxis_a*der(rAxis_a)))/(length_n2_a*axisLength)
                        = e3_a*cross(n1_a, der(rAxis_a))/(length_n2_a*axisLength)
   Furthermore, we have:
     rAxis_a      = resolve2(frame_a.R, rAxis_0);
     der(rAxis_a) = resolve2(frame_a.R, der(rAxis_0)) - cross(frame_a.R.w, rAxis_a));
*/
            der_rAxis_a_L = (Frames.resolve2(frame_a.R, der(rAxis_0)) - cross(frame_a.
               R.w, rAxis_a))/axisLength;
            w_rel_ia1 = {e3_a*cross(n1_a, der_rAxis_a_L)/length_n2_a,-e3_a*
              der_rAxis_a_L,e2_a*der_rAxis_a_L};
            R_ia1_a = Frames.from_T(transpose([eAxis_a, e2_a, e3_a]), w_rel_ia1);
            R_ia2_a = Frames.from_T([eAxis_ia, e2_ia, e3_ia], zeros(3));
            R_ia_a = Frames.absoluteRotation(R_ia1_a, R_ia2_a);
            /*
  T_ia_a = [eAxis_ia, e2_ia, e3_ia]*transpose([eAxis_a, e2_a, e3_a]);
  R_ia_a = Frames.from_T(T_ia_a, Frames.TransformationMatrices.angularVelocity2
    (T_ia_a, der(T_ia_a)));
*/

            // Compute kinematic quantities of frame_ia and frame_ib
            frame_ia.r_0 = frame_a.r_0;
            frame_ib.r_0 = frame_b.r_0;
            frame_ia.R = Frames.absoluteRotation(frame_a.R, R_ia_a);
            frame_ib.R = frame_ia.R;

            /* In the following formulas f_a, f_b, f_ia, f_ib, t_a, t_b, t_ia, t_ib are
     the forces and torques at frame_a, frame_b, frame_ia, frame_ib respectively,
     resolved in frame_a. eAxis, e2, e3 are the unit vectors resolved in frame_a.
     Torque balance at the rod around the origin of frame_a:
       0 = t_a + t_ia + t_ib + cross(rAxis, (f_b+f_ib))
     with
         rAxis = axisLength*eAxis
         f_bd  = f_b + f_ib
         f_bd  = f*eAxis + f_bd[2]*e2 + f_bd[3]*e3
     follows:
         0 = t_a + t_ia + axisLength*(f_bd[2]*e_z - f_bd[3]*e_y)
     The projection of t_a with respect to universal joint axes vanishes:
       e1*t_a = 0
       e2*t_a = 0
     Therefore:
        0 = e1*(t_ia + t_ib) + axisLength*f_bd[2]*(e1*e3)
        0 = e2*(t_ia + t_ib) - axisLength*f_bd[3]
     or
        f_bd = f*eAxis - e2*(e1*(t_ia+t_ib))/(axisLength*(e1*e3)) +
                e3*(e2*(t_ia+t_ib))/axisLength
     Force balance:
        0 = f_a + f_bd + f_ia
  */
            f_c_a = Frames.resolve1(R_ia_a, frame_ia.f);
            t_cd_a = Frames.resolve1(R_ia_a, frame_ia.t + frame_ib.t);
            f_bd_a = -eAxis_a*f - e2_a*((n1_a*t_cd_a)/(axisLength*(n1_a*e3_a))) +
              e3_a*((e2_a*t_cd_a)/axisLength);
            zeros(3) = frame_b.f + Frames.resolveRelative(frame_ib.f, frame_ib.R,
              frame_b.R) - Frames.resolveRelative(f_bd_a, frame_a.R, frame_b.R);
            zeros(3) = frame_b.t;
            zeros(3) = frame_a.f + f_c_a + f_bd_a;
            zeros(3) = frame_a.t + t_cd_a + cross(rAxis_a, f_bd_a);

            // Measure power for test purposes
            if checkTotalPower then
              totalPower = frame_a.f*Frames.resolve2(frame_a.R, der(frame_a.r_0)) +
                frame_b.f*Frames.resolve2(frame_b.R, der(frame_b.r_0)) + frame_ia.f*
                Frames.resolve2(frame_ia.R, der(frame_ia.r_0)) + frame_ib.f*
                Frames.resolve2(frame_ib.R, der(frame_ib.r_0)) + frame_a.t*
                Frames.angularVelocity2(frame_a.R) + frame_b.t*
                Frames.angularVelocity2(frame_b.R) + frame_ia.t*
                Frames.angularVelocity2(frame_ia.R) + frame_ib.t*
                Frames.angularVelocity2(frame_ib.R) + axis.f*der(axis.s) + bearing.f*
                der(bearing.s);
            else
              totalPower = 0;
            end if;
          end JointUPS;
        end Assemblies;

        package Internal
        "Components used for analytic solution of kinematic loops (use only if you know what you are doing)"
          extends Modelica.Icons.Library;

           model RollingConstraintVerticalWheel
          "Rolling constraint for wheel that is always perpendicular to x-y plane"
              import SI = Modelica.SIunits;
              import Modelica.Mechanics.MultiBody.Frames;

              Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
            "Frame fixed in wheel center point. x-Axis: upwards, y-axis: along wheel axis";

              parameter SI.Radius radius "Wheel radius";

              parameter Boolean lateralSlidingConstraint = true
            "= true, if lateral sliding constraint taken into account, = false if lateral force = 0 (needed to avoid overconstraining if two ideal rolling wheels are connect on one axis)";

              // Contact force
              SI.Force f_wheel_0[3]
            "Contact force acting on wheel, resolved in world frame";
              SI.Force f_lat
            "Contact force acting on wheel in lateral direction";
              SI.Force f_long
            "Contact force acting on wheel in longitudinal direction";
        protected
               Real e_axis_0[3]
            "Unit vector along wheel axis, resolved in world frame";
               SI.Position rContact_0[3]
            "Distance vector from wheel center to contact point, resolved in world frame";

               // Coordinate system at contact point
               Real e_n_0[3]
            "Unit vector in normal direction of road at contact point, resolved in world frame";
               Real e_lat_0[3]
            "Unit vector in lateral direction of wheel at contact point, resolved in world frame";
               Real e_long_0[3]
            "Unit vector in longitudinal direction of wheel at contact point, resolved in world frame";

               // Slip velocities
               SI.Velocity v_0[3]
            "Velocity of wheel center, resolved in world frame";
               SI.AngularVelocity w_0[3]
            "Angular velocity of wheel, resolved in world frame";

               SI.Velocity vContact_0[3]
            "Velocity of wheel contact point, resolved in world frame";

               // Utility vectors
               Real aux[3];

           equation
               // Coordinate system at contact point (e_long_0, e_lat_0, e_n_0)
               e_n_0    = {0,0,1};
               e_axis_0 = Frames.resolve1(frame_a.R, {0,1,0});
               aux      = cross(e_n_0, e_axis_0);
               e_long_0 = aux / Modelica.Math.Vectors.length(aux);
               e_lat_0  = cross(e_long_0, e_n_0);

               // Slip velocities
               rContact_0 = {0,0,-radius};
               v_0 = der(frame_a.r_0);
               w_0 = Frames.angularVelocity1(frame_a.R);
               vContact_0 = v_0 + cross(w_0, rContact_0);

               // Two non-holonomic constraint equations on velocity level (ideal rolling, no slippage)
               0 = vContact_0*e_long_0;
               if lateralSlidingConstraint then
                  0 = vContact_0*e_lat_0;
                  f_wheel_0 = f_lat*e_lat_0 + f_long*e_long_0;
               else
                  0 = f_lat;
                  f_wheel_0 = f_long*e_long_0;
               end if;

               // Force and torque balance at the wheel center
               zeros(3) = frame_a.f + Frames.resolve2(frame_a.R, f_wheel_0);
               zeros(3) = frame_a.t + Frames.resolve2(frame_a.R, cross(rContact_0, f_wheel_0));
           end RollingConstraintVerticalWheel;
        end Internal;
      end Joints;

      package Parts
      "Rigid components such as bodies with mass and inertia and massless rods"
        import SI = Modelica.SIunits;
        extends Modelica.Icons.Library;

        model Fixed "Frame fixed in the world frame at a given position"
          import SI = Modelica.SIunits;
          import Modelica.Mechanics.MultiBody.Types;

          Interfaces.Frame_b frame_b
          "Coordinate system fixed in the world frame";

          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter SI.Position r[3]={0,0,0}
          "Position vector from world frame to frame_b, resolved in world frame";
          parameter Types.ShapeType shapeType="cylinder" " Type of shape";
          parameter SI.Position r_shape[3]={0,0,0}
          " Vector from world frame to shape origin, resolved in world frame";
          parameter SI.Position lengthDirection[3]=r - r_shape
          " Vector in length direction of shape, resolved in world frame";
          parameter SI.Position widthDirection[3]={0,1,0}
          " Vector in width direction of shape, resolved in world frame";
          parameter SI.Length length=Modelica.Math.Vectors.length(
                                                   r - r_shape)
          " Length of shape";
          parameter SI.Distance width=length/world.defaultWidthFraction
          " Width of shape";
          parameter SI.Distance height=width " Height of shape";
          parameter Types.ShapeExtra extra=0.0
          " Additional parameter for cone, pipe etc. (see docu of Visualizers.Advanced.Shape)";
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
            length=length,
            width=width,
            height=height,
            lengthDirection=lengthDirection,
            widthDirection=widthDirection,
            extra=extra,
            r_shape=r_shape,
            r=zeros(3),
            R=Frames.nullRotation()) if world.enableAnimation and animation;
        equation
          Connections.root(frame_b.R);
          frame_b.r_0 = r;
          frame_b.R = Frames.nullRotation();
        end Fixed;

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

        model FixedRotation
        "Fixed translation followed by a fixed rotation of frame_b with respect to frame_a"

          import Modelica.Mechanics.MultiBody.Frames;
          import Modelica.Mechanics.MultiBody.Types;
          import SI = Modelica.SIunits;
          import Cv = Modelica.SIunits.Conversions;
          Interfaces.Frame_a frame_a
          "Coordinate system fixed to the component with one cut-force and cut-torque";
          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the component with one cut-force and cut-torque";

          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter SI.Position r[3]={0,0,0}
          "Vector from frame_a to frame_b resolved in frame_a";
          parameter Modelica.Mechanics.MultiBody.Types.RotationTypes
          rotationType=
                    Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis
          "Type of rotation description";
          parameter Types.Axis n={1,0,0}
          " Axis of rotation in frame_a (= same as in frame_b)";
          parameter Cv.NonSIunits.Angle_deg angle=0
          " Angle to rotate frame_a around axis n into frame_b";

          parameter Types.Axis n_x={1,0,0}
          " Vector along x-axis of frame_b resolved in frame_a";
          parameter Types.Axis n_y={0,1,0}
          " Vector along y-axis of frame_b resolved in frame_a";

          parameter Types.RotationSequence sequence(
            min={1,1,1},
            max={3,3,3}) = {1,2,3} " Sequence of rotations";
          parameter Cv.NonSIunits.Angle_deg angles[3]={0,0,0}
          " Rotation angles around the axes defined in 'sequence'";
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
        /*
  parameter Boolean checkTotalPower=false
    "= true, if total power flowing into this component shall be determined (must be zero)"
    annotation (Dialog(tab="Advanced"));
*/

          input Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.RodColor
          " Color of shape";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";
          final parameter Frames.Orientation R_rel=if rotationType == 1 then 
              Frames.planarRotation(Modelica.Math.Vectors.normalize(
                                                     n), Cv.from_deg(angle), 0) else 
              if rotationType == 2 then Frames.from_nxy(n_x, n_y) else 
              Frames.axesRotations(sequence, Cv.from_deg(angles), zeros(3))
          "Fixed rotation object from frame_a to frame_b";
        /*
  SI.Power totalPower
    "Total power flowing into this element, if checkTotalPower=true (otherwise dummy)";
*/
      protected
          outer Modelica.Mechanics.MultiBody.World world;

          /*
  parameter Frames.Orientation R_rel_inv=
      Frames.inverseRotation(R_rel)
*/
          parameter Frames.Orientation R_rel_inv=Frames.from_T(transpose(R_rel.T),
              zeros(3)) "Inverse of R_rel (rotate from frame_b to frame_a)";
          Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape shape(
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
            "Neither connector frame_a nor frame_b of FixedRotation object is connected");

          /* Relationships between quantities of frame_a and frame_b */
          frame_b.r_0 = frame_a.r_0 + Frames.resolve1(frame_a.R, r);
          if rooted(frame_a.R) then
            frame_b.R = Frames.absoluteRotation(frame_a.R, R_rel);
            zeros(3) = frame_a.f + Frames.resolve1(R_rel, frame_b.f);
            zeros(3) = frame_a.t + Frames.resolve1(R_rel, frame_b.t) - cross(r, frame_a.f);
          else
            frame_a.R = Frames.absoluteRotation(frame_b.R, R_rel_inv);
            zeros(3) = frame_b.f + Frames.resolve1(R_rel_inv, frame_a.f);
            zeros(3) = frame_b.t + Frames.resolve1(R_rel_inv, frame_a.t) + cross(Frames.resolve1(R_rel_inv,r), frame_b.f);
          end if;

        /*
  if checkTotalPower then
    totalPower = frame_a.f*Frames.resolve2(frame_a.R, der(frame_a.r_0)) +
                 frame_b.f*Frames.resolve2(frame_b.R, der(frame_b.r_0)) +
                 frame_a.t*Frames.angularVelocity2(frame_a.R) +
                 frame_b.t*Frames.angularVelocity2(frame_b.R);
  else
    totalPower = 0;
  end if;
*/
        end FixedRotation;

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

          SI.Position r_0[3](start={0,0,0}, each stateSelect=if enforceStates then 
                      StateSelect.always else StateSelect.avoid)
          "Position vector from origin of world frame to origin of frame_a";
          SI.Velocity v_0[3](start={0,0,0}, each stateSelect=if enforceStates then StateSelect.always else 
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

          parameter Boolean w_0_fixed = false "= true, if w_0_start are used as initial values, else as guess values";
          parameter SI.AngularVelocity w_0_start[3]={0,0,0} "Initial or guess values of angular velocity of frame_a resolved in world frame";

          parameter Boolean z_0_fixed = false "= true, if z_0_start are used as initial values, else as guess values";
          parameter SI.AngularAcceleration z_0_start[3]={0,0,0} "Initial values of angular acceleration z_0 = der(w_0)";

          parameter SI.Diameter sphereDiameter=world.defaultBodyDiameter "Diameter of sphere";
          input Types.Color sphereColor=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor "Color of sphere";
          parameter SI.Diameter cylinderDiameter=sphereDiameter/Types.Defaults.BodyCylinderDiameterFraction "Diameter of cylinder";
          input Types.Color cylinderColor=sphereColor "Color of cylinder";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient "Reflection of ambient light (= 0: light is completely absorbed)";
          parameter Boolean enforceStates=false " = true, if absolute variables of body object shall be used as states (StateSelect.always)";
          parameter Boolean useQuaternions=true " = true, if quaternions shall be used as potential states otherwise use 3 angles as potential states";
          parameter Types.RotationSequence sequence_angleStates={1,2,3} " Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states";

          final parameter SI.Inertia I[3, 3]=[I_11, I_21, I_31; I_21, I_22, I_32;
              I_31, I_32, I_33] "inertia tensor";
          final parameter Frames.Orientation R_start=Modelica.Mechanics.MultiBody.Frames.axesRotations(
              sequence_start, angles_start, zeros(3))
          "Orientation object from world frame to frame_a at initial time";
          final parameter SI.AngularAcceleration z_a_start[3]=Frames.resolve2(R_start, z_0_start)
          "Initial values of angular acceleration z_a = der(w_a), i.e., time derivative of angular velocity resolved in frame_a";

          SI.AngularVelocity w_a[3](start=Frames.resolve2(R_start, w_0_start),
                                    fixed=fill(w_0_fixed,3),
                                    each stateSelect=if enforceStates then (if useQuaternions then 
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
          Frames.Quaternions.Orientation Q(start=Q_start, each stateSelect=if 
                enforceStates then (if useQuaternions then StateSelect.prefer else 
                StateSelect.never) else StateSelect.avoid)
          "Quaternion orientation object from world frame to frame_a (dummy value, if quaternions are not used as states)";

          // Declaration for 3 angles
          parameter SI.Angle phi_start[3]=if sequence_start[1] ==
              sequence_angleStates[1] and sequence_start[2] == sequence_angleStates[2]
               and sequence_start[3] == sequence_angleStates[3] then angles_start else 
               Frames.axesRotationsAngles(R_start, sequence_angleStates)
          "Potential angle states at initial time";
          SI.Angle phi[3](start=phi_start, each stateSelect=if enforceStates then (if 
                useQuaternions then StateSelect.never else StateSelect.always) else 
                StateSelect.avoid)
          "Dummy or 3 angles to rotate world frame into frame_a of body";
          SI.AngularVelocity phi_d[3](each stateSelect=if enforceStates then (if 
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

          SI.Position r_0[3](start={0,0,0}, each stateSelect=if enforceStates then 
                      StateSelect.always else StateSelect.avoid)
          "Position vector from origin of world frame to origin of frame_a";
          SI.Velocity v_0[3](start={0,0,0}, each stateSelect=if enforceStates then StateSelect.always else 
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

        model BodyBox
        "Rigid body with box shape. Mass and animation properties are computed from box data and density (12 potential states)"

          import SI = Modelica.SIunits;
          import Modelica.Mechanics.MultiBody.Types;

          Interfaces.Frame_a frame_a
          "Coordinate system fixed to the component with one cut-force and cut-torque";
          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the component with one cut-force and cut-torque";
          parameter Boolean animation=true
          "= true, if animation shall be enabled (show box between frame_a and frame_b)";
          parameter SI.Position r[3](start={0.1,0,0})
          "Vector from frame_a to frame_b resolved in frame_a";
          parameter SI.Position r_shape[3]={0,0,0}
          "Vector from frame_a to box origin, resolved in frame_a";
          parameter Modelica.Mechanics.MultiBody.Types.Axis lengthDirection=r - r_shape
          "Vector in length direction of box, resolved in frame_a";
          parameter Modelica.Mechanics.MultiBody.Types.Axis widthDirection={0,1,0}
          "Vector in width direction of box, resolved in frame_a";
          parameter SI.Length length=Modelica.Math.Vectors.length(
                                                   r - r_shape) "Length of box";
          parameter SI.Distance width=length/world.defaultWidthFraction
          "Width of box";
          parameter SI.Distance height=width "Height of box";
          parameter SI.Distance innerWidth=0
          "Width of inner box surface (0 <= innerWidth <= width)";
          parameter SI.Distance innerHeight=innerWidth
          "Height of inner box surface (0 <= innerHeight <= height)";
          parameter SI.Density density = 7700
          "Density of cylinder (e.g., steel: 7700 .. 7900, wood : 400 .. 800)";
          input Modelica.Mechanics.MultiBody.Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor
          "Color of box";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";

          SI.Position r_0[3](start={0,0,0}, each stateSelect=if enforceStates then 
                      StateSelect.always else StateSelect.avoid)
          "Position vector from origin of world frame to origin of frame_a";
          SI.Velocity v_0[3](start={0,0,0}, each stateSelect=if enforceStates then StateSelect.always else 
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

          parameter Boolean enforceStates=false
          " = true, if absolute variables of body object shall be used as states (StateSelect.always)";
          parameter Boolean useQuaternions=true
          " = true, if quaternions shall be used as potential states otherwise use 3 angles as potential states";
          parameter Types.RotationSequence sequence_angleStates={1,2,3}
          " Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states";

          final parameter SI.Mass mo(min=0)=density*length*width*height
          "Mass of box without hole";
          final parameter SI.Mass mi(min=0)=density*length*innerWidth*innerHeight
          "Mass of hole of box";
          final parameter SI.Mass m(min=0)=mo - mi "Mass of box";
          final parameter Frames.Orientation R=Frames.from_nxy(r, widthDirection)
          "Orientation object from frame_a to coordinates system spanned by r and widthDirection";
          final parameter SI.Position r_CM[3]=Modelica.Math.Vectors.normalize(
                                                               r)*length/2
          "Position vector from origin of frame_a to center of mass, resolved in frame_a";
          final parameter SI.Inertia I[3, 3]=Frames.resolveDyade1(R, diagonal({mo*(
              width*width + height*height) - mi*(innerWidth*innerWidth + innerHeight*
              innerHeight),mo*(length*length + height*height) - mi*(length*length +
              innerHeight*innerHeight),mo*(length*length + width*width) - mi*(length*
              length + innerWidth*innerWidth)}/12))
          "Inertia tensor of body box with respect to center of mass, parallel to frame_a";
          Body body(
            animation=false,
            r_CM=r_CM,
            m=m,
            I_11=I[1, 1],
            I_22=I[2, 2],
            I_33=I[3, 3],
            I_21=I[2, 1],
            I_31=I[3, 1],
            I_32=I[3, 2],
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
          FixedTranslation frameTranslation(
            r=r,
            animation=animation,
            shapeType="box",
            r_shape=r_shape,
            lengthDirection=lengthDirection,
            widthDirection=widthDirection,
            length=length,
            width=width,
            height=height,
            color=color,
           specularCoefficient=specularCoefficient);

      protected
          outer Modelica.Mechanics.MultiBody.World world;
        equation
          r_0 = frame_a.r_0;
          v_0 = der(r_0);
          a_0 = der(v_0);

          assert(innerWidth <= width,
            "parameter innerWidth is greater as parameter width");
          assert(innerHeight <= height,
            "parameter innerHeight is greater as paraemter height");
          connect(frameTranslation.frame_a, frame_a);
          connect(frameTranslation.frame_b, frame_b);
          connect(frame_a, body.frame_a);
        end BodyBox;

        model BodyCylinder
        "Rigid body with cylinder shape. Mass and animation properties are computed from cylinder data and density (12 potential states)"

          import SI = Modelica.SIunits;
          import NonSI = Modelica.SIunits.Conversions.NonSIunits;
          import Modelica.Mechanics.MultiBody.Types;
          Interfaces.Frame_a frame_a
          "Coordinate system fixed to the component with one cut-force and cut-torque";
          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the component with one cut-force and cut-torque";
          parameter Boolean animation=true
          "= true, if animation shall be enabled (show cylinder between frame_a and frame_b)";
          parameter SI.Position r[3](start={0.1,0,0})
          "Vector from frame_a to frame_b, resolved in frame_a";
          parameter SI.Position r_shape[3]={0,0,0}
          "Vector from frame_a to cylinder origin, resolved in frame_a";
          parameter Modelica.Mechanics.MultiBody.Types.Axis lengthDirection=r - r_shape
          "Vector in length direction of cylinder, resolved in frame_a";
          parameter SI.Length length=Modelica.Math.Vectors.length(
                                                   r - r_shape)
          "Length of cylinder";
          parameter SI.Distance diameter=length/world.defaultWidthFraction
          "Diameter of cylinder";
          parameter SI.Distance innerDiameter=0
          "Inner diameter of cylinder (0 <= innerDiameter <= Diameter)";
          parameter SI.Density density = 7700
          "Density of cylinder (e.g., steel: 7700 .. 7900, wood : 400 .. 800)";
          input Modelica.Mechanics.MultiBody.Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor
          "Color of cylinder";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";

          SI.Position r_0[3](start={0,0,0}, each stateSelect=if enforceStates then 
                      StateSelect.always else StateSelect.avoid)
          "Position vector from origin of world frame to origin of frame_a";
          SI.Velocity v_0[3](start={0,0,0}, each stateSelect=if enforceStates then StateSelect.always else 
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

          parameter Boolean enforceStates=false
          " = true, if absolute variables of body object shall be used as states (StateSelect.always)";
          parameter Boolean useQuaternions=true
          " = true, if quaternions shall be used as potential states otherwise use 3 angles as potential states";
          parameter Types.RotationSequence sequence_angleStates={1,2,3}
          " Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states";

          constant Real pi=Modelica.Constants.pi;
          final parameter SI.Distance radius=diameter/2 "Radius of cylinder";
          final parameter SI.Distance innerRadius=innerDiameter/2
          "Inner-Radius of cylinder";
          final parameter SI.Mass mo(min=0)=density*pi*length*radius*radius
          "Mass of cylinder without hole";
          final parameter SI.Mass mi(min=0)=density*pi*length*innerRadius*innerRadius
          "Mass of hole of cylinder";
          final parameter SI.Inertia I22=(mo*(length*length + 3*radius*radius) - mi*(
              length*length + 3*innerRadius*innerRadius))/12
          "Inertia with respect to axis through center of mass, perpendicular to cylinder axis";
          final parameter SI.Mass m(min=0)=mo - mi "Mass of cylinder";
          final parameter Frames.Orientation R=Frames.from_nxy(r, {0,1,0})
          "Orientation object from frame_a to frame spanned by cylinder axis and axis perpendicular to cylinder axis";
          final parameter SI.Position r_CM[3]=Modelica.Math.Vectors.normalize(
                                                               r)*length/2
          "Position vector from frame_a to center of mass, resolved in frame_a";
          final parameter SI.Inertia I[3, 3]=Frames.resolveDyade1(R, diagonal({(mo*
              radius*radius - mi*innerRadius*innerRadius)/2,I22,I22}))
          "Inertia tensor of cylinder with respect to center of mass, resolved in frame parallel to frame_a";

          Body body(
            r_CM=r_CM,
            m=m,
            I_11=I[1, 1],
            I_22=I[2, 2],
            I_33=I[3, 3],
            I_21=I[2, 1],
            I_31=I[3, 1],
            I_32=I[3, 2],
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
          FixedTranslation frameTranslation(
            r=r,
            animation=animation,
            shapeType="pipecylinder",
            r_shape=r_shape,
            lengthDirection=lengthDirection,
            length=length,
            width=diameter,
            height=diameter,
            extra=innerDiameter/diameter,
            color=color,
            specularCoefficient=specularCoefficient,
            widthDirection={0,1,0});

      protected
          outer Modelica.Mechanics.MultiBody.World world;
        equation
          r_0 = frame_a.r_0;
          v_0 = der(r_0);
          a_0 = der(v_0);

          assert(innerDiameter < diameter,
            "parameter innerDiameter is greater as parameter diameter.");
          connect(frameTranslation.frame_a, frame_a);
          connect(frameTranslation.frame_b, frame_b);
          connect(frame_a, body.frame_a);
        end BodyCylinder;

        model PointMass
        "Rigid body where body rotation and inertia tensor is neglected (6 potential states)"

          import SI = Modelica.SIunits;
          import Modelica.Mechanics.MultiBody.Types;
          Interfaces.Frame_a frame_a
          "Coordinate system fixed at center of mass point";
          parameter Boolean animation=true
          "= true, if animation shall be enabled (show sphere)";
          parameter SI.Mass m(min=0) "Mass of mass point";
          input SI.Diameter sphereDiameter=world.defaultBodyDiameter
          "Diameter of sphere";
          input Types.Color sphereColor=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor
          "Color of sphere";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";
          parameter StateSelect stateSelect=StateSelect.avoid
          "Priority to use frame_a.r_0, v_0 (= der(frame_a.r_0)) as states";

          SI.Position r_0[3](start={0,0,0}, each stateSelect=stateSelect)
          "Position vector from origin of world frame to origin of frame_a, resolved in world frame";
          SI.Velocity v_0[3](start={0,0,0}, each stateSelect=stateSelect)
          "Absolute velocity of frame_a, resolved in world frame (= der(r_0))";
          SI.Acceleration a_0[3](start={0,0,0})
          "Absolute acceleration of frame_a resolved in world frame (= der(v_0))";

      protected
          outer Modelica.Mechanics.MultiBody.World world;

          // Declarations for animation
          Visualizers.Advanced.Shape sphere(
            shapeType="sphere",
            color=sphereColor,
            specularCoefficient=specularCoefficient,
            length=sphereDiameter,
            width=sphereDiameter,
            height=sphereDiameter,
            lengthDirection={1,0,0},
            widthDirection={0,1,0},
            r_shape= - {1,0,0}*sphereDiameter/2,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;
        equation
          // If any possible, do not use the connector as root
          Connections.potentialRoot(frame_a.R, 10000);

          if Connections.isRoot(frame_a.R) then
             assert(cardinality(frame_a)==0, "
A Modelica.Mechanics.MultiBody.Parts.PointMass model is connected in
a way, so that no equations are present to compute frame_a.R
(the orientation object in the connector). Setting frame_a.R to
an arbitrary value in the PointMass model, might lead to a wrong
overall model, depending on how the PointMass model is used.
   You can avoid this message, by providing equations that
compute the orientation object, e.g., by using the
Modelica.Mechanics.MultiBody.Joints.FreeMotion joint.
   If a PointMass model is not connected at all, the
orientation object is set to a unit rotation. But this is
the only case where this is done.
");
             frame_a.R = Frames.nullRotation();
          else
             frame_a.t = zeros(3);
          end if;

          // Newton equation: f = m*(a-g)
          r_0 = frame_a.r_0;
          v_0 = der(r_0);
          a_0 = der(v_0);
          frame_a.f = m*Frames.resolve2(frame_a.R, a_0 - world.gravityAcceleration(r_0));
        end PointMass;

        model Mounting1D
        "Propagate 1-dim. support torque to 3-dim. system (provided world.driveTrainMechanics3D=true)"
          parameter Modelica.SIunits.Angle phi0=0
          "Fixed offset angle of housing";
          parameter Modelica.Mechanics.MultiBody.Types.Axis n={1,0,0}
          "Axis of rotation = axis of support torque (resolved in frame_a)";

          Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b
          "(right) flange fixed in housing";
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a if world.driveTrainMechanics3D
          "Frame in which housing is fixed (connector is removed, if world.driveTrainMechanics3D=false)";
      protected
          outer Modelica.Mechanics.MultiBody.World world;

          encapsulated model Housing
            import Modelica;
            input Modelica.SIunits.Torque t[3];
            Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a;
          equation
            frame_a.f=zeros(3);
            frame_a.t=t;
          end Housing;
          Housing housing(t=-n*flange_b.tau) if world.driveTrainMechanics3D;
        equation
          flange_b.phi = phi0;
          connect(housing.frame_a, frame_a);
        end Mounting1D;

          model RollingWheel "Ideal rolling wheel on flat surface z=0 (5 positional, 3 velocity degrees of freedom)"
            import SI = Modelica.SIunits;
            parameter Boolean animation=true "= true, if animation of wheel shall be enabled";
            parameter SI.Radius wheelRadius "Radius of wheel";
            parameter SI.Mass wheelMass "Mass of wheel";
            parameter SI.Inertia wheel_I_axis "Inertia along the wheel axis";
            parameter SI.Inertia wheel_I_long "Inertia perpendicular to the wheel axis";
            parameter StateSelect stateSelect=StateSelect.always "Priority to use generalized coordinates as states";
            SI.Position x(start=0, fixed = true, stateSelect=stateSelect) "x-coordinate of wheel axis";
            SI.Position y(start=0, fixed = true, stateSelect=stateSelect) "y-coordinate of wheel axis";
            SI.Angle angles[3](start={0,0,0}, each fixed = true, each stateSelect=stateSelect) "Angles to rotate world-frame in to frame_a around z-, y-, x-axis";
            SI.AngularVelocity der_angles[3](start={0,0,0}, each fixed = true, each stateSelect=stateSelect) "Derivative of angles";

            parameter SI.Distance width = 0.035 "Width of wheel";
            parameter Real hollowFraction = 0.8 "1.0: Completely hollow, 0.0: rigid cylinder";
            parameter Modelica.Mechanics.MultiBody.Types.Color wheelColor={30,30,30} "Color of wheel";

            Modelica.Mechanics.MultiBody.Parts.Body body(
              final r_CM={0,0,0},
              final m=wheelMass,
              final I_11=wheel_I_long,
              final I_22=wheel_I_axis,
              final I_33=wheel_I_long,
              final I_21=0,
              final I_31=0,
              final I_32=0,
              animation=false);

            Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
          "Frame fixed in wheel center point. y-axis: along wheel axis, z-Axis: upwards, ";
            Modelica.Mechanics.MultiBody.Joints.RollingWheel rollingWheel(wheelRadius=wheelRadius,
                stateSelect=StateSelect.avoid);
            Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape(
              final animation=animation,
              final r_shape={0,-width,0},
              final lengthDirection={0,1,0},
              final widthDirection={1,0,0},
              final length=2*width,
              final width=2*wheelRadius,
              final height=2*wheelRadius,
              final color=wheelColor,
              final extra=hollowFraction,
              final shapeType="pipe") if 
                            animation;

          equation
            rollingWheel.x = x;
            rollingWheel.y = y;
            rollingWheel.angles = angles;
            rollingWheel.der_angles = der_angles;

            connect(body.frame_a, frame_a);
            connect(rollingWheel.frame_a, frame_a);
            connect(fixedShape.frame_a, frame_a);
          end RollingWheel;

          model RollingWheelSet
        "Ideal rolling wheel set consisting of two ideal rolling wheels connected together by an axis"
            import SI = Modelica.SIunits;
           Modelica.Mechanics.MultiBody.Interfaces.Frame_a frameMiddle
          "Frame fixed in middle of axis connecting both wheels (y-axis: along wheel axis, z-Axis: upwards)";

            parameter Boolean animation=true
          "= true, if animation of wheel set shall be enabled";

            parameter SI.Radius wheelRadius "Radius of one wheel";
            parameter SI.Mass wheelMass "Mass of one wheel";
            parameter SI.Inertia wheel_I_axis "Inertia along one wheel axis";
            parameter SI.Inertia wheel_I_long
          "Inertia perpendicular to one wheel axis";
            parameter SI.Distance wheelDistance
          "Distance between the two wheels";
             parameter StateSelect stateSelect = StateSelect.always
          "Priority to use the generalized coordinates as states";

            Modelica.SIunits.Position x(start=0, fixed=true, stateSelect=stateSelect)
          "x coordinate of center between wheels";
            Modelica.SIunits.Position y(start=0, fixed=true, stateSelect=stateSelect)
          "y coordinate of center between wheels";
            Modelica.SIunits.Angle phi(start=0, fixed=true, stateSelect=stateSelect)
          "Orientation angle of wheel axis along z-axis";
            Modelica.SIunits.Angle theta1(start=0, fixed=true, stateSelect=stateSelect)
          "Angle of wheel 1";
            Modelica.SIunits.Angle theta2(start=0, fixed=true, stateSelect=stateSelect)
          "Angle of wheel 2";
            Modelica.SIunits.AngularVelocity der_theta1(start=0, fixed=true, stateSelect=stateSelect)
          "Derivative of theta 1";
            Modelica.SIunits.AngularVelocity der_theta2(start=0, fixed=true, stateSelect=stateSelect)
          "Derivative of theta 2";

            parameter SI.Distance wheelWidth = 0.01 "Width of one wheel";
            parameter Real hollowFraction = 0.8
          "1.0: Completely hollow, 0.0: rigid cylinder";
            parameter Modelica.Mechanics.MultiBody.Types.Color wheelColor={30,30,30}
          "Color of wheels";


            Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame1
          "Frame fixed in center point of left wheel (y-axis: along wheel axis, z-Axis: upwards)";
            Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame2
          "Frame fixed in center point of right wheel (y-axis: along wheel axis, z-Axis: upwards)";
            Modelica.Mechanics.MultiBody.Parts.Body body2(
              final r_CM={0,0,0},
              final I_21=0,
              final I_31=0,
              final I_32=0,
              animation=false,
              final m=wheelMass,
              final I_11=wheel_I_long,
              final I_22=wheel_I_axis,
              final I_33=wheel_I_long);
            Modelica.Mechanics.MultiBody.Visualizers.FixedShape shape2(
              final animation=animation,
              final lengthDirection={0,1,0},
              final widthDirection={1,0,0},
              final color=wheelColor,
              final extra=hollowFraction,
              final shapeType="pipe",
              final r_shape={0,-wheelWidth,0},
              final length=2*wheelWidth,
              final width=2*wheelRadius,
              final height=2*wheelRadius) if 
                            animation;
            Modelica.Mechanics.MultiBody.Parts.Body body1(
              final r_CM={0,0,0},
              final I_21=0,
              final I_31=0,
              final I_32=0,
              animation=false,
              final m=wheelMass,
              final I_11=wheel_I_long,
              final I_22=wheel_I_axis,
              final I_33=wheel_I_long);
            Modelica.Mechanics.MultiBody.Visualizers.FixedShape shape1(
              final animation=animation,
              final lengthDirection={0,1,0},
              final widthDirection={1,0,0},
              final color=wheelColor,
              final extra=hollowFraction,
              final shapeType="pipe",
              final r_shape={0,-wheelWidth,0},
              final length=2*wheelWidth,
              final width=2*wheelRadius,
              final height=2*wheelRadius) if 
                            animation;
            Modelica.Mechanics.Rotational.Interfaces.Flange_a axis1
          "1-dim. rotational flange that drives the left wheel";
            Modelica.Mechanics.Rotational.Interfaces.Flange_a axis2
          "1-dim. rotational flange that drives the right wheel";
            Modelica.Mechanics.MultiBody.Joints.RollingWheelSet wheelSetJoint(
              animation=false,
              wheelRadius=wheelRadius,
              wheelDistance=wheelDistance,
              stateSelect=StateSelect.default,
              x(fixed=false),
              y(fixed=false),
              phi(fixed=false),
              theta1(fixed=false),
              theta2(fixed=false),
              der_theta1(fixed=false),
              der_theta2(fixed=false));
            Modelica.Mechanics.Rotational.Interfaces.Flange_b support
          "Support of 1D axes";
          equation
            wheelSetJoint.x      = x;
            wheelSetJoint.y      = y;
            wheelSetJoint.phi    = phi;
            wheelSetJoint.theta1 = theta1;
            wheelSetJoint.theta2 = theta2;
            der_theta1 = der(theta1);
            der_theta2 = der(theta2);

            connect(body2.frame_a,frame2);
            connect(body1.frame_a, frame1);
            connect(shape1.frame_a, frame1);
            connect(shape2.frame_a, frame2);
            connect(wheelSetJoint.frame2, frame2);
            connect(wheelSetJoint.frame1, frame1);
            connect(wheelSetJoint.axis1, axis1);
            connect(wheelSetJoint.axis2, axis2);
            connect(wheelSetJoint.support, support);
            connect(wheelSetJoint.frameMiddle, frameMiddle);
          end RollingWheelSet;
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

        type ResolveInFrameB = enumeration(
          world "Resolve in world frame",
          frame_b "Resolve in frame_b",
          frame_resolve
            "Resolve in frame_resolve (frame_resolve must be connected)")
        "Enumeration to define the frame in which an absolute vector is resolved (world, frame_b, frame_resolve)";

        type ResolveInFrameAB = enumeration(
          world "Resolve in world frame",
          frame_a "Resolve in frame_a",
          frame_b "Resolve in frame_b",
          frame_resolve
            "Resolve in frame_resolve (frame_resolve must be connected)")
        "Enumeration to define the frame in which a relative vector is resolved (world, frame_a, frame_b, frame_resolve)";

        type RotationTypes = enumeration(
          RotationAxis "Rotating frame_a around an angle with a fixed axis",
          TwoAxesVectors "Resolve two vectors of frame_b in frame_a",
          PlanarRotationSequence "Planar rotation sequence")
        "Enumeration defining in which way the fixed orientation of frame_b with respect to frame_a is specified";

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

          constant Types.Color ForceColor={0,128,0}
          "Default color for force arrow (dark green)";

          constant Types.Color TorqueColor={0,128,0}
          "Default color for torque arrow (dark green)";

          constant Types.Color SpringColor={0,0,255}
          "Default color for a spring (blue)";

          constant Types.Color SensorColor={255,255,0}
          "Default color for sensors (yellow)";

          constant Types.Color FrameColor={0,0,0}
          "Default color for frame axes and labels (black)";

          constant Types.Color ArrowColor={0,0,255}
          "Default color for arrows and double arrows (blue)";

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

          constant Real JointRodDiameterFraction=2
          "Default for rod diameter as a fraction of joint sphere diameter attached to rod";
        end Defaults;
      end Types;

      package Visualizers "3-dimensional visual objects used for animation"
        extends Modelica.Icons.Library;

        model FixedShape
        "Animation shape of a part with fixed shape type and dynamically varying shape definition"
          import SI = Modelica.SIunits;
          import Modelica.Mechanics.MultiBody.Types;
          extends Modelica.Mechanics.MultiBody.Interfaces.PartialVisualizer;

          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter Types.ShapeType shapeType="box" "Type of shape";
          input SI.Position r_shape[3]={0,0,0}
          "Vector from frame_a to shape origin, resolved in frame_a";
          input Types.Axis lengthDirection={1,0,0}
          "Vector in length direction of shape, resolved in frame_a";
          input Types.Axis widthDirection={0,1,0}
          "Vector in width direction of shape, resolved in frame_a";
          input SI.Distance length(start=1) "Length of shape";
          input SI.Distance width(start=0.1) "Width of shape";
          input SI.Distance height(start=0.1) "Height of shape";
          input Modelica.Mechanics.MultiBody.Types.Color color={0,128,255}
          "Color of shape";
          input Types.ShapeExtra extra=0.0
          "Additional data for cylinder, cone, pipe, gearwheel and spring";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";

      protected
          Advanced.Shape vis(
            shapeType=shapeType,
            r_shape=r_shape,
            lengthDirection=lengthDirection,
            widthDirection=widthDirection,
            length=length,
            width=width,
            height=height,
            color=color,
            extra=extra,
            specularCoefficient=specularCoefficient,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;
        equation
          // No forces and torques
          frame_a.f = zeros(3);
          frame_a.t = zeros(3);
        end FixedShape;

         model Ground "Visualize ground (box in z=0)"
            parameter Boolean animation=true
          "= true, if animation of ground shall be enabled";
            parameter Modelica.SIunits.Position length = 10
          "Length and width of box (center is at x=y=0)";
            parameter Modelica.SIunits.Position height = 0.02
          "Height of box (upper surface is at z=0, lower surface is at z=-height)";
            parameter Modelica.Mechanics.MultiBody.Types.Color groundColor={0,255,0}
          "Color of box";

            Modelica.Mechanics.MultiBody.Visualizers.FixedShape ground(
              lengthDirection={1,0,0},
              widthDirection={0,1,0},
              animation=animation,
              r_shape={-length/2,0,-height},
              length=length,
              height=height,
              color=groundColor,
              width=length);
            Modelica.Mechanics.MultiBody.Parts.Fixed fixed;
         equation

            connect(fixed.frame_b, ground.frame_a);
         end Ground;

        package Advanced
        "Visualizers that require basic knowledge about Modelica in order to use them"
          extends Modelica.Icons.Library;

          model Arrow
          "Visualizing an arrow with variable size; all data have to be set as modifiers (see info layer)"

            import SI = Modelica.SIunits;
            import Modelica.Mechanics.MultiBody.Types;
            import Modelica.Mechanics.MultiBody.Frames;

            input Frames.Orientation R=Frames.nullRotation()
            "Orientation object to rotate the world frame into the arrow frame.";
            input SI.Position r[3]={0,0,0}
            "Position vector from origin of world frame to origin of arrow frame, resolved in world frame";
            input SI.Position r_tail[3]={0,0,0}
            "Position vector from origin of arrow frame to arrow tail, resolved in arrow frame";
            input SI.Position r_head[3]={0,0,0}
            "Position vector from arrow tail to the head of the arrow, resolved in arrow frame";
            input SI.Diameter diameter=world.defaultArrowDiameter
            "Diameter of arrow line";
            input Modelica.Mechanics.MultiBody.Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.ArrowColor
            "Color of arrow";
            input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
            "Material property describing the reflecting of ambient light (= 0 means, that light is completely absorbed)";

        protected
            outer Modelica.Mechanics.MultiBody.World world;
            SI.Length length=Modelica.Math.Vectors.length(
                                           r_head) "Length of arrow";
            Visualizers.Advanced.Shape arrowLine(
              length=noEvent(max(0, length - diameter*Types.Defaults.
                  ArrowHeadLengthFraction)),
              width=diameter,
              height=diameter,
              lengthDirection=r_head,
              widthDirection={0,1,0},
              shapeType="cylinder",
              color=color,
              specularCoefficient=specularCoefficient,
              r_shape=r_tail,
              r=r,
              R=R) if world.enableAnimation;
            Visualizers.Advanced.Shape arrowHead(
              length=noEvent(max(0, min(length, diameter*Types.Defaults.
                  ArrowHeadLengthFraction))),
              width=noEvent(max(0, diameter*MultiBody.Types.Defaults.
                  ArrowHeadWidthFraction)),
              height=noEvent(max(0, diameter*MultiBody.Types.Defaults.
                  ArrowHeadWidthFraction)),
              lengthDirection=r_head,
              widthDirection={0,1,0},
              shapeType="cone",
              color=color,
              specularCoefficient=specularCoefficient,
              r=arrowLine.rvisobj + arrowLine.rxvisobj*arrowLine.length,
              R=R) if world.enableAnimation;

          end Arrow;

          model DoubleArrow
          "Visualizing a double arrow with variable size; all data have to be set as modifiers (see info layer)"

            import SI = Modelica.SIunits;
            import Modelica.Mechanics.MultiBody.Types;
            import Modelica.Mechanics.MultiBody.Frames;
            input Frames.Orientation R=Frames.nullRotation()
            "Orientation object to rotate the world frame into the arrow frame.";
            input SI.Position r[3]={0,0,0}
            "Position vector from origin of world frame to origin of arrow frame, resolved in world frame";
            input SI.Position r_tail[3]={0,0,0}
            "Position vector from origin of arrow frame to double arrow tail, resolved in arrow frame";
            input SI.Position r_head[3]={0,0,0}
            "Position vector from double arrow tail to the head of the double arrow, resolved in arrow frame";
            input SI.Diameter diameter=world.defaultArrowDiameter
            "Diameter of arrow line";
            input Modelica.Mechanics.MultiBody.Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.ArrowColor
            "Color of double arrow";
            input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
            "Material property describing the reflecting of ambient light (= 0 means, that light is completely absorbed)";


        protected
            outer Modelica.Mechanics.MultiBody.World world;
            SI.Length length=Modelica.Math.Vectors.length(
                                           r_head) "Length of arrow";
            SI.Length headLength=noEvent(max(0, min(length, diameter*MultiBody.Types.
                Defaults.ArrowHeadLengthFraction)));
            SI.Length headWidth=noEvent(max(0, diameter*MultiBody.Types.Defaults.
                ArrowHeadWidthFraction));
            Visualizers.Advanced.Shape arrowLine(
              length=noEvent(max(0, length - 1.5*diameter*MultiBody.Types.Defaults.
                  ArrowHeadLengthFraction)),
              width=diameter,
              height=diameter,
              lengthDirection=r_head,
              widthDirection={0,1,0},
              shapeType="cylinder",
              color=color,
              specularCoefficient=specularCoefficient,
              r_shape=r_tail,
              r=r,
              R=R) if world.enableAnimation;
            Visualizers.Advanced.Shape arrowHead1(
              length=headLength,
              width=headWidth,
              height=headWidth,
              lengthDirection=r_head,
              widthDirection={0,1,0},
              shapeType="cone",
              color=color,
              specularCoefficient=specularCoefficient,
              r=arrowLine.rvisobj + arrowLine.rxvisobj*arrowLine.length,
              R=R) if world.enableAnimation;
            Visualizers.Advanced.Shape arrowHead2(
              length=headLength,
              width=headWidth,
              height=headWidth,
              lengthDirection=r_head,
              widthDirection={0,1,0},
              shapeType="cone",
              color=color,
              specularCoefficient=specularCoefficient,
              r=arrowLine.rvisobj + arrowLine.rxvisobj*(arrowLine.length + 0.5*
                  arrowHead1.length),
              R=R) if world.enableAnimation;

          end DoubleArrow;

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

        model Damper "Linear 1D rotational damper"
          extends
          Modelica.Mechanics.Rotational.Interfaces.PartialCompliantWithRelativeStates;
          parameter SI.RotationalDampingConstant d(final min=0, start=0)
          "Damping constant";

        equation
          tau = d*w_rel;
        end Damper;
      end Components;

      package Sources "Sources to drive 1D rotational mechanical components"
        extends Modelica.Icons.Library2;

        model Torque2 "Input signal acting as torque on two flanges"
          extends Rotational.Interfaces.PartialTwoFlanges;

          Modelica.Blocks.Interfaces.RealInput tau
          "Torque driving the two flanges (a positive value accelerates the flange)";


        equation
          flange_a.tau =  tau;
          flange_b.tau = -tau;
        end Torque2;

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

        partial model PartialTorque
        "Partial model of a torque acting at the flange (accelerates the flange)"
          extends
          Modelica.Mechanics.Rotational.Interfaces.PartialElementaryOneFlangeAndSupport2;
          Modelica.SIunits.Angle phi
          "Angle of flange with respect to support (= flange.phi - support.phi)";

        equation
          phi = flange.phi - phi_support;
        end PartialTorque;
      end Interfaces;
    end Rotational;

    package Translational
    "Library to model 1-dimensional, translational mechanical systems"
      extends Modelica.Icons.Library2;
      import SI = Modelica.SIunits;

      package Components
      "Components for 1D translational mechanical drive trains"
        extends Modelica.Icons.Library2;

        model Fixed "Fixed flange"
          parameter SI.Position s0=0 "fixed offset position of housing";


          Interfaces.Flange_b flange;
        equation
          flange.s = s0;
        end Fixed;

        model Spring "Linear 1D translational spring"
          extends Translational.Interfaces.PartialCompliant;
          parameter SI.TranslationalSpringConstant c(final min=0, start = 1)
          "spring constant ";
          parameter SI.Distance s_rel0=0 "unstretched spring length";


        equation
          f = c*(s_rel - s_rel0);
        end Spring;

        model Damper "Linear 1D translational damper"
          extends Translational.Interfaces.PartialCompliantWithRelativeStates;
          parameter SI.TranslationalDampingConstant d(final min=0, start = 0)
          "damping constant";

        equation
          f = d*v_rel;
        end Damper;
      end Components;

      package Sources "Sources to drive 1D translational mechanical components"
        extends Modelica.Icons.Library2;

        model ConstantForce "Constant force, not dependent on speed"
          extends Modelica.Mechanics.Translational.Interfaces.PartialForce;
          parameter Modelica.SIunits.Force f_constant
          "Nominal force (if negative, force is acting as load)";
        equation
          f = -f_constant;
        end ConstantForce;
      end Sources;

      package Interfaces
      "Interfaces for 1-dim. translational mechanical components"
          extends Modelica.Icons.Library;

        connector Flange_a
        "(left) 1D translational flange (flange axis directed INTO cut plane, e. g. from left to right)"


          SI.Position s "absolute position of flange";
          flow SI.Force f "cut force directed into flange";
        end Flange_a;

        connector Flange_b
        "right 1D translational flange (flange axis directed OUT OF cut plane)"

          SI.Position s "absolute position of flange";
          flow SI.Force f "cut force directed into flange";
        end Flange_b;

        connector Support "Support/housing 1D translational flange"

          SI.Position s "absolute position of flange";
          flow SI.Force f "cut force directed into flange";
        end Support;

        model InternalSupport
        "Adapter model to utilize conditional support connector"
          input SI.Force f
          "External support force (must be computed via force balance in model where InternalSupport is used; = flange.f)";
          SI.Position s "External support position (= flange.s)";
          Flange_a flange
          "Internal support flange (must be connected to the conditional support connector for useSupport=true and to conditional fixed model for useSupport=false)";
        equation
          flange.f = f;
          flange.s = s;
        end InternalSupport;

        partial model PartialCompliant
        "Compliant connection of two translational 1D flanges"

          Flange_a flange_a
          "Left flange of compliant 1-dim. translational component";
          Flange_b flange_b
          "Right flange of compliant 1-dim. translational component";
          SI.Distance s_rel(start=0)
          "relative distance (= flange_b.s - flange_a.s)";
          SI.Force f
          "force between flanges (positive in direction of flange axis R)";

        equation
          s_rel = flange_b.s - flange_a.s;
          flange_b.f = f;
          flange_a.f = -f;
        end PartialCompliant;

        partial model PartialCompliantWithRelativeStates
        "Base model for the compliant connection of two translational 1-dim. shaft flanges where the relative position and relative velocities are used as states"

          parameter StateSelect stateSelect=StateSelect.prefer
          "Priority to use phi_rel and w_rel as states";
          parameter SI.Distance s_nominal=1e-4
          "Nominal value of s_rel (used for scaling)";

          SI.Distance s_rel(start=0, stateSelect=stateSelect, nominal=s_nominal)
          "Relative distance (= flange_b.s - flange_a.s)";
          SI.Velocity v_rel(start=0, stateSelect=stateSelect)
          "Relative velocity (= der(s_rel))";

          SI.Force f "Forces between flanges (= flange_b.f)";
          Translational.Interfaces.Flange_a flange_a
          "Left flange of compliant 1-dim. translational component";
          Translational.Interfaces.Flange_b flange_b
          "Right flange of compliant 1-dim. transational component";

        equation
          s_rel = flange_b.s - flange_a.s;
          v_rel = der(s_rel);
          flange_b.f =  f;
          flange_a.f = -f;
        end PartialCompliantWithRelativeStates;

        partial model PartialElementaryOneFlangeAndSupport2
        "Partial model for a component with one translational 1-dim. shaft flange and a support used for textual modeling, i.e., for elementary models"
          parameter Boolean useSupport=false
          "= true, if support flange enabled, otherwise implicitly grounded";
          Modelica.SIunits.Length s = flange.s - s_support
          "distance between flange and support (= flange.s - support.s)";
          Flange_b flange "Flange of component";
          Support support(s=s_support, f=-flange.f) if useSupport
          "Support/housing of component";
      protected
          Modelica.SIunits.Length s_support
          "Absolute position of support flange";
        equation
          if not useSupport then
             s_support = 0;
          end if;

        end PartialElementaryOneFlangeAndSupport2;

      partial model PartialForce
        "Partial model of a force acting at the flange (accelerates the flange)"
        extends PartialElementaryOneFlangeAndSupport2;
        Modelica.SIunits.Force f = flange.f
          "Accelerating force acting at flange (= flange.f)";
      end PartialForce;
      end Interfaces;
    end Translational;
  end Mechanics;

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

    type Radius = Length(min=0);

    type Diameter = Length(min=0);

    type Time = Real (final quantity="Time", final unit="s");

    type AngularVelocity = Real (
        final quantity="AngularVelocity",
        final unit="rad/s");

    type AngularAcceleration = Real (final quantity="AngularAcceleration", final unit
        =      "rad/s2");

    type Velocity = Real (final quantity="Velocity", final unit="m/s");

    type Acceleration = Real (final quantity="Acceleration", final unit="m/s2");

    type Frequency = Real (final quantity="Frequency", final unit="Hz");

    type Mass = Real (
        quantity="Mass",
        final unit="kg",
        min=0);

    type Density = Real (
        final quantity="Density",
        final unit="kg/m3",
        displayUnit="g/cm3",
        min=0);

    type MomentOfInertia = Real (final quantity="MomentOfInertia", final unit=
            "kg.m2");

    type Inertia = MomentOfInertia;

    type Force = Real (final quantity="Force", final unit="N");

    type TranslationalSpringConstant=Real(final quantity="TranslationalSpringConstant", final unit
        =                                                                                          "N/m");

    type TranslationalDampingConstant=Real(final quantity="TranslationalDampingConstant", final unit
        =                                                                                            "N.s/m");

    type Torque = Real (final quantity="Torque", final unit="N.m");

    type RotationalDampingConstant=Real(final quantity="RotationalDampingConstant", final unit
        =                                                                                      "N.m.s/rad");

    type Power = Real (final quantity="Power", final unit="W");
  end SIunits;
end Modelica;
package Modelica_Mechanics_MultiBody_Examples_Elementary
 extends Modelica.Mechanics.MultiBody.Examples.Elementary;
  annotation(experiment(
    StopTime=1,
    NumberOfIntervals=500,
    Tolerance=0.0001,
    Algorithm="dassl"),uses(Modelica(version="3.1")));
end Modelica_Mechanics_MultiBody_Examples_Elementary;
