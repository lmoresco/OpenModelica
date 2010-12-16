class PreAndAliasedVar
  Real a = time;
  Real b = -a;
  Real c;
equation
  when sample(0.1,0.1) then
    c = a+pre(b);
  end when;
end PreAndAliasedVar;
