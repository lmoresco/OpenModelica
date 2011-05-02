type Int16 = Integer;

record tstR
     Int16 val;
end tstR;

connector ct
  tstR el;
end ct;

block tst2B
 output ct i1;
 output ct i2;
 output ct i3;
 Boolean clock1,  clock2;
 Integer cntr(start = 0);
 Integer cntr2(start = 2);
equation
  clock1=sample(0,0.1);
  clock2=sample(0,0.001);
  i1.el.val=cntr+1;
  i2.el.val=cntr+40;
  i3.el.val=cntr2;
algorithm
  when clock1  then
    cntr:=pre(cntr)+1;
  end when;
  when clock2  then
    cntr2:=pre(cntr2)+1;
  end when;
end tst2B;

