within TwoTanks;

block PIcontinuousController extends BaseController(K = 2, T = 10);
  Real  x  "State variable of continuous PI controller";
equation
  der(x) = error/T;
  outCtr = K*(error + x);
end PIcontinuousController;