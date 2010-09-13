// name: DocumentationBackslash
// status: correct
//
// See bug #1143. Dymola allows this behaviour even though the specification
// does not. So we need to print the warnings.
//

model DocumentationBackslash
  annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="
 <em>Extras\Libraries\CommunicationMSWindows.dll</em>", revisions=""));
end DocumentationBackslash;

// Result:
// [DocumentationBackslash.mo:9:14-9:15:writable] Warning: Lexer treating \ as \\, since \L is not a valid Modelica escape sequence.
// [DocumentationBackslash.mo:9:24-9:25:writable] Warning: Lexer treating \ as \\, since \C is not a valid Modelica escape sequence.
// 
// class DocumentationBackslash
// end DocumentationBackslash;
// endResult
