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
    hasMember := listMember(i, lst);
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
    output Boolean hasMember1;
    output Boolean hasMember2;
    output T1 getIx;
    output T1 getNthIx;
    output list<T1> deleteIx;
    output list<T1> consIx;
  protected
    Integer i2;
    Real r;
    Boolean b;
    String s;
    UT ut;
  algorithm
    reverse := listReverse(lst);
    appendDupe := listAppend(lst,lst);
    len := listLength(lst);
    hasMember1 := listMember(member, lst);
    (i2,r,b,s,ut) := member;
    hasMember2 := listMember((i2,r,b,s,ut), lst); // We also need to see if we can call listMember with a tuple
    getIx := listGet(lst, i);
    getNthIx := listNth(lst, i);
    deleteIx := listDelete(lst, i);
    consIx := cons(member, {});
  end funcTuple;

end BuiltinList;
