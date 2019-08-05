function [filename,x]=create_data_file(var_name,sim_per,ref_per)

load('results/workspace_ini.mat');  %#ok<*LOAD>
pers_name = strcat('rho_',var_name);
filename = strcat('results/',var_name,'.mat');
params = M_.params;
param_names = cellstr(M_.param_names);
rho = params(strcmp(pers_name,param_names));
x_ini = oo_.exo_steady_state(strcmp(var_name,cellstr(M_.exo_names)));
mLag = M_.maximum_lag;
mLead = M_.maximum_lead;
sim_length = sim_per+mLag+mLead;

load('results/workspace_term.mat');
x_tar = oo_.exo_steady_state(strcmp(var_name,cellstr(M_.exo_names)));

shk = (x_tar/x_ini-1)*(1-rho)/(1-rho^ref_per);
x = x_tar+zeros(sim_length,1);
x(1:1+mLag) = x_ini;
for i = mLag+2:ref_per+mLag
    x(i) = rho*x(i-1)+(1-rho)*x_ini+x_ini*shk;
end
x(end-mLead+1:end) = [];
x(1:mLag) = []; 
save(filename,'x');

end
