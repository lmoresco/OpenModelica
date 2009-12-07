package BuiltinArray

function test
  input Integer nelem;
  input Integer val;
  input Integer getn;
  output array<Integer> arrCopy;
  output array<Integer> arr;
  output Integer arrLength;
  output Integer arrElem;
  output list<Integer> arrList;
  output array<Integer> listArr;
  output array<Integer> arrAdd;
algorithm
  arr := arrayCreate(nelem, val);
  arrCopy := arrayCopy(arr);
  _ := arrayUpdate(arr, getn, val+1);
  arrLength := arrayLength(arr);
  arrElem := arrayGet(arr, getn);
  arrList := arrayList(arr);
  listArr := listArray(val+2::arrList);
  arrAdd := arrayAdd(listArr,val*5);
end test;

end BuiltinArray;
