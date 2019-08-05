function [x] = ar(x_ini,x_tar,rho,T)

shk = (x_tar/x_ini-1)*(1-rho)/(1-rho^(T-1));
x = x_ini+zeros(T,1);
for i = 2:T
    x(i) = rho*x(i-1)+(1-rho)*x_ini+x_ini*shk;
end

end
