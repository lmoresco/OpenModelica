
class C

  record R
    Real b[10];
  end R;

  flow Real y;
  R r;

end A;

model World
  C c1;
  constant C c2;
equation
  connect(c1,c2);
end World;
