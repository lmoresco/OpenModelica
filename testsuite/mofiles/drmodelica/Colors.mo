// name:     Colors
// keywords: extends, equation
// status:   correct

record ColorData "Superclass of Color"
  parameter Real red;
  parameter Real blue;
  Real green;
end ColorData;

class Color "Subclass of ColorData"
  extends ColorData;
equation
  red + blue + green = 1;
end Color;

model Colors
  Color c(red=0.7,blue=0.1);
  real k;
equation
  k = c.green;
end Colors;