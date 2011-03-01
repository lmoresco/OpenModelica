final encapsulated package GraphTest

import Graph;

function topologicalSortTest 
  input list<tuple<Integer, list<Integer>>> inGraph;
  output list<Integer> outNodes;
  output list<tuple<Integer, list<Integer>>> outRemainingGraph;
algorithm
  (outNodes, outRemainingGraph) := Graph.topologicalSort(inGraph, intEq);
end topologicalSortTest;
  
end GraphTest;
