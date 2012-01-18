model forest
  Real foxes(nominal=100000000);
  Real rabbits(nominal=0.000000000001);
  Real population(start=850);
  Real value;
  discrete Integer seasons(start=0, fixed=true);

  parameter Real g_r = 0.4;
  parameter Real d_rf= 0.005;
  parameter Real d_f = 0.9;
  parameter Real g_fr= 1.0;
  parameter Real priceFox = 150;
  parameter Real priceRabbit = 12;
  parameter Real priceSeason = 1000;

initial equation 
  der(foxes) = 20*10000000000;
  value = 11000;

equation 
  der(rabbits)/0.0000000001 =  rabbits/0.0000000001*g_r - rabbits/0.0000000001*foxes/10000000000*d_rf;
  der(foxes)/10000000000 = -foxes/10000000000*d_f + rabbits/0.0000000001*foxes/10000000000*d_rf*g_fr;
  population = foxes/10000000000+rabbits/0.0000000001;
  value = priceFox*foxes/10000000000 + priceRabbit*rabbits/0.0000000001 + priceSeason*seasons;

  when sample(1, 1) and foxes/10000000000 > 50 then
    reinit(foxes, foxes/2);
    seasons = pre(seasons)+1;
  end when;
end forest;
