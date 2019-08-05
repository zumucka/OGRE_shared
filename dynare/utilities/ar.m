function [shk] = ar(x_ini,x_tar,rho,T)

if T>1
    shk_des = (x_tar/x_ini-1)*(1-rho)/(1-rho^T);
    shk_ini = (x_tar/x_ini-1)*(1-rho)*ones(T,1);
    shk = shk_des-shk_ini;
else
    shk = x_tar/x_ini-1;
end    

end

