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
    end Interfaces;

    package Sources
    "Library of signal source blocks generating Real and Boolean signals"
      import Modelica.Blocks.Interfaces;
      import Modelica.SIunits;
          extends Modelica.Icons.Library;

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
    end Sources;
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

        package Rotational3DEffects
        "Demonstrates the usage of 1-dim. rotational elements with all 3-dim. effects included"
          model GyroscopicEffects
          "Demonstrates that a cylindrical body can be replaced by Rotor1D model"
            extends Modelica.Icons.Example;

            inner World world(                             driveTrainMechanics3D=true);
            Joints.Spherical spherical1(
              angles_fixed=true,
              w_rel_a_fixed=true,
              z_rel_a_fixed=false);
            Parts.BodyCylinder bodyCylinder1(                             r={0.25,0,0},
                diameter=0.05);
            Parts.FixedRotation fixedRotation1(                             angle=45,
                n={0,1,0});
            Joints.Revolute revolute(
              n={1,0,0},
              a(fixed=false),
              phi(fixed=true),
              w(fixed=true, start=10));
            Parts.FixedTranslation fixedTranslation(                             r={-0.1,
                  0,0});
            Parts.BodyCylinder bodyCylinder2(                             diameter=
                  0.1, r={0.2,0,0});
            Parts.Fixed fixed;
            Joints.Spherical spherical2(
              angles_fixed=true,
              w_rel_a_fixed=true,
              z_rel_a_fixed=false);
            Parts.BodyCylinder bodyCylinder3(
              r={0.25,0,0},
              diameter=0.05,
              color={0,128,0});
            Parts.FixedRotation fixedRotation2(                             n={0,1,0},
                angle=45);
            Parts.FixedTranslation fixedTranslation1(                             r={
                  -0.1,0,0});
            Parts.BodyCylinder bodyCylinder4(
              diameter=0.1,
              r={0.2,0,0},
              color={0,128,0});
            Parts.Rotor1D rotor1D(
              J=bodyCylinder4.I[1, 1],
              n={1,0,0},
              a(fixed=false),
              phi(fixed=true),
              w(fixed=true, start=10));
          equation
            connect(world.frame_b,spherical1. frame_a);
            connect(spherical1.frame_b,bodyCylinder1. frame_a);
            connect(bodyCylinder1.frame_b,fixedRotation1. frame_a);
            connect(fixedRotation1.frame_b,revolute. frame_a);
            connect(revolute.frame_b,fixedTranslation. frame_a);
            connect(fixedTranslation.frame_b,bodyCylinder2. frame_a);
            connect(spherical2.frame_b,bodyCylinder3. frame_a);
            connect(bodyCylinder3.frame_b,fixedRotation2. frame_a);
            connect(fixed.frame_b,spherical2. frame_a);
            connect(fixedTranslation1.frame_b,bodyCylinder4. frame_a);
            connect(fixedRotation2.frame_b,fixedTranslation1. frame_a);
            connect(rotor1D.frame_a,fixedRotation2. frame_b);
          end GyroscopicEffects;

          model ActuatedDrive
             extends Modelica.Icons.Example;
            Parts.BodyShape bodyCylinder(
              r={0.5,0,0},
              m=0,
              I_11=2,
              I_22=0,
              I_33=0,
              shapeType="cylinder",
              width=0.1,
              animateSphere=false,
              r_shape={0.1,0,0},
              r_CM={0,0,0});
            Joints.Revolute revolute(                             n={1,0,0},
              a(fixed=false),
              phi(fixed=true),
              w(fixed=true));
            inner World world(                             g=0, driveTrainMechanics3D=
                  true);
            Forces.Torque torque;
            Blocks.Sources.Sine sine[         3](amplitude={1,0,0}, freqHz={1,1,1});
            inner Parts.Fixed fixed;
            Parts.Rotor1D rotor1D(                             J=2,
              phi(fixed=true),
              w(fixed=true));
            Rotational.Sources.Torque torque1(useSupport=true);
            Parts.Mounting1D mounting1D;
          equation
            connect(world.frame_b,revolute. frame_a);
            connect(revolute.frame_b,bodyCylinder. frame_a);
            connect(torque.frame_b,bodyCylinder. frame_b);
            connect(torque.frame_resolve,world. frame_b);
            connect(torque.frame_a,world. frame_b);
            connect(sine.y,torque. torque);
            connect(fixed.frame_b,rotor1D. frame_a);
            connect(torque1.flange,rotor1D.   flange_a);
            connect(mounting1D.flange_b,torque1.support);
            connect(mounting1D.frame_a,fixed. frame_b);
            connect(sine[1].y,torque1. tau);
          end ActuatedDrive;

          model MovingActuatedDrive
             extends Modelica.Icons.Example;
            Parts.BodyShape bodyCylinder(
              r={0.5,0,0},
              m=0,
              I_11=2,
              I_22=0,
              I_33=0,
              shapeType="cylinder",
              width=0.1,
              animateSphere=false,
              r_shape={0.1,0,0},
              r_CM={0,0,0});
            Joints.Revolute revolute(                             n={1,0,0},
              a(fixed=false),
              phi(fixed=true),
              w(fixed=true));
            inner World world(                             g=0, driveTrainMechanics3D=
                  true);
            Forces.Torque torque;
            Blocks.Sources.Sine sine1[         3](amplitude={1,0,0}, freqHz={1,1,1});
            Parts.Rotor1D rotor1D(                             J=2,
              phi(fixed=true),
              w(fixed=true));
            Rotational.Sources.Torque torque1(useSupport=true);
            Parts.Mounting1D mounting1D;
            Joints.Revolute r1(useAxisFlange=true,  n={0,1,0});
            Rotational.Sources.Position position1(useSupport=true);
            Blocks.Sources.Sine sine2(         amplitude=2, freqHz=1);
            Parts.Mounting1D mounting1D1;
            Joints.Revolute r2(useAxisFlange=true, n={0,1,0});
            Rotational.Sources.Position position2(useSupport=true);
            Parts.Mounting1D mounting1D2;
            Parts.Fixed fixed;
          equation
            connect(revolute.frame_b,bodyCylinder. frame_a);
            connect(torque.frame_b,bodyCylinder. frame_b);
            connect(sine1.y,torque. torque);
            connect(torque1.flange,rotor1D.   flange_a);
            connect(mounting1D.flange_b,torque1.support);
            connect(r1.frame_a,world. frame_b);
            connect(position1.flange,r1.   axis);
            connect(position1.support,mounting1D1. flange_b);
            connect(mounting1D1.frame_a,world. frame_b);
            connect(sine2.y,position1. phi_ref);
            connect(r1.frame_b,revolute. frame_a);
            connect(torque.frame_resolve,revolute. frame_a);
            connect(torque.frame_a,revolute. frame_a);
            connect(position2.flange,r2.   axis);
            connect(position2.support,mounting1D2. flange_b);
            connect(fixed.frame_b,r2. frame_a);
            connect(fixed.frame_b,mounting1D2. frame_a);
            connect(sine2.y,position2. phi_ref);
            connect(r2.frame_b,rotor1D. frame_a);
            connect(r2.frame_b,mounting1D. frame_a);
            connect(sine1[1].y,torque1. tau);
          end MovingActuatedDrive;

          model GearConstraint
             extends Modelica.Icons.Example;
            Joints.GearConstraint gearConstraint(                             ratio=10);
            inner World world(                             driveTrainMechanics3D=true,
                g=0);
            Parts.BodyCylinder cyl1(
              diameter=0.1,
              color={0,128,0},
              r={0.4,0,0});
            Parts.BodyCylinder cyl2(                             r={0.4,0,0}, diameter=
                  0.2);
            Forces.Torque torque1;
            Blocks.Sources.Sine sine[         3](amplitude={2,0,0}, freqHz={1,1,1});
            Parts.Fixed fixed;
            Rotational.Components.Inertia inertia1(
                J=cyl1.I[1, 1],
              a(fixed=false),
              phi(fixed=true),
              w(fixed=true));
            Rotational.Components.IdealGear idealGear(        ratio=10, useSupport=true);
            Rotational.Components.Inertia inertia2(        J=cyl2.I[1, 1]);
            Rotational.Sources.Torque torque2(useSupport=true);
            Parts.Mounting1D mounting1D;
          equation
            connect(world.frame_b,gearConstraint. bearing);
            connect(cyl1.frame_b,gearConstraint. frame_a);
            connect(gearConstraint.frame_b,cyl2. frame_a);
            connect(torque1.frame_b,cyl1. frame_a);
            connect(torque1.frame_a,world. frame_b);
            connect(sine.y,torque1. torque);
            connect(inertia1.flange_b,idealGear. flange_a);
            connect(idealGear.flange_b,inertia2. flange_a);
            connect(torque2.flange,inertia1.   flange_a);
            connect(sine[1].y,torque2. tau);
            connect(mounting1D.flange_b,idealGear.support);
            connect(mounting1D.flange_b,torque2.support);
            connect(fixed.frame_b,mounting1D. frame_a);
          end GearConstraint;
        end Rotational3DEffects;
      end Examples;

      package Forces
      "Components that exert forces and/or torques between frames"
        import SI = Modelica.SIunits;
        extends Modelica.Icons.Library;

        model Torque
        "Torque acting between two frames, defined by 3 input signals and resolved in frame world, frame_a, frame_b or frame_resolve"

          import SI = Modelica.SIunits;
          extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
          Interfaces.Frame_resolve frame_resolve if 
               resolveInFrame == Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_resolve
          "The input signals are optionally resolved in this frame";

          Modelica.Blocks.Interfaces.RealInput torque[3](each final quantity="Torque", each
            final unit =   "N.m")
          "x-, y-, z-coordiantes of torque resolved in frame defined by resolveInFrame";
          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB
          resolveInFrame=
            Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_b
          "Frame in which input force is resolved (1: world, 2: frame_a, 3: frame_b, 4: frame_resolve)";
          parameter Real Nm_to_m(unit="N.m/m") = world.defaultNm_to_m
          " Torque arrow scaling (length = torque/Nm_to_m)";
          input SI.Diameter torqueDiameter=world.defaultArrowDiameter
          " Diameter of torque arrow";
          input SI.Diameter connectionLineDiameter=torqueDiameter
          " Diameter of line connecting frame_a and frame_b";
          input Types.Color torqueColor=Modelica.Mechanics.MultiBody.Types.Defaults.TorqueColor
          " Color of torque arrow";
          input Types.Color connectionLineColor=Modelica.Mechanics.MultiBody.Types.Defaults.SensorColor
          " Color of line connecting frame_a and frame_b";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";

      protected
          SI.Position t_in_m[3]=frame_b.t/Nm_to_m
          "Torque mapped from Nm to m for animation";
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
            lengthDirection=basicTorque.r_0,
            widthDirection={0,1,0},
            length=Modelica.Math.Vectors.length(
                                 basicTorque.r_0),
            width=connectionLineDiameter,
            height=connectionLineDiameter,
            color=connectionLineColor,
            specularCoefficient=specularCoefficient,
            r=frame_a.r_0) if world.enableAnimation and animation;

      public
          Internal.BasicTorque basicTorque(resolveInFrame=resolveInFrame);
      protected
          Interfaces.ZeroPosition zeroPosition if 
               not (resolveInFrame == Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_resolve);
        equation
          connect(basicTorque.frame_a, frame_a);
          connect(basicTorque.frame_b, frame_b);
          connect(basicTorque.torque, torque);
          connect(basicTorque.frame_resolve, frame_resolve);
          connect(zeroPosition.frame_resolve, basicTorque.frame_resolve);
        end Torque;

        package Internal "Internal package, should not be used by user"

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

        model Spherical
        "Spherical joint (3 constraints and no potential states, or 3 degrees-of-freedom and 3 states)"

          import Modelica.Mechanics.MultiBody.Frames;
          import SI = Modelica.SIunits;

          extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
          parameter Boolean animation=true
          "= true, if animation shall be enabled (show sphere)";
          parameter SI.Distance sphereDiameter=world.defaultJointLength
          "Diameter of sphere representing the spherical joint";
          input Types.Color sphereColor=Modelica.Mechanics.MultiBody.Types.Defaults.JointColor
          "Color of sphere representing the spherical joint";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";

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

          parameter Boolean enforceStates=false
          " = true, if relative variables of spherical joint shall be used as states (StateSelect.always)";
          parameter Boolean useQuaternions=true
          " = true, if quaternions shall be used as states otherwise use 3 angles as states (provided enforceStates=true)";
          parameter Types.RotationSequence sequence_angleStates={1,2,3}
          " Sequence of rotations to rotate frame_a into frame_b around the 3 angles used as states";

          final parameter Frames.Orientation R_rel_start=
              Frames.axesRotations(sequence_start, angles_start, zeros(3))
          "Orientation object from frame_a to frame_b at initial time";

      protected
          Visualizers.Advanced.Shape sphere(
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

          // Declarations for quaternions (dummies, if quaternions are not used)
          parameter Frames.Quaternions.Orientation Q_start=
                    Modelica.Mechanics.MultiBody.Frames.to_Q(R_rel_start)
          "Quaternion orientation object from frame_a to frame_b at initial time";
          Frames.Quaternions.Orientation Q(start=Q_start, each stateSelect=if 
                enforceStates and useQuaternions then StateSelect.prefer else 
                StateSelect.never)
          "Quaternion orientation object from frame_a to frame_b (dummy value, if quaternions are not used as states)";

          // Declaration for 3 angles
          parameter SI.Angle phi_start[3]=if sequence_start[1] ==
              sequence_angleStates[1] and sequence_start[2] == sequence_angleStates[2]
               and sequence_start[3] == sequence_angleStates[3] then angles_start else 
               Frames.axesRotationsAngles(R_rel_start, sequence_angleStates)
          "Potential angle states at initial time";
          SI.Angle phi[3](start=phi_start, each stateSelect=if enforceStates and not 
                useQuaternions then StateSelect.always else StateSelect.never)
          "Dummy or 3 angles to rotate frame_a into frame_b";
          SI.AngularVelocity phi_d[3](each stateSelect=if enforceStates and not 
                useQuaternions then StateSelect.always else StateSelect.never)
          "= der(phi)";
          SI.AngularAcceleration phi_dd[3] "= der(phi_d)";

          // Other declarations
          SI.AngularVelocity w_rel[3](start=Frames.resolve2(R_rel_start, w_rel_a_start),
                fixed = fill(w_rel_a_fixed,3), each stateSelect=if 
                enforceStates and useQuaternions then StateSelect.always else 
                StateSelect.never)
          "Dummy or relative angular velocity of frame_b with respect to frame_a, resolved in frame_b";
          Frames.Orientation R_rel
          "Dummy or relative orientation object to rotate from frame_a to frame_b";
          Frames.Orientation R_rel_inv
          "Dummy or relative orientation object to rotate from frame_b to frame_a";
        initial equation
          if angles_fixed then
            if not enforceStates then
              // no states defined in spherical object
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
            der(w_rel) = Frames.resolve2(R_rel_start, z_rel_a_start);
          end if;
        equation
          // torque balance
          zeros(3) = frame_a.t;
          zeros(3) = frame_b.t;

          if enforceStates then
            Connections.branch(frame_a.R, frame_b.R);

            frame_b.r_0 = frame_a.r_0;
            if rooted(frame_a.R) then
              R_rel_inv = Frames.nullRotation();
              frame_b.R = Frames.absoluteRotation(frame_a.R, R_rel);
              zeros(3) = frame_a.f + Frames.resolve1(R_rel, frame_b.f);
            else
              R_rel_inv = Frames.inverseRotation(R_rel);
              frame_a.R = Frames.absoluteRotation(frame_b.R, R_rel_inv);
              zeros(3) = frame_b.f + Frames.resolve2(R_rel, frame_a.f);
            end if;

            // Compute relative orientation object
            if useQuaternions then
              // Use Quaternions as states (with dynamic state selection)
              {0} = Frames.Quaternions.orientationConstraint(Q);
              w_rel = Frames.Quaternions.angularVelocity2(Q, der(Q));
              R_rel = Frames.from_Q(Q, w_rel);

              // Dummies
              phi = zeros(3);
              phi_d = zeros(3);
              phi_dd = zeros(3);

            else
              // Use angles as states
              phi_d = der(phi);
              phi_dd = der(phi_d);
              R_rel = Frames.axesRotations(sequence_angleStates, phi, phi_d);
              w_rel = Frames.angularVelocity2(R_rel);

              // Dummies
              Q = zeros(4);
            end if;

          else
            // Spherical joint does not have states
            frame_b.r_0 = frame_a.r_0;
            //frame_b.r_0 = transpose(frame_b.R.T)*(frame_b.R.T*(transpose(frame_a.R.T)*(frame_a.R.T*frame_a.r_0)));

            zeros(3) = frame_a.f + Frames.resolveRelative(frame_b.f, frame_b.R, frame_a.R);

            if w_rel_a_fixed or z_rel_a_fixed then
              w_rel = Frames.angularVelocity2(frame_b.R) - Frames.resolve2(frame_b.R,
                 Frames.angularVelocity1(frame_a.R));
            else
              w_rel = zeros(3);
            end if;

            // Dummies
            R_rel = Frames.nullRotation();
            R_rel_inv = Frames.nullRotation();
            Q = zeros(4);
            phi = zeros(3);
            phi_d = zeros(3);
            phi_dd = zeros(3);
          end if;
        end Spherical;

        model GearConstraint
        "Ideal 3-dim. gearbox (arbitrary shaft directions)"
          extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
          Interfaces.Frame_a bearing "Coordinate system fixed in the bearing";

          parameter Real ratio(start=2) "Gear speed ratio";

          parameter Modelica.Mechanics.MultiBody.Types.Axis n_a={1,0,0}
          "Axis of rotation of shaft a (same coordinates in frame_a, frame_b, bearing)";
          parameter Modelica.Mechanics.MultiBody.Types.Axis n_b={1,0,0}
          "Axis of rotation of shaft b (same coordinates in frame_a, frame_b, bearing)";

          parameter Modelica.SIunits.Position r_a[3]={0,0,0}
          "Vector from frame bearing to frame_a resolved in bearing";
          parameter Modelica.SIunits.Position r_b[3]={0,0,0}
          "Vector from frame bearing to frame_b resolved in bearing";

          Modelica.Mechanics.MultiBody.Joints.Revolute actuatedRevolute_a(useAxisFlange=true, n=n_a, animation=false);
          Modelica.Mechanics.MultiBody.Joints.Revolute actuatedRevolute_b(useAxisFlange=true,n=n_b, animation=false);
          Modelica.Mechanics.Rotational.Components.IdealGear idealGear(
                                                            ratio=ratio);
          Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1
          (                                                                     animation=false, r=r_b);
          Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2
          (                                                                     animation=false, r=r_a);
        equation
          assert(cardinality(bearing) > 0,
            "Connector bearing of component is not connected");

          connect(actuatedRevolute_a.axis, idealGear.flange_a);
          connect(idealGear.flange_b, actuatedRevolute_b.axis);
          connect(actuatedRevolute_a.frame_a,fixedTranslation2. frame_b);
          connect(fixedTranslation2.frame_a, bearing);
          connect(fixedTranslation1.frame_a, bearing);
          connect(fixedTranslation1.frame_b, actuatedRevolute_b.frame_a);
          connect(frame_a, actuatedRevolute_a.frame_b);
          connect(actuatedRevolute_b.frame_b, frame_b);
        end GearConstraint;
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

        model Rotor1D
        "1D inertia attachable on 3-dim. bodies (3D dynamic effects are taken into account if world.driveTrainMechanics3D=true)"

          import SI = Modelica.SIunits;
          import Cv = Modelica.SIunits.Conversions;

          parameter Boolean animation=true
          "= true, if animation shall be enabled (show rotor as cylinder)";
          parameter SI.Inertia J(min=0,start=1)
          "Moment of inertia of rotor around its axis of rotation";
          parameter Modelica.Mechanics.MultiBody.Types.Axis n={1,0,0}
          "Axis of rotation resolved in frame_a";
          parameter SI.Position r_center[3]=zeros(3)
          "Position vector from origin of frame_a to center of cylinder";
          parameter SI.Distance cylinderLength=2*world.defaultJointLength
          "Length of cylinder representing the rotor";
          parameter SI.Distance cylinderDiameter=2*world.defaultJointWidth
          "Diameter of cylinder representing the rotor";
          input Modelica.Mechanics.MultiBody.Types.Color cylinderColor=Modelica.Mechanics.MultiBody.Types.Defaults.RodColor
          "Color of cylinder representing the rotor";
          input Modelica.Mechanics.MultiBody.Types.SpecularCoefficient
          specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)";
          parameter StateSelect stateSelect=StateSelect.default
          "Priority to use rotor angle (phi) and rotor speed (w) as states";
          parameter Boolean exact=true
          "= true, if exact calculations; false if influence of bearing on rotor acceleration is neglected to avoid an algebraic loop";

          SI.Angle phi(start=0, stateSelect=stateSelect)
          "Rotation angle of rotor with respect to frame_a (= flange_a.phi = flange_b.phi)";
          SI.AngularVelocity w(start=0, stateSelect=stateSelect)
          "Angular velocity of rotor with respect to frame_a";
          SI.AngularAcceleration a(start=0)
          "Angular acceleration of rotor with respect to frame_a";

          Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
          "(left) driving flange (flange axis directed INTO cut plane)";
          Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b
          "(right) driven flange (flange axis directed OUT OF cut plane)";
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a if world.driveTrainMechanics3D
          "Frame in which rotor housing is fixed (connector is removed, if world.driveTrainMechanics3D=false)";

        encapsulated model RotorWith3DEffects
          "1D inertia attachable on 3-dim. bodies (3D dynamic effects are taken into account)"

            import Modelica;
            import Modelica.Mechanics.MultiBody.Frames;
            import Modelica.Mechanics.MultiBody.Types;
            import SI = Modelica.SIunits;
            import Cv = Modelica.SIunits.Conversions;

          parameter Boolean animation=true
            "= true, if animation shall be enabled (show rotor as cylinder)";
          parameter SI.Inertia J(min=0)=1
            "Moment of inertia of rotor around its axis of rotation";
          parameter Types.Axis n={1,0,0} "Axis of rotation resolved in frame_a";
          parameter SI.Position r_center[3]=zeros(3)
            "Position vector from origin of frame_a to center of cylinder";
          parameter SI.Distance cylinderLength=2*world.defaultJointLength
            "Length of cylinder representing the rotor";
          parameter SI.Distance cylinderDiameter=2*world.defaultJointWidth
            "Diameter of cylinder representing the rotor";
          input Types.Color cylinderColor=Modelica.Mechanics.MultiBody.Types.Defaults.RodColor
            "Color of cylinder representing the rotor";
          input Types.SpecularCoefficient specularCoefficient =                              world.defaultSpecularCoefficient
            "Reflection of ambient light (= 0: light is completely absorbed)";
          parameter StateSelect stateSelect=StateSelect.default
            "Priority to use rotor angle (phi) and rotor speed (w) as states";
          parameter Boolean exact=true
            "= true, if exact calculations; false if influence of bearing on rotor acceleration is neglected to avoid an algebraic loop";

          SI.AngularVelocity w_a[3]
            "Angular velocity of frame_a, resolved in frame_a";
          SI.Angle phi(start=0, final stateSelect=stateSelect)
            "Rotation angle of rotor with respect to frame_a (= flange_a.phi = flange_b.phi)";

          SI.AngularVelocity w(start=0, stateSelect=stateSelect)
            "Angular velocity of rotor with respect to frame_a";
          SI.AngularAcceleration a(start=0)
            "Angular acceleration of rotor with respect to frame_a";

          Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
            "(left) driving flange (flange axis directed INTO cut plane)";
          Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b
            "(right) driven flange (flange axis directed OUT OF cut plane)";
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
            "Frame in which rotor housing is fixed";


        protected
          outer Modelica.Mechanics.MultiBody.World world;
          parameter Real e[3](each final unit="1")=Modelica.Math.Vectors.normalize(
                                               n)
            "Unit vector in direction of rotor axis, resolved in frame_a";
          parameter SI.Inertia nJ[3]=J*e;
          Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape cylinder(
            shapeType="cylinder",
            color=cylinderColor,
            specularCoefficient=specularCoefficient,
            length=cylinderLength,
            width=cylinderDiameter,
            height=cylinderDiameter,
            lengthDirection=n,
            widthDirection={0,1,0},
            extra=1,
            r_shape=r_center - e*(cylinderLength/2),
            r=frame_a.r_0,
            R=Frames.absoluteRotation(frame_a.R, Frames.planarRotation(e, phi, 0))) if 
               world.enableAnimation and animation;
        equation
          phi = flange_a.phi;
          phi = flange_b.phi;
          w = der(phi);
          a = der(w);

          w_a = Modelica.Mechanics.MultiBody.Frames.angularVelocity2(frame_a.R);
          if exact then
            J*a = flange_a.tau + flange_b.tau - nJ*der(w_a);
          else
            J*a = flange_a.tau + flange_b.tau;
          end if;

         /* Reaction torque:
        t = n*(J*a - flange_a.tau - flange_b.tau) + cross(w_a, nJ*w)

     Since
        J*a = flange_a.tau + flange_b.tau - nJ*der(w_a);

     the reaction torque can be simplified to
        t = n*(- nJ*der(w_a)) + cross(w_a, nJ*w)

  */
          frame_a.f = zeros(3);
          frame_a.t = cross(w_a, nJ*w)-e*(nJ*der(w_a));
        end RotorWith3DEffects;

      protected
          outer Modelica.Mechanics.MultiBody.World world;
          parameter Real e[3](each final unit="1")=Modelica.Math.Vectors.normalize(
                                               n)
          "Unit vector in direction of rotor axis, resolved in frame_a";
          Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape cylinder(
            shapeType="cylinder",
            color=cylinderColor,
            specularCoefficient=specularCoefficient,
            length=cylinderLength,
            width=cylinderDiameter,
            height=cylinderDiameter,
            lengthDirection=n,
            widthDirection={0,1,0},
            extra=1,
            r_shape=r_center - e*(cylinderLength/2),
            r=zeros(3),
            R=Modelica.Mechanics.MultiBody.Frames.planarRotation(
                e,
                phi,
                0)) if world.enableAnimation and animation and not world.driveTrainMechanics3D;

          Modelica.Mechanics.Rotational.Components.Inertia inertia(
            J=J) if 
                not world.driveTrainMechanics3D;
          RotorWith3DEffects rotorWith3DEffects(
            animation=animation,
            J=J,
            n=n,
            r_center=r_center,
            cylinderLength=cylinderLength,
            cylinderDiameter=cylinderDiameter,
            cylinderColor=cylinderColor,
            specularCoefficient=specularCoefficient,
            exact=exact) if world.driveTrainMechanics3D;
        equation
          phi = flange_a.phi;
          w = der(phi);
          a = der(w);

          connect(inertia.flange_a, flange_a);
          connect(inertia.flange_b, flange_b);
          connect(rotorWith3DEffects.flange_b, flange_b);
          connect(rotorWith3DEffects.flange_a, flange_a);
          connect(rotorWith3DEffects.frame_a, frame_a);
        end Rotor1D;
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

          constant Types.Color TorqueColor={0,128,0}
          "Default color for torque arrow (dark green)";

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
        end Defaults;
      end Types;

      package Visualizers "3-dimensional visual objects used for animation"
        extends Modelica.Icons.Library;

        package Advanced
        "Visualizers that require basic knowledge about Modelica in order to use them"
          extends Modelica.Icons.Library;

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
      end Components;

      package Sources "Sources to drive 1D rotational mechanical components"
        extends Modelica.Icons.Library2;

        model Position
        "Forced movement of a flange according to a reference angle signal"
          import SI = Modelica.SIunits;
          extends
          Modelica.Mechanics.Rotational.Interfaces.PartialElementaryOneFlangeAndSupport2;
          parameter Boolean exact=false
          "true/false exact treatment/filtering the input signal";
          parameter SI.Frequency f_crit=50
          "if exact=false, critical frequency of filter to filter input signal";
          SI.Angle phi(stateSelect=if exact then StateSelect.default else StateSelect.prefer)
          "Rotation angle of flange with respect to support";
          SI.AngularVelocity w(start=0,stateSelect=if exact then StateSelect.default else StateSelect.prefer)
          "If exact=false, Angular velocity of flange with respect to support else dummy";
          SI.AngularAcceleration a(start=0)
          "If exact=false, Angular acceleration of flange with respect to support else dummy";
          Modelica.Blocks.Interfaces.RealInput phi_ref(final quantity="Angle", final unit
            =                                                                             "rad", displayUnit="deg")
          "Reference angle of flange with respect to support as input signal";

      protected
          parameter Modelica.SIunits.AngularFrequency w_crit=2*Modelica.Constants.pi*f_crit
          "Critical frequency";
          constant Real af=1.3617 "s coefficient of Bessel filter";
          constant Real bf=0.6180 "s*s coefficient of Bessel filter";
        initial equation
          if not exact then
            phi = phi_ref;
          end if;
        equation
          phi = flange.phi - phi_support;
          if exact then
            phi = phi_ref;
            w = 0;
            a = 0;
          else
            // Filter: a = phi_ref*s^2/(1 + (af/w_crit)*s + (bf/w_crit^2)*s^2)
            w = der(phi);
            a = der(w);
            a = ((phi_ref - phi)*w_crit - af*w)*(w_crit/bf);
          end if;
        end Position;

        model Torque "Input signal acting as external torque on a flange"
          extends
          Modelica.Mechanics.Rotational.Interfaces.PartialElementaryOneFlangeAndSupport2;
          Modelica.Blocks.Interfaces.RealInput tau
          "Accelerating torque acting at flange (= -flange.tau)";

        equation
          flange.tau = -tau;
        end Torque;

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
      end Interfaces;
    end Rotational;
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

    type AngularFrequency = Real (final quantity="AngularFrequency", final unit
        =   "rad/s");

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

    type Torque = Real (final quantity="Torque", final unit="N.m");
  end SIunits;
end Modelica;
package Modelica_Mechanics_MultiBody_Examples_Rotational3DEffects
 extends Modelica.Mechanics.MultiBody.Examples.Rotational3DEffects;
  annotation(experiment(
    StopTime=1,
    NumberOfIntervals=500,
    Tolerance=0.0001,
    Algorithm="dassl"),uses(Modelica(version="3.1")));
end Modelica_Mechanics_MultiBody_Examples_Rotational3DEffects;
