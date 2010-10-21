package HashTableTest

import HashTable2.*;

function fn
  input Integer i;
  output list<DAE.Exp> lst;
  DAE.ComponentRef wild := DAE.WILD();
  DAE.ComponentRef abc := DAE.CREF_IDENT("abc",DAE.ET_INT(),{});
  DAE.ComponentRef def := DAE.CREF_IDENT("def",DAE.ET_INT(),{});
  HashTable ht;
algorithm
  ht := emptyHashTable();
  ht := add((wild,DAE.ICONST(i)),ht);
  ht := add((abc,DAE.ICONST(i*2)),ht);
  ht := add((def,DAE.ICONST(i*3)),ht);
  lst := {};
  lst := get(wild,ht)::lst;
  lst := get(abc,ht)::lst;
  lst := get(def,ht)::lst;
  ht := add((def,DAE.ICONST(i*7)),ht);
  lst := get(def,ht)::lst;
  ht := add((wild,DAE.ICONST(i*9)),ht);
  ht := delete(wild,ht);
  failure(lst := get(wild,ht)::lst);
end fn;

end HashTableTest;
