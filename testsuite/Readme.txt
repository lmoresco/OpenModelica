This is the Modelica semantic test-suite for Modelica 1.4. 
Hans Olsson, Dynasim AB, has updated it to Modelica 1.4, 
as decided by the 24th and 26th Modelica meeting.

The test-suite consists of a large number of independent 
test-cases, each represented by one .mo file.

Each Modelica test-case illustrates one ore more semantical aspects 
of the Modelica language, and is given in two formulations: 
Modelica code and in some cases a flat representation that explains 
the semantics of the example. Furthermore a classification is used to 
allow grouping of several test-cases.

Each test-case is formulated in one Modelica file consisting of

   1.header explaining the test-case 
   2.classification entry
   3.correctness entry
   4.Modelica classes
   5.flat representation

The classification contains one or several of the following:
`algorithm' 
`array','array of components'
`connection','connect' 
`declaration','declaration order' 
'encapsulated'
`equation' 
'import'
'replaceable'
`modification' 
`scoping','dynamic scoping'
`typing' 
'when semantics'

The correctness entry is 'correct' if the example is correct
and contains no modelling error.

The Modelica code is in one file, which is not recommended
practice and is followed by a flat representation as a comment.

The flat representation has erased all inheritance and 
sub-components, but is no longer formally defined.


Note:
The test-suite is not considered normative description
of the Modelica language, but the unclear cases were discussed
at the 24th and 25th Modelica meetings.

This resulted in large changes of the test-suite and some 
major updates to the specification in order to make the 
Modelica language more consistent with our goals for the language.
Additionally several examples were added to demonstrate
new features of the Modelica language.

The previous version was constructed by Ruediger Franke
and David Kagedal and last updated by the 12th Modelica meeting.


