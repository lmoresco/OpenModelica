package HT2

import HashTable2.*;

function fn
  input Integer i;
  output HashTable ht;
algorithm
  ht := emptyHashTable();
  ht := add((DAE.WILD(),DAE.ICONST(i)),ht);
  // ht := get((DAE.WILD(),DAE.ICONST(i)),ht);
end fn;

end HT2;
