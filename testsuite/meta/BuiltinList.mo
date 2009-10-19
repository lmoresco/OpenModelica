package BuiltinList
  
  function func
    input list<Integer> lst;
    input Integer i;
    output list<Integer> reverse;
    output list<Integer> appendDupe;
    output Integer len;
    output Boolean hasMember;
    output Integer getIx;
    output Integer getNthIx;
    output list<Integer> deleteIx;
  algorithm
    reverse := listReverse(lst);
    appendDupe := listAppend(lst,lst);
    len := listLength(lst);
    hasMember := listMember(lst, i);
    getIx := listGet(lst, i);
    getNthIx := listNth(lst, i);
    deleteIx := listDelete(lst, i);
  end func;

  uniontype UT
    record UT1
      list<tuple<Integer,Option<Integer>>> lst;
    end UT1;
  end UT;

  type T1 = tuple<Integer,Real,Boolean,String,UT>;

  function funcTuple
    input list<T1> lst;
    input T1 member;
    input Integer i;
    output list<T1> reverse;
    output list<T1> appendDupe;
    output Integer len;
    output Boolean hasMember;
    output T1 getIx;
    output T1 getNthIx;
    output list<T1> deleteIx;
  algorithm
    reverse := listReverse(lst);
    appendDupe := listAppend(lst,lst);
    len := listLength(lst);
    hasMember := listMember(lst, member);
    getIx := listGet(lst, i);
    getNthIx := listNth(lst, i);
    deleteIx := listDelete(lst, i);
  end funcTuple;

end BuiltinList;
