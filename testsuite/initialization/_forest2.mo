model forest
  Real foxes;
  Real rabbits;
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
  der(foxes) = 20;
  value = 11000;

equation 
  der(rabbits) =  rabbits*g_r - rabbits*foxes*d_rf;
  der(foxes) = -foxes*d_f + rabbits*foxes*d_rf*g_fr;
  population = foxes+rabbits;
  value = priceFox*foxes + priceRabbit*rabbits + priceSeason*seasons;

  when sample(1, 1) and foxes > 50 then
    reinit(foxes, foxes/2);
    seasons = pre(seasons)+1;
  end when;
end forest;
